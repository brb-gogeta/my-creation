import pyttsx3

def select_voice(voices):
    print("Voix disponibles :")
    for i, voice in enumerate(voices):
        print(f"{i + 1}. {voice.name}")
    
    while True:
        try:
            choice = int(input("Sélectionnez la voix (1, 2, ...) : "))
            if 1 <= choice <= len(voices):
                return voices[choice - 1].id
            else:
                print("Choix non valide. Veuillez saisir un numéro valide.")
        except ValueError:
            print("Veuillez entrer un numéro valide.")

def main():
    Assistant = pyttsx3.init('sapi5')
    voices = Assistant.getProperty('voices')
    
    # Sélectionnez une voix
    selected_voice_id = select_voice(voices)
    
    # Configurez la voix sélectionnée et le taux de parole
    Assistant.setProperty('voice', selected_voice_id)
    rate = 170
    Assistant.setProperty('rate', rate)

    while True:
        try:
            text = input("Saisissez le texte à synthétiser (ou quit pour quitter) : ")
            if text.lower() == 'quit':
                break
            Assistant.say(text)
            Assistant.runAndWait()
        except Exception as e:
            print(f"Une erreur s'est produite : {e}")

if __name__ == "__main__":
    main()
