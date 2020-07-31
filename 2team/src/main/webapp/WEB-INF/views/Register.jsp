<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원가입 </title>
<!-- <link href="./resources/css/main.css" rel="stylesheet" type="text/css"> -->
<script src="./resources/js/jquery-1.10.2.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<script>
	$(function(){
		$('#id').keyup(function(){
			var id = $(this).val();
			if(id.length >= 2)
		    $.ajax({													 // 기본적인 형태의 정보를 보내는 방법 
			   															 // 서버에 데이터를 전송하고, 서버에서는 받은 데이터를 처리하고 검색을 하거나 해서 다시 클라이언트에게 보냄
		        async:true,												 // 동기 비동기 형식으로 어떻게 보낼지 
				type:'POST', 											 // 데이터 접근 방법 
				data:id, 	 											 // 내가 보낼 데이터 중괄호를 통해서 여러개를 보낼 수도 있음
													        			 // 아이디 중복 체크는 동기 형식으로 처리
													        			 // 댓글 등록은 비동기 형식 
		        url:"<%=request.getContextPath()%>/idCheck",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){								 // 성공하면 서버에서 보내준 값을 콘솔로그를 통해 찍어 보여달라.
					if(data['Check']){
						$('.dup-suc-msg').removeClass('display-none')
						$('.dup-fail-msg').addClass('display-none')
					}else{
						$('.dup-suc-msg').addClass('display-none')
						$('.dup-fail-msg').removeClass('display-none')
					}
		            console.log(data);
		        }
			});

			else {
				$('.dup-suc-msg').addClass('display-none')
				$('.dup-fail-msg').addClass('display-none')
			}
		})

		$('form').validate({ 						   // form태그의 유효성을 검사하겠다. submit 될 때 동작함.
	        rules: { 								   // 규칙
	            id: { 								   // id는 , 
	                required : true, 				   // 필수항목
	                minlength : 2 					   // 최대 4글자
	            },
	            pw: {
	                required : true,
	                minlength : 2,
	                maxlength : 15,
	                regex: /^\w*(\d[A-z]|[A-z]\d)\w*$/ // 정규 표현식. 숫자, 영문이 하나 이상 포함되게끔
		                							   // (?=\w{8,20}$)글자가 이런 조건을 만족 한다. 라는 뜻 \w 영문,숫자
	            },
	            pwcheck: {
	                required : true,
	                equalTo : pw					   // 누구랑 같은지 확인하는거.
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
	            pw: {
	                required : "필수로입력하세요",
	                minlength : "최소 {0}글자이상이어야 합니다",
	                maxlength : "최대 {0}글자이상이어야 합니다",
	                regex : "영문자, 숫자로 이루어져있으며 최소 하나이상 포함"
	            },
	            pwcheck: {
	                required : "필수로입력하세요",
	                equalTo : "비밀번호가 일치하지 않습니다."
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
	})
</script>
<style type="text/css">

	*{
		margin: 0;
		padding: 0;
	}
	
	body{
		background-color: rgb(245,246,247);
	}
	
	.container{
		width: 500px;
		margin: auto;
	}
	
	.logo{
		text-align: center;
		margin-top: 20px;
        }
        
	.logo>a{
		font-size: 35px;
		font-weight: bold;
        }
	
	.text-id, .text-pw, .text-pwcheck, .text-name, .text-gender, .text-email, .text-phone{
		font-weight: bold;
	}

	.box-id, .box-pw, .box-pwcheck, .box-name, .box-gender, .box-email, .box-phone{
	    height: 50px;
	    margin-top: 10px;
	    padding: 10px;
	    margin-bottom: 10px;
	    background-color: white;
	    border: rgb(218,218,218) 2px solid;
	    box-sizing: border-box;
	}
	
	.box-id>input, .box-pw>input, .box-pwcheck>input, .box-name>input, .box-gender #gender, .box-email>input, .box-phone>input {
		padding: 5px 5px;
		margin: auto;
		width: 100%;
		border: 2px solid rgb(218,218,218);
		box-sizing: border-box;
        font-weight: bold;
	}
	
	.box-button button{
		text-align: center;
		width: 100%;
		height: 50px;
		margin-top: 5px;
		border: 2px solid rgb(218,218,218);
		box-sizing: border-box;
		font-size: 20px;
		font-weight: bold;
	}
	
	.box-id>label{
    line-height: 28px;
	}
	
	.dup-fail-msg, .dup-suc-msg{
		color : red;
		line-height : 16px;
		margin-bottom : 10px;
		font-weight: bold;
	}
	.dup-suc-msg{
		color : green;
	}
	
	.display-none{
		display: none;
	}
	
	label.error {
		color: red;
		line-height : 16px;
		font-size: 12px;
		font-weight: bold;
	}	
	
</style>
</head>
<body>
	<form class="container" name="form" title="회원가입" method="post" action="<%=request.getContextPath()%>/register">
		<div class="logo">
			<a href=""> <img src="./resources/data/logo.gif" alt="" /> </a>
		</div>
		<div class="container-id">
			<div class="text-id"> 아이디 </div>
			<div class="box-id">
				<input type="text" title="아이디" name="id" id="id" placeholder="아이디를 입력하시오." >
			</div>

			<label id="id-error" class="error" for="id"></label>     
			       
			<div class="dup-fail-msg display-none"> 이미 사용중이거나 탈퇴한 아이디입니다. </div>
			<div class="dup-suc-msg display-none"> 사용 가능한 아이디 입니다.</div>
		</div>
				
		<div class="container-pw">
			<div class="text-pw"> 비밀번호 </div>
			<div class="box-pw">
				<input type="password" title="비밀번호" name="pw" id="pw" placeholder="비밀번호를 입력하시오." >
			</div>
		</div>
		
		<label id="pw-error" class="error" for="pw"></label>
		
		<div class="container-pwcheck">
			<div class="text-pwcheck"> 비밀번호 확인 </div>
			<div class="box-pwcheck">
				<input type="password" title="비밀번호확인" name="pwcheck" id="pwcheck" placeholder="비밀번호를 입력하시오." >
			</div>
		</div>
		
		<label id="pwcheck-error" class="error" for="pwcheck"></label>
			
		<div class="container-name">			
			<div class="text-name"> 이름 </div>
			<div class="box-name">
				<input type="text" title="이름" name="name" id="name">
			</div>
		</div>			
		
		<div class="container-gender">
            <div class="text-gender"> 성별 </div>
            <div class="box-gender">
                <select name="gender" id="gender">
                    <option value="">성별</option>
                    <option value="Male">남자</option>
                    <option value="Female">여자</option>
                </select>
            </div>
        </div>
		
		<div class="container-email">
			<div class="text-email">이메일</div>
			<div class="box-email">
				<input type="text" title="이메일" name="email" id="email" placeholder="abc @ gmail.com" >
			</div>
		</div>
		
		<div class="container-phone">
			<div class="text-phone"> 휴대전화번호 </div>
			<div class="box-phone">
				<input type="text" title="휴대전화번호" name="phone" id="phone" placeholder="010-1234-1234" >
			</div>
			<label id="phone-error" class="error" for="phone"></label>
		</div>
		<div class="container-button">
			<div class="box-button">			
				<button class="btn-submit"> 가입하기  </button>
			</div>
		</div>		
	</form>		
</body>
</html>