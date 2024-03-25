import time
import tkinter as tk

class Tamagotchi:
    def __init__(self, name):
        self.name = name
        self.hunger = 0
        self.boredom = 0
        self.tiredness = 0
        self.age = 0
        self.is_alive = True

    def feed(self):
        if self.hunger > 0:
            self.hunger -= 1
        self.update_status()
    
    def play(self):
        if self.boredom > 0:
            self.boredom -= 1
        self.update_status()
    
    def sleep(self):
        if self.tiredness > 0:
            self.tiredness -= 1
        self.update_status()
    
    def increase_age(self):
        self.age += 1
        self.update_status()

    def check_status(self):
        if self.hunger >= 5:
            self.is_alive = False
        elif self.boredom >= 5:
            self.is_alive = False
        elif self.tiredness >= 5:
            self.is_alive = False
        elif self.age >= 10:
            self.is_alive = False

    def update_status(self):
        self.hunger += 1
        self.boredom += 1
        self.tiredness += 1
        self.check_status()

# Fonctions d'interaction avec les boutons
def feed_tamagotchi():
    pet.feed()
    update_pet_info()

def play_tamagotchi():
    pet.play()
    update_pet_info()

def sleep_tamagotchi():
    pet.sleep()
    update_pet_info()

def age_tamagotchi():
    pet.increase_age()
    update_pet_info()

# Mise à jour des informations du Tamagotchi
def update_pet_info():
    info_text.set(f"Nom: {pet.name}\nFaim: {pet.hunger}\nEnnui: {pet.boredom}\nFatigue: {pet.tiredness}\nAge: {pet.age}")
    if not pet.is_alive:
        status_text.set(f"{pet.name} est mort.")

# Création de la fenêtre principale
window = tk.Tk()
window.title("Tamagotchi")

# Création du Tamagotchi
pet = Tamagotchi("MonTamagotchi")

# Création des boutons
feed_button = tk.Button(window, text="Nourrir", command=feed_tamagotchi)
feed_button.pack()

play_button = tk.Button(window, text="Jouer", command=play_tamagotchi)
play_button.pack()

sleep_button = tk.Button(window, text="Dormir", command=sleep_tamagotchi)
sleep_button.pack()

age_button = tk.Button(window, text="Vieillir", command=age_tamagotchi)
age_button.pack()

# Création de l'étiquette d'informations
info_text = tk.StringVar()
info_label = tk.Label(window, textvariable=info_text)
info_label.pack()

# Création de l'étiquette de statut
status_text = tk.StringVar()
status_label = tk.Label(window, textvariable=status_text)
status_label.pack()

def update_tamagotchi():
    pet.update_status()
    update_pet_info()
    if pet.is_alive:
        window.after(1000, update_tamagotchi)  # Met à jour le Tamagotchi toutes les 1000 ms

# Démarrage de la mise à jour du Tamagotchi
update_tamagotchi()

# Démarrage de la boucle principale de la fenêtre
window.mainloop()
