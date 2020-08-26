var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
 mapOption = {
     center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
     level: 5 // 지도의 확대 레벨
 };  
 
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성 


var geocoder = new kakao.maps.services.Geocoder(); // 주소 -> 좌표 변환 객체 

var points=[];	// 주소들의 좌표 배열 
var addressList = []; // 전체주소 담을 배열

var bounds = new kakao.maps.LatLngBounds(); // 재설정할 범위 정보 객체 

var currCategory = '';

// 주소들을 addressList 배열 에 담아줌 
$.each( $("#list2-1 input") , function(k,v){
	addressList.push($(v).val()); 
});

//addressList에 들어간 주소들을 차례대로 마커 표시 해줌 
addressList.forEach(function(address){
   
   geocoder.addressSearch(address, function(result, status){
   
      // 정상적으로 검색이 완료됐으면 
      if (status === kakao.maps.services.Status.OK) {

         var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

         // 결과값으로 받은 위치를 마커로 표시합니다
         var marker = new kakao.maps.Marker({
                 map: map,
              position: coords
         });
         
         bounds.extend(coords);

         //points.push(coords);

          // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
          //map.setCenter(coords);
          
         }
      }); // geocoder end

}); // addressList foreach end



// 처음에 선택된 카테고리 색깔 바꿈
function func1(){
	
}


// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

//카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();

    } else {
        currCategory = id;
        changeCategoryClass(this);

    }
}

//클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
} 

   // 실행 순서 문제 때문에 맵의 위치 이동은 window.load 가 완료되면 setBounds 시켜줘야함 
$(window).load(function() {
      map.setBounds(bounds);
      
      addCategoryClickEvent();
});

/*
$(function(){
	function ajaxProcess(){
		
		var category='';
		var keyword = $('#keyword').val();
		
		if(currCategory === 'c_entire'){category = 0;}
		else if(currCategory === 'c_korean'){category = 2;} //한식
		else if(currCategory === 'c_chinese'){category = 3;} //중식
		else if(currCategory === 'c_american'){category = 4;} //양식
		else if(currCategory === 'c_japanese'){category = 5;} //일식
		else if(currCategory === 'c_cafe'){category = 6;} //카페
		
		$.ajax({													 
			async:true,												
			type:'get', 							
			data:{"keyword": keyword , "category":category}, 	 								
			url:"/custom/sub1",
			dataType:"json",

			success : function(data){								 
				if(){

				}else{

				}
			}
		});
	}

	
});
*/