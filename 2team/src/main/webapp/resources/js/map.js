function getLocation() {
	  if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(showPosition);
	    console.log(position.coords.latitude);
	  } else { 
	    alert("위치 정보를 불러올 수 없습니다");
	  }
	}
function showPosition(position) {
	var la = position.coords.latitude;
	var lo = position.coords.longitude;
	}


// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(la, lo), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨 	
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 