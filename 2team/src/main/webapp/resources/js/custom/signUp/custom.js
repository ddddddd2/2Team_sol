	$(function(){

		// 회원가입 id 중복 확인 												 
		    															// 기본적인 형태의 정보를 보내는 방법 													 // 서버에 데이터를 전송하고, 서버에서는 받은 데이터를 처리하고 검색을 하거나 해서 다시 클라이언트에게 보냄
		$('#id').keyup(function(){
			var id = $('#id').val();
			if(id.length >= 4)
		    $.ajax({													 // 기본적인 형태의 정보를 보내는 방법 
			   															 // 서버에 데이터를 전송하고, 서버에서는 받은 데이터를 처리하고 검색을 하거나 해서 다시 클라이언트에게 보냄
		        async:true,												 // 동기 비동기 형식으로 어떻게 보낼지 
				type:'POST', 											 // 데이터 접근 방법 
				data:{"id":id}, 	 								// 내가 보낼 데이터 중괄호를 통해서 여러개를 보낼 수도 있음
																		// 아이디 중복 체크는 동기 형식으로 처리								        			 // 댓글 등록은 비동기 형식 
		        url:"/idCheck",
		        dataType:"json",
		        //contentType:"application/json; charset=UTF-8",
		        success : function(data){								 // 성공하면 서버에서 보내준 값을 콘솔로그를 통해 찍어 보여달라.
					if(data > 0){
$(function(){

		// 회원가입 id 중복 확인 												 
		// 기본적인 형태의 정보를 보내는 방법 													 // 서버에 데이터를 전송하고, 서버에서는 받은 데이터를 처리하고 검색을 하거나 해서 다시 클라이언트에게 보냄
		$('#id').keyup(function(){
			var id = $('#id').val();
			if(id.length >= 2)			//
				$.ajax({													 // 기본적인 형태의 정보를 보내는 방법 
					// 서버에 데이터를 전송하고, 서버에서는 받은 데이터를 처리하고 검색을 하거나 해서 다시 클라이언트에게 보냄
					async:true,												 // 동기 비동기 형식으로 어떻게 보낼지 
					type:'POST', 											 // 데이터 접근 방법 
					data:{"id":id}, 	 								// 내가 보낼 데이터 중괄호를 통해서 여러개를 보낼 수도 있음
					url:"/nickCheck",
					dataType:"json",
//					contentType:"application/json; charset=UTF-8",
					success : function(data){								 // 성공하면 서버에서 보내준 값을 콘솔로그를 통해 찍어 보여달라.
						if(data > 0){
						$('.dup-suc-msg').addClass('display-none')
						$('.dup-fail-msg').removeClass('display-none')
						}else{
						$('.dup-suc-msg').removeClass('display-none')
						$('.dup-fail-msg').addClass('display-none')
							
						}
						//console.log(data);
					}
				});
			else {
				$('.dup-suc-msg').addClass('display-none')
				$('.dup-fail-msg').addClass('display-none')
			}
		})

		// 회원가입 폼 validation 확인 
		$("form[name='signUpForm']").validate({ 	   // form태그의 유효성을 검사하겠다. submit 될 때 동작함.
	        rules: { 								   // 규칙
	            id: { 							   // id는 , 
	                required : true, 				   // 필수항목
	                minlength : 4 					   // 최대 4글자
	            },
	            passwd: {
	                required : true,
	                minlength : 4,
	                maxlength : 15,
	                regex: /^\w*(\d[A-z]|[A-z]\d)\w*$/ // 정규 표현식. 숫자, 영문이 하나 이상 포함되게끔
		                							   // (?=\w{8,20}$)글자가 이런 조건을 만족 한다. 라는 뜻 \w 영문,숫자
	            },
	            passwdchk: {
	                required : true,
	                equalTo : passwd			   // 누구랑 같은지 확인하는거.
	            },
	            
	            name:{
	            	required : true,
	            	minlength : 1
	            },
	            
	            phone: {
	            	required : true,
	            },
	            
	        },
	        //규칙체크 실패시 출력될 메시지
	        messages : {
	            id: {
	                required : "필수로입력하세요",
	                minlength : "최소 {0}글자이상이어야 합니다"
	            },
	            passwd: {
	                required : "필수로입력하세요",
	                minlength : "최소 {0}글자이상이어야 합니다",
	                maxlength : "최대 {0}글자이상이어야 합니다",
	                regex : "영문자, 숫자로 이루어져있으며 최소 하나이상 포함"
	            },
	            passwdchk: {
	                required : "필수로입력하세요",
	                equalTo : "비밀번호가 일치하지 않습니다."
	            },
	            name:{
	            	required : "필수로입력하세요",
	            	minlength : "최소 {1} 글자 이상이어야 합니다"
	            },
	            phone: {
	            	required : "필수로입력하세요"
	            },
	        }
	    });
		$.validator.addMethod(
			    "regex",
			    function(value, element, regexp) {
			        var re = new RegExp(regexp);
			        return this.optional(element) || re.test(value);
			    },
			    "Please check your input."
			);

		
		// 닉네임 중복 확인 												 
		    															// 기본적인 형태의 정보를 보내는 방법 													 // 서버에 데이터를 전송하고, 서버에서는 받은 데이터를 처리하고 검색을 하거나 해서 다시 클라이언트에게 보냄
		$('#nick_name').keyup(function(){
			var nick_name = $('#nick_name').val();
			if(nick_name.length >= 2){
				var regExp = /^[가-힣A-Za-z0-9]{2,10}$/
				 // 검증에 사용할 정규식 변수 regExp에 저장
			  if (nick_name.match(regExp) != null){
					  $.ajax({													 // 기본적인 형태의 정보를 보내는 방법  															 // 서버에 데이터를 전송하고, 서버에서는 받은 데이터를 처리하고 검색을 하거나 해서 다시 클라이언트에게 보냄
				        async:true,												 // 동기 비동기 형식으로 어떻게 보낼지 
						type:'POST', 											 // 데이터 접근 방법 
						data:{"nick_name":nick_name}, 	 								// 내가 보낼 데이터 중괄호를 통해서 여러개를 보낼 수도 있음
				        url:"/nickCheck",
				        dataType:"json",
				        contentType:"application/json; charset=UTF-8",
				        success : function(data){								 // 성공하면 서버에서 보내준 값을 콘솔로그를 통해 찍어 보여달라.
							if(data.cnt > 0){
								$("#owenoback").text("중복되는 닉네임이 있습니다.");
								document.getElementById("owenoback").style.color = "red";
							}else{
								$('#owenoback').text("중복되는 닉네임이 없습니다");
								document.getElementById("owenoback").style.color = "blue";
								
							}
				            //console.log(data);
				        }
					  }); // ajax 끝
			  } // 정규식 체크 통과 끝
			  else {
				  $("#owenoback").text("총 10자리의 한글,영어,숫자만 사용 가능하며 특수문자는 사용할 수 없습니다.");
				  document.getElementById("owenoback").style.color = "red";
			  } // 정규식 체크 통과 안했을 경우.
			} // 닉네임 길이 검증
		})
		
		
		
		// 이메일 중복 확인 												 
		// 기본적인 형태의 정보를 보내는 방법 													 // 서버에 데이터를 전송하고, 서버에서는 받은 데이터를 처리하고 검색을 하거나 해서 다시 클라이언트에게 보냄
		$('#email').keyup(function(){
			var email = $('#email').val();
			console.log(email);
			  var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]){2,13}@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			  // 검증에 사용할 정규식 변수 regExp에 저장
			  if(email.length >= 5) {
				  if (email.match(regExp) != null) {
					  $.ajax({													 // 기본적인 형태의 정보를 보내는 방법  															 // 서버에 데이터를 전송하고, 서버에서는 받은 데이터를 처리하고 검색을 하거나 해서 다시 클라이언트에게 보냄
						  async:true,												 // 동기 비동기 형식으로 어떻게 보낼지 
						  type:'POST', 											 // 데이터 접근 방법 
						  data:{"email":email}, 	 								// 내가 보낼 데이터 중괄호를 통해서 여러개를 보낼 수도 있음
						  url:"/emailCheck",
						  dataType:"json",
						  contentType:"application/json; charset=UTF-8",
						  success : function(data){								 // 성공하면 서버에서 보내준 값을 콘솔로그를 통해 찍어 보여달라.
							  if(data.cnt > 0){
								  $("#emailExplain").text("중복되는 이메일이 있습니다.");
								  document.getElementById("emailExplain").style.color = "red";
							  } // 중복인 경우
							  else{
								  $('#emailExplain').text("중복되는 이메일이 없습니다");
								  document.getElementById("emailExplain").style.color = "blue";
							  } // 중복이 아닌 경우
						  }
					  })
				  } // 정규식 통과했을 때 
				  else {
					  $("#emailExplain").text("이메일 형식에 맞지 않습니다.");
					  document.getElementById("emailExplain").style.color = "red";
				  } // 정규식 통과 못했을 때
			
			  }	// 이메일 길이 검증 끝
		})
		
		
		
		// 전화번호 중복 확인 												 
		// 기본적인 형태의 정보를 보내는 방법 													 // 서버에 데이터를 전송하고, 서버에서는 받은 데이터를 처리하고 검색을 하거나 해서 다시 클라이언트에게 보냄
		$('#email').keyup(function(){
			var email = $('#email').val();
			console.log(email);
			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]){2,13}@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			// 검증에 사용할 정규식 변수 regExp에 저장
			if(email.length >= 5) {
				if (email.match(regExp) != null) {
					$.ajax({													 // 기본적인 형태의 정보를 보내는 방법  															 // 서버에 데이터를 전송하고, 서버에서는 받은 데이터를 처리하고 검색을 하거나 해서 다시 클라이언트에게 보냄
						async:true,												 // 동기 비동기 형식으로 어떻게 보낼지 
						type:'POST', 											 // 데이터 접근 방법 
						data:{"email":email}, 	 								// 내가 보낼 데이터 중괄호를 통해서 여러개를 보낼 수도 있음
						url:"/emailCheck",
						dataType:"json",
						contentType:"application/json; charset=UTF-8",
						success : function(data){								 // 성공하면 서버에서 보내준 값을 콘솔로그를 통해 찍어 보여달라.
							if(data.cnt > 0){
								$("#emailExplain").text("중복되는 이메일이 있습니다.");
								document.getElementById("emailExplain").style.color = "red";
							} // 중복인 경우
							else{
								$('#emailExplain').text("중복되는 이메일이 없습니다");
								document.getElementById("emailExplain").style.color = "blue";
							} // 중복이 아닌 경우
						}
					})
				} // 정규식 통과했을 때 
				else {
					$("#emailExplain").text("이메일 형식에 맞지 않습니다.");
					document.getElementById("emailExplain").style.color = "red";
				} // 정규식 통과 못했을 때
				
			}	// 이메일 길이 검증 끝
		})

//		// 회원가입 폼 validation 확인 
//		$("form[name='signUpForm']").validate({ 	   // form태그의 유효성을 검사하겠다. submit 될 때 동작함.
//	        rules: { 								   // 규칙
//	            id: { 							   // id는 , 
//	                required : true, 				   // 필수항목
//	                minlength : 4 					   // 최대 4글자
//	            },
//	            passwd: {
//	                required : true,
//	                minlength : 4,
//	                maxlength : 15,
//	                regex: /^\w*(\d[A-z]|[A-z]\d)\w*$/ // 정규 표현식. 숫자, 영문이 하나 이상 포함되게끔
//		                							   // (?=\w{8,20}$)글자가 이런 조건을 만족 한다. 라는 뜻 \w 영문,숫자
//	            },
//	            passwdchk: {
//	                required : true,
//	                equalTo : passwd			   // 누구랑 같은지 확인하는거.
//	            },
//	            
//	            phone: {
//	            	required : true,
//	            },
//	            
//	        },
//	        //규칙체크 실패시 출력될 메시지
//	        messages : {
//	            id: {
//	                required : "필수로입력하세요",
//	                minlength : "최소 {0}글자이상이어야 합니다"
//	            },
//	            passwd: {
//	                required : "필수로입력하세요",
//	                minlength : "최소 {0}글자이상이어야 합니다",
//	                maxlength : "최대 {0}글자이상이어야 합니다",
//	                regex : "영문자, 숫자로 이루어져있으며 최소 하나이상 포함"
//	            },
//	            passwdchk: {
//	                required : "필수로입력하세요",
//	                equalTo : "비밀번호가 일치하지 않습니다."
//	            },
//	            phone: {
//	            	required : "필수로입력하세요"
//	            },
//	        }
//	    });
//		$.validator.addMethod(
//			    "regex",
//			    function(value, element, regexp) {
//			        var re = new RegExp(regexp);
//			        return this.optional(element) || re.test(value);
//			    },
//			    "Please check your input."
//			);
//
//		
})
