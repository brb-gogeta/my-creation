import tkinter as tk
from tkinter import scrolledtext

import nltk

nltk.download('punkt')
nltk.download('wordnet')

def preprocess_text(text):
    return text.lower()

def generate_response(input_text):
    response = "Je ne comprends pas. Peux-tu me donner plus d'informations ?"

    if "import" in input_text:
        try:
            exec(input_text)
            response = "Importation réussie !"
        except Exception as e:
            response = f"Erreur lors de l'importation : {str(e)}"
    else:
        try:
            exec(input_text)
            response = "Opération réussie !"
        except Exception as e:
            response = f"Erreur : {str(e)}"

    return response

def on_send_button_click():
    user_input = input_text.get("1.0", tk.END)
    preprocessed_input = preprocess_text(user_input.strip())
    response = generate_response(preprocessed_input)
    output_text.insert(tk.END, "\nVous: " + user_input.strip())
    output_text.insert(tk.END, "\nIA: " + response)
    output_text.insert(tk.END, "\n")

if __name__ == "__main__":
    window = tk.Tk()
    window.title("IA de codage")

    # Zone de saisie pour l'entrée utilisateur
    input_text = scrolledtext.ScrolledText(window, wrap=tk.WORD, width=50, height=10)
    input_text.pack(pady=10)

    # Bouton d'envoi
    send_button = tk.Button(window, text="Envoyer", command=on_send_button_click)
    send_button.pack()

    # Zone d'affichage pour les réponses de l'IA
    output_text = scrolledtext.ScrolledText(window, wrap=tk.WORD, width=50, height=10)
    output_text.pack(pady=10)

    # Lancer la boucle principale de l'interface graphique
    window.mainloop()
