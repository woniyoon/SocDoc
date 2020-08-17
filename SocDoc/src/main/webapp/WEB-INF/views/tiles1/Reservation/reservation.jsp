<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>
       
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<%
      String ctxPath = request.getContextPath();
%>
<link rel="stylesheet" type="text/css" media="screen" href="<%=ctxPath %>/resources/css/reservationInfo.css" />
<!-- Pignose 캘린더 라이브러리 임포트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<link rel="stylesheet" href="<%=ctxPath %>/resources/pg-calendar/dist//css/pignose.calendar.min.css">
<link rel="stylesheet" href="<%=ctxPath %>/resources/pg-calendar/dist//css/pignose.calendar.css">
<script src="<%=ctxPath %>/resources/pg-calendar/dist/js/pignose.calendar.min.js"></script>
<script src="<%=ctxPath %>/resources/pg-calendar/dist/js/pignose.calendar.full.min.js"></script>
<script src="<%=ctxPath %>/resources/pg-calendar/dist/js/pignose.calendar.full.js"></script>
<script src="<%=ctxPath %>/resources/pg-calendar/dist/js/pignose.calendar.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
<script src="<%=ctxPath %>/resources/js/util/common.js"></script>
 

<style type="text/css">
/* body {
      width: 1440px;   
} */
#reservation_container{
      width: 80%;
       margin: 0 auto;
}
#reservation_title{
      width: 40%;
      margin: 1%;
      padding-top: 2%;
      padding-bottom: 3%;
}
.list_hospital{
      padding-top:5%;
      width: 48%;
      float: left;
}
.schedule_medical{
      padding-top:5%;
      width: 45%;
      float: right;
}
.container_find{ /* 병원찾기 지역/진료/병원명 검색 창 */
      width: 65%;
      border: solid 2px black;
      padding: 2%;
      padding-left:1%;
      padding-bottom: 3%;
      float: left;
      height: 250px;
}
.check_box{ /* 예약하실 정보 확인 */
      float: right;
      width: 30%;
      height: 250px;
      background-color: skyblue;
      color: white;
}
.check_box li{
      height: 40px;
      font-size: 14pt;
      font-weight: bold;
      margin-left: 8%;
}
select{
      width: 150px;
      padding: 7px 0 6px;
      border: solid 1px #d4d4d4;
      vertical-align: middle;
      margin: 1%;
}
select#generalDongCode{
      width: 25%;
}
select#generalGugunCode{
      width: 25%;
}
select#egdgCode{
      width: 50%;
}
.reserve_btn{
   padding:3%;
   width:350px;
   margin-top: 10%;
}
.con{
      display: none;
}
.form-control-tel {
         width: 70px;
}
.reserve_btn{ /* 예약확정하기 버튼*/
      background-color: skyblue;
      color: white;
      font-size: 15pt;
      font-weight: bold;
      margin-bottom: 15%;
      margin-left: 6%;
}
.btnTypecheck{
      width: 100px;
      height: 30px;
      margin: 0 10px 0 0;
      padding: 0;
      border: solid 1px white;
      color: white;
      background-color: transparent;
      font-size: 12pt;
      line-height: normal;
      text-align: center;
      cursor: pointer;
}
.selecthospital{
	border: solid 1px black;
	font-size: 10pt;
	width: 110px;
	height: 40px;
	background-color: white;
	cursor: pointer;
}
.selecthospital:focus{
	border: solid 1px black;
	font-size: 10pt;
	width: 110px;
	height: 40px;
	background-color: skyblue;
	cursor: pointer;
}
.selecthospital:hover{
	border: solid 1px black;
	font-size: 10pt;
	width: 110px;
	height: 40px;
	background-color: skyblue;
	color:white;
	cursor: pointer;
	 opacity: 0;  
}
/* 모달창 만들기 */

.hidden {
    display: none;
}

.modalContainer {
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    z-index: 1000;   /* 달력의 화살표가 튀어나오지 않게 방지 */
}

.modalOverlay {
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: rgba(0, 0, 0, 0.2);
    width: 100%;
    height: 100%;
    position: absolute;
}

