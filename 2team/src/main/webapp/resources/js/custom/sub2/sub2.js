<<<<<<< HEAD
		// 첫번째 , 마지막 메뉴에 class 속성 추가 
   		$(function(){
   			$(".menu_list li:first").addClass("menu_fst");
   			$(".menu_list li:last").addClass("menu_last");
   			
   		});
   		
   	    // 리뷰 작성 버튼 클릭 시 이벤트 
   		$(".btn_enroll").click(function(){
   			var star_rating = $("output>b").text();
   			
   			if(star_rating <= 0)
   			{
   				alert("별점을 선택해 주세요 ...!!! ");
   				return false;
   			}
   			
   			$("#review_form [name = 'rating']").val(star_rating);	
   			
   			$("#review_form").submit();
   		
   		});
   	    
   	    // 이미지가 아닌 file 들어올 때 걸러주기 
	   	function validateFileType(){
   	   	    var fileName = $("#review_form [name = 'file2']").val();
   	   	    var idxDot = fileName.lastIndexOf(".") + 1;
   	   	    var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
   	   	    if(extFile == "jpg" || extFile == "jpeg" || extFile == "png"){
   	   	    	
   	   	    }else{
   	   	    	alert("Only jpg/jpeg and png files are allowed!");
   	   	 		$("#review_form [name = 'file2']").val("");
   	   	    }
   	    }
   	    
   	    // 글자수 check
   	    $(".review_content").on('keyup',function(){
   	    	var content = $(".review_content").val();
   	    	var cnt = content.length;
   	    	if(cnt <= 200){
   	    		$(".txt_len").text(cnt);
   	    	}else{
   	    		alert("over 200 !!");
   	    	}
   	    });
   	 	
   	    // fancy box modal 창 
=======
		// 첫번째 , 마지막 메뉴에 class 속성 추가 
   		$(function(){
   			$(".menu_list li:first").addClass("menu_fst");
   			$(".menu_list li:last").addClass("menu_last");
   			
   		});
   		
   	    // 리뷰 작성 버튼 클릭 시 이벤트 
   		$(".btn_enroll").click(function(){
   			var star_rating = $("output>b").text();
   			
   			if(star_rating <= 0)
   			{
   				alert("별점을 선택해 주세요 ...!!! ");
   				return false;
   			}
   			
   			$("#review_form [name = 'rating']").val(star_rating);	
   			
   			$("#review_form").submit();
   		
   		});
   	    
   	    // 이미지가 아닌 file 들어올 때 걸러주기 
	   	function validateFileType(){
   	   	    var fileName = $("#review_form [name = 'file2']").val();
   	   	    var idxDot = fileName.lastIndexOf(".") + 1;
   	   	    var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
   	   	    if(extFile == "jpg" || extFile == "jpeg" || extFile == "png"){
   	   	    	
   	   	    }else{
   	   	    	alert("Only jpg/jpeg and png files are allowed!");
   	   	 		$("#review_form [name = 'file2']").val("");
   	   	    }
   	    }
   	    
   	    // 글자수 check
   	    $(".review_content").on('keyup',function(){
   	    	var content = $(".review_content").val();
   	    	var cnt = content.length;
   	    	if(cnt <= 200){
   	    		$(".txt_len").text(cnt);
   	    	}else{
   	    		alert("over 200 !!");
   	    	}
   	    });
   	 	
   	    // fancy box modal 창 
>>>>>>> refs/heads/mypage
   	 	$('.fancybox').fancybox();