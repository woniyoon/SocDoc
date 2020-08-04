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
    
    div#search_header {
		
	}
	
	div#search_bar {
		width: 85%;
		height: 76px;
		/* background-color: #f4f4f2; */
		border-radius: 3px;
    	margin-bottom: 40px;
	}
	
	div#search_bar_right {
		float: right;
		margin-right: 5%;
	}

	
	input#searchWord {
		margin-top: 20px;
		display: inline;
		width: 200px;
	    height: 36px;
	    line-height: 36px;
	    border: 1px solid #ddd;
	    border-radius: 3px;
	    text-indent: 10px;
	    color: #666;
	}
	
	/* 버튼 타입이라 밑에 그림자 지는게 맘에 안듬 */
	input#search_button {
		display: inline;
	    width: 54px;
	    height: 38px;
	    line-height: 38px;
	    background: skyblue;
	    border-radius: 3px;
	    font-size: 14px;
	    font-weight: bold;
	    color: gray;
	    text-align: center;
	    padding: 0;
	    cursor: pointer;
	    border: none;
	}
	
	p.search_button {
		display: inline;
	    width: 54px;
	    height: 38px;
	    line-height: 38px;
	}
	

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
            	<li><h3>관련 콘텐츠</h3></li>
                <li><a href="<%= request.getContextPath()%>/infoEdit.sd">· 회원정보수정</a></li>
                <li><a href="<%= request.getContextPath()%>/askList.sd">· 문의내역</a></li>
                <li><a href="<%= request.getContextPath()%>/myHealth.sd">· 내 건강</a></li>
                <li><a href="<%= request.getContextPath()%>/bookMark.sd">· 병원 즐겨찾기</a></li>
                <li><a href="<%= request.getContextPath()%>/reservation.sd">· 예약확인</a></li>
                <li><a href="<%= request.getContextPath()%>/viewHistory.sd">· 최근 진료이력조회</a></li>
            </ul>
            <ul style="display:inline-block; margin-top: 20px; margin-left: 50px;">
            	<li><h3>자주 찾는 서비스</h3></li>
                <li><a>FAQ</a>&nbsp;&nbsp;&nbsp;<a>병원찾기</a></li>
                <li><a>내 건강</a></li>
            </ul>
        </div>
        
        <div id="contents">
        <h1><strong>문의내역</strong></h1>
        <div>총 문의내역: <span style="color: skyblue;">1</span></div>
        <div>
        	<form name="seachFrm">
				<div id="search_header">
					<div id="search_bar">
						<div id="search_bar_right">
	
							<input id="searchWord" name="searchWord" type="text" placeholder="검색어를 입력해 주세요." />
							<input id="search_button" onclick="goSearch();" type="button" value="검색" /> 
						</div>
					</div>
				</div>	
			</form>
        </div>
			<form name="noticeListFrm">
			<table style="margin-top: 30px;">
				<thead>
					 <tr>
					 	<th>글번호</th>
					 	<th>제목</th>
					 	<th>등록일</th>
					 	<th>처리과정</th>
					 </tr>
				</thead>
				
				<tbody>
					<tr>
					    <td class="notice_seq">1</td>
						<td class="noticeTitle">문의합니다</td>
						<td>2020-07-29</td>
						<td style="color: skyblue;">답변완료</td>
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