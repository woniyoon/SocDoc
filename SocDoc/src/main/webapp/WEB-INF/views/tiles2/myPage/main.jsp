<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
    
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
<script src="main.js"></script>
<style>

    body {
        height: auto;
        margin: 0 auto;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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
        margin: 0 auto;
        width: 90vw;
        min-height: 75vh;
        height: auto;
        display: flex;
        flex-direction: row;
    }

    #mycontent {
    	 background-position: top;
    	 background-image: url("<%= ctxPath%>/resources/images/mypageMain2.jpg");
    	 background-repeat: no-repeat;
    }

    #sideMenu {
        flex: 1;
        /* border: 1px solid navy; */
    }

    #contents {
        flex: 4;
        height: auto;
        margin: 0 30px;
		flex-direction: row;
        justify-content: space-around;
    }


    /* #scheduleTbl, thead, tbody, td {
        width: 50vw;
        border: 2px solid grey;
        border-collapse: collapse;
    }

    #reviewBoard, thead, tfoot {
        width: 50vw;
        border: 2px solid grey;
        border-collapse: collapse;

    } */

    
    /*  main 끝  */
/*     footer {
        position: absolute;
        height: 5rem;
        width: 100vw;
        background-color: rgb(241, 241, 241);
    } */
      
    /* 첫번째줄 셋팅- 예약확인 */
	div#box1 {
		width: 105%;
		margin-top: 20px;
		height: 200px;
		border: 2px solid #157bb9;
		padding: 0 15px 15px 15px;
		box-shadow: 2px 2px 10px gray;

	}
	
	/* 두번째줄 셋팅 */
	div#box2 {
		display: inline-block;
		width: 105%;
		margin-top: 20px;
		height: 300px;
	}
	
	/* 두번째줄 - 최근진료조회, 내건강 */
	div#box2-1, div#box2-2, div#box2-3 {
		width: 32%;
		height: 300px;
		border: 1px solid gray;
		padding: 0 15px 15px 15px;
	}
	
	/* 예약확인  */
	table {
		width: 95%;
		margin: 0 auto;
		border-collapse: collapse;
	}
	
	 th {
		font-size: 14px;
	    font-weight: bold;
	    color: #222222;
	    text-align: center;
	    padding: 12px 2px;
	    border-top: 1px solid #333333;
	    border-bottom: 1px solid #333333;
	}
	
	td {
		font-size: 14px;
	    color: #666666;
	    text-align: center;
	    padding: 17px 0;
	    border-bottom: 1px solid #dddddd;
	    line-height: 1.3;
	
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
	    height: 35px;
	    line-height: 45px;
	    width: 100%;
	    text-decoration: none;
		cursor: pointer;
	}
	
	/* td.noticeTitle:hover {
		cursor: pointer;
	} */
	
	#notice {
		/* border: solid 1px red; */
		width: 80%;
		height: 160px;
		padding:15px;
		background-color: #E3E3E3;
		border-radius: 4px;
	}
	
	@FONT-FACE {
		font-family: 'han';
		src:url("<%= ctxPath%>/resources/fonts/HANDotum.ttf");
	}
	
	/* 버튼  */
	button.main{
	  background:#157bb9;
	  color:#fff;
	  border:none;
	  position:relative;
	  height:60px;
	  font-size:10pt;
	  padding:0 2em;
	  cursor:pointer;
	  transition:800ms ease all;
	  outline:none;
	}
	button.main:hover{
	  background: #fff;
	  color: #157bb9;
	}
	button.main:before,button.main:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: #157bb9;
	  transition:400ms ease all;
	}
	button.main:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	button.main:hover:before,button.main:hover:after{
	  width:100%;
	  transition:800ms ease all;
	}
	
	a:hover {
		text-decoration: none;
	}
	
</style>

<script type="text/javascript">
	<%-- var loginuser = "${sessionScope.loginuser}";
	
	if(loginuser == null) {
		alert("로그인이 필요한 서비스입니다.");
		location.href="<%= ctxPath%>/+login.sd";
	}
	else if(loginuser != null) {
		location.href="<%= ctxPath%>/mypage.sd";
	} --%>
</script>


</head>
<body>
   <!--  <header>
        <img id="logo" src="/JqueryStudy/logo.jpg" width=80px height=80px />
        <ul class="headerMenu">
            <li><a>찾기</a></li>
            <li><a>예약</a></li>
            <li><a>후기</a></li>
            <li><a>알림소식</a></li>
        </ul>

