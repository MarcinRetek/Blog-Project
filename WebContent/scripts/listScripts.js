$(document).ready(function() {
	
	//background on hover
	$('.article').mouseover(function(){
		$(this).css('background','linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0))');
	});
	$('.article').mouseout(function(){
		$(this).css('background','transparent');
	});
	
	var $smallLimit = 600;

	//limit paragraph size
	$('.list .article p').each(function(){
		$(this).html(
			$(this).html().substr(0, $smallLimit) + ' ...'
		);
	});
		
	
	//Replace /n in the text body
	$('.list .article p').each(function(){
		$(this).html(
			$(this).html().replace('/n', ' ', 'g')
		);
	});
	
});