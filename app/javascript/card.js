if( document.URL.match(/orders/)){

  const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);// PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    
    const card = {
      number: formData.get("order_addresses[number]"),
      cvc: formData.get("order_addresses[cvc]"),
      exp_month: formData.get("order_addresses[exp_month]"),
      exp_year: `20${formData.get("order_addresses[exp_year]")}`,
    };
    
    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        console.log(token)
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='order_addresses[token]'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("order_addresses_number").removeAttribute("name");
        document.getElementById("order_addresses_cvc").removeAttribute("name");
        document.getElementById("order_addresses_exp_month").removeAttribute("name");
        document.getElementById("order_addresses_exp_year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } else {
        alert('カードの情報を入力してください')
        document.getElementById("message").removeAttribute("disabled");

      }
    });
  });
};

window.addEventListener("load", pay);
}