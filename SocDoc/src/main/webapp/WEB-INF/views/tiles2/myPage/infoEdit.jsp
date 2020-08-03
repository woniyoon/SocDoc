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
        border: 1px solid navy;
    }

    #contents {
        flex: 4;
       /*  height: auto; */
		flex-direction: row;
		margin: 0 30px;
        justify-content: space-around;
    }

    #scheduleTbl, thead, tbody, td {
        width: 50vw;
        border: 2px solid grey;
        border-collapse: collapse;
    }

    #reviewBoard, thead, tfoot {
        width: 50vw;
        border: 2px solid grey;
        border-collapse: collapse;
    }
    
    /*  main 끝  */
    footer {
        position: absolute;
        height: 5rem;
        width: 100vw;
        background-color: rgb(241, 241, 241);
    }
      
    /* 첫번째줄 셋팅- 예약확인 */
	div#box1 {
		width: 95.6%;
		height: 200px;
		margin-top: 20px;
		padding-top: 20px;
		/* border: 1px solid gray; */
		text-align: center;
	}
	
	/* 두번째줄 셋팅 */
	div#box2 {
		width: 75%;
		margin: 0 auto;
		height: 150px;
		border: 2px solid gray; 
		text-align: center;
	}
	
	
</style>
</head>
<body>
    <header>
        <img id="logo" src="<%= ctxPath%>/resources/images/logo.jpg" width=80px height=80px />
        <ul class="headerMenu">
            <li><a>찾기</a></li>
            <li><a>예약</a></li>
            <li><a>후기</a></li>
            <li><a>알림소식</a></li>
        </ul>
    </header>
    <main>
        <div id="sideMenu">
            <ul>
            	<li><h3>관련 콘텐츠</h3></li>
                <li><a>· 회원정보수정</a></li>
                <li><a>· 문의내역</a></li>
                <li><a>· 내 건강</a></li>
                <li><a>· 병원 즐겨찾기</a></li>
                <li><a>· 예약확인</a></li>
                <li><a>· 최근 진료이력조회</a></li>
            </ul>
            <ul style="display:inline-block; margin-top: 20px;">
            	<li><h3>자주 찾는 서비스</h3></li>
                <li><a>FAQ</a>&nbsp;&nbsp;&nbsp;<a>병원찾기</a></li>
                <li><a>내 건강</a></li>
            </ul>
        </div>
        <div id="contents">
		<h1 style="text-align: left;"><strong>회원정보수정</strong></h1>
		<div id="box1">
			<img id="findPW" src="<%= ctxPath%>/resources/images/findPW.png" />
			<h2>회원정보를 수정하시려면 비밀번호를 입력해 주세요.</h2>
			 <div><span style="color: skyblue;">주혜정</span> 회원님의 소중한 개인정보의 보호를 위하여 비밀번호를 한번 더 입력하여 주시기 바랍니다.</div>
		</div>
		<div id="box2" style="margin-top:10px;  border-left: none; border-right: none;">
			<span style="font-size: 15pt;">비밀번호<input type="password" style="margin-left: 30px; margin-top: 50px; width: 300px; height: 40px;"/></span>
		</div>
		<div style="text-align: center; margin-top: 30px;"><button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/infoEdit2'" style="background-color: skyblue; color:white; width: 150px; height: 50px; border-radius: 4px; border: none; font-size: 14pt;">확인</button></div>
        </div>
    </main>
    <footer>
    </footer>
</body>
</html>