.modalContent {
    background-color: white;
    width: 30%;
    /* min-height: 70%; */
    overflow-y: auto;
    /* max-height: 60%; */
    position: relative;
    padding: 30px;
    border: 1px solid rgb(230, 230, 230);
}

.modalContentHeader {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
}

.visitorDetail {
   width: 90%;
   margin: 40px 0 0 0;   
}

.visitorDetail tr, .visitorDetail td {
   border-top: 1px solid #dddddd;
   border-collapse: collapse;
   padding: 10px 0;   
}
.modalbtn{
	border: solid 1px gray;
	font-size: 10pt;
	margin-top: 5%;
	padding: 5%;
	width: 150px;
	cursor: pointer;
	
}
.feFoRadio{
	overflow: visible;
	width: 226px;
	margin-top: 16px;
	font-size: 11pt;
	background: none;
	display: inline-block;
}
.calendar{
	margin-left: 20%;
}
button.click{
  background:skyblue;
  color:#fff;
  border:none;
  position:relative;
  height:30px;
  font-size:10pt;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button.click:hover{
  background:#fff;
  color:skyblue;
}
button.click:before,button.click:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: skyblue;
  transition:400ms ease all;
}
button.click:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button.click:hover:before,button.click:hover:after{
  width:150px;
  transition:800ms ease all;
}
   </style>
<script>
var selectedHpSeq = -1;
$(document).ready(function() {
	   

		// =========  [진료과목] 검색버튼 클릭시 ========= 
		$("#deptSearch").click(function(){
	
			alert("진료과목검색");
			var arrDeptId = new Array(); // 체크값들의 저장소가 될 배열을 생성
			
			// 체크박스 선택된 값들을 불러온다. 
			$("input:checkbox[name=dept]").each(function(){
				// 체크박스의 체크유무를 검사한다. 
				var bool = $(this).is(":checked");
				if(bool == true) {
					// 체크박스에 체크가 되었으면 배열속에 체크된 값을 저장한다.
					arrDeptId.push($(this).val()); // 배열속에 넣는 방식은 push 를 사용한다. 
					
				}
			});
			
			var sDeptIdes = arrDeptId.join(); // 배열을 join 을 통해서 문자열로 만든다.
			
			var frm = document.deptFrm;
			frm.sDeptIdes.value = sDeptIdes;
			
			frm.method = "GET";
			frm.action = "reserve.sd"; // 앞에 슬래시"/" 가 업으면 상대경로로, 자기가 자기에게 보내는 것이다.
			frm.submit();
			
		});
		// === 체크박스 유지시키기 시작 === //
		var sDeptIdes = "${sDeptIdes}";
		//console.log(sDeptIdes);
		
		if(sDeptIdes != ""){
			var arrDeptId = sDeptIdes.split(","); // 배열로 쪼갠다 (배열타입이다.)
			
			$("input:checkbox[name=dept]").each(function(){
				for(var i=0; i<arrDeptId.length; i++){
					if($(this).val()== arrDeptId[i]){
						$(this).prop("checked",true);
						break;
					}
				}
			});
		}// =========  [진료과목] 검색버튼 클릭시 끝  ========= 
	   

			
		  
	   $("#searchWord").keydown(function(event){
	          if(event.keyCode == 13){
	        	  //엔터를 했을경우
	             goSearch();
	             
	          }
	       });
	       
	       //검색시 검색조건 및 검색어 값유지시키기
	       if(${paraMap != null}){
	          $("#searchType").val("${paraMap.searchType}");
	          $("#searchWord").val("${paraMap.searchWord}");
	       } 
	       
	       
	       
	   
	       // 모달을 띄우기 위해 테이블 행 클릭 이벤트 추가
		      $("#visitorRow").each(function() {
		         $(this).click(function(e) {
		            // 체크박스 클릭시, 이벤트를 취소
		            if (e.target.type == "checkbox") {
		               e.stopPropagation();
		               console.log("event canceled!!");
		            } else {
		               $(".modalContainer").removeClass("hidden");
		               console.log("event going on");
		            }
		         });
		      }); // =========  모달창  끝 =========

			
	   });
		  
	
