from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.kdf.pbkdf2 import PBKDF2HMAC
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.backends import default_backend
import os

def generate_key(password):
    salt = os.urandom(16)
    kdf = PBKDF2HMAC(
        algorithm=hashes.SHA256(),
        length=32,
        salt=salt,
        iterations=100000,
        backend=default_backend()
    )
    key = kdf.derive(password.encode())
    return salt, key

def encrypt_message(message, password):
    salt, key = generate_key(password)

    iv = os.urandom(16)
    cipher = Cipher(algorithms.AES(key), modes.CBC(iv), backend=default_backend())
    encryptor = cipher.encryptor()

    padded_message = message.encode().rjust(16, b'\x00')
    encrypted_message = encryptor.update(padded_message) + encryptor.finalize()

    return salt, iv, encrypted_message

def decrypt_message(encrypted_message, salt, iv, password):
    key = generate_key_with_salt(password, salt)

    cipher = Cipher(algorithms.AES(key), modes.CBC(iv), backend=default_backend())
    decryptor = cipher.decryptor()

    decrypted_message = decryptor.update(encrypted_message) + decryptor.finalize()
    unpadded_message = decrypted_message.lstrip(b'\x00')

    return unpadded_message.decode()

# Exemple d'utilisation
password = "MotDePasseSecret"
message = "Bonjour, ceci est un message secret !"

salt, iv, encrypted = encrypt_message(message, password)
print("Message crypté :", encrypted)

decrypted = decrypt_message(encrypted, salt, iv, password)
print("Message décrypté :", decrypted)
