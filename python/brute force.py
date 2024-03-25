import random
import string
import time

def generate_random_password(length):
    characters = string.ascii_letters + string.digits + string.punctuation
    password = ''.join(random.choices(characters, k=length))
    return password

def guess_password(password):
    characters = string.ascii_letters + string.digits + string.punctuation
    password_length = len(password)
    max_attempts = 1000000  # Limite le nombre maximum d'essais
    attempts = 0
    start_time = time.time()

    while True:
        attempts += 1
        guess = generate_random_password(password_length)

        if guess == password:
            end_time = time.time()
            elapsed_time = end_time - start_time
            return guess, attempts, elapsed_time

        if attempts >= max_attempts:
            end_time = time.time()
            elapsed_time = end_time - start_time
            return None, attempts, elapsed_time

def main():
    password = input("Entrez le mot de passe : ")
    guessed_password, attempts, elapsed_time = guess_password(password)

    if guessed_password:
        print("Mot de passe trouvé : " + guessed_password)
        print("Nombre d'essais : " + str(attempts))
        print("Temps écoulé : " + str(elapsed_time) + " secondes")
    else:
        print("Impossible de trouver le mot de passe après " + str(attempts) + " essais.")
        print("Temps écoulé : " + str(elapsed_time) + " secondes")

if __name__ == '__main__':
    main()
