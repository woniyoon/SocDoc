<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String ctxPath = request.getContextPath();
	// 	   /board
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Page Title</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" media="screen" href="main.css" />
<link rel="stylesheet" type="text/css" media="screen" href="<%=ctxPath %>/resources/css/reservationInfo.css" />
<!-- Pignose 캘린더 라이브러리 임포트 -->
<link rel="stylesheet" href="<%=ctxPath %>/resources/pg-calendar/dist//css/pignose.calendar.min.css">
<link rel="stylesheet" href="<%=ctxPath %>/resources/pg-calendar/dist//css/pignose.calendar.css">
<script src="<%=ctxPath %>/resources/pg-calendar/dist/js/pignose.calendar.min.js"></script>
<script src="<%=ctxPath %>/resources/pg-calendar/dist/js/pignose.calendar.full.min.js"></script>
<script src="<%=ctxPath %>/resources/pg-calendar/dist/js/pignose.calendar.full.js"></script>
<script src="<%=ctxPath %>/resources/pg-calendar/dist/js/pignose.calendar.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
<script src="main.js"></script>
<style>

    body {
        height: auto;
        margin: 0 auto;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        border: 1px solid pink;
        min-height: 100vh;
    }

    header {
        position: sticky;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 10px 0;
        width: 100vw;
        background-color: white;
        box-shadow: 2px 2px 2px 0 #b6b6b65a, 0 2px 2px 0 rgba(155, 155, 155, 0.337);
    }

    .headerMenu {
        width: 80vw;
        display: flex;
        flex-direction: row;
        justify-content: space-around;
        padding: 0;
    }

    /*  header 끝  */

    ul {
        list-style-type: none;
    }

    main {
        padding: 30px auto;
        width: 100vw;
        min-height: 75vh;
        height: auto;
        display: flex;
        flex-direction: row;
    }

    #sideMenu {
        flex: 1;
        /* border: 1px solid navy; */
    }

    #contents {
        flex: 4;
       /*  height: auto; */
		flex-direction: row;
        justify-content: space-around;
        margin: 0 30px;
    }

    /*  main 끝  */
    footer {
        position: absolute;
        height: 5rem;
        width: 100vw;
        background-color: rgb(241, 241, 241);
    }
    
    /* @media (max-width:1000px) {
		CSS 스타일 !
	
	}
       */

	/* 게시판  */
	table {
		width: 80%;
		border-collapse: collapse;
	}
	
	 th {
		font-size: 14px;
	    font-weight: bold;
	    color: #222222;
	    text-align: center;
	    padding: 17px 3px;
	    border-top: 1px solid #333333;
	    border-bottom: 1px solid #333333;
	}
	
	td {
		font-size: 14px;
	    color: #666666;
	    text-align: center;
	    padding: 17px 0;
	    border-bottom: 1px solid #dddddd;
	    line-height: 1.8;
	
	}
	
	div#notice_button_wrap{
		display: inline-block;
		width: 100%;	
	}
	
	p#notice_button {
		display: inline-block;
		border-radius: 3px;
	    height: 45px;
	    width: 84px;
	    background: #666666;
		color: white;
		float: right;
		margin: 30px 20px 50px 0px;
	}
	
	a.notice_list {
		display: inline-block;
	    font-size: 14px;
	    color: #fff;
	    font-weight: bold;
	    text-align: center;
	    height: 45px;
	    line-height: 45px;
	    width: 100%;
	    text-decoration: none;
		cursor: pointer;
	}
	
	td.noticeTitle:hover {
		cursor: pointer;
	}
	
	div#pageBar {
		text-align: center;
		
	}
	
	#notice {
		/* border: solid 1px red; */
		width: 80%;
		height: 160px;
		padding:15px;
		background-color: #E3E3E3;
		border-radius: 4px;
	}
	
	/* 기본정보 변경 form */
	table.type05 {
		width: 100%;
	    border-collapse: separate;
	    border-spacing: 1px;
	    text-align: left;
	    line-height: 1.5;
	    /* border-top: 1px solid #ccc; */
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
		width: 100%;
	}
	
	div#pageBar {
		text-align: center;
		
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

