import socket

host = "127.0.0.1"  # Localhost
port = 12345  # Port number

server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind((host, port))
server_socket.listen(1)  # Allow only one connection

print(f"Server started. Waiting for connection on {host}:{port}...")
client_socket, client_address = server_socket.accept()
print(f"Client {client_address} connected.")

while True:
    message = client_socket.recv(1024).decode()
    if message.lower() == "exit":
        print("Client disconnected.")
        break
    print(f"Client: {message}")

    response = input("You: ")
    client_socket.send(response.encode())
    if response.lower() == "exit":
        break

client_socket.close()
server_socket.close()
