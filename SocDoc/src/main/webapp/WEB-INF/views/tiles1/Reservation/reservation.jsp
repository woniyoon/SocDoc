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
#info_check td{
      margin: 1%;
      font-size: 10pt;
}
#info ul{
      list-style:none;
      line-height: 40px;
      font-size: 14pt;
      font-weight: bolder;
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
      padding-left:2%;
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
button.btnType {
       width: 92px;
       height: 30px;
       margin: 0 10px 0 0;
       padding: 0;
       border: 1px solid #fff;
       color: #fff;
       font-size: 14px;
       text-align: center;
       line-height: normal;
       background-color: transparent;
}
select{
      width: 200px;
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
.general{
      width: 40%;
}
.reserve_btn{
   padding:3%;
   width:350px;
   margin-top: 10%;
}
.con{
      display: none;
}
.accodion-box span{
      min-width: 190px;
      text-align: center;
      display: inline-block;
}
.btnset{
      color: black;
}
   /* 기본정보 변경 form */
table.type05 {
         width: 100%;
          border-collapse: separate;
          border-spacing: 1px;
          text-align: left;
          line-height: 1.5;
          border-top: 1px solid #ccc;
} 
table.type05 th {
          width: 20%;
          padding: 10px;
          font-weight: bold;
          vertical-align: middle;
          border-bottom: 1px solid #ccc;
          background: #f2f2f2;
} 
table.type05 td {
          width: 80%;
          padding: 10px;
          vertical-align: top;
          border-bottom: 1px solid #ccc;
}
.form-control-tel {
         width: 70px;
}
#infoChange {
         width: 69%;
}
.reserve_btn{ /* 예약확정하기 버튼*/
      background-color: skyblue;
      color: white;
      font-size: 15pt;
      font-weight: bold;
      margin-bottom: 15%;
      margin-left: 6%;
}
.btn{
      margin-bottom: 5%;
}
.modal_footer{
      margin-left: 3%;
}
.modal-body li{
      list-style-type: none;
      line-height: 40px;
      font-size: 15pt;
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
   </style>
   <script>
   
   $(document).ready(function() {
	      console.log("document ready function");
	      
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
	      });
	   });

	   // 달력 불러오는 로직이 있었음      
	   
	   function closeModal() {
	      $(".modalContainer").addClass("hidden");
	   }

	   
	   
	// ================ 진료과별로 나열하기 ===============
		function Searchgo(){
			//alert('ㅇㅇ');
			var arrDeptId = new Array(); // 체크값들의 저장소가 될 배열을 생성 
			
			$("input:radio[name=dept]").each(function(){
				var bool = $(this).is(":checked");
				if(bool==true){
					// 체크박스에 체크가 되었으면 배열속에 체크된 값을 저장한다. 
					arrDeptId.push($(this).val()); // 배열속에 넣는 방식 push를 사용 
				}
				
				var sDeptIdes = arrDeptId.join(); // 배열을 join을 통해서 문자열로 만든다. 
				// console.log("~~~~~~ 확인용 sDeptIdes =>" + sDeptIdes);
				// 결과물: ~~~~~~ 확인용 sDeptIdes =>이비인후과
				
				var frm = document.searchFrm;
				frm.sDeptIdes.value = sDeptIdes;
				
				frm.method = "GET";
				frm.action = "reserve.sd"; // 앞에 슬레시"/"가 없으면 상대경로로, 자기에게 보내는 것이다. 
				frm.submit();
			});
		}
	// end of 진료과별로 나열하기 끝 =======================
		

   
   /* function postnTr(){
      $('#postnTr').toggleClass("hide");
      if($('#postnTab').text() == "▼"){
         $('#postnTab').text("▲");
      }else
         $('#postnTab').text("▼");
   } */


   
	// ================ 달력 ==================
   $(function() {
	    $('.calendar').pignoseCalendar();
	    
	});// end of 달력 끝 =======================
		
	
	

	$(function() {
	    $("#time1").timepicker({
	        timeFormat: 'h:mm p',
	        interval: 60,
	        minTime: '10',
	        maxTime: '6:00pm',
	        defaultTime: '11',
	        startTime: '10:00',
	        dynamic: false,
	        dropdown: true,
	        scrollbar: true        
	    });
	});	
		
		
		
		
	$('.calendar').pignoseCalendar({
	    click: function(event, context) { 
	        /**
	         * @params this Element
	         * @params event MouseEvent
	         * @params context PignoseCalendarContext
	         * @returns void
	         */

	         // This is clicked button Element.
	         var $this = $(this);
	         

	       Socdocsocdoc2  // You can access event parameter.
	         event.preventDefault();

	         // You can get target element in `context` variable, This element is same `$(this)`.
	         var $element = context.element;
	         

	         // You can also get calendar element, It is calendar view DOM.
	         var $calendar = context.calendar;
	    }
	});

	
   

	
   // ================ 예약버튼 ================  
   function goReserve(hpSeq){
	   
	   if(${sessionScope.loginuser == null}){
      		alert("예약하시려면 먼저 로그인을 해주세요.");
      		
       var frm = document.reserveOrderFrm;
       
       frm.method = "POST";
       frm.action = "<%=ctxPath%>/socdoc/reserve.sd";
       frm.submit();
       
       return;
	   }
	   // 병원선택을 안했을 경우  === 
	   var hospital = document.getElementById("selecthospital").value;
	   
	   if(isNaN(Number(selecthospital))){
		   alert("병원을 선택하세요");
	   	  return;
	   }
   }// end of 예약버튼 끝 =======================
 
 
	 
	   
   	// ============== 병원선택 
   function selecthospital(name, dept){
	   
	   //alert(name);
	   
	   //hpanddept
	   if(${sessionScope.loginuser == null}){
		   alert("병원을 선택하시려면 먼저 로그인을 해주세요.");
	   }
	   
	   var hpanddept = document.getElementById("hpanddept");
	   hpanddept.innerText = name + " / " + dept;
	   

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
         <a>
        <!-- <form name="searchFrm" action="xyz.do"> -->
           <input id="myInput" name="myInput" type="text" placeholder="병원명을 입력하세요." style="width: 300px; height: 30px;"/>
           <button id="myInput" class="myInput" onclick="Searchgo()">검색</button>
           
        <!-- </form> -->
         </a>
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
            <!-- 진료과목 선택-->
            <label class="feFoRadio" for="feFor">
               <input type="radio" name="dept" value="내과"><span>내과</span>
            </label>
            <label class="feFoRadio" for="feFor">
               <input type="radio" name="dept" value="이비인후과"><span>이비인후과</span>
            </label>
            <label class="feFoRadio" for="feFor">
               <input type="radio" name="dept" value="정형외과"><span>정형외과</span>
            </label>
            <label class="feFoRadio" for="feFor">
               <input type="radio" name="dept" value="안과"><span>안과</span>
            </label>
            <label class="feFoRadio" for="feFor">
               <input type="radio" name="dept" value="산부인과"><span>산부인과</span>
            </label>
            <label class="feFoRadio" for="feFor">
               <input type="radio" name="dept" value="치과"><span>치과</span>
            </label>
            <label class="feFoRadio" for="feFor">
               <input type="radio" name="dept" value="외과"><span>외과</span>
            </label>
            <label class="feFoRadio" for="feFor">
               <input type="radio" name="dept" value="성형외과"><span>성형외과</span>
            </label>
            <label class="feFoRadio" for="feFor">
               <input type="radio" name="dept" value="정신건강의학과"><span>정신건강의학과</span>
            </label>
            <label class="feFoRadio" for="feFor">
               <input type="radio" name="dept" value="피부과"><span>피부과</span>
            </label>
              </form>
   </div>
   <!-- 시/군구/진료과목/병원검색 container 끝 -->
   
   <div class="check_box">
   <h3 style="margin-left: 4%; margin-bottom: 3%; margin-top: 3%; color:black;">예약하실정보확인</h3>
   	
   	<c:if test="${empty membervo}">
   	<ul>
 	<li style="font-size: 11pt; color: black; margin-bottom: 35px;">
         회원정보가 없습니다.
     <br/>속닥속닥을 더 안전하고 편리하게 이용해주세요 : ) 
     
     </li>  	
     <li>
     <a href="<%=ctxPath%>/login.sd" style="border: solid 1px black; padding: 20px; margin-top: 50px;">SOCDOC 로그인 </a>
     </li>
     
   	</ul>
   	</c:if>
   	
   	<c:if test="${not empty membervo}">
      <ul>
      
         <li>환자명 : ${membervo.name}</li>
         <li><button class="btnTypecheck" id="visitorRow">환자정보확인</button><button class="btnTypecheck">최근예약</button></li>
         <li style="font-size: 10pt;">병원/진료과&nbsp;:&nbsp;<span id="hpanddept"></span></li>
         <li style="font-size: 10pt;">진료일시 : </li>
       
      </ul>
      
      </c:if>
      
   </div>
   <br>
   
   <!-- 병원목록 -->
   <div class="list_hospital">
   <h2>병원목록</h2>
   <hr style="border: solid 1px black;"/>
   <!-- <!-- 병원찾기전
   <div id="list_container" style="margin: 30%;">
   <span>위에서 진료과 선택 또는 질병명/의료진명 검색을 먼저해주세요.</span>
   병원찾기전 끝 
   
    <!-- 병원검색했을경우, 병원정보정렬 -->
   
   <div id="hospital" style="height: 300px; text-align: center;">
   <div class="hpsinfo" style="float: left; width:150px; margin-left: 6px;">
      <table class="hpList">
      <c:if test="${empty hpinfovoList}">
         <tr>
            <td>현재 등록된 병원이 없습니다.</td>
         </tr>
      </c:if>
      
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
      <button type="button" name="selecthospital" id="selecthospital" class="selecthospital"  onclick="selecthospital('${hpinfovoList.hpName}','${hpinfovoList.dept}')">선택</button>
      </div>
      <br/>
      </td>
      <c:if test="${(status.count)%4 == 0 }">
      </tr><tr>
      </c:if>
      
      </c:forEach>
      </c:if>
      </table>
      </div>
   	   <!-- 병원검색했을경우, 병원정보정렬 끝 -->
   </div>
   </div>
   <!-- 병원목록 끝 -->
   
   
   <!-- 진료일정 : 달력 날짜선택 시간선택 -->
   <div class="schedule_medical">
   <h2>진료일정</h2>
   <hr style="border: solid 1px black; margin-bottom: 15px;"/>
   
   <!-- ============================================ -->
   <!-- 병원을 선택 안했을때, 보여지는 창 -->
   <!-- <div id="list_container" style="margin: 30%;">
   <span>병원을 선택하시면 진료일정을 확인 하실 수 있습니다.</span>
   </div> --><!-- 병원을 선택 안했을때, 보여지는 창 end -->
   
   <!-- [달력/시간]설정하기 -->
   <div class="calendar"></div>
   <label for="time">시간 선택</label>
	<input type="text" id="time1" name="time1" class="form-control" style="width:200px;">
 
   <!-- 예약확정하기 -->
   <div id="reverse_set" style="margin-left: 13%;">
   <a style="cursor: pointer;" class="setbtn" data-toggle="modal" data-target="#myModal">
   <button type="button" class="reserve_btn" onclick="goReserve()">예약확정하기</button></a>
   </div>
   </div><!--  [달력/시간]설정하기 end -->
   
   
   <!-- 페이지바 -->
   <div class="paging" align="left">
   <div>${pageBar}</div>
   </div>
   
   
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
  
   
