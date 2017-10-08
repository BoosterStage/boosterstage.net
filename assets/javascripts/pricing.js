import Cookies from 'js-cookie';

document.addEventListener('DOMContentLoaded', function(){
  var pricingNav = document.getElementById('nav--pricing')
  
  if (pricingNav && !Cookies.get('viewed_pricing_guide') && typeof(_dcq) != 'undefined' ) {

    pricingNav.addEventListener('click', function(e){
      e.preventDefault()
      _dcq.push(["showForm", {id: "36601678"}])
    })
  }
})

