import Cookies from 'js-cookie';

document.addEventListener('DOMContentLoaded', function(){
  var pricingNav = document.querySelectorAll('[data-pricing]')
  
  if (pricingNav && !Cookies.get('viewed_pricing_guide') && typeof(_dcq) != 'undefined' ) {
    pricingNav.forEach((el) => {
      el.addEventListener('click', function(e){
        e.preventDefault()
        _dcq.push(["showForm", {id: "36601678"}])
      })
    })
  }
})

