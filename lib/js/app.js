$('#subnav li a').live('click', function(e) {
	var $this = $(this);

	$('#subnav li').removeClass('active');

	$("#summary, #backtrace, #environment, #parameters").hide();

	$this.closest('li').addClass('active');

	$($this.closest('a').attr('href')).show();

	e.preventDefault();
});

