<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>
       
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<%
      String ctxPath = request.getContextPath();
%>
<link rel="stylesheet" href="<%=ctxPath%>/resources/pg-calendar/dist/css/pignose.calendar.min.css">
<link rel="stylesheet" href="<%=ctxPath%>/resources/pg-calendar/dist/css/pignose.calendar.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
<script src="<%=ctxPath%>/resources/pg-calendar/dist/js/pignose.calendar.full.js"></script>
<script src="<%=ctxPath%>/resources/pg-calendar/dist/js/pignose.calendar.min.js"></script>
<script src="<%=ctxPath%>/resources/pg-calendar/dist/js/pignose.calendar.full.min.js"></script>
<script src="<%=ctxPath%>/resources/pg-calendar/dist/js/pignose.calendar.js"></script>
<style type="text/css">
/* body {
      width: 1440px;   
} */
#reservation_container{
      width: 95%;
       margin: 0 auto
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
      width: 50%;
      border: solid 2px black;
      padding: 5%;
      padding-bottom: 3%;
      float: left;
      height: 250px;
}
.check_box{ /* 예약하실 정보 확인 */
      float: right;
      width: 46%;
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
   width:480px;
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
}
   </style>
   <script>
   
   var cat1_num = new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);
   var cat1_name = new Array('서울','부산','대구','인천','광주','대전','울산','강원','경기','경남','경북','전남','전북','제주','충남','충북');
   
   
   var cat2_num = new Array();
   var cat2_name = new Array();
   
   
   cat2_num[1] = new Array(17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41);
   cat2_name[1] = new Array('강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');
   
   
   cat2_num[2] = new Array(42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57);
   cat2_name[2] = new Array('강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');
   
   
   cat2_num[3] = new Array(58,59,60,61,62,63,64,65);
   cat2_name[3] = new Array('남구','달서구','동구','북구','서구','수성구','중구','달성군');
   
   
   cat2_num[4] = new Array(66,67,68,69,70,71,72,73,74,75);
   cat2_name[4] = new Array('계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');
   
   
   cat2_num[5] = new Array(76,77,78,79,80);
   cat2_name[5] = new Array('광산구','남구','동구','북구','서구');
   
   
   cat2_num[6] = new Array(81,82,83,84,85);
   cat2_name[6] = new Array('대덕구','동구','서구','유성구','중구');
   
   
   cat2_num[7] = new Array(86,87,88,89,90);
   cat2_name[7] = new Array('남구','동구','북구','중구','울주군');
   
   
   cat2_num[8] = new Array(91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108);
   cat2_name[8] = new Array('강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','횡성군');
   
   
   cat2_num[9] = new Array(109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148);
   cat2_name[9] = new Array('고양시 덕양구','고양시 일산구','과천시','광명시','광주시','구리시','군포시','김포시','남양주시','동두천시','부천시 소사구','부천시 오정구','부천시 원미구','성남시 분당구','성남시 수정구','성남시 중원구','수원시 권선구','수원시 장안구','수원시 팔달구','시흥시','안산시 단원구','안산시 상록구','안성시','안양시 동안구','안양시 만안구','오산시','용인시','의왕시','의정부시','이천시','파주시','평택시','하남시','화성시','가평군','양주군','양평군','여주군','연천군','포천군');
   
   
   cat2_num[10] = new Array(149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168);
   cat2_name[10] = new Array('거제시','김해시','마산시','밀양시','사천시','양산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','의령군','창녕군','하동군','함안군','함양군','합천군');
   
   
   cat2_num[11] = new Array(169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192);
   cat2_name[11] = new Array('경산시','경주시','구미시','김천시','문경시','상주시','안동시','영주시','영천시','포항시 남구','포항시 북구','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');
   
   
   cat2_num[12] = new Array(193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214);
   cat2_name[12] = new Array('광양시','나주시','목포시','순천시','여수시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');
   
   
   cat2_num[13] = new Array(215,216,217,218,219,220,221,222,223,224,225,226,227,228,229);
   cat2_name[13] = new Array('군산시','김제시','남원시','익산시','전주시 덕진구','전주시 완산구','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');
   
   
   cat2_num[14] = new Array(230,231,232,233);
   cat2_name[14] = new Array('서귀포시','제주시','남제주군','북제주군');
   
   
   cat2_num[15] = new Array(234,235,236,237,238,239,240,241,242,243,244,245,246,247,248);
   cat2_name[15] = new Array('공주시','논산시','보령시','서산시','아산시','천안시','금산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');
   
   
   cat2_num[16] = new Array(249,250,251,252,253,254,255,256,257,258,259,260);
   cat2_name[16] = new Array('제천시','청주시 상당구','청주시 흥덕구','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');
   
   
   function cat1_change(key,sel){
   if(key == '') return;
   var name = cat2_name[key];
   var val = cat2_num[key];
   
   for(i=sel.length-1; i>=0; i--)
    sel.options[i] = null;
   sel.options[0] = new Option('시도선택','', '', 'true');
   for(i=0; i<name.length; i++){
    sel.options[i+1] = new Option(name[i],val[i]);
   }
   }
   
   
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
	         

	         // You can access event parameter.
	         event.preventDefault();

	         // You can get target element in `context` variable, This element is same `$(this)`.
	         var $element = context.element;
	         

	         // You can also get calendar element, It is calendar view DOM.
	         var $calendar = context.calendar;
	    }
	});

   
   
   // ================ 예약버튼 ================  
   function goReserve(){
      alert("예약하시려면 먼저 로그인을 해주세요.");
   }// end of 예약버튼 끝 =======================
   
   
      
      
      
   // ================ 검색 ================
   function goSearch(){  
      
      var h_area1 = $("#h_area1").val().trim(); 	// 시도선택
      var h_area2 = $("#h_area2").val().trim(); 	// 구군선택
      var h_area3 = $("#h_area3").val().trim(); 	// 진료과목선택
      var myInput = $("#myInput").val().trim(); 	// 병원명입력창
      
      if(! (h_area1 == "시도선택" && h_area2 == "구군선택" && h_area3 == "전체" && myInput=="")){ 
         alert("검색완료");
      }else{
         alert("찾으시는 병원 정보를 선택해주세요.");
      }
   }// end of 검색 끝 =======================

   
   
   
	// ================ 진료과별로 나열하기 ================
		$("select:option[class=dept]").click(function(){
			$()	
		});
	// end of 진료과별로 나열하기 끝 =======================
   </script>
   
   <!-- 전체박스 -->
   <div id="reservation_container">
   <div id="reservation_title">
   <h1 style="font-weight: bolder;">인터넷 진료예약</h1>
   </div>
   <div class="container_find">
   <form name="form1">
              <select id="h_area1" name="h_area1" onChange="cat1_change(this.value,h_area2)" >
               <option selected>시도선택</option>
            <option value='1'>서울</option>
            <option value='2'>부산</option>
            <option value='3'>대구</option>
            <option value='4'>인천</option>
            <option value='5'>광주</option>
            <option value='6'>대전</option>
            <option value='7'>울산</option>
            <option value='8'>강원</option>
            <option value='9'>경기</option>
            <option value='10'>경남</option>
            <option value='11'>경북</option>
            <option value='12'>전남</option>
            <option value='13'>전북</option>
            <option value='14'>제주</option>
            <option value='15'>충남</option>
            <option value='16'>충북</option>
              </select>
              <select id="h_area2" name="h_area2">
               <option selected>구군선택</option>
              </select>
              <br>
            <label>진료과목</label>
              <select id="h_area3" name="h_area3" style="width: 200px;">
              <option selected>전체</option>
                  <option value='내과' class="dept">내과</option>
                  <option value='이비인후과' class="dept">이비인후과</option>
                  <option value='정형외과' class="dept">정형외과</option>
                  <option value='안과' class="dept">안과</option>
                  <option value='산부인과' class="dept">산부인과</option>
                  <option value='치과' class="dept">치과</option>
                  <option value='외과' class="dept">외과</option>
                  <option value='성형외과' class="dept">성형외과</option>
                  <option value='정신건강의학과' class="dept">정신건강의학과</option>
                  <option value='피부과' class="dept">피부과</option>
              </select>
              <!--  D001:내과, 
              	    D002:소아청소년과,
					D004:정신건강의학과,  
					D005:피부과,
					D011:여성의학과,
					D012:안과, 
					D013:이비인후과, D014:비뇨기과, 
					D022:가정의학과, 
					D026:치과 -->
             <label>
             <br>
                  <a>
                     <!-- <form name="searchFrm" action="xyz.do"> -->
                        <input id="myInput" name="myInput" type="text" placeholder="병원명을 입력하세요." style="width: 200px; "/>
                        <button class="myInput" onclick="goSearch()">검색</button>
                      
                     <!-- </form> -->
                  </a>
               </label>
              </form>
   </div>
   <!-- 시/군구/진료과목/병원검색 container 끝 -->
   
   <div class="check_box">
   <h3 style="margin-left: 4%; margin-bottom: 4%;">예약하실정보확인</h3>
      <ul>
         <li>환자명 : </li>
         <li><button class="btnTypecheck">환자정보확인</button><button class="btnTypecheck">최근예약</button></li>
         <li>병원/진료과 : </li>
         <li>진료일시 : </li>
      </ul>
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
   
   <div id="hospital" style="height: 300px;">
   <div class="hpsinfo" style="float: left; width:150px; margin-left: 6px;">
      <table>
      <c:if test="${empty hpinfovoList}">
         <tr>
            <td>현재 등록된 병원이 없습니다.</td>
         </tr>
      </c:if>
      
      <c:if test="${not empty hpinfovoList}">
      <tr>
      <c:forEach var="hpinfovoList" items="${hpinfovoList}" varStatus="status">
      <td>
      <!-- 병원사진 -->
      <a href='<%= ctxPath%>/socdoc/reserve.sd?hpSeq=${hpinfovoList.hpSeq}'><img width="150px;" height="140px;" src="<%= ctxPath%>/resources/images/${hpinfovoList.mainImg}"/></a>
      <!-- 병원이름 -->${hpinfovoList.hpName}<br/>
      <!-- 병원소개 -->${hpinfovoList.info}<br/>
      <!-- 리뷰보기 --><a href="http://drsonyouna.com/">리뷰 및 상세보기</a><br/>
      <c:if test="${(status.count)%2 == 0 }"></c:if>
      </td>
      
      </c:forEach>
      </tr>
      </c:if> 
      </table>
      </div>
      <!-- 리뷰보기 -->
   <!-- 병원검색했을경우, 병원정보정렬 끝 -->
   </div>
   </div>
   <!-- 병원목록 끝 -->
   
   
   <!-- 진료일정 : 달력 날짜선택 시간선택 -->
   <div class="schedule_medical">
   <h2>진료일정</h2>
   <hr style="border: solid 1px black;"/>
   
   <!-- ============================================ -->
   <!-- 병원을 선택 안했을때, 보여지는 창 -->
   <!-- <div id="list_container" style="margin: 30%;">
   <span>병원을 선택하시면 진료일정을 확인 하실 수 있습니다.</span>
   </div> --><!-- 병원을 선택 안했을때, 보여지는 창 end -->
   
   <!-- [달력/시간]설정하기 -->
   <div class="calendar"></div>
   <!-- 예약확정하기 -->
   <div id="reverse_set">
   <a style="cursor: pointer;" class="setbtn" data-toggle="modal" data-target="#myModal">
   <button type="button" class="reserve_btn" onclick="goReserve()">예약확정하기</button></a>
   </div>
   </div><!--  [달력/시간]설정하기 end -->
   
   
   
   <!-- 모달 영역 -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-ladelledby="myModalLabel">
      <div class="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
         <h4 class="modal-title" id="myModalLabel" style="font-size: 18pt; color: blue; font-weight: bold;">홍길동님 진료예약하시겠습니까?</h4>
         </div>
         
         <!-- 내용 -->
         <div class="modal-body">
         <ul>
            <li style="font-weight: bold;">2020년 07월 30일 13시30분</li>
            <li>닥터손유나의원/피부과</li>
            <li>정진호 의사</li>
         </ul>
         <br>
         <p class="title">
         <span style="text-align: center;">&nbsp;&nbsp;&nbsp;내 건강정보 확인하기</span>
         <table class="type05" style="border-top: solid 1px black; margin-bottom: 4%;">
               <tbody>
               <tr>
               <th scope="row">키</th>
                    <td>
                         160cm
                  </td>
                </tr>
                <tr>
               <th scope="row">몸무게</th>
                    <td>
                      50kg
                  </td>
                </tr>
                 <tr>
               <th scope="row">혈액형</th>
                    <td>
                      A형
                  </td>
                </tr>
                <tr>
                <th scope="row">알레르기</th>
                    <td>
                      없음
                  </td>
                </tr>
                <tr>
                <th scope="row">병력</th>
                    <td>
                      없음
                  </td>
                </tr>
                <tr>
                <th scope="row">복용약</th>
                    <td>
                      없음
                  </td>
                </tr>
                </tbody>
                </table>
      </div>
        
         
         
         <div class="modal_footer">
         <button type="button" class="btn btn-primary">확인</button>
         <button type="button" class="btn btn-default myclose" data-dismiss="modal">취소</button>
         </div>
      </div>
      </div>
      </div>
      <!-- 예약확정하기 버튼 끝 -->
   
   </div>
   <!-- 진료일정 : 달력 날짜선택 시간선택 끝-->
  
   
