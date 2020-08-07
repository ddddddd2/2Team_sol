//검색창에 글자 쓰면 DB에서 매칭되는 항목 보여주기
$( document ).ready(function() {
	$("#searchBar").keyup(function(e) {
		// 37~40 - 방향키 / 8 = backSpace / 45~46 = ins, del
		if(!(e.keyCode >= 37 && e.keyCode <= 40 || e.keyCode==8 || e.keyCode==45 || e.keyCode==46)){
		var inputVal = $(this).val();
		$(this).val(inputVal.replace(/[^(ㄱ-힣a-zA-Z0-9]/gi,'')); // 한글 숫자 영문만 가능
		// 0.2초 뒤에 실행
		setTimeout(function() {
			alert("키업 이벤트 발생");
		},500);
		}
	});
});