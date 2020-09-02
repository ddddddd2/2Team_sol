	$('document').ready(function(){
		$('#searchAction').click(function(e){
			e.preventDefault();
			var keyword = $('#header_keyword').val();
			var category = $('#header_category').val();
			var url = "/custom/sub1?keyword="+keyword+"&category="+category;
			
			$('#search_form').attr("action",url);
			$('#search_form').submit();
			
		})
		
	})