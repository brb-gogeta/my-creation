import time

# Délai en secondes avant de renvoyer une réponse en cas d'échec d'authentification
DELAI_ATTENTE = 5

# Nombre maximal de tentatives autorisées avant de bloquer l'utilisateur
MAX_TENTATIVES = 3

# Dictionnaire pour stocker les tentatives d'authentification échouées par adresse IP
tentatives_echouees = {}


def authentification(username, password):
    # Vérifier si l'adresse IP est bloquée
    adresse_ip = obtenir_adresse_ip()
    if adresse_ip in tentatives_echouees:
        if tentatives_echouees[adresse_ip] >= MAX_TENTATIVES:
            attente = DELAI_ATTENTE * (2 ** (tentatives_echouees[adresse_ip] - MAX_TENTATIVES))
            time.sleep(attente)
            return False

    # Effectuer l'authentification
    est_authentifie = verifier_identifiants(username, password)

    # Si l'authentification échoue, enregistrer la tentative dans le dictionnaire
    if not est_authentifie:
        if adresse_ip in tentatives_echouees:
            tentatives_echouees[adresse_ip] += 1
        else:
            tentatives_echouees[adresse_ip] = 1

    return est_authentifie


def obtenir_adresse_ip():
    # Code pour obtenir l'adresse IP de la requête en cours
    # Remplacez cette fonction par celle appropriée en fonction de votre environnement
    adresse_ip = "127.0.0.1"  # Exemple d'adresse IP statique pour les tests
    return adresse_ip


def verifier_identifiants(username, password):
    # Code pour vérifier les identifiants de l'utilisateur
    # Remplacez cette fonction par celle appropriée en fonction de votre application
    # Par exemple, vous pouvez utiliser une base de données pour vérifier les identifiants
    identifiants_valides = {
        "utilisateur1": "motdepasse1",
        "utilisateur2": "motdepasse2",
        "utilisateur3": "motdepasse3"
    }
    if username in identifiants_valides and identifiants_valides[username] == password:
        return True
    else:
        return False