function closeModal() {
	      $(".modalContainer").addClass("hidden");
	   }
		// =========  모달창  ========= 
	  console.log("document ready function"); 
	      
	 
		
			 
	   
	   
		// =========  주르륵 효과  =========
	   /* function postnTr(){
	      $('#postnTr').toggleClass("hide");
	      if($('#postnTab').text() == "▼"){
	         $('#postnTab').text("▲");
	      }else
	         $('#postnTab').text("▼");
	   } */// =========  주르륵 효과 끝  ==================  달력  =========


	// ㄷ	   
	$(function() {
		$('.calendar').pignoseCalendar({
					click : function(event, context) {
						
						
							console.log(selectedHpSeq);
						// 선택된 날짜
						var date = context.current[0]._i;
		        
		        // 선택된 날짜의 요일
		        var day = context.current[0]._d.getDay();
						if(selectedHpSeq == -1) {
							alert("병원을 선택해주세요!");
							return;
						} else {
					        // 여기서 ajax 호출을 합니다.
					        $.ajax({
					            url:"<%=ctxPath%>/ajax/getNumOfReserv.sd",
					            type:"GET",
					            data:{"visitDate": date, "day": day, "hpSeq": selectedHpSeq},
					            dataType: "JSON",
					            success: function(json){
					              // json에 담겨진 시작시간부터 종료시간까지 1시간씩 증가시키면서 시간대 추가
					              // 더불어 그 시간대에 몇 명이 예약했는지 받아옴
					              console.log(json);
					              var html = "<ul>";
					              for(var i=0; i<json.hours.length; i++) {
					            	  var hour = json.hours[i];
					            	  var numHour = Number(json.hours[i].substring(0,2));
					            	  console.log("시간:"+hour);
					            	  if( hour >= json.openHours.open && hour <= json.openHours.close ) {
					            		  var hourSeq = numHour-8;
					            		  //html += "<li onclick='selectTime("+hourSeq+")'>"+hour+"</li>"
					            		  html += "<a href='javascript:selectTime("+hourSeq+")' style='margin-right: 10%;'>"+hour+"</span>"
					            	  }
					              }
					            	
					              html+= "</ul>";
					              $("#timeOptions").html(html);
					              
					              var dateandtime = document.getElementById("dateandtime");
					              dateandtime.innerText = date;
					            
					          
					            },
					            error: function(request, status, error){
									alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
								}
					        });
							
						}
		        
						
		   }
	});
		});	

	   
	  

	/* $(function() {
	    $("#time1").timepicker({
	        timeFormat: 'h:mm p',
	        interval: 60,
	        minTime: '10',
	        maxTime: '16:00',
	        defaultTime: '11',
	        startTime: '10:00',
	        dynamic: false,
	        dropdown: true,
	        scrollbar: true        
	    });
	}); */	
		
	
	// 시간대 선택 
	function selectTime(selectedHpSeq){
		
		// alert(hour);
		   
		var time = document.getElementById("time");
		time.innerText = selectedHpSeq; 
	 }
		
		
/* 	$('.calendar').pignoseCalendar({
	    click: function(event, context) { 
	        
	         var $this = $(this);
	         

	       Socdocsocdoc2  // You can access event parameter.
	         event.preventDefault();

	         // You can get target element in `context` variable, This element is same `$(this)`.
	         var $element = context.element;
	         

	         // You can also get calendar element, It is calendar view DOM.
	         var $calendar = context.calendar;
	    }
	}); */

	function goSearch(){
		 	alert("병원명 검색");
			 var frm = document.searchFrm;
			 
			 var searchWord = frm.searchWord.value;
			 //console.log(searchWord);
			/*  if(searchWord.trim() == ""){
				 alert("병원명을 입력하세요!");
				 return;
			 }  */
			 
			 frm.method = "GET";
			 frm.action = "<%= ctxPath%>/reserve.sd";
			 frm.submit();
			 
			
			 
		 } // end of function goSearch(){}-----------------------


	
// ================ 예약확정하기 ================  
function goReserve(){
	   
	   if(${sessionScope.loginuser == null}){
   		alert("예약하시려면 먼저 로그인을 해주세요.");
   	return;	
	   }
	   // 병원선택을 안했을 경우  === 
	   /*var hospital = document.getElementById("selecthospital").value;
	   
	   if(isNaN(Number(selecthospital))){
		   alert("병원을 선택하세요");
	   	  return;
	   } */
	   
	   func_pop();
		
	   }
