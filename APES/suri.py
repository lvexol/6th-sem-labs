from scapy.all import IP, TCP, Raw, send, hexdump

# Spoofed packet settings
src_ip = "1.2.3.4"  # Fake IP
dst_ip = "192.168.1.1"  # Target IP
src_port = 1234
dst_port = 80

# Create IP and TCP headers
ip_layer = IP(src=src_ip, dst=dst_ip)
tcp_layer = TCP(sport=src_port, dport=dst_port, flags="S")  # SYN flag

# Adding payload
payload = Raw(b"Hello, this is spoofed data!")

# Complete packet
packet = ip_layer / tcp_layer / payload

# Print packet in Wireshark-like hex format
print("Wireshark-like Hexdump:")
hexdump(packet)

# Send the spoofed packet
send(packet, verbose=True)

print("Spoofed TCP SYN packet with payload sent!")
