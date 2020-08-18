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
       /*  border: 1px solid pink; */
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

    #sideMenu {
        flex: 1;
        /* border: 1px solid navy; */
    }

    #contents {
        flex: 4;
       /*  height: auto; */
		flex-direction: row;
		margin: 0 30px;
        justify-content: space-around;
    }

   /*  #scheduleTbl, thead, tbody, td {
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
    footer {
        position: absolute;
        height: 5rem;
        width: 100vw;
        background-color: rgb(241, 241, 241);
    }
      
    /* 첫번째줄 셋팅- 예약확인 */
	div#box1 {
		/* width: 95.6%; */
		width: 75%;
		height: 200px;
		margin-top: 20px;
		padding-top: 20px;
		/* border: 1px solid gray; */
		text-align: center;
	}
	
	/* 두번째줄 셋팅 */
	div#box2 {
		width: 45%;
		margin-left: 210px;
		height: 150px;
		border: 2px solid gray; 
		text-align: center;
	}
	
	/* 세번째줄 셋팅 */
	div#box3 {
		width: 50%;
		margin-left: 140px; 
		height: 100px;
		border: 2px solid gray; 
		text-align: center;
	}
	
</style>

<script type="text/javascript">
 
     $(document).ready(function(){
    	 
    	 $("#ok").click(function() {
    		 func_Login();
    	 }); // end of $("#btnLOGIN").click();-----------------------
    	 
    	 $("#pwd").keydown(function(event){
  			
  			if(event.keyCode == 13) { // 엔터를 했을 경우
  				func_Login();
  			}
    	 }); // end of $("#pwd").keydown();-----------------------	
    	 
    }); // end of $(document).ready()---------------------------	 

    
    function func_Login() {
    		 
		 var pwd = $("#pwd").val(); 
		
		 if(pwd.trim()=="") {
			 alert("비밀번호를 입력하세요!!");
			 $("#pwd").val(""); 
			 $("#pwd").focus();
			 return;
		 }

		 var frm = document.infoLoginFrm;
		 
		 frm.action = "<%=ctxPath%>/infoEdit2.sd";
		 frm.method = "POST";
		 frm.submit();
		 
    } // end of function func_Login(event)-----------------------------
     
</script>
</head>
<body>
    <main>
        <div id="sideMenu">
            <ul style="margin-left: 50px;">
            	<li><h3 style="font-weight: bolder; color: #4e4e4b;">관련 콘텐츠</h3></li>
                <li><a style="color: #157bb9; font-weight: bolder;" href="<%= request.getContextPath()%>/infoEdit.sd">· 회원정보수정</a></li>
                <li><a href="<%= request.getContextPath()%>/askList.sd">· 문의내역</a></li>
                <li><a href="<%= request.getContextPath()%>/myHealth.sd">· 내 건강</a></li>
                <li><a href="<%= request.getContextPath()%>/bookMark.sd">· 병원 즐겨찾기</a></li>
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
		<h1 style="text-align: left;"><strong>회원정보수정</strong></h1>
		<div id="box1">
			<img id="findPW" src="<%= ctxPath%>/resources/images/findPW.png" />
			<h2>회원정보를 수정하시려면 비밀번호를 입력해 주세요.</h2>
			 <div><span style="color: skyblue;"></span> 회원님의 소중한 개인정보의 보호를 위하여 비밀번호를 한번 더 입력하여 주시기 바랍니다.</div>
		</div>
		<!-- <div id="box2" style="margin-top:10px;  border-left: none; border-right: none;">
			<span style="font-size: 15pt;">비밀번호<input type="password" style="margin-left: 30px; margin-top: 50px; width: 300px; height: 40px;"/></span>
		</div> -->
		<form name="infoLoginFrm">
		<div id="box3" style="margin-top:35px;  border-left: none; border-right: none;">
			<span style="font-size: 15pt;">비밀번호<input id="pwd" name="pwd" type="password" style="margin-left: 30px; margin-top: 25px; width: 300px; height: 40px;"/></span><br/>
		</div>
		</form>
		<div style="text-align: center; margin-top: 30px;"><button type="button" id="ok" style="background-color: #157bb9; color:white; width: 150px; height: 50px; margin-right:230px; border-radius: 4px; border: none; font-size: 14pt;">확인</button></div>
        </div>
    </main>
    <footer>
    </footer>
</body>
</html>