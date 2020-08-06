<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>속닥 로그인</title>

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
   		border: solid 1px #ccc;
   	}
   
	#box {
		width: 60%;
		margin: 50px auto;
		padding: 0;
		//border: solid 1px blue;
	}
   
	/* 탭(개인회원/병원회원) */
	#tab {
		display: flex;
		flex-direction: row;
	}
   
	/* 버튼 클릭 안됐을 때 */
	.buttonOff {
		flex:1;
    	padding: 15px 0;
   		font-size: 14pt;
   		font-weight: bold;
   		background-color: white;
   		color: #ccc;
   		border: solid 1px #f4f4f1;
   		border-bottom: solid 2px #58ACFA;
	}
	
 	/* 버튼 클릭 됐을 때 */
	.buttonOn {
		flex:1;
	    padding: 15px 0;
    	font-size: 14pt;
    	font-weight: bold;
    	background-color: #58ACFA;
    	color: #fff;	
    	border: solid 0px black;
	} 
   
	/* -------------------------------- 上 끝 ---------------------------------- */
   
	/* 아디비번 입력 */
	.formGroup {   
		padding-top: 5px;
		box-sizing: border-box;
	}
   
	.formControl {
		float:left;
		width: 70%;
		height: 35px;
		padding-left: 10px;
	}

	#btnLogin {
		display: inline-block;
		width: 30%;
		height: 72px;
		padding: 0 10px;
		background-color: #58ACFA;
		border: solid 1px #ccc;
		color: white;
		font-weight: bold; 
	}
   
	#bottomBtn > ul li {
		display: inline-block;
		padding-right: 10px;
		margin-top: 15px;
	}
	
	a {
		text-decoration: none;
	}
    
	.bottom {
		list-style: none;
		padding-left: 0;
	}
    
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(window).ready(function(){
		
		// 개인회원가입 버튼을 눌렀을 때
		$("#memTab").click(function(){
			
			// 탭 색깔 바꾸기
			$("#tab > a").removeClass();
		    $(this).addClass("buttonOn");
		    $("#hpMemTab").addClass("buttonOff");
		    
			$(".individualMember").show();
			$(".hospitalMember").hide();
			
		});	
		$("#memTab").trigger("click");
		
		// 병원회원가입 버튼을 눌렀을 때
		$("#hpMemTab").click(function(){
			
			// 탭 색깔 바꾸기
			$("#tab > a").removeClass();
		    $(this).addClass("buttonOn");
		    $("#memTab").addClass("buttonOff");
		    
			$(".hospitalMember").show();
			$(".individualMember").hide();
		});	
	});	
</script>	
	
	
<script type="text/javascript">

	$(document).ready(function(){
		$("#btnLogin").click(function(){
	         goLogin(); // 로그인 시도한다.
		});
	      
		$("#pwd").keydown(function(event){
	         if(event.keyCode == 13) { // 암호입력란에 엔터를 했을 경우 
	            goLogin(); // 로그인 시도한다.
			} 
		});
		
		var userid = localStorage.getItem('saveid');
			if(userid != null){
				$("#userid").val(userid);
	    	  	$("input:checkbox[id=saveid]").prop("checked",true);
		}
	});	
	
	/* === 로그인 처리 함수 === */
	function goLogin() {
   
		var userid = $("#userid").val().trim();
		var pwd = $("#pwd").val().trim();
      
		if(userid == "") {
			alert("아이디를 입력하세요");
			$("#userid").val("");
			$("#userid").focus();
			return; 
      	}
      
      	if(pwd == "") {
        	alert("비밀번호를 입력하세요");
        	$("#pwd").val("");
         	$("#pwd").focus();
         	return;  
      	}
		
		// === 로컬 스토리지(localStorage)에 userid 값 저장시키기 === //
	  	if($("input:checkbox[id=saveid]").prop("checked")){
	  		alert("아이디 저장을 클릭하셨네요");
  		   	localStorage.setItem('saveid', $("#userid").val());
  	   	} else {
  	   		alert("아이디 저장을 해제하셨네요");
			localStorage.removeItem('saveid');
  	   	}
      	var frm = document.loginFrm;  
      	
      	frm.action = "<%=ctxPath%>/loginEnd.sd";
      	frm.method = "POST";
      	frm.submit();
	}
	
<%--
 	/* === 로그아웃 처리 함수 === */	
	function goLogOut() {
		location.href="<%= request.getContextPath()%>/login/logout.sd";
	}
--%>

</script>



</head>
<div class="container">
  
	<h2 class="textPrimary">로그인</h2>
   
	<div class="bowl">	
		<div id="tab" align="center">	
	        <a href="#" class="buttonOn" id="memTab" role="button" title="개인회원 로그인">개인회원</a>
	        <a href="#" class="buttonOff" id="hpMemTab" role="button" title="병원관계자 로그인">병원회원</a>
		</div>   
		   
		<!-- -------------------------------- 上 끝 ---------------------------------- --> 
	   
		<form name="loginFrm">
			<div id="box">
				<div class="checkbox">
					<label for="saveid"><input type="checkbox" id="saveid" name="saveid" />아이디저장</label>
				</div>
		         
				<div class="formGroup">
		            <div class="input">
						<input type="text" class="formControl" name="userid" id="userid" value="" placeholder="아이디" /> 
					</div>
		             
		            <div class="input">
						<input type="password" class="formControl" name="pwd" id="pwd" value="" placeholder="비밀번호"/> 
		            </div>
		
			        <div class="btnJoin">
						<input type="button" id="btnLogin" value="로그인" onClick="goRegister();" /> 
			        </div>
				</div>
		         
				<div id="bottomBtn">
					<ul id="input" class="bottom" style="width: 100%; font-size: 8pt;">
						<li><a href="/socdoc/register.sd" class="bottom btnJoin" style="font-weight: bold;">회원가입</a></li>
						<li>|</li>
						<li><a href="/socdoc/idFind.sd" class="bottom btnSearchId">아이디 찾기</a></li>
						<li>|</li>
						<li><a href="/socdoc/pwdFind.sd" class="bottom btnSearchPasswd">비밀번호 찾기</a></li>
					</ul>
				</div>
			</div>
		</form>
	</div>
</div>
