//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require underscore
//= require gmaps/google
//= require vue
//= require vue-router
//= require vue-resource
//= require turbolinks
//= require_tree .

let startup = function() {
  $('.inner-wrapper').css({'padding-top': $('.navbar-fixed-top').height()});
  main_map();
}

$(document).on('turbolinks:load', startup());
