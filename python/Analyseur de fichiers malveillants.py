import hashlib

def calculate_file_hash(file_path):
    with open(file_path, "rb") as file:
        data = file.read()
        file_hash = hashlib.sha256(data).hexdigest()
        return file_hash

# Exemple d'utilisation
file_path = "/path/to/file.exe"  # Chemin vers le fichier à analyser

file_hash = calculate_file_hash(file_path)
print(f"Hachage SHA-256 du fichier : {file_hash}")
