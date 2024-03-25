from cryptography.fernet import Fernet

def generate_key():
    key = Fernet.generate_key()
    with open('key.key', 'wb') as key_file:
        key_file.write(key)

def load_key():
    with open('key.key', 'rb') as key_file:
        key = key_file.read()
    return key

def encrypt_message(message):
    key = load_key()
    cipher_suite = Fernet(key)
    encrypted_message = cipher_suite.encrypt(message.encode())
    return encrypted_message

def decrypt_message(encrypted_message):
    key = load_key()
    cipher_suite = Fernet(key)
    decrypted_message = cipher_suite.decrypt(encrypted_message)
    return decrypted_message.decode()

# Exemple d'utilisation
generate_key()  # Génère une clé (à faire une seule fois)

message = "Bonjour, ceci est un message secret !"
encrypted = encrypt_message(message)
print("Message crypté :", encrypted)

decrypted = decrypt_message(encrypted)
print("Message décrypté :", decrypted)
