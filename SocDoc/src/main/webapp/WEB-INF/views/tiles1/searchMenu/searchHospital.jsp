<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        
<%	String ctxPath = request.getContextPath();%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>속닥 - 병원 찾기</title>


</head>
<style>


	.container{
		width:1080px;
		margin: 100px auto;
	}
	
	.content{
		width:90%;
		margin:0px auto;
		min-width: 864px;
	}
		
	.select{
		width: 250px;
		height: 30px;
		border: 1px solid #999999;
		border-radius: .25em; 
		margin-right: 10px;
		margin-bottom: 5px;
	}
	
	.selectMap{
		width: 150px;
		height: 30px;
		border: 1px solid #999999;
		border-radius: .25em; 
		margin-right: 10px;
		margin-bottom: 5px;
	}
	
	
	ul.tabs{
		margin: 0px;
		padding: 0px;
		list-style: none;
	}
	
	ul.tabs li{
		background: none;
		display: inline-block;
 		padding: 10px 15px;
 		width:49.7%;
 		margin:0px;
		border: solid 1px #ddd;
		text-align: center;
		cursor: pointer;		
	}
	
	ul.tabs li.current{
		background: #0080ff;
		color: #fff;
		font-weight: 1000;
	}
	
	.tab-content{
		display: none;
	}
	
	.tab-content.current{
		display: inherit;
	}
	
	.tabGeneral{
		margin : 10px auto;
		background-color: #f2f2f2;
		padding:20px 35px;
	}
	
	.btnSearch{
  		padding: 0 .75em; 
 		height:30px;
		background-color: #bfbfbf; 
		cursor: pointer; 
		border: 1px solid #999999; 
		border-radius: .25em; 
		margin-left: -10px;	
	}
	
	.tabMap{
		padding-top: 15px;
	}
	
	.mapSelect{
		display:inline-block; 
		width:63%; 
		height:40px;
	}
	
	.mapSearch{
		display:inline-block; 
		width:35%; 
		height:40px;
		float:right;
		text-align:right;
	}
	
	.mapContent{
		float:clear;
		width:100%;
		height:800px;
	}
	
	.map{
		display:inline-block;
		width:63%;
		height:100%;
		margin-right: 10px;
	}
	
	.mapList{
		display:inline-block;
		background-color: #efefef; 
		float:right;
		width:35%;		
		height:100%;
		padding: 10px 20px;
	}		
	
	.hospitalList{
		border-bottom : 1px solid #999999;
		padding: 10px 25px 20px 25px;
	}
	
	.mabListTable{
		width:100%;
		font-size: 10pt;
	}
	
	.mabListTable td{
		border-bottom: 1px solid #999999;	
		width:100%;	
		padding: 20px 0;	
	}
	
	.mHospitalName{
		font-size : 11pt;
		color:#0080ff; 
		font-weight: bolder;
		margin-bottom: 5px;
	}
	
	.hospitalName{
		font-weight: 900;
		font-size: 13pt;
		margin:0 10px 10px 0;
	}
	
	.btnDetail{
		border-radius: .25em; 
		cursor: pointer; 
		border: 1px solid #999999; 
	}
	
	.info{
		margin:0px;
	}
	
	
	.infoWindow{
		padding:10px;
		border-radius: .25em;
		border: 1px solid #999999;  
		font-size: 9pt;
		background-color: #fff;
	}
	
	
	   