//}// end of 예약버튼 끝 =======================

//아임포트 API 
	function func_pop(hpSeq,hpName,dept){		
		var recieve = 5000;
		//var frm = document.reservFrm;
		//localStorage.setItem("recieve", $("#sumprice").text());	
		console.log(recieve);
		window.open("<%=ctxPath%>/Reservation/pay.sd?recieve=" + recieve, "/Reservation/reservation_result", "left=350px, top=100px, width=820px, height=600px");
		
		
		
}
	   
	// ============== 병원선택 
function selecthospital(name, dept, hpSeq){
	   
	   //alert("ㅎㅇ");
	   
	   selectedHpSeq = hpSeq;
	   
	   //hpanddept
	   if(${sessionScope.loginuser == null}){
		   alert("병원을 선택하시려면 먼저 로그인을 해주세요.");
	   }
	   
	   var hpanddept = document.getElementById("hpanddept");
	   hpanddept.innerText = name + " / " + dept;
	   
	   $('#selecthospital').removeClass('selecthospital');
	    $(this).addClass('selecthospital');
	   
	   
}// end of 병원 선택 끝 ========================
   

$('#stime')
    .timepicker({timeFormat:'H:i','minTime':'06:00','maxTime':'23:00','scrollDefaultNow': true }) //stime 시작 기본 설정
    .on('changeTime',function() {                           //stime 을 선택한 후 동작
        var from_time = $("input[name='stime']").val(); //stime 값을 변수에 저장
        $('#etime').timepicker('option','minTime', from_time);//etime의 mintime 지정
        if ($('#etime').val() && $('#etime').val() < from_time) {
            $('#etime').timepicker('setTime', from_time);
//etime을 먼저 선택한 경우 그리고 etime시간이 stime시간보다 작은경우 etime시간 변경
        }  
    });
 
$('#etime').timepicker({timeFormat:'H:i','minTime':'06:00','maxTime':'23:00'});//etime 시간 기본 설정



	// ================ 병원 검색 ================  
//function Searchgo(){  
   
   //var h_area1 = $("#h_area1").val().trim(); 	// 시도선택
   //var h_area2 = $("#h_area2").val().trim(); 	// 구군선택
   //var myInput = $("#myInput").val().trim(); 	// 병원명입력창
   
   
   //if(! (h_area1 == "시도선택" && h_area2 == "구군선택" && myInput == "")){ 
       //alert("검색완료"); 
      
   //}else{
   //   alert("찾으시는 병원 정보를 선택하거나 입력해주세요.");
   // }
	  //  }// end of 병원 검색 끝 ========================

	 
		
