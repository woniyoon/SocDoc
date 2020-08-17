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
	
	.searchMap{
		display:inline-block; 
		width:35%; 
		height:40px;
		float:right;
		text-align:right;
	}
	
	.divMap{
		float:clear;
		width:100%;
		height:800px;
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
	
	.pharmacyList{
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
	
	.mpharmacyName{
		font-size : 11pt;
		color:#0080ff; 
		font-weight: bolder;
		margin-bottom: 5px;
	}
	
	.pharmacyName{
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
	
	.page_wrap {
		text-align:center;
		font-size:0;
	}
	
	.page_nation {
		display:inline-block;
	}
	.page_nation .none {
		display:none;
	}
	.page_nation a {
		display:block;
		margin:0 3px;
		float:left;
		border:1px solid #e6e6e6;
		width:28px;
		height:28px;
		line-height:28px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}
	
	.page_nation .arrow {
		border:1px solid #ccc;
	}
	
	.page_nation .pprev {
		background:#f8f8f8 url('/socdoc/resources/images/page_pprev.png') no-repeat center center;
		margin-left:0;
	}
	
	.page_nation .prev {
		background:#f8f8f8 url('/socdoc/resources/images/page_prev.png') no-repeat center center;
		margin-right:7px;
	}
	
	.page_nation .next {
		background:#f8f8f8 url('/socdoc/resources/images/page_next.png') no-repeat center center;
		margin-left:7px;
	}
	
	.page_nation .nnext {
		background:#f8f8f8 url('/socdoc/resources/images/page_nnext.png') no-repeat center center;
		margin-left:7px;
	}
	
	.page_nation a.active {
		background-color:#42454c;
		color:#fff;
		border:1px solid #42454c;
	}
	
	
	   
</style>

<script type="text/javascript" src="/SocDoc/util/myutil.js"></script>
<script type="text/javascript">

	var store_id = "";    

	$(document).ready(function(){
		
	/* 	//탭 전환
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');
	
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
	
			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		}) */
		
// ========== 탭

		// 약국 지도 탭
		$('#tabMap').click(function(){
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
			
			$(#tabMap).addClass('current');
			$('#contentMap').addClass('current');
			
			$.ajax({
				
				url:"/socdoc/mapPharm.",
				async: false,
				dataType:"json",
				success:function(json){
					
					
					
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			    }
				
				
				
			});
		
			
			
		})
		
		
		
		// 약국 일반 탭
		$('#tabGeneral').click(function(){
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
			
			$('#tabGeneral').addClass('current');
			$('#contentGeneral').addClass('current');
			
			$.ajax({
				
				url:"/socdoc/generalPharm.",
				dataType:"json",
				success:function(json){
					
					
					
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			    }
				
				
				
			});
		
			
			
		});
	
		
//  ==============  약국 지도

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
		
		
		
///////////////////////
	
	
	
	
	
	
		
		
		
		
		
		
		
		
	})
	
	
	
	
	
	
	
	
	
	
	
</script>



<body>

	<div class="container">
	
		<div class="content">
		
			<ul class="tabs">
				<li class="tab-link current" id="tabMap">지도</li>
				<li class="tab-link" id="tabGeneral">일반</li>
			</ul>
		
			<!-- 지도 -->
			<div id="contentMap" class="tab-content current">
				  <div class="selectMap">
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
				      
				      <div class="searchMap">
				         <input type="text" id="search" name="search" class="select" style="width:60%;">
				         <button type="button" class="btnSearch" onclick="goSearch();" >검색</button>
				      </div>
				 </div>
				   
				 <div class="divMap">
				 '
				      <div id="map" class="map">지도영역</div>
				      <div class="mapList">
				      		<table class="mabListTable">
				      			<tr>
				      				<td>
				      					<div id="mpharmacyName" class="mpharmacyName">어쩌고 병원</div>
				      					<div id="mpharmacyTel">02-123-4567</div>
				      					<div id="mpharmacyAddress">서울특별시 강남구 강남로123-1</div>
				      				</td>
				      			<tr>
				      			<tr>
				      				<td>
				      					<div id="mpharmacyName" class="mpharmacyName">어쩌고 병원</div>
				      					<div id="mpharmacyTel">02-123-4567</div>
				      					<div id="mpharmacyAddress">서울특별시 강남구 강남로123-1</div>
				      				</td>
				      			<tr>
				      		</table>				      
				      </div>
				 </div>				
			</div>
			
			<!-- 일반 -->			
			<div id="contentGeneral" class="tab-content">
				<div class="selectGeneral">					
			          <select id="city" name="city" class="selectMap">
			             <option value="0">시</option>                                 
			          </select>
			          <select id="city2" name="city" class="selectMap">
			             <option value="0">군</option>                                 
			          </select>      
			          <select id="city3" name="city" class="selectMap">
			             <option value="0">구</option>                                 
			          </select>            
			      
				      <div class="searchGeneral">
				         <input type="text" id="search" name="search" class="select" style="width:60%;">
				         <button type="button" class="btnSearch" onclick="goSearch();" >검색</button>
				      </div>	
				</div>
				
				<hr style="width:100%; border:solid 1px #999999; margin: 20px 0;">
				
				<div class="pharmacyList">
					<span class="pharmacyName">어쩌고 약국</span><button type="button" class="btnDetail" onClick="goDetail();">상세보기</button>
					<p class="info">02-1234-5678</p>
					<p class="info">서울특별시 강남구 어쩌고로 저쩌고 1층</p>				
				</div>
				
			</div>
			
			
			
		</div>
		
	</div>

</body>