</style>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b7fa563027be4561a627edb8c3c2821f"></script>
<script type="text/javascript">


	$(document).ready(function(){
		
		//탭 전환
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');
	
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
	
			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		})
		
		
		
		//지도
		
			var mapContainer = document.getElementById('map');
			
			var options = {
				center: new kakao.maps.LatLng(37.56602747782394, 126.98265938959321), // 지도의 중심좌표.
				level: 3 // 지도의 레벨(확대, 축소 정도). 숫자가 적을수록 확대된다.
			};
			
			// 지도 생성 및 생성된 지도객체 리턴
			var mapobj = new kakao.maps.Map(mapContainer, options);
			
			// 일반 or 스카이뷰 전환
			var mapTypeControl = new kakao.maps.MapTypeControl();
			mapobj.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

			// 지도 확대 축소를 제어컨트롤
			var zoomControl = new kakao.maps.ZoomControl(); 
			mapobj.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


			if (navigator.geolocation) {
				
				navigator.geolocation.getCurrentPosition(function(position) {
					var latitude = position.coords.latitude;   //위도
					var longitude = position.coords.longitude; //경도
									
					// 마커 만들기
					var locPosition = new kakao.maps.LatLng(latitude, longitude);
					
			        var imageSrc = 'http://localhost:9090/socdoc/resources/images/locationPin.png'; 
				    var imageSize = new kakao.maps.Size(34, 35);
				    var imageOption = {offset: new kakao.maps.Point(15, 35)}; //이미지 꼭지점 잡기 ?
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

					var marker = new kakao.maps.Marker({ 
						map: mapobj, 
				        position: locPosition,
				        image: markerImage
					}); 
				 	
					marker.setMap(mapobj);
			
					// 인포 윈도우
					var iwContent = "<div style='padding:5px; font-size:9pt;'>여기에 계신가요?<br/><a href='https://map.kakao.com/link/map/현위치(약간틀림),"
									+latitude+","+longitude+"' style='color:blue;' target='_blank'>큰지도</a> <a href='https://map.kakao.com/link/to/현위치,"
									+latitude+","+longitude+"' style='color:blue' target='_blank'>길찾기</a></div>";
					
				    var iwPosition = locPosition;
				    var iwRemoveable = true; // x표시

					var infowindow = new kakao.maps.InfoWindow({
					    position : iwPosition, 
					    content : iwContent,
					    removable : iwRemoveable
					});

					infowindow.open(mapobj, marker);
				    mapobj.setCenter(locPosition);

				});
			}
			else {

				var locPosition = new kakao.maps.LatLng(37.56602747782394, 126.98265938959321);     
		        
				// 위의 
				// 마커이미지를 기본이미지를 사용하지 않고 다른 이미지로 사용할 경우의 이미지 주소 
				// 부터
				// 마커 위에 인포윈도우를 표시하기 
				// 까지 동일함.
				
		     	// 지도의 센터위치를 위에서 정적으로 입력한 위.경도로 변경한다.
			    mapobj.setCenter(locPosition);
				
			} 
			
			
			
			
			

			// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열 
			var positionArr = [];
			
			$.ajax({ 
				url: "/socdoc/map.sd",
				async: false, // 동기 // 지도는 비동기 통신이 아닌 동기 통신을 해야 한다! ★중요
				dataType: "json",
				success: function(json){ 
					
					$.each(json, function(index, item){ 
						var position = {}; // position 이라는 객체 생성
						var test ="";
												
						position.content = "<div class='infoWindow'>"+ 
							        	   "  <div class='windowHpName'>"+ 
									       "    <strong>"+item.hpName+"</strong></a>"+  
									       "  </div>"+
									       "  <div class='windowAddress'>"+ 
									       			item.address+ 
									       "  </div>"+ 
									       "  <div class='windowPhone'>"+ 
							       					item.phone+ 
							       		   "  </div>"+
									       "</div>";
						
						position.latlng = new kakao.maps.LatLng(item.latitude, item.longitude);
						position.zIndex = 1;
						
						positionArr.push(position);
						
						console.log(item);
						console.log(item.hpName);
			       
					});					
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			    }
				
			});
			
			// 인포윈도우를 가지고 있는 객체 배열의 용도 
			var infowindowArr = new Array(); 
			
			
			var imageSrc = "/socdoc/resources/images/locationPin.png";       
		    var imageSize = new kakao.maps.Size(30, 50);   
		    var imageOption = {offset: new kakao.maps.Point(15, 39)};         
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

			
			// == 객체 배열 만큼 마커 및 인포윈도우를 생성하여 지도위에 표시한다. == //
			for(var i=0; i<positionArr.length; i++) {
				
				// == 마커 생성하기
				var marker = new kakao.maps.Marker({ 
					map: mapobj,
					position: positionArr[i].latlng ,
					image: markerImage,
				});
				
				// 지도에 마커를 표시한다.
				marker.setMap(mapobj);
				
				// == 인포윈도우(말풍선) 생성하기 ==
				var infowindow = new kakao.maps.InfoWindow({ 
					content: positionArr[i].content,
					removable: true,
					zIndex: i+1
				});
				
				// 인포윈도우를 가지고 있는 객체배열에 넣기
				infowindowArr.push(infowindow);	
				
				// == 마커위에 인포윈도우를 표시하기
				// infowindow.open(mapobj, marker);
				
				// == 마커위에 인포윈도우를 표시하기
				// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저(closure => 함수 내에서 함수를 정의하고 사용하도록 만든것)를 만들어 등록합니다 
			    // for문에서 클로저(closure => 함수 내에서 함수를 정의하고 사용하도록 만든것)를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    kakao.maps.event.addListener(marker, 'click', makeOverListener(mapobj, marker, infowindow, infowindowArr));

			}
		
		
			
			
		
		goSearch();
		
		
	})
		
		
	
	
		
	function makeOverListener(map, marker, infowindow, infowindowArr) {
	    return function() {    	
	    	for(var i=0; i<infowindowArr.length; i++) {
	    		if(i == infowindow.getZIndex()-1) {
	    			infowindowArr[i].open(map, marker);
	    		}
	    		else{
	    			infowindowArr[i].close();
	    		}
	    	}
	    };
	}

	
	// 인포윈도우를 표시하는 클로저(closure => 함수 내에서 함수를 정의하고 사용하도록 만든것)를 만드는 함수입니다 
	function makeOverListener(mapobj, marker, infowindow, infowindowArr) {
	    return function() {
	    	// alert("infowindow.getZIndex()-1:"+ (infowindow.getZIndex()-1));
	    	
	    	for(var i=0; i<infowindowArr.length; i++) {
	    		if(i == infowindow.getZIndex()-1) {
	    			infowindowArr[i].open(mapobj, marker);
	    		}
	    		else{
	    			infowindowArr[i].close();
	    		}
	    	}
	    };
	}	
	

	  
	function goSearch(){
	 
		 var frm = document.searchFrm;
		 frm.method = "GET";
		 frm.action = "generalHospital.sd";
		 frm.submit();
		 
	}
	    
	    
	
	
	
	
	
	
