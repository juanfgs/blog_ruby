
var rating_widget = function(){
    var titles = ["Very Bad", "Bad","Decent","Good", "Excellent"];
    for(var i = 5; i > 0; i--){
	var star = $('<span class="star" data-rating="'+i+'" title="'+ titles[i -1] +'"> </span>');
	star.click(function(){
	    $.ajax({
		method: 'POST',
		data: { rating: $(this).attr('data-rating'), post_id: $('#ratings').attr('data-post') },
		url: '/ratings/rate',
		success:function(response){
		    alert('sent' + response);
		    $('#ratings .stars').hide();
		}
	    });
	})

	star.appendTo("#ratings .stars");
    }
}

$(document).ready(rating_widget);
$(document).on('page:load',rating_widget);







