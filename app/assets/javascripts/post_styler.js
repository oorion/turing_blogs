$(document).ready(function(){
	unMouseOver();
	mouseOver();
});

function unMouseOver(){
	$(".post").mouseleave(function(){
	  $(this).removeClass("active");
	  $(this).find('a').each(function(i, v){
	    changeTextColor(v, '#337ab7');
	  });
	});
}

function mouseOver(){
	$(".post").mouseenter(function(){
		$(this).addClass("active");
		$(this).find('a').each(function(i, v){ 
			changeTextColor(v, 'white');
		});
	});
}

function changeTextColor(element, color) {
	$(element).css('color', color); 
}