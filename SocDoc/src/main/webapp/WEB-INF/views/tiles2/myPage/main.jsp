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
        height: auto;
        margin: 0 30px;
		flex-direction: row;
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
		margin-top: 20px;
		height: 150px;
		border: 1px solid gray;
	}
	
	/* 두번째줄 셋팅 */
	div#box2 {
		display: inline-block;
		width: 100%;
		margin-top: 18px;
		height: 300px;
	}
	
	/* 두번째줄 - 최근진료조회, 내건강 */
	div#box2-1, div#box2-2, div#box2-3 {
		width: 31%;
		height: 300px;
		border: 1px solid gray;
	}
</style>
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
		<h1 style="text-align: left;"><strong>마이페이지</strong></h1>
	<div id="box1">
		<h3>예약확인</h3>
		<div style="height:80%; text-align: center; margin-top: 25px;">
			조회 가능한 진료예약이 없습니다.
		</div>
	</div>
	<div id="box2">
		<div id="box2-1" style="float: left;">
			<h3>최근 진료이력조회</h3>
			<div style="height:80%; text-align: center; margin-top: 25px;">
				최근 1년간 수진이력이 존재하지 않습니다.
			</div>
		</div>
		<div id="box2-2" style="float: left; margin-left: 18px;">
			<h3>내 건강</h3>
			<div style="height:80%; text-align: center; margin-top: 25px;">
				조회 가능한 내 건강이 없습니다.
			</div>
		</div>
		<div id="box2-3" style="float:left; margin-left: 18px;">
			<h3>병원 즐겨찾기</h3>
			<div style="height:80%; text-align: center; margin-top: 25px;">
				즐겨찾기로 추가된 병원이 없습니다.
			</div>
		</div>
	</div>
	<div id="box2">
		<div id="box2-1" style="float: left;">
			<h3>회원정보수정</h3>
			<div style="height:80%; text-align: center; margin-top: 40px;">
				회원정보 수정을 원하시거나 비밀번호 변경을 원하실 경우 아래의 버튼을 클릭 해주세요.
				<div id="infoBnt" style="margin-top: 50px;">
					<button type="button" style="width:45%; height:40px; border-radius: 4px; background-color: gray; color: white;" >회원정보 수정</button>
					<button type="button" style="width:45%; height:40px; border-radius: 4px; background-color: gray; color: white;" >비밀번호 변경</button>
				</div>
			</div>
		</div>
		<div id="box2-2" style="float: left; margin-left: 18px;">
			<h3>문의내역</h3>
			<div style="height:80%; text-align: center; margin-top: 40px;">
				홈페이지 이용시 의견이 있으시면 문의해주세요.
				<div id="infoBnt" style="margin-top: 50px;">
					<button type="button" style="width:90%; height:40px; border-radius: 4px; background-color: gray; color: white;" >문의내역</button>
					<button type="button" style="width:90%; height:40px; margin-top:10px; border-radius: 4px; background-color: gray; color: white;" >의견접수</button>
				</div>
			</div>
		</div>
		<div id="box2-3" style="float:left; margin-left: 18px;">
			<h3>후기</h3>
			<div style="height:80%; text-align: center; margin-top: 25px;">
				등록된 후기가 없습니다.
			</div>
		</div>
	</div>
        </div>
    </main>
    <footer>
    </footer>
</body>
</html>