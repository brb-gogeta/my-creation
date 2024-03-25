import os

# Liste de signatures de virus connues
SIGNATURES_VIRUS = [
    "SignatureVirus1",
    "SignatureVirus2",
    "SignatureVirus3"
]

def scanner_antivirus(chemin_fichier):
    fichier = open(chemin_fichier, 'rb')
    contenu = fichier.read()
    fichier.close()

    # Parcourir les signatures de virus connues et vérifier si elles correspondent au contenu du fichier
    for signature in SIGNATURES_VIRUS:
        if signature.encode('utf-8') in contenu:
            print(f"Le fichier {chemin_fichier} est infecté par un virus connu : {signature}")

# Répertoire à analyser
repertoire_scan = "/chemin/vers/repertoire"

# Parcourir les fichiers dans le répertoire
for racine, dossiers, fichiers in os.walk(repertoire_scan):
    for fichier in fichiers:
        chemin_fichier = os.path.join(racine, fichier)
        scanner_antivirus(chemin_fichier)