</script>



<body>

	<div class="container">
	
		<div class="content">
		
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">지도</li>
				<li class="tab-link" data-tab="tab-2">일반</li>
			</ul>
		
			<!-- 지도 -->
			<div id="tab-1" class="tab-content current">
				  <div class="tabMap">
				      <div class="mapSelect">
				         <select id="city" name="city" class="selectMap">
				            <option value="0">시</option>                                 
				         </select>
				         <select id="city2" name="city" class="selectMap">
				            <option value="0">군</option>                                 
				         </select>      
				         <select id="city3" name="city" class="selectMap">
				            <option value="0">구</option>                                 
				         </select>            
				      </div>
				      
				      <div class="mapSearch">
				         <input type="text" id="search" name="search" class="select" style="width:60%;">
				         <button type="button" class="btnSearch" onclick="goSearch();" >검색</button>
				      </div>
				 </div>
				   
				 <div class="mapContent">
				      <div id="map" class="map"></div>
				      <div class="mapList">
				      		<table class="mabListTable">
				      			<tr>
				      				<td>
				      					<div id="mHospitalName" class="mHospitalName">어쩌고 병원</div>
				      					<div id="mHospitalTel">02-123-4567</div>
				      					<div id="mHospitalAddress">서울특별시 강남구 강남로123-1</div>
				      				</td>
				      			<tr>
				      			<tr>
				      				<td>
				      					<div id="mHospitalName" class="mHospitalName">어쩌고 병원</div>
				      					<div id="mHospitalTel">02-123-4567</div>
				      					<div id="mHospitalAddress">서울특별시 강남구 강남로123-1</div>
				      				</td>
				      			<tr>
				      		</table>				      
				      </div>
				 </div>				
			</div>
			
			<!-- 일반 -->			
			<div id="tab-2" class="tab-content">
				<div class="tabGeneral">
					<form name="searchFrm">
						<div>
							<select id="city" name="city" class="select">
								<option value="city">시</option>
							</select>
							<select id="county" name="county" class="select">
								<option value="county">군</option>
							</select>
							<select id="district" name="district" class="select">
								<option value="district">구</option>
							</select>
						</div>
						<div>
							<select id="category" name="category" class="select">
								<option value="category">진료과목</option>
							</select>
							<input type="text" id ="searchWord" name="searchWord" class="select"/>	
							<button type="button" class="btnSearch" onclick="goSearch();">검색</button>
						</div>					
					</form>	
				</div>
				
				<hr style="width:100%; border:solid 1px #999999; margin: 20px 0;">
				
				<div class="hospitalList">
					<span class="hospitalName">어쩌고 병원</span><button type="button" class="btnDetail" onClick="goDetail();">상세보기</button>
					<p class="info">내과</p>
					<p class="info">02-1234-5678</p>
					<p class="info">서울특별시 강남구 어쩌고로 저쩌고 1층</p>				
				</div>
				
			</div>
			
			
			
		</div>
		
	</div>

</body>