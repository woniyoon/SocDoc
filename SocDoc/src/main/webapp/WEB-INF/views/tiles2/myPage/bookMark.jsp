<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        /* height: auto; */
        margin: 0 auto;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        /* border: 1px solid pink;
        min-height: 100vh; */
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

</style>
</head>
<body>
    <main>
        <div id="sideMenu">
            <ul style="margin-left: 50px;">
            	<li><h3 style="font-weight: bolder; color: #4e4e4b;">관련 콘텐츠</h3></li>
                <li><a href="<%= request.getContextPath()%>/infoEdit.sd">· 회원정보수정</a></li>
                <li><a href="<%= request.getContextPath()%>/askList.sd">· 문의내역</a></li>
                <li><a href="<%= request.getContextPath()%>/myHealth.sd">· 내 건강</a></li>
                <li><a style="color: #157bb9; font-weight: bolder;" href="<%= request.getContextPath()%>/bookMark.sd">· 병원 즐겨찾기</a></li>
                <li><a href="<%= request.getContextPath()%>/reservation.sd">· 예약확인</a></li>
                <li><a href="<%= request.getContextPath()%>/viewHistory.sd">· 최근 진료이력조회</a></li>
           		<li><a href="<%= request.getContextPath()%>/review.sd">· 내 후기</a></li>
            </ul>
            <ul style="display:inline-block; margin-top: 20px; margin-left: 50px; font-size: 14pt; color:#157bb9;">
            	<li><h3 style="font-weight: bolder; color: #4e4e4b;">자주 찾는 서비스</h3></li>
                <li><a>FAQ</a>&nbsp;&nbsp;&nbsp;<a>병원찾기</a></li>
                <li><a>내 건강</a></li>
            </ul>
        </div>
        
        <div id="contents">
        <h1 style="text-align: left;"><strong>병원 즐겨찾기</strong></h1>
        <div>총 즐겨찾기: <span style="color: skyblue;">1</span></div>
			<form name="noticeListFrm">
			<table style="margin-top: 30px;">
				<thead>
					 <tr>
					 	<th><input type="checkbox" /></th>
					 	<th>번호</th>
					 	<th>유형</th>
					 	<th>병원이름</th>
					 	<th>등록일</th>
					 </tr>
				</thead>
				
				<tbody>
					<tr>
						<td><input type="checkbox" /></td>
					    <td class="notice_seq">1</td>
						<td>내과</td>
						<td class="noticeTitle">똑닥병원</td>
						<td>2020-07-30</td>
					</tr>
				</tbody>	
						

				<!--  
				<tbody>
					<c:forEach var="feedback" items="${feedbackList}" >
					<tr>
					    <td>${feedback.rno}</td>
						<td>${feedback.status}</td>
						<td class="notice_seq">${feedback.feedback_board_seq}</td>
						<td class="noticeTitle">${feedback.title}</td>
						<a href="/notice/noticeView.sb?notice_seq=${notice.notice_seq}">
						<td>${feedback.username}</td>
						<td>${feedback.write_day}</td>
						<td>${feedback.hit}</td>
					</tr>
					</c:forEach>
				</tbody>
				-->
			</table>
			</form>
			</br></br>
			
			<div style="width:80%; text-align: right;">
				<span><button id="printBtn" style="background-color: skyblue; color:white; width: 50px; height: 30px; border-radius: 4px; border: none; font-size: 10pt;">삭제</button></span>
			</div>
			
			<!-- 페이지바 -->
			<div id="center" style="width: 70%; border: solid 0px gray; margin: 20px auto;">
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
		
    </main>
    <footer>
    </footer>
</body>
</html>