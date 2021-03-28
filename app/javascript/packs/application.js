
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import $ from 'jquery';
import 'bootstrap/dist/js/bootstrap';
import Cookies from 'js-cookie'

Rails.start()
Turbolinks.start()
ActiveStorage.start()



$(document).on('turbolinks:load', function() {
  const Store = {}
  $("#payment").hide();
  $("#finish").hide();
  
  const validation = () => {
    var account = $("input.account").val();
    var bank = $("input.bank").val();
    $("#payment-but").on('click', function(e){
      e.preventDefault();
      if (account.length===10 && bank.length ===5) {
        $("#payment-info").html('');
      }
      $("#payment-info").html('Account number should 10 digit and bank detail 5 digit long'); 
      $("#payment-info").addClass('alert alert-danger');  
      setTimeout(() => {
        $("#payment-info").html('');
        $("#payment-info").removeClass('alert alert-danger');
      }, 3000);
    });
    return true;
  }
  
  $("#info-but").on('click', (e)=> {
    e.preventDefault();
    var street = $("input.street").val();
    Store.street = street;
    var zipcode = $("input.zipcode").val();
    Store.zipcode = zipcode;
    var name = $("input.name").val();
    Store.name = name;
    var country = $("input.country").val();
    Store.country = country;
    Cookies.set('checkout', Store);
    if(street && name && zipcode && country){
      $("#payment").show();
      $("#info").hide();
    }
  })
  
  $("#payment-but").on('click', (e)=>{
    e.preventDefault();
    var account = $("input.account").val();
    Store.account = account;
    var bank = $("input.bank").val();
    Store.bank = bank;
    Cookies.set('checkout', Store);
    $("#payment").hide();
    $("#finish").show();
  });

  $("#finish-but").on('click', (e)=> {
    setTimeout(() => {
      Cookies.set('checkout', '');  
    }, 4000);
  });

  const setForm = () =>{
    if(Cookies.get('checkout')){
      const hash = JSON.parse(Cookies.get('checkout'))
      $("input.street").val(hash.street);
      $("input.zipcode").val(hash.zipcode);
      $("input.name").val(hash.name);
      $("input.country").val(hash.country);
      $("input.account").val(hash.account);
      $("input.bank").val(hash.bank);
    }
  } 
  setForm();
  validation();
});