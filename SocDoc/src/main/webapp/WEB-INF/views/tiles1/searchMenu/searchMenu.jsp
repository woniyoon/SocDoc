<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        
<%	String ctxPath = request.getContextPath();%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<style>


	.container{
		width:1080px;
		margin: 100px auto;
	}
	
	.content{
		width:80%;
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
		border:1px solid red;
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
		border:1px solid blue;		
	}
	
	.map{
		display:inline-block;
		width:63%;
		height:100%;
		border:1px solid orange;
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
	
	
	   
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/SocDoc/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/SocDoc/util/myutil.js"></script>
<script type="text/javascript">

	var store_id = "";    

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
		/* 
		var usesOwnLocation = confirm("현재 위치를 이용하겠습니까?");
	    
	    var coordinates = { // 디폴트 위치
	    	"lat":33.450701, 
	    	"lng":126.570667
	    };
	    
	    var container = document.getElementById('map');
	    var options = { 
	    		center: new kakao.maps.LatLng(coordinates.lat, coordinates.lng),
	    		level: 3,
	    };
	    
	    var map = new kakao.maps.Map(container, options); 
	    	
		var positionArr = [];
	    
	    $.ajax({ 
			url: "/SocDoc/location.sd",
			async: false,
			dataType: "json",
			success: function(json){ 
				
				$.each(json, function(index, item){ 
					var position = {}; // position 이라는 객체 생성
					
					if(navigator.geolocation && usesOwnLocation) {
					    
					    navigator.geolocation.getCurrentPosition(function(position) {
				            
				            var lat = position.coords.latitude, // 위도
				                lon = position.coords.longitude; // 경도
				            				
				            var position = new kakao.maps.LatLng(lat, lon);
				
						    map.setCenter(position);					

				        });
					    
					} else if(!usesOwnLocation && index == 5) {
						var locPosition = new kakao.maps.LatLng(item.latitude, item.longitude);     
					    map.setCenter(locPosition);	
					} 			    
					
					console.log(item);
					
					// 마커 위에 나타낼 인포 element 만들기
					position.content = "<div class='store_info' id='store_info"+item.store_id+"'>"+ 
						        	   "  <div class='store_info_header' align='left'>"+ 
								       "    <strong>"+item.store_name.substring(5)+"</strong>"+  
								       "  </div>"+
								       "  <div class='store_info_body'>"+  
								       "    <span class='address'>"+item.address+"</span>"+ 
								       "  </div>"+ 
								       "<input id='store_name"+item.store_id+"' type='hidden' value='"+item.store_name.substring(4)+"'/>"
								       "</div>";
					
					position.latlng = new kakao.maps.LatLng(item.latitude, item.longitude);
					position.zIndex = item.zIndex;
					
					positionArr.push(position);
		       
				});					
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
			
		});
	    
	 
	    
	 // 인포윈도우를 가지고 있는 객체 배열의 용도 
		var infowindowArr = new Array(); 
		
		var imageSrc = "/SocDoc/resource/images/location_pin.png";       
	    var imageSize = new kakao.maps.Size(38, 60);   
	    var imageOption = {offset: new kakao.maps.Point(15, 39)};         
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		
		// == 객체 배열 만큼 마커 및 인포윈도우를 생성하여 지도위에 표시한다. == //
		for(var i=0; i<positionArr.length; i++) {
			
			// == 마커 생성하기
			var marker = new kakao.maps.Marker({ 
				map: map,
				position: positionArr[i].latlng,	
				image: markerImage,
			});
			
			// 지도에 마커를 표시한다.
			marker.setMap(map);
			
			// == 인포윈도우(말풍선) 생성하기 ==
			var infowindow = new kakao.maps.InfoWindow({ 
				content: positionArr[i].content,
				removable: true,
				zIndex: i+1
			});
			
			
			// 인포윈도우를 가지고 있는 객체배열에 넣기
			infowindowArr.push(infowindow);	
			
			
			// == 마커위에 인포윈도우를 표시하기
			// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저(closure => 함수 내에서 함수를 정의하고 사용하도록 만든것)를 만들어 등록합니다 
		    // for문에서 클로저(closure => 함수 내에서 함수를 정의하고 사용하도록 만든것)를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow, infowindowArr));

		}
 */
		
	
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
				      <div id="map" class="map">지도영역</div>
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