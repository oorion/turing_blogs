$(document).ready(function(){
	unMouseOver();
	mouseOver();
});

function unMouseOver(){
	$(".post").mouseleave(function(){
	  $(this).removeClass("active");
	  findLinksAndIterate.call(this, changeTextColor, '#337ab7');
	});
}

function mouseOver(){
	$(".post").mouseenter(function(){
		$(this).addClass("active");
		findLinksAndIterate.call(this, changeTextColor, 'white');
	});
}

function findLinksAndIterate(method, color) {
	$(this).find('a').each(function(i, v){
    changeTextColor(v, color);
  });
}

function changeTextColor(element, color) {
	$(element).css('color', color); 
}
