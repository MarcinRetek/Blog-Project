$(document).ready(function() {
	
	//background on hover
	$('.article').mouseover(function(){
		$(this).css('background','linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0))');
	});
	$('.article').mouseout(function(){
		$(this).css('background','transparent');
	});
	
	var $smallLimit = 90;

	for(var i = 6; i < 12; i++){
		$('#smallOneArticle'+i).html(
				$('#smallOneArticle'+i).html().substr(0, $smallLimit) + ' ...'		
		);
	}
	
	//Replace /n in the text body
	var oldText = $('.articleBody p').html();
	var newText = oldText.replace(/\/n/g, "</p><p>");
	$('.articleBody p').html(newText);
	
});