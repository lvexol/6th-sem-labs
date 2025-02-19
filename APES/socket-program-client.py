import socket

host = "127.0.0.1"  # Server IP
port = 12345  # Server Port

client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect((host, port))

print("Connected to the server. Type 'exit' to quit.")

while True:
    message = input("You: ")
    client_socket.send(message.encode())

    if message.lower() == "exit":
        break

    response = client_socket.recv(1024).decode()
    if response.lower() == "exit":
        print("Server disconnected.")
        break
    print(f"Server: {response}")

client_socket.close()
