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
        /* border: 1px solid navy; */
        /* padding-left: 50px; */
    }

    #contents {
        flex: 4;
       /*  height: auto; */
       	margin: 0 30px;
		flex-direction: row;
        justify-content: space-around;
    }
    

    /*  main 끝  */
    footer {
        position: absolute;
        height: 5rem;
        width: 100vw;
        background-color: rgb(241, 241, 241);
    }
    
   /*  @media (max-width:1000px) {
		CSS 스타일 !
	
	} */
      
    /* 첫번째줄 셋팅- 예약확인 */
	div#box1 {
		width: 72%;
		/* margin: 0 auto; */
		height: 55px;
		margin-top: 20px;
		/* border: 1px solid gray; */
		text-align: center;
		margin-bottom: 30px;
	}
	
	/* 두번째줄 셋팅 */
	div#box2 {
		width: 70%;
		/* margin: 0 auto; */
		height: 150px;
		/* border: 2px solid gray;  */
		text-align: center;
	}
	
	/* 세번째줄 셋팅 */
	div#box3 {
		width: 70%;
		/* margin: 0 auto; */
		height: 230px;
		border: 2px solid gray; 
		text-align: center;
	}
	
	label {
		margin-bottom: 0;
	}
	
	/* 탭메뉴  */
	.tabmenu{ 
	  width: 100%; 
	  margin: 0 auto; 
	  position:relative; 
	  height: 55px;
	}
	.tabmenu ul li{
	  display:  inline-block;
	  width:48%; 
	  float:left;  
	  text-align:center; 
	  background: white;
	  line-height:40px;
	  border : 1px solid gray;
	}
	.tabmenu label{
	  display:block;
	  width:100%; 
	  height:55px;
	  line-height:50px;
	}
	.tabmenu input{display:none;}
	.tabCon{
	  display:none; 
	  text-align:left; 
	  padding: 20px;
	  position:absolute; 
	  left:0; top:40px; 
	  box-sizing: border-box; 
	  
	}
	.tabmenu input:checked ~ label{
	  background:skyblue;
	}
	.tabmenu input:checked ~ .tabCon{
	  display:block;
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
	
</style>


<script type="text/javascript">


<%-- var loginuser = "${sessionScope.loginuser}";
var gobackURL = "${requestScope.gobackURL}";

if(loginuser != null && (gobackURL != null && gobackURL != "")) {
	alert("${sessionScope.loginuser.name}님 로그인 성공했습니다.");
	location.href="<%= ctxPath%>/"+gobackURL;
}
else if(loginuser != null && (gobackURL == null || gobackURL == "")) {
	alert("${sessionScope.loginuser.name}님 로그인 성공했습니다.");
	location.href="<%= ctxPath%>/index.action";
} --%>


	$(document).ready(function(){
		
		$("#box2").hide();
		$("#box3").hide();
		
	});
	
	function changePWD() {
		
		$("#infoChange").hide();
		$("#box2").show();
		$("#box3").show();
		
	}
	
	function changeInfo() {
		
		$("#infoChange").show();
		$("#box2").hide();
		$("#box3").hide();
	}
	
	
	
	


	
</script>
</head>
<body>
   <%--  <header>
        <img id="logo" src="<%= ctxPath%>/resources/images/logo.jpg" width=80px height=80px />
        <ul class="headerMenu">
            <li><a>찾기</a></li>
            <li><a>예약</a></li>
            <li><a>후기</a></li>
            <li><a>알림소식</a></li>
        </ul>
    </header> --%>
    <main>
        <div id="sideMenu">
            <ul style="margin-left: 50px;">
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
		<h1 style="text-align: left;"><strong>회원정보수정</strong></h1>
		<div id="box1">
			<div class="tabmenu">
			  	<ul>
				    <li id="tab1" class="btnCon" onclick="changeInfo()"> <input type="radio" checked name="tabmenu"  id="tabmenu1">
				      <label for="tabmenu1">기본정보 변경</label>
				      <!-- <div class="tabCon" >내용</div> -->
				    </li>
				    <li id="tab2" class="btnCon" onclick="changePWD()"><input type="radio" name="tabmenu" id="tabmenu2">
				      <label for="tabmenu2">비밀번호 변경</label>
				      <!-- <div class="tabCon" >내용</div> -->
				    </li>    
			    </ul>
		    </div>
	    </div>
	    
	    <!-- 기본정보 변경 form시작 -->
	    <div id="infoChange">
		<form name="writeFrm" >
			<table class="type05" style="border-top: solid 1px black; margin: 0 auto;">
				<tbody>
				<tr>
			        <th scope="row">아이디 </th>
			        <td>
					    userid
					</td>
			    </tr>
			    <tr>
			        <th scope="row">성명 </th>
			        <td>
					      주혜정
					</td>
			    </tr>
			    <tr>
			        <th scope="row">성별 </th>
			        <td>
					    여
					</td>
		        </tr>
		        <tr>
			        <th scope="row">생년월일 </th>
			        <td>
			        	2020.01.01
					</td>
				</tr>	
				<tr>
					<th scope="row">나이</th> 
					<td>
					28 세
					</td>
				</tr>			
			    <tr>
			        <th scope="row">연락처</th>
			        <td>
						<select class="form-control-tel" id="sel1" name="hp1">
					      	<option>010</option>
					        <option>011</option>
					        <option>016</option>
					        <option>017</option>
					        <option>018</option>
					        <option>019</option>
					    </select> - <input class="form-control-tel" name="hp2" type="text" maxlength="4" /> - <input class="form-control-tel" name="hp3" type="text" maxlength="4" />
					</td>
			    </tr>
			    <tr>
			        <th scope="row">이메일</th>
			        <td>
						<input type="text" style="width: 100px; height: 20px;"/> @
						<select style="width: 180px; height: 25px;">
							<option>이메일 선택</option>
					      	<option>hanmail.net</option>
					        <option>naver.com</option>
					        <option>gmail.com</option>
					        <option>nate.com</option>
					        <option value="">직접입력</option>
					    </select><button type="button" style="margin-left:10px; background-color: skyblue; color:white; width: 40px; height: 25px; border-radius: 4px; border: none; font-size: 10pt;">인증</button>
					</td>
			    </tr>
			    </tbody>
			</table>
		  
	  </form>
	  </div>
   <!-- 기본정보 변경 form끝 -->
   
    <!-- 비밀번호 변경탭 시작-->
		<div id="box2" style="margin-top:15px;  border-left: none; border-right: none;">
			<img id="findPW" src="<%= ctxPath%>/resources/images/findPW.png" style="margin-top:10px;" width=50px height=60px/>
			<h2 style="margin: 0;">비밀번호 변경</h2>
			<p style="margin-top: 10px;">주혜정 회원님의 소중한 개인정보의 보호를 위하여 비밀번호를 한번 더 입력하여 주시기 바랍니다.</p>
		</div> 
		<div id="box3" style="margin-top:35px;  border-left: none; border-right: none;">
			<span style="font-size: 15pt;">현재 비밀번호<input type="password" style="margin-left: 30px; margin-top: 25px; width: 300px; height: 40px;"/></span><br/>
			<span style="font-size: 15pt;">현재 비밀번호<input type="password" style="margin-left: 30px; margin-top: 20px; width: 300px; height: 40px;"/></span><br/>
			<span style="font-size: 15pt;">현재 비밀번호<input type="password" style="margin-left: 30px; margin-top: 20px; width: 300px; height: 40px;"/></span><br/>
		</div>
	<!-- 비밀번호 변경탭 끝-->
	    
		<div style="text-align:right; margin-top: 30px; width: 70%;"><button type="button" style="background-color: skyblue; color:white; width: 50px; height: 30px; border-radius: 4px; border: none; font-size: 10pt;">저장</button></div>
        </div>
    </body>
 </html>