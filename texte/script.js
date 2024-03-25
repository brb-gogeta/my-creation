// Remove the transition class
const elem = document.querySelector("aside");
elem.classList.remove("slide-in");

// Create the observer, same as before:
const observer = new IntersectionObserver(entries => {
	entries.forEach(entry => {
	   if (entry.intersectionRatio > 0) {
      // Add 'active' class if observation target is inside viewport
      entry.target.classList.add("slide-in");
    } else {
      // Remove 'active' class otherwise
      entry.target.classList.remove("slide-in");
    }
	});
});

//observer.observe(document.querySelector("aside"));
const elems = document.querySelectorAll("aside");
console.log(elems)
elems.forEach((el) => {
  observer.observe(el);
});