import openai

# Configuration de l'API OpenAI
openai.api_key = 'VOTRE_CLE_API_OPENAI'

def completer_texte(prompt, max_tokens=100, temperature=0.7, top_p=1.0, stop=None):
    # Appel de l'API OpenAI pour compléter le texte
    response = openai.Completion.create(
        engine='davinci-codex',  # Modèle de l'IA codeur de texte
        prompt=prompt,
        max_tokens=max_tokens,  # Nombre maximum de tokens à générer
        temperature=temperature,  # Paramètre de diversité du texte généré (entre 0 et 1)
        top_p=top_p,  # Paramètre pour contrôler la probabilité cumulée des choix de tokens (entre 0 et 1)
        n=1,  # Nombre de réponses générées
        stop=stop,  # Critère d'arrêt facultatif
        temperature=temperature,  # Paramètre de diversité du texte généré (entre 0 et 1)
        top_p=top_p,  # Paramètre pour contrôler la probabilité cumulée des choix de tokens (entre 0 et 1)
        n=1,  # Nombre de réponses générées
        stop=stop,  # Critère d'arrêt facultatif
        presence_penalty=0.0,  # Paramètre pour contrôler la diversité en pénalisant la répétition de phrases
        frequency_penalty=0.0,  # Paramètre pour contrôler la diversité en pénalisant la répétition de tokens
        best_of=1,  # Nombre de réponses à générer et renvoyer
        max_tokens=max_tokens,  # Nombre maximum de tokens à générer
        temperature=temperature,  # Paramètre de diversité du texte généré (entre 0 et 1)
        top_p=top_p,  # Paramètre pour contrôler la probabilité cumulée des choix de tokens (entre 0 et 1)
        frequency_penalty=0.0,  # Paramètre pour contrôler la diversité en pénalisant la répétition de tokens
        presence_penalty=0.0,  # Paramètre pour contrôler la diversité en pénalisant la répétition de phrases
        stop=stop  # Critère d'arrêt facultatif
    )

    # Récupération de la réponse générée par l'IA
    if response.choices:
        return response.choices[0].text.strip()
    else:
        return None

# Exemple d'utilisation
prompt = "Écris une fonction en Python qui calcule la somme de deux nombres :"
complement = completer_texte(prompt)
print(complement)