</header> -->
    <main style="margin-bottom: 80px;">
        <div id="sideMenu" style="margin-top: 220px;">
            <ul style="font-size: 14pt;">
            	<li><h3 style="margin-bottom:20px; font-family: han; font-weight: bolder; font-size: 22pt; letter-spacing:-1px; word-spacing: -2px;">관련 콘텐츠</h3></li>
                <li><a href="<%= request.getContextPath()%>/infoEdit.sd">·  회원정보수정</a></li>
                <li><a href="<%= request.getContextPath()%>/askList.sd">· 문의내역</a></li>
                <li><a href="<%= request.getContextPath()%>/myHealth.sd">· 내 건강</a></li>
                <li><a href="<%= request.getContextPath()%>/bookMark.sd">· 병원 즐겨찾기</a></li>
                <li><a href="<%= request.getContextPath()%>/reservation.sd">· 예약확인</a></li>
                <li><a href="<%= request.getContextPath()%>/viewHistory.sd">· 최근 진료이력조회</a></li>
                <li><a href="<%= request.getContextPath()%>/review.sd">· 내 후기</a></li>
            </ul>
            <ul style="display:inline-block; margin-top: 20px; font-size: 16pt;">
            	<li><h3 style="margin-bottom:20px; font-family: han; font-weight: bolder; font-size: 22pt; letter-spacing:-1px; word-spacing: -3px;">자주 찾는 서비스</h3></li>
                <li><a href="<%= request.getContextPath()%>/faq.sd" style="color: #157bb9; cursor: pointer;">FAQ</a>&nbsp;&nbsp;&nbsp;<a href="<%= request.getContextPath()%>/searchHospital.sd" style="cursor: pointer; color: #157bb9;">병원찾기</a></li>
                <li><a style="color: #157bb9; cursor: pointer;" href="<%= request.getContextPath()%>/myHealth.sd">내 건강</a></li>
            </ul>
        </div>
        <div id="contents" style="margin-top: 220px;">
		<!-- <h1 style="text-align: left;"><strong>마이페이지</strong></h1> -->
	<div id="box1" style="background-color: white; margin-bottom: 5px;">

		<h3 style="margin-bottom: 0; font-family: han; font-size: 18pt; letter-spacing:-1px; word-spacing: -2px;">예약확인</h3>
		<!-- 더보기 -->
		<div id="more" style="text-align: right; margin-right: 30px;">
				<a href="<%= request.getContextPath()%>/reservation.sd" style="font-size: 9pt; font-weight: bolder;">더보기></a>
		</div>
		<!-- 더보기 -->	
		<div style="height:80%; text-align: center; margin-top: 10px; ">
			<!-- 테이블 -->
			<form name="noticeListFrm">
			<table>
				<thead>
					 <tr style="background-color: #e8f5fc;">
					 	<th>병원이름</th>
					 	<th>방문예정일</th>
					 	<th>방문예정시간</th>
					 </tr>
				</thead>
				
				<tbody>
				 <c:forEach var="reservationList" items="${reservationList}" varStatus="status">
					<tr>
						<td id="hospitalName" class="noticeTitle">${reservationList.hpName}</td>
						<td>${reservationList.visitdate}</td>
						<td>${reservationList.hour}</td>
					</tr>
				</c:forEach>
				</tbody>	
				
			</table>
			</form>
			<!-- 테이블 -->

		</div>
	</div>
	<div id="box2">
		<div id="box2-1" style="float: left; background-color: #e6e6e5;">
			<h3 style="color: #157bb9; font-family: han; font-size: 18pt; letter-spacing:-1px; word-spacing: -2px;">최근 진료이력조회</h3>
			<!-- 더보기 -->
			<div id="more" style="text-align: right; margin-right: 15px;">
					<a href="<%= request.getContextPath()%>/viewHistory.sd" style="font-size: 9pt; font-weight: bolder;">더보기></a>
			</div>
			<!-- 더보기 -->
			<div style="height:80%; text-align: center; margin-top: 25px;">
				<!-- 테이블 -->
				<form name="noticeListFrm">
				<table style="width: 90%;">
					<thead>
						 <tr>
						 	<th style="padding: 10px 0; font-size: 10pt;">병원이름</th>
						 	<th style="padding: 10px 0; font-size: 10pt;">방문일</th>
						 </tr>
					</thead>
					
					<tbody>
					 <c:forEach var="historyList" items="${historyList}" varStatus="status" begin="1" end="3">
						<tr>
							<td id="hospitalName" class="noticeTitle" style="padding: 10px 0; font-size: 9pt;">${historyList.hpName}</td>
							<td style="padding: 10px 0; font-size: 9pt;">${historyList.visitdate}</td>
						</tr>
					</c:forEach>
					</tbody>	
					
				</table>
				</form>
				<!-- 테이블 -->

			</div>
		</div>
		<div id="box2-2" style="float: left; margin-left: 18px;">
			<h3 style="font-family: han; font-size: 18pt; letter-spacing:-1px; word-spacing: -2px;"><span style="font-family: han; font-size: 18pt; font-weight: bolder;">${membervo.name}</span>님의 건강정보</h3>
			<div style="width:100%; height:100%; margin-top: 25px;">
			<!-- 테이블 -->
				<form name="noticeListFrm">
				<table style="width: 100%;">
					<thead>
						 <tr>
						 	<th style="border: none; font-weight: normal;">
						 		<img id="findPW" src="<%= ctxPath%>/resources/images/healthy.png" width="100" height="160"/>
							</th>
						 	<th style="padding-top: 25px; border: none; font-weight: normal; text-align: left;">
						 		키<br/>
								몸무게<br/>
								혈액형<br/>
								알레르기<br/>
								병력사항<br/>
								복용약<br/>
						 	</th>
						 	<th style="padding-top: 25px; border: none; font-weight: bolder; text-align: left; color: #157bb9;">
						 		<c:if test="${not empty (membervo.height)}">
						 			${membervo.height} cm<br/>
						 		</c:if>		
						 		<c:if test="${empty (membervo.height)}">
						 			미입력<br/>
						 		</c:if>	
						 		<c:if test="${not empty (membervo.weight)}">
						 			${membervo.weight} kg<br/>
						 		</c:if>		
						 		<c:if test="${empty (membervo.weight)}">
						 			미입력<br/>
						 		</c:if>	
						 		<c:if test="${not empty (membervo.bloodType)}">
						 			${membervo.bloodType} 형<br/>
						 		</c:if>		
						 		<c:if test="${empty (membervo.bloodType)}">
						 			미입력<br/>
						 		</c:if>	
						 		<c:if test="${not empty (membervo.allergy)}">
						 			${membervo.allergy}<br/>
						 		</c:if>		
						 		<c:if test="${empty (membervo.allergy)}">
						 			미입력<br/>
						 		</c:if>
						 		<c:if test="${not empty (membervo.history)}">
						 			${membervo.history}<br/>
						 		</c:if>		
						 		<c:if test="${empty (membervo.history)}">
						 			미입력<br/>
						 		</c:if>
						 		<c:if test="${not empty (membervo.medicine)}">
						 			${membervo.medicine}<br/>
						 		</c:if>		
						 		<c:if test="${empty (membervo.medicine)}">
						 			미입력<br/>
						 		</c:if>
						 	</th>
						 </tr>
					</thead>
				</table>
				</form>
				<!-- 테이블 -->
				</div>
		</div>
		<div id="box2-3" style="float:left; margin-left: 18px;">
			<h3 style="font-family: han; font-size: 18pt; letter-spacing:-1px; word-spacing: -2px;">회원정보수정</h3>
			<div style="height:80%; text-align: center; margin-top: 40px;">
				<strong>기본정보 변경</strong>을 원하시거나 <strong>비밀번호 변경</strong>을<br/> 원하실 경우 아래의 버튼을 클릭 해주세요.
				<div id="infoBnt" style="margin-top: 35px;">
					<!-- <button type="button" style="width:45%; height:40px; border-radius: 4px; background-color: gray; color: white;" onclick="">기본정보 변경</button>
					<button type="button" style="width:45%; height:40px; border-radius: 4px; background-color: gray; color: white;" >비밀번호 변경</button> -->
					<button type="button" class="main" style="width:45%; height:40px; box-shadow:none;" onclick="javascript:location.href='<%= request.getContextPath()%>/infoEdit.sd'">회원정보 수정</button>
				</div>
			</div>
		</div>
	</div>
	<div id="box2">
		<div id="box2-1" style="float: left;">
			<h3 style="font-family: han; font-size: 18pt; letter-spacing:-1px; word-spacing: -2px;">병원 즐겨찾기</h3>
			<div style="height:80%; margin-top: 16px;">
				<!-- 테이블 -->
				<form name="noticeListFrm">
				<table style="width: 100%;">
					<thead>
					<c:forEach var="bookMarkList" items="${bookMarkList}" varStatus="status" begin="1" end="1">
						 <tr>
						 	<th style="width: 35%;  border: none; font-weight: normal;  text-align: left;  ">
						 		<img id="findPW" src="<%= ctxPath%>/resources/images/${bookMarkList.mainimg}" width="140" height="190"/>
							</th>
						 	<th style="width: 65%;  border: none; font-weight: normal; text-align: left; vertical-align: text-top;">
						 	
						 		<strong style="font-size: 15pt; font-weight: bold; ">${bookMarkList.hpName}</strong><br/>
						 		<br/>
						 		유형: ${bookMarkList.dept}<br/>
								위치: ${bookMarkList.address}<br/>
								전화: ${bookMarkList.phone}<br/>
								<!-- 더보기 -->
								<div id="more" style="text-align: right; margin-right: 15px;">
										<a href="<%= request.getContextPath()%>/bookMark.sd" style="font-size: 9pt; font-weight: bolder;">더보기></a>
								</div>
								<!-- 더보기 -->
						 	</th>
						 </tr>
						 </c:forEach>
					</thead>
				</table>
				</form>
				<!-- 테이블 -->
				
			</div>
		</div>
		<div id="box2-2" style="float: left; margin-left: 18px;">
			<h3 style="font-family: han; font-size: 18pt; letter-spacing:-1px; word-spacing: -2px;">문의내역</h3>
			<div style=" height:80%; text-align: center; margin-top: 40px;">
				홈페이지 이용시 의견이 있으시면 문의해주세요.
				<div id="infoBnt" style="margin-top: 50px;">
					<button type="button" class="main" style="width:90%; height:40px;" onclick="javascript:location.href='<%= request.getContextPath()%>/askList.sd'" >문의내역</button>
					<button type="button" class="main" style="width:90%; height:40px; margin-top:10px;" onclick="javascript:location.href='<%= request.getContextPath()%>/faq.sd'" >의견접수</button>
				</div>
			</div>
		</div>
		<div id="box2-3" style="float:left; margin-left: 18px;  background-color: #e6e6e5;">
			<h3 style="color: #157bb9; font-family: han; font-size: 18pt; letter-spacing:-1px; word-spacing: -2px;"><span style="font-family: han; font-size: 18pt; font-weight: bolder;">${membervo.name}</span>님의 후기내역</h3>
			<!-- 더보기 -->
			<div id="more" style="text-align: right; margin-right: 15px;">
				<a href="<%= request.getContextPath()%>/review.sd" style="font-size: 9pt;">더보기></a>
			</div>
			<!-- 더보기 -->
			<div style="height:80%; text-align: center; margin-top: 25px;">
				<!-- 테이블 -->
				<form name="noticeListFrm">
				<table style="width: 90%;">
					<thead>
						 <tr>
						 	<th style="padding: 10px 0; font-size: 8pt;">병원</th>
						 	<th style="padding: 10px 0; font-size: 8pt;">별점</th>
						 	<th style="padding: 10px 0; font-size: 8pt;">내용</th>
						 </tr>
					</thead>
					
					<tbody>
					<c:forEach var="reviewList" items="${reviewList}" varStatus="status" end="3">
						<tr>
							<td id="hospitalName" class="noticeTitle" style="padding: 10px 0; font-size: 8pt;">${reviewList.name}</td>
							<td style="padding: 10px 0; font-size: 8pt;">
								<c:if test="${reviewList.rating==5}">★★★★★</c:if>
				                <c:if test="${reviewList.rating==4}">★★★★</c:if>
				                <c:if test="${reviewList.rating==3}">★★★</c:if>
				                <c:if test="${reviewList.rating==2}">★★</c:if>
				                <c:if test="${reviewList.rating==1}">★</c:if>
							</td>
							<td style="padding: 10px 0; font-size: 8pt;">${reviewList.content}</td>
						</tr>
					</c:forEach>
					</tbody>	
				</table>
				</form>
				<!-- 테이블 -->
				</div>
		</div>
	</div>
        </div>
    </main>
<!--     <footer>
    </footer> -->
</body>
</html>