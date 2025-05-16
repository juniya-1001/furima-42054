function post (){
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  if (!priceInput) return;

  priceInput.addEventListener("input", () => {
    const price = parseInt(priceInput.value);

    if (price >= 300 && price <= 9999999) {
      const tax = Math.floor(price * 0.1);
      const profit = price - tax;
      addTaxDom.textContent = tax.toLocaleString();
      profitDom.textContent = profit.toLocaleString();
    } else {
      addTaxDom.textContent = "Nan";
      profitDom.textContent = "Nan";
    }
  });
 };
 
 window.addEventListener('turbo:load', post);