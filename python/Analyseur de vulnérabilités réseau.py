import socket
import time

def scan_port(host, port):
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(2)  # Temps d'attente pour la connexion
        result = sock.connect_ex((host, port))
        if result == 0:
            print(f"Le port {port} est ouvert sur l'hôte {host}")
        sock.close()
    except socket.error:
        print("Erreur de connexion")

# Exemple d'utilisation
host = "127.0.0.1"
ports = [21, 22, 80, 443, 3389]  # Liste des ports à analyser

for port in ports:
    scan_port(host, port)
    time.sleep(0.5)  # Temps de pause entre les scans pour éviter les blocages
