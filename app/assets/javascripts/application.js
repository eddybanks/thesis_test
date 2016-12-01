//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require underscore
//= require gmaps/google
//= require turbolinks
//= require react
//= require react_ujs
//= require components
//= require_tree .

let startup = function() {
  $('.inner-wrapper').css({'padding-top': $('.navbar-fixed-top').height()});
  main_map();
}

$(document).on('turbolinks:load', startup());
