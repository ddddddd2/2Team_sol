	$('document').ready(function(){
		$('#searchAction').click(function(e){
			e.preventDefault();
			var keyword = $('#keyword').val();
			var category = $('#header_category').val();
			var url = "/custom/sub1?keyword="+keyword+"&category="+category;
			
			document.location.href=url;
		})
		
	})