const poster = document.getElementById("poster");
const poster_top = document.getElementById("top");
const poster_bottom = document.getElementById("bottom");
const h1 = document.querySelector("h1");

var open = true;

poster.addEventListener("click", () => {
	if (open === true) {
		open = false;
		poster.style.height = "10vh";
		poster.style.borderRadius = "0";
		poster_top.style.top = "40vh";
		poster_bottom.style.bottom = "40vh";
		h1.style.opacity = "0";
	} else {
		open = true;
		poster.style.height = "90vh";
		poster.style.borderRadius = "3rem";
		poster_top.style.top = "5vh";
		poster_bottom.style.bottom = "5vh";
		h1.style.opacity = "1";
	}
});