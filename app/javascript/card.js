const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    const card = {
      number: formData.get("purchase_information[num]"),
      cvc: formData.get("purchase_information[cvc]"),
      exp_month: formData.get("purchase_information[exp_month]"),
      exp_year: `20${formData.get("purchase_information[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("purchase_information_num").removeAttribute("name");
      document.getElementById("purchase_information_exp_month").removeAttribute("name");
      document.getElementById("purchase_information_exp_year").removeAttribute("name");
      document.getElementById("purchase_information_cvc").removeAttribute("name");
      document.getElementById("charge-form").submit();
    });
  });
};

if (document.URL.match( /purchase/ ) && document.URL.match( /new/ )) {
  window.addEventListener("load", pay);
}