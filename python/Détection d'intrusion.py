import re
import time

def detect_intrusion(log_file):
    # Patterns de détection d'intrusion
    patterns = [
        r"Failed password for .* from .*",
        r"Invalid user .* from .*",
        r"Received disconnect from .*: .*: .*"
    ]

    with open(log_file, "r") as file:
        for line in file:
            for pattern in patterns:
                if re.search(pattern, line):
                    print(f"Intrusion détectée : {line}")
                    # Prenez ici des mesures préventives appropriées

# Exemple d'utilisation
log_file = "/var/log/auth.log"  # Chemin vers le fichier journal

while True:
    detect_intrusion(log_file)
    time.sleep(1)  # Temps de pause entre les analyses
