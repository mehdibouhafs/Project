		    
			    var up = ' <i class="fa fa-sort-asc"></i>';
		    	var down = ' <i class="fa fa-sort-desc"></i>';
		    	var sort=' <i class="fa fa-sort"></i>';
		    	var ctablesorter = 0;

	

		    	$('.sortable_ie th').each(function() {
			    	var sort1 = $(this).attr('sort');
		    		if(sort1=='down' || sort1=='up'){
			    		var html = $(this).html();
				    	$(this).attr('data', html);
				    		$(this).html(html + sort);
				    		//$(this).html(html + down);
		    		}
			    	
			    });
			    $('.sortable_ie th').click(function() {
			    	var htm = $(this).attr('data');
			    	var sort = $(this).attr('sort');
			    	if(sort == 'up') {
			    		$(this).html(htm +  down );
			    		$(this).attr('sort', 'down');
			    	}
			    	else{
				    	if(sort == 'down'){
				    		$(this).html(  htm+ up);
				    		$(this).attr('sort', 'up');
				    	}
			    	}
			    });
