// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require popper
//= require bootstrap
//= require data-confirm-modal
//= require local-time
//= require activestorage
//= require turbolinks
//= require jquery.easy-autocomplete
//= require jquery.atwho
//= require_tree .

$(document).on('turbolinks:load', function() {
    // This should be a search controller at some point
    $(function(){
        data = "/users.json";
        $("[data-behavior='mentions']").atwho({at:"@", 'data':data});
    });
});