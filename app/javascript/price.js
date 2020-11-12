function price (){
  const price = document.getElementById("item-price");
  price.addEventListener("click", (e) => {
  console.log(document.getElementById("add-tax-price"));
});
}

window.addEventListener('load', price);