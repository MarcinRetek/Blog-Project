$(document).ready(function() {
	
	//background on hover
	$('.article').mouseover(function(){
		$(this).css('background','linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0))');
	});
	$('.article').mouseout(function(){
		$(this).css('background','transparent');
	});
	
	//Limit the length of text in different containers
	var $bigLimit = 500;
	var $smallLimit = 100;
	var $bottomLimit = 300;
	
	for(var i = 0; i < 3; i++){
		$('#bigOneArticle'+i).html(
				$('#bigOneArticle'+i).html().substr(0, $bigLimit) + ' ...'		
		);
	}
	
	for(var i = 6; i < 12; i++){
		$('#smallOneArticle'+i).html(
				$('#smallOneArticle'+i).html().substr(0, $smallLimit) + ' ...'		
		);
	}
	for(var i = 3; i < 6; i++){
		$('#bottomOneArticle'+i).html(
				$('#bottomOneArticle'+i).html().substr(0, $bottomLimit) + ' ...'		
		);
	}
	
	//Replace /n in the text body
	$('.article p').each(function(){
		$(this).html(
			$(this).html().replace('/n', ' ', 'g')
		);
	});

});

