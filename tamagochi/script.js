document.addEventListener("DOMContentLoaded", function() {
    // Classe Tamagotchi
    class Tamagotchi {
      constructor(name) {
        this.name = name;
        this.hunger = 0;
        this.boredom = 0;
        this.tiredness = 0;
        this.age = 0;
        this.is_alive = true;
      }
  
      feed() {
        if (this.hunger > 0) {
          this.hunger--;
        }
        this.updateStatus();
      }
  
      play() {
        if (this.boredom > 0) {
          this.boredom--;
        }
        this.updateStatus();
      }
  
      sleep() {
        if (this.tiredness > 0) {
          this.tiredness--;
        }
        this.updateStatus();
      }
  
      increaseAge() {
        this.age++;
        this.updateStatus();
      }
  
      checkStatus() {
        if (this.hunger >= 5 || this.boredom >= 5 || this.tiredness >= 5 || this.age >= 10) {
          this.is_alive = false;
        }
      }
  
      updateStatus() {
        this.hunger++;
        this.boredom++;
        this.tiredness++;
        this.checkStatus();
      }
    }
  
    // Éléments de l'interface utilisateur
    const nameElement = document.getElementById("name");
    const hungerElement = document.getElementById("hunger");
    const boredomElement = document.getElementById("boredom");
    const tirednessElement = document.getElementById("tiredness");
    const ageElement = document.getElementById("age");
    const statusElement = document.getElementById("status");
    const feedButton = document.getElementById("feed-btn");
    const playButton = document.getElementById("play-btn");
    const sleepButton = document.getElementById("sleep-btn");
    const ageButton = document.getElementById("age-btn");
  
    // Création du Tamagotchi
    const tamagotchi = new Tamagotchi("MonTamagotchi");
  
    // Mise à jour de l'interface utilisateur
    function updateUI() {
      nameElement.textContent = "Nom: " + tamagotchi.name;
      hungerElement.textContent = "Faim: " + tamagotchi.hunger;
      boredomElement.textContent = "Ennui: " + tamagotchi.boredom;
      tirednessElement.textContent = "Fatigue: " + tamagotchi.tiredness;
      ageElement.textContent = "Âge: " + tamagotchi.age;
  
      if (!tamagotchi.is_alive) {
        statusElement.textContent = tamagotchi.name + " est mort.";
        feedButton.disabled = true;
        playButton.disabled = true;
        sleepButton.disabled = true;
        ageButton.disabled = true;
      }
    }
  
    // Actions des boutons
    feedButton.addEventListener("click", function() {
      tamagotchi.feed();
      updateUI();
    });
  
    playButton.addEventListener("click", function() {
      tamagotchi.play();
      updateUI();
    });
  
    sleepButton.addEventListener("click", function() {
      tamagotchi.sleep();
      updateUI();
    });
  
    ageButton.addEventListener("click", function() {
      tamagotchi.increaseAge();
      updateUI();
    });
  
    // Mise à jour initiale de l'interface utilisateur
    updateUI();
  });
  