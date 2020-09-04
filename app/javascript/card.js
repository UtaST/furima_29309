const pay = () => {
Payjp.setPublicKey("pk_test_9e0602d603ce55f5e9b09ab6")
const form = document.getElementById("charge-form")
form.addEventListener("submit", (e) => {
  e.preventDefault();

  const formResult = document.getElementById("charge-form");
  const formData = new FormData(formResult);
  console.log(...formData.entries());
  debugger

  const card = {
    number: formData.get("purchase_address[number]"),
    cvc: formData.get("purchase_address[cvc]"),
    exp_month: formData.get("purchase_address[exp_month]"),
    exp_year: `20${formData.get("purchase_address[exp_year]")}`,
  };
  Payjp.createToken(card, (status, response) => {
    if (status == 200) {
      const token = response.id;
      const renderDom = document.getElementById("charge-form");
      const tokenObj = `<input value=${token} type="hidden" name='purchase_address[token]'>`;
      renderDom.insertAdjacentHTML("beforeend", tokenObj);
    };
    document.getElementById("card-number").removeAttribute("name");
    document.getElementById("card-cvc").removeAttribute("name");
    document.getElementById("card-exp-month").removeAttribute("name");
    document.getElementById("card-exp-year").removeAttribute("name");

    document.getElementById("charge-form").submit();
    document.getElementById("charge-form").reset();
  });
});
};

window.addEventListener("load", pay);