from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.kdf.pbkdf2 import PBKDF2HMAC
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.backends import default_backend
import os

def generate_key(password, salt):
    kdf = PBKDF2HMAC(
        algorithm=hashes.SHA256(),
        length=32,
        salt=salt,
        iterations=100000,
        backend=default_backend()
    )
    key = kdf.derive(password.encode())
    return key

def decrypt_message(encrypted_message, salt, iv, password):
    key = generate_key(password, salt)

    cipher = Cipher(algorithms.AES(key), modes.CBC(iv), backend=default_backend())
    decryptor = cipher.decryptor()

    decrypted_message = decryptor.update(encrypted_message) + decryptor.finalize()

    # Supprimez le bourrage (padding) ajouté lors du chiffrement
    padding_length = decrypted_message[-1]
    unpadded_message = decrypted_message[:-padding_length]

    return unpadded_message.decode()

# Exemple d'utilisation
password = "MotDePasseSecret"
salt = b'\xd1\xe9\xce\xc8\xa2\x82\xd1\x15\xba\x8e0\xda\x88\x9a\xd4\xa3'
iv = b'\xf5\xc0j\xdc\xfc\xff\xd2\xab\xbe\xeb\x0c\x89)\xecj'
encrypted = b'2\xdd\xae\xc8>\x9d\xfc\xb9i\x8a\x12Qa\xedl\xe2Rr\xc2\xa9\x8e\xfd\xc8\xf8o\xdc\xee\x9f\xb6\xf2'
decrypted = decrypt_message(encrypted, salt, iv, password)
print("Message décrypté :", decrypted)
