var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
 mapOption = {
     center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
     level: 5 // 지도의 확대 레벨
 };  
 
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성 


var geocoder = new kakao.maps.services.Geocoder(); // 주소 -> 좌표 변환 객체 

var points=[];	// 주소들의 좌표 배열 
var addressList = []; // 전체주소 담을 배열
var marker;
var markers = [];

var bounds ; // 재설정할 범위 정보 객체 

var currCategory = '';

function drawMarker(){
		
			removeMarker();
			
			bounds = new kakao.maps.LatLngBounds();
			
			// 주소들을 addressList 배열 에 담아줌 
			$.each( $("#list2-1 input.res_address") , function(k,v){
				addressList.push($(v).val());
			});
			
			//addressList에 들어간 주소들을 차례대로 마커 표시 해줌 
			addressList.forEach(function(address,index){
			   geocoder.addressSearch(address, function(result, status){
				  
			      // 정상적으로 검색이 완료됐으면 
			      if (status === kakao.maps.services.Status.OK) {

			         var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			         var markerImageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_normal.png';
			         var imageSize = new kakao.maps.Size(29,40),
			         	 imageOptions = {
			        	 	spriteOrigin:new kakao.maps.Point(30,index*50),
			        	 	spriteSize:new kakao.maps.Size(276,891) // 원본과의 비율?
			         	};
			         
			         var markerImage = new kakao.maps.MarkerImage(markerImageSrc,imageSize,imageOptions);
			         
			         // 결과값으로 받은 위치를 마커로 표시합니다
			         marker = new kakao.maps.Marker({
			              position: coords,
			              image:markerImage // 마커 이미지 설정 
			         });
			         
			         marker.setMap(map);
			         markers.push(marker);
			         bounds.extend(coords);
			         map.setBounds(bounds); 
			
			         //points.push(coords);

			          // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			          //map.setCenter(coords);
			      }
			         
			      }); // geocoder end

			}); // addressList foreach end
}// drawMaker end


// 지도위에 표시되고 있는  마커 삭제 
function removeMarker(){
	for(var i = 0; i<markers.length; i++){
		markers[i].setMap(null);
	}
	addressList= [];
	markers = [];
	bounds = null;
}

// 받아온 category 에 따른 초기  스타일을 적용(category bar 처음에 선택된거 불들어 오게 )
function categoryInit(){
	var category_no = $('#category1').val();
	if(category_no == 0){ $('#c_entire').addClass("on"); }
	else if(category_no == 2){ $('#c_korean').addClass("on"); }
	else if(category_no == 3){ $('#c_chinese').addClass("on"); }
	else if(category_no == 4){ $('#c_american').addClass("on"); }
	else if(category_no == 5){ $('#c_japanese').addClass("on"); }
	else if(category_no == 6){ $('#c_cafe').addClass("on"); }
	
}

//각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;
    
    for (var i=0; i<children.length; i++) {
    	
        children[i].onclick = onClickCategory;
    }
}

