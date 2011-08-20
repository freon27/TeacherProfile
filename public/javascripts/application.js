// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){ $('input.ui-date-picker').datepicker({ changeYear: true, changeMonth: true, dateFormat: 'dd/mm/yy' }) });

$(document).ready(function() {
	$('select').selectbox({debug: true});
	$('#flash_notice').delay(2000).fadeTo("slow", 0.00, function(){ //fade
        $(this).slideUp("slow", function() { //slide up
            $(this).remove(); //then remove from the DOM
        });
    });
});