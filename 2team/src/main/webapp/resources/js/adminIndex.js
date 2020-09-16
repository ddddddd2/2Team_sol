//검색창에 글자 쓰면 DB에서 매칭되는 항목 보여주기
	
	$('#searchBtn').click(function(e){
		e.preventDefault();
		var sv = document.getElementById("searchBar").value; // 검색어 가져오기
		var op = document.getElementById("searchSelectBox");
		var opop = op.options[op.selectedIndex].value; // 검색 옵션 가져오기
			if(sv==""){
				alert("검색어를 입력해주세요");
			} else{
				if(opop==""){
						alert("옵션을 선택해주세요");
				} else{
						document.form1.submit();
				}
			}
	})
		
	function booking_cancel(e){
		var t = document.querySelector("#status_15").text;
		var t2 = document.querySelector('#status_15').html;
		
		console.log("t="+t)
		console.log("t2="+t2)
		$.ajax({
			type:"POST",
			url:"/booking_cancel",
			data:{"no":e},
			success : function(d){
				var num = "'.status "+d+"'";
				var num2 = Document.querySelector('#status 15').value;
				console.log(num2)
				
			},
			error : function(d){
				alert(d)
			}
		})
	}