//카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
	
	var nextCategory;
	
    var id = this.id,
        className = this.className;
    
    if(id == 'c_entire'){nextCategory = 0;}
    else if(id =='c_korean'){nextCategory = 2;}
    else if(id =='c_chinese'){nextCategory = 3;}
    else if(id =='c_american'){nextCategory = 4;} 
    else if(id =='c_japanese'){nextCategory = 5;} 
    else if(id =='c_cafe'){nextCategory =6;}
    
    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();

    } else {
        currCategory = id;
        changeCategoryClass(this);
        
		var keyword = $('#keyword1').val();
		var url = "/custom/sub1?keyword="+keyword+"&category="+nextCategory;
		
		document.location.href=url;
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

$('#list2-1 #res_name').click(function(e){ // event 
	e.preventDefault();
	
    // 출력된 음식점 리스트 css 변경
    $('#list2-1 li').css("background","white");
	
    $(this).closest("li").css("background","#eff7ff");
	$.ajax({
		type:"post",
		url:"/custom/getResInfo",
		data:{ no : this.dataset.no }, // a링크의 -> data-no = ${resdto.no} 값을 넘겨줌 
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType : "json",
		success : function(hmap){
	        //Ajax 성공

			// 지도에서 클릭 된 음식점 마커 이미지 변경 ...
			var index = addressList.indexOf(hmap.resdto.address1); // 내가 클릭한 음식점의 index 위치 
			
	        var markerImageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_normal.png';
	        var imageSize = new kakao.maps.Size(36,55),
	         	imageOptions = {
	        	 	spriteOrigin:new kakao.maps.Point(160,index*60),
	        	 	spriteSize:new kakao.maps.Size(276,891) // 원본과의 비율?
	         	};
	         
	        var markerImage = new kakao.maps.MarkerImage(markerImageSrc,imageSize,imageOptions);
			
	        
			geocoder.addressSearch(hmap.resdto.address1, function(result, status){
				if (status === kakao.maps.services.Status.OK) {
				
					drawMarker();
					
					var res_position = new kakao.maps.LatLng(result[0].y, result[0].x);

					
					// 코드의 구조상 동기식으로 ...
					setTimeout(function(){
						
						for(var i = 0; i<markers.length; i++){
							if(markers[i].getPosition().Ga.toFixed(11) == res_position.Ga.toFixed(11)
									&& markers[i].getPosition().Ha.toFixed(11) == res_position.Ha.toFixed(11)){
								
								markers[i].setImage(markerImage);
								markers[i].setZIndex(10);
								map.setCenter(markers[i].getPosition());
								map.setLevel(3);
								
							}else{
							}
						}
						
					} , 800);

				}
			});
			
	        // sub1 의 음식점 상세정보 
			$('#list2-2 a img').attr("src","../upload/"+hmap.resdto.no+".jpg");
	        $('#list2-3 p#selected_name span').html(hmap.resdto.name);
	        $('#list2-3 p#selected_address span').html(hmap.resdto.address1);
	        $('#list2-3 p#selected_tel span').html(hmap.resdto.tel);
	        $('#list2-3 p#selected_hour span').html(hmap.resdto.hour);
	        $('#list2-3 p#selected_cnt span').html(hmap.visitorsCnt);
	        $('#list2-3 p#selected_avg span#avg').html(hmap.reviewAvg);
	        $('#list2-3 p#selected_avg span#count').html("("+hmap.reviewCount+")");
	        
	        // 상세정보 보기 버튼 클릭 
	        var url = '/custom/sub2?no='+ hmap.resdto.no;
	        $('#list2-3 button').on("click",function(e){
	        	e.preventDefault();
	        	document.location.href=url;
	        });  
	        // 왼쪽 음식점 이미지 클릭시 target=_blank속성으로 나오기 위해 
	        $('#list2-2 a').attr("href",url);
	        
	    },error : function(){
	        //Ajax 실패시
	        
	    }
	});
	
});// $('#list2-1 #res_name').click


$('#list2-1 ul li span.alphabet').each(function(index,item){
	$(item).text(String.fromCharCode(index+65)); // 숫자를 문자로(아스키 코드)  (index 0)+65 -> 'A'
});

   // 실행 순서 문제 때문에 맵의 위치 이동은 window.load 가 완료되면 setBounds 시켜줘야함 
$(window).load(function() {
	
	drawMarker();
    addCategoryClickEvent(); // 카테고리 클릭 이벤트 등록 
    categoryInit(); // 처음 카테고리 색 변경 
});

//$(document).ready(function(){
//	var t = $('#list2-1>ul>li>div:first-child').attr('id');
//	var no = t.substr(5, t.length);
//	var name = $('#list2-1>ul>li>div:first a:first').text();
//	var addr = $('#list2-1>ul>li>div:first .res_address:first').val();
//	console.log(addr)
//	$('#list2-2 a img').attr("src","../upload/"+no+".jpg");
//	$('#selected_name span').text(name)
//	$('#selected_address span').text(addr)
//});
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