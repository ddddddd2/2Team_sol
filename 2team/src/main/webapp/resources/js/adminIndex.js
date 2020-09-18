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
		
	$('#UsubmitBtn').click(function(e){
		e.preventDefault();
		var name = $('#name').val();
		var address1 = $('#addrText').val();
		var tel = $('#tel').val();
		var hour = $('#hour1').val();
		alert(hour)
		var no = $('#no').val();
		$.ajax({
			type:"GET",
			url:"/UpdateRes",
			data:{"name":name,"address1":address1,"tel":tel,"hour":hour,"no":no},
			success : function(data){
				if(data==0){
					alert("실패")
				} else {
					alert("수정 성공")
				}
			},
			error : function(){
				alert("ajax 실패")
			}
			
			
		})
		
	})
		
	function booking_cancel(e){
		var s = "#status_"+e;
		var t = document.querySelector(s).text;
		var t2 = document.querySelector(s).html;
		var url = window.location.href;
		console.log("t="+t)
		console.log("t2="+t2)
		$.ajax({
			type:"POST",
			url:"/booking_cancel",
			data:{"no":e},
			success : function(d){
				document.location.href=url
			},
			error : function(d){
				alert(d)
			}
		})
	}

	
	
	function fn_prev(page, curBlock, rangeSize) {

		var page = ((curBlock - 2) * rangeSize) + 1;
		var curBlock = curBlock - 1;

		var url=window.location.pathname;
		url = url + "?curPage=" + page;
		url = url + "&curBlock=" + curBlock;

		location.href = url;
	}

  //페이지 번호 클릭

	function fn_pagination(page, curBlock, rangeSize, searchType, keyword) {
		var url=window.location.pathname;
		url = url + "?curPage=" + page;
		url = url + "&curBlock=" + curBlock;

		location.href = url;	
	}

	//다음 버튼 이벤트

	function fn_next(curPage, curBlock, rangeSize) {
		var curPage = parseInt((curBlock * rangeSize)) + 1;
		var curBlock= parseInt(curBlock) + 1;
		console.log(curPage+"=="+curBlock);
		var url=window.location.pathname;

		url = url + "?curPage=" + curPage;

		url = url + "&curBlock=" + curBlock;
		location.href = url;
	}