import wikipedia
import wikipedia.exceptions

def get_wikipedia_summary(topic, sentences=2):
    try:
        summary = wikipedia.summary(topic, sentences=sentences)
        return summary
    except wikipedia.exceptions.DisambiguationError as e:
        return f"La recherche a renvoyé une désambiguïsation. Veuillez préciser votre requête : {e.options}"
    except wikipedia.exceptions.HTTPTimeoutError:
        return "Erreur : délai d'attente dépassé. Veuillez réessayer plus tard."
    except wikipedia.exceptions.PageError:
        return "Aucune page Wikipédia trouvée pour ce sujet."
    except wikipedia.exceptions.WikipediaException as e:
        return f"Erreur inattendue : {e}"

# Exemple d'utilisation
topic = "Python (programming language)"
result = get_wikipedia_summary(topic)
print(result)