</style>

<script type="text/javascript" src="/StarbucksWeb/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/StarbucksWeb/util/myutil.js"></script>

<script type="text/javascript">

	 $(document).ready(function() {
		
		// 검색시 검색조건 및 검색어 값 유지시키기 
	    if(${paraMap != null}) {
	       $("#searchType").val("${paraMap.searchType}");
	    }
		
		$("#searchType").change(function(){
			searchType = $(this).val();
			goSearch(searchType);
		});
		
		// 모달을 띄우기 위해 테이블 행 클릭 이벤트 추가
	      $(".visitorRow").each(function() {
	    	  
	    	  //reservSeq = $("reservSeq").val();
	    	  //goDetail();
	    	  
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
 
	function hospitalName(){
		
		// 팝업창 띄우기
		var url = "<%= request.getContextPath()%>/hospitalNamePopup.sd";
		
		window.open(url, "hospitalNamePopup",
					"left=350px, top=100px, width=350px, height=250px, resizable = no, scrollbars = no"); // 팝업창 띄움(view단주소, 팝업창이름, 위치) --%>
		
	}
	
	function goSearch(searchType) {
	    var frm = document.searchFrm;
	    frm.searchType.value = searchType;
	    
	    frm.method = "GET";
	    frm.action = "<%= request.getContextPath()%>/reservation.sd";
	    frm.submit();
	  }// end of function goSearch()-------------------------

	  
	  function closeModal() {
	      $(".modalContainer").addClass("hidden");
	   }
	  
	  function goDetail(reservSeq) {
		  <%-- var frm = document.reservationListFrm;
		  
		  frm.method = "GET";
		  frm.action = "<%= request.getContextPath()%>/reservation.sd";
		  frm.submit(); --%>
		  
		  $.ajax({
	             url:"<%= request.getContextPath()%>/getDetail.sd",
	             type:"GET",
	             data:{"reservSeq":reservSeq},
	             dataType:"JSON",
	             success:function(json){
	               // json결과가 오면 데이터를 동적으로 모달 안에 삽입.
	               
	               console.log(json);
	            	var html = "";
	 				if(json != null) {
	 					html += "<table class='visitorDetail customTable'>";
 						html += "<tr align='center'>";
 						html += "<td>병원명</td>";
 						html += "<td>"+json.hpName+"</td>";
 						html += "</tr>";
 						html += "<tr align='center'>";
 						html += "<td>진료과목</td>";
 						html += "<td>"+json.dept+"</td>";
 						html += "</tr>";
 						html += "<tr align='center'>";
 						html += "<td>방문예정일</td>";
 						html += "<td>"+json.visitdate+"</td>";
 						html += "</tr>";
 						html += "<tr align='center'>";
 						html += "<td>방문예정시간</td>";
 						html += "<td>"+json.hour+"</td>";
 						html += "</tr>";
 						html += "<tr align='center'>";
 						html += "<td>전화번호</td>";
 						html += "<td>"+json.phone+"</td>";
 						html += "</tr>";
 						html += "<tr align='center'>";
 						html += "<td>주소</td>";
 						html += "<td>"+json.address+"</td>";
 						html += "</tr>";
 						html += "</table>";
	 					
	 				 /* $.each(json, function(index, item){
	 						html += "<table class='visitorDetail customTable'>";
	 						html += "<c:forEach var='reservationDetail' items='${reservationDetail}' varStatus='status'>";
	 						html += "<tr align='center'>";
	 						html += "<td>병원명</td>";
	 						html += "<td>${reservationDetail.hpName}</td>";
	 						html += "</tr>";
	 						html += "<tr align='center'>";
	 						html += "<td>진료과목</td>";
	 						html += "<td>${reservationDetail.dept}</td>";
	 						html += "</tr>";
	 						html += "<tr align='center'>";
	 						html += "<td>방문예정일</td>";
	 						html += "<td>"++"</td>";
	 						html += "</tr>";
	 						html += "<tr align='center'>";
	 						html += "<td>방문예정시간</td>";
	 						html += "<td>${reservationDetail.hour}</td>";
	 						html += "</tr>";
	 						html += "<tr align='center'>";
	 						html += "<td>전화번호</td>";
	 						html += "<td>${reservationDetail.phone}</td>";
	 						html += "</tr>";
	 						html += "<tr align='center'>";
	 						html += "<td>주소</td>";
	 						html += "<td>";
	 						html += "${reservationDetail.address}";
	 						html += "</td>";
	 						html += "</tr>";
	 						html += "</c:forEach>";
	 						html += "</table>";
	 					}); */
	 				}
	 				else {
	 					html += "<tr>";
	 					html += "<td colspan='4' style='text-align: center;'>오류</td>";
	 					html += "</tr>";
	 				}
	 				
	 				$("#detail").html(html); 
	             },
	             error: function(request, status, error){
	                      alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	             }
		  });
	  }
  
</script>


<body>
    <main>
        <div id="sideMenu">
            <ul style="margin-left: 50px;">
            	<li><h3>관련 콘텐츠</h3></li>
                <li><a href="<%= request.getContextPath()%>/infoEdit.sd">· 회원정보수정</a></li>
                <li><a href="<%= request.getContextPath()%>/askList.sd">· 문의내역</a></li>
                <li><a href="<%= request.getContextPath()%>/myHealth.sd">· 내 건강</a></li>
                <li><a href="<%= request.getContextPath()%>/bookMark.sd">· 병원 즐겨찾기</a></li>
                <li><a href="<%= request.getContextPath()%>/reservation.sd">· 예약확인</a></li>
                <li><a href="<%= request.getContextPath()%>/viewHistory.sd">· 최근 진료이력조회</a></li>
           		<li><a href="<%= request.getContextPath()%>/review.sd">· 내 후기</a></li>
            </ul>
            <ul style="display:inline-block; margin-top: 20px; margin-left: 50px;">
            	<li><h3>자주 찾는 서비스</h3></li>
                <li><a>FAQ</a>&nbsp;&nbsp;&nbsp;<a>병원찾기</a></li>
                <li><a>내 건강</a></li>
            </ul>
        </div>
        
        <div id="contents">
        <h1 style="text-align: left;"><strong>예약확인</strong></h1>
        <div>총 예약: <span style="color: skyblue;">${totalCount}</span></div>
        <div style="width:80%; display: inline-block; ">
        <form name="searchFrm">
  			<select id="searchType" name="searchType" style="height:25px; float: right;" >
  				<option id="searchType1" value="1" >전체</option>
  				<option id="searchType2" value="2" >최신순</option>
  				<option id="searchType3" value="3" >오래된순</option>
  			</select>
  		</form>
       </div>
			<form name="reservationListFrm">
			<table style="margin-top: 30px;">
				<thead>
					 <tr>
					 	<th>번호</th>
					 	<th>병원이름</th>
					 	<th>방문예정일</th>
					 	<th>방문예정시간</th>
					 	<th>방문여부</th>
					 </tr>
				</thead>
				
				
				
				<tbody>
				<c:forEach var="reservationList" items="${reservationList}" varStatus="status">
					<tr>
					    <td class="notice_seq">${status.count}</td>
<%-- 						<td id="hospitalName" class="visitorRow" ><a href="javascript:goDetail(${reservationList.reservSeq})" style="cursor: pointer;" class="btn">${reservationList.hpName}</a></td> --%>
						<td id="hospitalName" class="visitorRow" onclick="goDetail(${reservationList.reservSeq})" style="cursor: pointer;">${reservationList.hpName}</td>
						
						<td>${reservationList.visitdate}</td>
						<td>${reservationList.hour}</td>
						<c:if test="${reservationList.status == 0}">
						<td style="color: gray;">
								방문완료
						</td>
						</c:if>
						<c:if test="${reservationList.status == 1}">
						<td style="color: skyblue;">
								방문예정
						</td>
						</c:if>
					</tr>
				</c:forEach>
				</tbody>	
					
			</table>
				<input type="hidden" id="reservSeq" name=reservSeq value="${reservSeq}"/>	
			</form>
			</br></br>
			
			<div id="notice">
				<img id="warning" src="<%= ctxPath%>/resources/images/warning.png" width=70px height=70px /><span style="color: #02BAFF; font-size: 18pt; font-weight: bold;">주의</span><br/>
				<span style="font-size: 10pt;">
					진료예약취소는 진료일 이전(자정)까지 가능합니다. (수납기록 및 검사예약이 없는 진료만 변경/취소가 가능특정 진료과(정신건강의학과, 영상의학과, 마취통증의학과)의 예약이 조회되지 않을 수 있습니다.<br/>
					예약이 조회되지 않을 경우에는 예약센터나 해당 진료과로 문의해 주십시오.
				</span>
			</div>
			
			<!-- 페이지바 -->
			<div id="center" style="width: 30%; border: solid 0px gray; margin: 20px auto;">
				${pageBar}
			</div>
			
			</div>
			</br></br>
			
			<!--  
			<div id="notice_button_wrap">
				<p id="notice_button">
					<a class="write notice_list" href="feedbackWrite.sb" >글쓰기</a>
				</p>
			</div>
			-->
		</section>
		</div>
		
		<!-- 모달 영역 -->
		<!--  
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-ladelledby="myModalLabel">
   <div class="modal-dialog" role="document">
   <div class="modal-content">
      <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
      <h4 class="modal-title" id="myModalLabel" style="font-size: 18pt; font-weight: bold;">예약확인</h4>
      </div>
      -->
      
      <!-- 내용 
      <div class="modal-body">
      <div id="container" style="text-align: center; margin-top: 30px; width: 100%; margin: 0 auto;">
		<!-- 기본정보 변경 form시작 
	    <div id="infoChange">
	    -->
	    
		<form name="writeFrm" >
		
			<div class="modalContainer hidden">
		      <div class="modalOverlay">
		         <div class="modalContent" align="center">
		            <div class="modalContentHeader">
		               <h4 align="left">병원정보</h4>
		               <span style="font-size: 1.2em; cursor: pointer;"
		                  onclick="closeModal()">X</span>
		            </div>
		            <div id="detail">
		            <!-- ajax를 이용해, 동적으로 생성 ⬇️-->
		            <table class="visitorDetail customTable" >
		            <c:forEach var="reservationDetail" items="${reservationDetail}" varStatus="status">
		               <tr align="center">
		                  <td>병원명</td>
		                  <td>${reservationDetail.hpName}</td>
		               </tr>
		               <tr align="center">
		                  <td>진료과목</td>
		                  <td>${reservationDetail.dept}</td>
		               </tr>
		               <tr align="center">
		                  <td>방문예정일</td>
		                  <td>${reservationDetail.visitdate}</td>
		               </tr>
		               <tr align="center">
		                  <td>방문예정시간</td>
		                  <td>${reservationDetail.hour}</td>
		               </tr>
		               <tr align="center">
		                  <td>전화번호</td>
		                  <td>${reservationDetail.phone}</td>
		               </tr>
		               <tr align="center">
		                  <td>주소</td>
		                  <td>
		                  	${reservationDetail.address}
		                  </td>
		               </tr>
		                </c:forEach>
		            </table>
		            <!-- 동적으로 생성되는 부분-->
		            </div>
		            <div class="modal_footer" style="text-align: center; margin-top:15px; margin-bottom: 15px;">
				      <button type="button" class="btn btn-primary">예약변경</button>
				      <button type="button" class="btn btn-default myclose" data-dismiss="modal">예약취소</button>
				    </div>
		         </div>
		      </div>
		   </div>
	  </form>
	  </div>
   <!-- 기본정보 변경 form끝 -->
      </div>
      </div>
      
      
   </div>
   </div>
   </div>
		
    </main>
    <footer>
    </footer>
</body>
</html>