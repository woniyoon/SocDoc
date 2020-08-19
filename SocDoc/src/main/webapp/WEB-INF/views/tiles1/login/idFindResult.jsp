<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>속닥 아이디 찾기 결과</title>

<style type="text/css">

/* 	body {
		font-family: Arial, "MS Trebuchet", sans-serif;
		width: 1100px;
		margin: 0 auto;
	} */
   
	form {
		width: 100%;
	}

	.container { 
		width: 35%;
		height: 150%;
		margin: 100px auto 200px auto;
		padding: 0;
		border: solid 0px red;
	}
   	
   	.bowl {
   		//border: solid 1px #ccc;
   	}
   	
	/* -------------------------------- 上 ---------------------------------- */
	
    .textPrimary {
		margin-bottom: 5px;
		color: #585858;	
	}
	
	.description {
		margin-top: 10px;
		font-size: 9pt;
	} 
	
	/* -------------------------------- 아이디 확인 테이블 ---------------------------------- */
	   
   	table {
	    width: 100%;
	    margin: 40px auto;
	    border-collapse: collapse;
	}
	
	thead {
		background-color: #F8F8F8;
	}
	
	th {
		padding: 17px 3px;
	    font-size: 14px;
	    font-weight: bold;
	    color: #222222;
	    text-align: center;
	    border-top: 1px solid #333333;
	    border-bottom: 1px solid #333333;
	}
	
	td {
	    padding: 17px 0;
	    text-align: center;
	    font-size: 14px;
	    line-height: 1.8;
	    color: #666666;
	    border-bottom: 1px solid #dddddd;
	}
	
	/* -------------------------------- 하단 버튼 ---------------------------------- */
	
	.btnJoin {
   		margin-top: 50px;
   		text-align: center;		
	}
    
	#btnLogin {
	    width: 200px;
	    height: 60px;
	    font-size: 20px;
	    font-weight: bold;
	    color: #fff;
	    background-color: #157bb9;
	    border: solid 1px #ccc;
	}
   
	#btnFind {
	    width: 200px;
	    height: 60px;
	    font-size: 20px;
	    font-weight: bold;
	    color: black;
	    background-color: #fff;
	    border: solid 1px #ccc;
	}
    
	a {
		text-decoration: none;
    }
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<script type="text/javascript">
</script>



</head>

<div class="container">
   
	<div class="bowl">
	
   		<!-- -------------------------------- 上 ---------------------------------- -->
		<h2 class="textPrimary">아이디 찾기</h2>   
		<hr>
	    <div class="description"> 아이디 조회 결과 입력하신 정보와 일치하는 아이디는 아래와 같습니다. </div> 
	    
		<!-- -------------------------------- 내용물 ---------------------------------- --> 		    
		<form name="findFrm">
			<div id="box">
				<table>
					<thead>
				      	<tr>
				      		<td>구분</td>
				      		<td>아이디</td>
				      		<td>가입일</td>
				      	</tr>
		      		</thead>
		      		
		      		<tbody>
			      		<tr>
				      		<c:if test="${check == 1}">
				      			<td>일반회원</td>
				      			<td>${userid}</td>
				      			<td>${registerDate}</td>
			      			</c:if>
							<c:if test="${check == 2}">
				      			<td>병원회원</td>
				      			<td>${userid}</td>
				      			<td>${registerDate}</td>
			      			</c:if>
			      		</tr>
					</tbody>
				</table>
			     
	    		<!-- -------------------------------- 하단 버튼 ---------------------------------- -->  
				<div class="btnJoin">
					<input type="button" id="btnLogin" value="로그인" onClick="location.href='<%=ctxPath%>/login.sd'"  />
					<input type="button" id="btnFind" value="비밀번호 찾기" onClick="location.href='<%=ctxPath%>/pwdFind.sd'" style="color: #ccc;"/>
				</div> 
			</div>	    
		</form>
	</div>
</div>