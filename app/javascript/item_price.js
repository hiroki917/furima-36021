function post (){
  const priceInput = document.getElementById("item-price");
  if (!priceInput){
    return null;
  }
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    
    
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
     

    const profitNumber = document.getElementById("profit");
    const value_result = Math.floor(inputValue * 0.1)
   
    profitNumber.innerHTML = (Math.floor(inputValue - value_result));
      
  })
}


window.addEventListener('load', post);
 