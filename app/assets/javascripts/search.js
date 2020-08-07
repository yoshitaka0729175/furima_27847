$(function(){
  $('.price-input').on('keyup',function(){
    let input = $(".price-input").val();
    let tax = Math.round(input*0.1);
    $('#add-tax-price').html(tax);
    $('#profit').html(input - tax);
  });
});