</script>
   
   <!-- 전체박스 -->
   <div id="reservation_container">
   <div id="reservation_title">
   <h1 style="font-weight: bolder;">인터넷 진료예약</h1>
   </div>
   <div class="container_find">
   
   <form name="searchFrm">
   <label>
         <!-- <a> -->
        <select name="searchType" id="searchType" style="height: 35px; font-size: 10pt;">
               <option value="hpName">병원명</option>
            </select>
            <input type="text" name="margin-left:2%;" id="searchWord" placeholder="병원명을 입력하세요." size="47" autocomplete="off"/> 
        	
        <button type="button" id="btnSearch" class="click" onclick="goSearch()">병원명검색</button>
        <!-- </form> -->
        <!--  </a> -->
      	</label>
        <br/>
            <select id="h_area1" name="h_area1" onChange="cat1_change(this.value,h_area2)" >
            <option selected>시도선택</option>
            <option value='서울'>서울</option>
            <option value='부산'>부산</option>
            <option value='대구'>대구</option>
            <option value='인천'>인천</option>
            <option value='광주'>광주</option>
            <option value='대전'>대전</option>
            <option value='울산'>울산</option>
            <option value='강원'>강원</option>
            <option value='경기'>경기</option>
            <option value='경남'>경남</option>
            <option value='경북'>경북</option>
            <option value='전남'>전남</option>
            <option value='전북'>전북</option>
            <option value='제주'>제주</option>
            <option value='충남'>충남</option>
            <option value='충북'>충북</option>
              </select>
              
              <select id="h_area2" name="h_area2" onChange="cat2_change(this.value,h_area3)">
               <option selected>구군선택</option>
              </select>
              
              <select id="h_area3" name="h_area3">
               <option selected>동선택</option>
              </select>
            <br/>
            
			<br/>
		<input type="hidden" name="hpName" />
            </form>
            
            
            <!-- 진료과목 선택-->
            <form name="deptFrm">
            
            <c:if test="${not empty deptIdList}">
			<c:forEach var="deptId" items="${deptIdList}" varStatus="status">			
				<input type="checkbox" id="${status.index}" name="dept" value="${deptId}" style="margin-left: 2%; margin-top: 1%;"/>
	  			<label for="${status.index}" style="margin-right: 8%; font-size: 10pt;">${deptId}</label>&nbsp;
	  			<c:if test="${(status.count)%4 == 0 }">
	  			<br/><br>
      			</c:if>
			</c:forEach>
		</c:if>
		<button type="button" id="deptSearch" class="click" style="float: right;">진료과목검색</button><br/>
           <input type="hidden" name="sDeptIdes" />
        </form>
   </div>
   
   <!-- 시/군구/진료과목/병원검색 container 끝 -->
   
   <div class="check_box">
   <h3 style="margin-left: 4%; margin-bottom: 3%; margin-top: 6%; color:black;">예약하실정보확인</h3>
   	
   	<c:if test="${empty membervo}">
   	<ul>
 	<li style="font-size: 10pt; color: black; margin-bottom: 35px;">
         회원정보가 없습니다.
     <br/>속닥속닥을 더 안전하고 편리하게 이용해주세요. 
     
     </li>  	
     <li>
     <a href="<%=ctxPath%>/login.sd" style="border: solid 1px black; padding: 20px; margin-top: 50px;">
     SOCDOC 로그인 </a>
     </li>
     
   	</ul>
   	</c:if>
   	<form name="reservFrm">
   	<c:if test="${not empty membervo}">
      <ul>
         <li>환자명 : ${membervo.name}</li>
         <li><button class="btnTypecheck" id="visitorRow">환자정보확인</button><button class="btnTypecheck">최근예약</button></li>
         <li style="font-size: 10pt;" value="hpName">병원/진료과&nbsp;:&nbsp;<span id="hpanddept"></span></li>
         <li style="font-size: 10pt;" value="dept">진료일시&nbsp;:&nbsp;<span id="dateandtime"></span></li>
         <li style="font-size: 10pt;" value="hour">시간&nbsp;:&nbsp;<span id="time"></span></li>  
      </ul>
      </c:if>
      
      </form>
   </div>
   <br>
   
   <!-- 병원목록 -->
   <div class="list_hospital">
   <h2>병원목록</h2>
   <hr style="border: solid 1px black;"/>
   <div id="hospital" style="height: 300px; text-align: center;">
   <div class="hpsinfo" style="float: left; width:150px; margin-left: 6px;">
      <table class="hpList">
      <!-- 병원이 존재하지 않을 경우 -->
      <c:if test="${empty hpinfovoList}">
         <tr style="padding: 50%; border: solid 1px red;">
            <td>등록 된 병원이 없습니다.</td>
         </tr>
      </c:if>
      <!-- 병원이 존재할 경우 -->
      <c:if test="${not empty hpinfovoList}">
      <tr>
      <c:forEach var="hpinfovoList" items="${hpinfovoList}" varStatus="status">
      <td>
      <div style="margin-right: 40px; font-size: 10pt;">
      <!-- 병원사진 -->
      <img width="150px;" height="140px;" src="<%= ctxPath%>/resources/images/${hpinfovoList.mainImg}"/>
      <!-- 병원이름 -->${hpinfovoList.hpName}<br/> <span style="display:none">${hpinfovoList.dept}</span>
      <!-- 병원소개 -->${hpinfovoList.info}<br/>
      <!-- 리뷰보기 --><a href='<%= ctxPath%>/socdoc/reserve.sd?hpSeq=${hpinfovoList.hpSeq}' target="_blank" style="color: blue; font-size: 9pt; font-weight: bold;">리뷰 및 상세보기</a><br/>
      <br/>
      <!-- 선택하기버튼 -->
      <%-- <button type="button" name="selecthospital" id="selecthospital" class="selecthospital"  onclick="selecthospital('${hpinfovoList.hpName}','${hpinfovoList.dept}', '${hpinfovoList.hpSeq }')">선택</button> --%>
     <!-- <a name="selecthospital" id="selecthospital" class="selecthospital">선택</a> -->
     <a href="javascript:selecthospital('${hpinfovoList.hpName}','${hpinfovoList.dept}', '${hpinfovoList.hpSeq}')" name="selecthospital" id="selecthospital" class="selecthospital">선택</a>
      </div>
      <br/>
      </td>
      <c:if test="${(status.count)%3 == 0 }">
      </tr><tr>
      </c:if>
      </c:forEach>
      </c:if>
      </table>
      </div>
      
   </div>
   </div>
  
   
   
   
   
   <!-- 진료일정 : 달력 날짜선택 시간선택 -->
   <div class="schedule_medical">
   <h2>진료일정</h2>
   <hr style="border: solid 1px black; margin-bottom: 15px;"/>
   <!-- [달력/시간]설정하기 --> 
   <div class="calendar" style="margin-bottom: 6%;"></div>
   <label for="time">시간 선택</label>
   <div style="border: 2px solid black; margin-top: 3%;" id="timeOptions"></div>
   
   <!-- <input type="text" id="time1" name="time1" class="form-control" style="width:200px;"> -->
   <!-- 예약확정하기 -->
   
   
   
   <div id="reverse_set" style="margin-left: 13%;">
   <a style="cursor: pointer;" class="setbtn" data-toggle="modal" data-target="#myModal">
   <button type="button" class="reserve_btn" onclick="goReserve()">예약확정하기</button></a> 
   <%-- <a href="javascript:func_pop('${hpinfovoList.hpName}','${hpinfovoList.dept}', '${hpinfovoList.hpSeq }')" name="func_pop" id="func_pop" class="func_pop">예약확정하기</a> --%>
   </div>
   </div><!--  [달력/시간]설정하기 end -->
   
   
   
   <div class="container" align="center">
   <div class="modalContainer hidden">
      <div class="modalOverlay">
         <div class="modalContent" align="center">
            <div class="modalContentHeader">
               <h4 align="left">환자정보</h4>
               <span style="font-size: 1.2em; cursor: pointer;"
                  onclick="closeModal()">X</span>
            </div>
            <!-- ajax를 이용해, 동적으로 생성 ⬇️-->
            <table class="visitorDetail customTable" >
            <c:if test="${not empty membervo}">
               <tr align="center">
                  <td>성명</td>
                  <td>${membervo.name}(${membervo.userid})</td>
               </tr>
               <tr align="center">
                  <td>생년월일</td>
                  <td>${membervo.birthDate}</td>
               </tr>
               <tr align="center">
                  <td>연락처</td>
                  <td>${membervo.phone}</td>
               </tr>
               <tr align="center">
                  <td>성별</td>
                  <td>${membervo.gender}</td>
               </tr>
               <tr align="center">
                  <td>키</td>
                  
                  <td>${membervo.height}</td>
                  
               </tr>
               <tr align="center">
                  <td>몸무게</td>
                  <td>${membervo.weight}
                  </td>
               </tr>
               <tr align="center">
                  <td>혈액형</td>
                  <td>${membervo.bloodType}
                  </td>
               </tr>
               </c:if>
            </table>
            <!-- 동적으로 생성되는 부분 ⬆️  -->
            <table>
             <tr>
               <td>
               <button class="modalbtn" style="background-color: white;">수정신청</button></td>
              <td><button class="modalbtn" style="background-color: skyblue;" onclick="closeModal()">확인완료</button></td>
               
               </tr>
            </table>
         </div>
      </div>
   </div>
</div>
   
   
   

  
   </div>
   <!-- 진료일정 : 달력 날짜선택 시간선택 끝-->
  
   <%-- <div>${pageBar}</div> --%>
  <div style="float:right; width: 300px; margin-right: 2%;">${pageBar}</div>
 <!-- 페이지바 == -->
   <div><span style="float: left; width: 10%;"></span></div>
    
