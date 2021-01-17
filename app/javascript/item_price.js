function item_price(){
  const itemPrice = document.getElementById("item-price");
  const addtaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  itemPrice.addEventListener("input", () => {
    const inputPrice = itemPrice.value;
    addtaxPrice.innerHTML = Math.floor(inputPrice / 10);
    profit.innerHTML = (inputPrice - addtaxPrice.innerHTML);
  });
}
window.addEventListener('load', item_price);