
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import $ from 'jquery';
import 'bootstrap/dist/js/bootstrap';

Rails.start()
Turbolinks.start()
ActiveStorage.start()



$(document).on('turbolinks:load', function() {
  $("#payment").hide();
  $("#finish").hide();
  
  function validation(){
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
  validation()
});