#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/ip.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <pcap.h>
#include <pthread.h>
#include <signal.h>

// Global variables for packet capture
pcap_t *handle;
char *spoofed_ip;
volatile int running = 1;

// Signal handler to gracefully stop packet capture
void signal_handler(int signum) {
    running = 0;
}

// Calculate IP checksum
unsigned short calculate_checksum(unsigned short *buf, int nwords) {
    unsigned long sum = 0;
    
    while (nwords > 0) {
        sum += *buf++;
        nwords--;
    }
    
    sum = (sum >> 16) + (sum & 0xffff);
    sum += (sum >> 16);
    
    return ~sum;
}

// Callback function for packet capture
void packet_handler(u_char *user_data, const struct pcap_pkthdr *pkthdr, const u_char *packet) {
    struct iphdr *ip = (struct iphdr *)(packet + 14); // Skip Ethernet header
    char src_ip[INET_ADDRSTRLEN];
    
    // Convert source IP to string
    inet_ntop(AF_INET, &(ip->saddr), src_ip, INET_ADDRSTRLEN);
    
    // Check if this packet has our spoofed source IP
    if (strcmp(src_ip, spoofed_ip) == 0) {
        printf("\nCaptured spoofed packet:\n");
        printf("Source IP: %s\n", src_ip);
        printf("Destination IP: %s\n", inet_ntoa(*(struct in_addr *)&ip->daddr));
        printf("Protocol: %d\n", ip->protocol);
        printf("TTL: %d\n", ip->ttl);
        printf("Length: %d\n", ntohs(ip->tot_len));
    }
}

// Packet capture thread function
void *capture_packets(void *arg) {
    char errbuf[PCAP_ERRBUF_SIZE];
    struct bpf_program fp;
    char filter_exp[100];
    bpf_u_int32 net, mask;
    pcap_if_t *alldevs, *dev_ptr;
    char *dev = NULL;
    
    // Find all available devices
    if (pcap_findalldevs(&alldevs, errbuf) == -1) {
        fprintf(stderr, "Error finding devices: %s\n", errbuf);
        return NULL;
    }
    
    // Use the first available device
    if (alldevs != NULL) {
        dev = strdup(alldevs->name);
        printf("Using device: %s\n", dev);
    } else {
        fprintf(stderr, "No devices found\n");
        return NULL;
    }
    
    // Get network address and mask
    if (pcap_lookupnet(dev, &net, &mask, errbuf) == -1) {
        fprintf(stderr, "Can't get netmask: %s\n", errbuf);
        net = 0;
        mask = 0;
    }
    
    // Open device for capturing
    handle = pcap_open_live(dev, BUFSIZ, 1, 1000, errbuf);
    if (handle == NULL) {
        fprintf(stderr, "Couldn't open device %s: %s\n", dev, errbuf);
        free(dev);
        pcap_freealldevs(alldevs);
        return NULL;
    }
    
    // Create and set filter for our spoofed IP
    snprintf(filter_exp, sizeof(filter_exp), "src host %s", spoofed_ip);
    if (pcap_compile(handle, &fp, filter_exp, 0, net) == -1) {
        fprintf(stderr, "Couldn't parse filter %s: %s\n", filter_exp, pcap_geterr(handle));
        free(dev);
        pcap_freealldevs(alldevs);
        return NULL;
    }
    
    if (pcap_setfilter(handle, &fp) == -1) {
        fprintf(stderr, "Couldn't install filter %s: %s\n", filter_exp, pcap_geterr(handle));
        free(dev);
        pcap_freealldevs(alldevs);
        return NULL;
    }
    
    printf("Starting packet capture for spoofed IP: %s\n", spoofed_ip);
    
    // Start capture loop
    while (running) {
        pcap_dispatch(handle, 1, packet_handler, NULL);
    }
    
    // Cleanup
    pcap_freecode(&fp);
    pcap_close(handle);
    free(dev);
    pcap_freealldevs(alldevs);
    return NULL;
}

// Create and send a raw IP packet
void send_raw_packet(const char *source_ip, const char *dest_ip) {
    // Create raw socket
    int sockfd = socket(AF_INET, SOCK_RAW, IPPROTO_RAW);
    if (sockfd < 0) {
        perror("Socket creation error");
        return;
    }
    
    // Packet buffer
    char packet[sizeof(struct iphdr)];
    memset(packet, 0, sizeof(packet));
    
    // IP header
    struct iphdr *ip = (struct iphdr *)packet;
    ip->version = 4;
    ip->ihl = 5;
    ip->tos = 0;
    ip->tot_len = sizeof(struct iphdr);
    ip->id = htons(12345);
    ip->frag_off = 0;
    ip->ttl = 64;
    ip->protocol = IPPROTO_RAW;
    ip->saddr = inet_addr(source_ip);
    ip->daddr = inet_addr(dest_ip);
    
    // Calculate checksum
    ip->check = 0;
    ip->check = calculate_checksum((unsigned short *)ip, sizeof(struct iphdr) >> 1);
    
    // Destination address structure
    struct sockaddr_in dest;
    memset(&dest, 0, sizeof(dest));
    dest.sin_family = AF_INET;
    dest.sin_addr.s_addr = ip->daddr;
    
    // Send packet
    if (sendto(sockfd, packet, sizeof(packet), 0, 
               (struct sockaddr *)&dest, sizeof(dest)) < 0) {
        perror("Packet send error");
    } else {
        printf("Packet sent successfully\n");
    }
    
    close(sockfd);
}

int main() {
    printf("Network Programming Demo with Packet Capture\n");
    printf("Note: This requires root privileges to run\n");
    
    // Example IPs for demonstration
    const char *source_ip = "192.168.1.2";  // Example source IP
    const char *dest_ip = "142.250.196.14";    // Example destination IP
    
    // Set global spoofed IP for capture
    spoofed_ip = strdup(source_ip);
    
    // Set up signal handler
    signal(SIGINT, signal_handler);
    
    // Create packet capture thread
    pthread_t capture_thread;
    if (pthread_create(&capture_thread, NULL, capture_packets, NULL) != 0) {
        fprintf(stderr, "Failed to create capture thread\n");
        return 1;
    }
    
    // Wait for capture to initialize
    sleep(1);
    
    // Send spoofed packet
    send_raw_packet(source_ip, dest_ip);
    
    printf("\nPress Ctrl+C to stop packet capture...\n");
    
    // Wait for capture thread to finish
    pthread_join(capture_thread, NULL);
    
    free(spoofed_ip);
    printf("\nPacket capture stopped\n");
    
    return 0;
}
