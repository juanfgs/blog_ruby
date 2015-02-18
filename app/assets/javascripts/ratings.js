
var rating_widget = function(){
    var titles = ["Very Bad", "Bad","Decent","Good", "Excellent"];
    for(var i = 5; i > 0; i--){
	var star = $('<span class="star" data-rating="'+i+'" title="'+ titles[i -1] +'"> </span>');
	star.click(function(){
	    $.ajax({
		method: 'GET',
		dataType: "json",
		data: { rating: $(this).attr('data-rating'), post_id: $('#ratings').attr('data-post') },
		url: '/ratings/rate',
		success:function(response){

		    if(response.errors){
			for(error in response.errors){
			    $('<div class="alert alert-warning" role="alert"><span>'+error+' </span>:  '+response.errors[error]+'</div>').insertAfter('#ratings');
			}
		    } else {
			$('<div class="alert alert-success" role="alert">Post rated!</div>').insertAfter('#ratings');
			$('#ratings .stars').hide();
		    }
			
		}
	    });
	})

	star.appendTo("#ratings .stars");
    }
}

$(document).ready(rating_widget);
$(document).on('page:load',rating_widget);







