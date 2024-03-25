const dataLowerCase = "azertyuiopqsdfghjklmwxcvbn";
const dataUpperCase = dataLowerCase.toUpperCase();
const dataNumber = "123456789";
const dataSymboles = "&~#{[|`^]]}-\"';.<>/(-_)=éèçàà";
const rangVal = document.getElementById("rangOutput");
const mdpOut = document.getElementById("mdpOut");
let pass = "";

const generateurMdp = () => {
  let data = [];
  pass = "";

  if (lowerCase.checked) data.push(...dataLowerCase);
  if (upperCase.checked) data.push(...dataUpperCase);
  if (numbers.checked) data.push(...dataNumber);
  if (symboles.checked) data.push(...dataSymboles);

  if (data.length === 0) {
    alert("Veuillez remplire des critères...");
    return;
  }

  for (i = 0; i < rangVal.value; i++) {
    pass += data[Math.floor(Math.random() * data.length)];
  }


  mdpOut.value = pass;

  mdpOut.select();
  document.execCommand("copy");

  mdpGenerator.textContent = "Copie !";

  setTimeout(() => {
    mdpGenerator.textContent = "Générer le mot de passe";
  }, 1000);
};

mdpGenerator.addEventListener("click", generateurMdp);

// const dateParser = (date) => {
//   let newdate = new Date(date).toLocaleDateString("fr", {
//     year: "numeric",
//     month: "short",
//     day: "numeric",
//     hour: "numeric",
//     minute: "numeric",
//     second: "numeric",
//   });
//   return newdate;
// };

// date1 = new Date();

// console.log(dateParser(date1));

cursor = document.getElementById("cursor");

window.addEventListener("mousemove", (ev) => {
  cursor.style.top = ev.pageY + "px";
  cursor.style.left = ev.pageX + "px";
});
