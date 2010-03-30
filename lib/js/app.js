$('#subnav li a').live('click', function(e) {
	var $this = $(this),
	closest_li;

	$('#subnav li').removeClass('active');

	$("#detailed, #backtrace, #environment, #parameters").hide();

	closest_li = $this.closest('li');

	closest_li.addClass('active');

	if ($('#subnav li').index(closest_li) === 0) {
		$("#detailed, #backtrace, #environment, #parameters").show();
	}

	$($this.closest('a').attr('href')).show();

	e.preventDefault();
});

