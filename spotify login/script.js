

let oneSignBtn = document.querySelector('.phone-one-sign-in');
let onelogBtn = document.querySelector('.phone-one-log-in');

let logo = document.querySelector('.spotify');

function phoneOneSignBtn(){
  oneSignBtn.style.display = "block";
  onelogBtn.style.display = "none";
  logo.style.marginTop = "35px";
}


function phoneOnelogBtn(){
  oneSignBtn.style.display = "none";
  onelogBtn.style.display = "block";
}


let twoSignBtn = document.querySelector('.phone-two-sign-in');
let twologBtn = document.querySelector('.phone-two-log-in');
let logo2 = document.querySelector('.spotifyTwo');


function phoneTwologBtn(){
 twologBtn.style.display = "block";
 twoSignBtn.style.display = "none";
 logo2.style.marginTop = "60px";
}

function phoneTwoSignBtn(){
 twologBtn.style.display = "none";
 twoSignBtn.style.display = "block";
}



//music

const audio = document.getElementById("myAudio");
const btn = document.querySelector("#plays");
const music = document.querySelector(".music");

let a = true;
function play(){
  
  if(a == true){
    a = false;
    audio.play();
    btn.classList.replace("fa-play","fa-pause");
  }else{
    a = true;
    audio.pause();
    btn.classList.replace("fa-pause","fa-play");
  }
  
}




audio.addEventListener('timeupdate',() => {
  
    var duration = audio.duration;
    var currentTime = audio.currentTime;
  
  let progress_time = (currentTime / duration) * 100;
  
  music.style.width = `${progress_time}%`;
  
})