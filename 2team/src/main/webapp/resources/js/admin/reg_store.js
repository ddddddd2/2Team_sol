$('document').ready(function(){
	$('#nameCheck').click(function(e){
		e.preventDefault();
		var name = $('#name').val();
		$.ajax({
			type:"POST",
			url:"/admin/reg_storePro/nameChk",
			data:{
				"nameChk":name
			},
			dataType:"JSON",
			success : function(data){
				console.log(data);
					$('#nameCheck2').text("중복확인해야함.");
				switch(data){
				case 0 : $('#nameCheck2').text("사용가능한 이름입니다").css("color","blue");break;
				case 1 : $('#nameCheck2').text("사용불가능한 이름입니다").css("color","red");break;
				}
			},
			error : function(data){
				alert("에러 : "+data)
				console.log(data);
			}
			
		})
		
	}); // 식당명 중복체크
	
	// 주소 중복체크 시작
	$('#addrCheck').click(function(){
		var addr = $('#addrText').val();
		// 공백 갯수 구하기
// 		var m = addr.match(/\s/g);

		var length = addr.length;
		var fs = addr.indexOf(" "); //첫번째 공백 구함
		var si = addr.substring(0, fs); // 시 분리
		var addr2 = addr.substring(fs+1,length) // 시 제외한 문자열 
		$('#si').val(si);
		
		var length2 = addr2.length; // 구를 제외한 문자열
		var ss = addr2.indexOf(" "); //두번째 공백
		var gu = addr2.substring(0,ss); // 구분리
		var addr3 = addr2.substring(ss+1,length2)
		$('#gu').val(gu);
		
		var lenth3 = addr3.length;
		var ts = addr3.indexOf(" ");
		var dong = addr3.substring(0, ts);
		var addr4 = addr3.substring(ts+1, lenth3)
		$('#dong').val(dong);
		$('#addrDetail').val(addr4)
		// 전체 길이 먼저 담기
		//si 잘라내기
	});
	
	// submit 시작
	$('#submitBtn').click(function(e){
		e.preventDefault();
		var name = $('#name').val();
		var si = $('#si').val();
		var gu = $('#gu').val();
		var dong = $('#dong').val();
		var addrDetail = $('#addrDetail').val();
		var tel = $('#tel').val();
		var hour = $('#hour1').val()+" ~ "+$('#hour2').val();
		var file = $('#file').val();
		
		console.log(file)
	})
	
	$('#file').change(function(e){
			e.preventDefault();
		    var fileName = $("#flie").val();
		    console.log(fileName)
		    var idxDot = fileName.lastIndexOf(".") + 1;
		    
		    console.log(idxDot);
		    var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
			    if(extFile == "jpg" || extFile == "jpeg" || extFile == "png"){
			    	console.log("정상 파일")
			    	console.log(extFile)
			    	
			    }else{
			    	alert("Only jpg/jpeg and png files are allowed!");
			 		$("#file").val("");
			    }
 		    } 
	})
// 	$('#btn').click(function(e){
// 		e.preventDefault();
// 		var name = $('#name').val();
// 		var address1 = $('#address1').val();
// 		var si = $('#si').val();
// 		var gu = $('#gu').val();
// 		var dong = $('#dong').val();
// 		var tel = $('#tel').val();
// 		var hour =$('#hour').val();
// 	$.ajax({
// 		type:"POST",
// 		url:"/reg_storePro",
// 		data:{
// 			"name":name,
// 			"address1":address1,
// 			"si":si,
// 			"gu":gu,
// 			"dong":dong,
// 			"tel":tel,
// 			"hour":hour
// 		},
// 		dataType:"JSON",
// 		success : function(msg){
// 			alert(msg);
// 		}
		
// 	})
// 	}) // 끝
})