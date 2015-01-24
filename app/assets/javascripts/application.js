// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

var total = 0;

for( var i = 0; i < gon.user_diaries_urls.length; i++ ) {
  var fburl = "https://graph.facebook.com/v2.1/?fields=share{comment_count}&id=".concat(gon.user_diaries_urls[i]);
  $.getJSON(fburl, function(data){
    total += parseInt(data.share.comment_count);
  });
}

$("#total_comments").text(total); 


console.log("Total of comments is: " + total);
