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
//= require jquery.turbolinks
//= require jquery_ujs
//= bootstrap-sprockets
//= require_tree .
//= require nested_form_fields
//= require moment
//= require bootstrap-datetimepicker


$(function(){
	$('#button').bind("click",function(){
		var re = new RegExp($('#search').val());
		$('#result tbody tr').each(function(){
			var txt = $(this).find("td:eq(0)").html();
			if(txt.match(re) != null){
				$(this).show();
			}else{
				$(this).hide();
			}
		});
	});

	$('#button2').bind("click",function(){
		$('#search').val('');
		$('#result tr').show();
	});
});

// $(function(){
//   $('.datepicker').datetimepicker({
//     format : "YYYY/MM/DD",
//     icons: {
//       previous: "fa fa-arrow-left",
//       next: "fa fa-arrow-right"
//     }
//   });
//   $('.datetimepicker').datetimepicker({
//     format : "HH:mm"
//     icons: {
//       time: "fa fa-clock-o",
//       date: "fa fa-calendar",
//       up: "fa fa-arrow-up",
//       down: "fa fa-arrow-down",
//       previous: "fa fa-arrow-left",
//       next: "fa fa-arrow-right"
//     }
//   });
// });