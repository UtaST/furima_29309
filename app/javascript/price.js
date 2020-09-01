function price() {
  const input = document.getElementById("item-price");
  input.addEventListener('input', () => {
    var inputPrice = input.value;
    var selesCommission = Math.floor(inputPrice * 0.1);
    var selesProfit = inputPrice - selesCommission;

    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");

    addTaxPrice.innerText = selesCommission;
    profit.innerText = selesProfit;
  });
}
window.addEventListener('load', price);