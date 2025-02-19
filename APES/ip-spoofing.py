from scapy.all import *

# Define the spoofed source IP and destination IP
spoofed_ip = "192.168.1.100"  # Fake source IP
target_ip = "192.168.1.200"  # Destination IP

# Create an IP packet with the spoofed source
ip_layer = IP(src=spoofed_ip, dst=target_ip)

# Create a TCP/UDP/ICMP layer (Example: ICMP)
icmp_layer = ICMP()

# Send the spoofed packet
send(ip_layer / icmp_layer)
