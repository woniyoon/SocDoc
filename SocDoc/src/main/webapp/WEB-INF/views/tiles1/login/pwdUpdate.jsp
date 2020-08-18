<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>속닥 비밀번호 찾기</title>

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
   
	/* -------------------------------- 上 끝 ---------------------------------- */
   
   	.description {
		margin-top: 10px;
		font-size: 7pt;
	}
   
	h2 {
		margin: 0;
	    padding: 15px 0 15px 15px;
    	font-size: 14pt;
    	font-weight: bold;
    	color: #fff;	
		background-color: #58ACFA;
    	border: solid 0px black;
	} 
   
	/* 입력 */
	.formGroup {
		margin: 0 auto;
		padding-bottom: 20px;
    }
    
    label {
		display: block;
		padding: 5px 0;
		margin-top: 10px;
    }
    
    .input {
		padding: 0px;
    }
    
    span {
		display: block;
		padding: 5px 0 10px 15px;
		font-size: 8pt;
		color: red;
    }
	
	.textPrimary {
		margin-bottom: 5px;
		color: #ffffff;
	}
	
	.title {
		background-color: #F8F8F8;
	}

    .requiredInfo {
		width: 100%;
		height: 35px;
		padding-left: 10px;
		box-sizing: border-box;
		border: solid 1px #ccc;
     }
     
    .btnJoin {
    	width: 100%;
    	margin: 20px auto;
    	text-align: center;
   	}
   	
	#btnFind {
	    width: 200px;
	    height: 60px;
	    font-size: 20px;
	    font-weight: bold;
	    color: #fff;
	    background-color: #58ACFA;
	    border: solid 1px #ccc;
	}
    
    a {
      text-decoration: none;
    }
    
	/* 입력 - 비활성화 */
	.wrong {
		border: solid 1px red;
	}	
	
	.success {
		color: blue;
	}
   	
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	// ------------ 비밀번호 ------------ // 
/* 	$("form[name=hpChangePwdFrm]").hide();
	$("form[name=changePwdFrm]").show(); */
	
	$("form[name=changePwdFrm] span#pwdError").hide();
	$("form[name=changePwdFrm] span#pwdSuccess").hide();

	$("form[name=changePwdFrm] #pwd").keyup(function(){
		if($("form[name=changePwdFrm] input#pwd").val().trim() == "") {	// 데이터가 없다면
			$("form[name=changePwdFrm] span#pwdSuccess").hide();
			$("form[name=changePwdFrm] span#pwdError").show();
			$("form[name=changePwdFrm] input#pwd").addClass("wrong");
		} else {	// 데이터가 있다면
			// 정규표현식
	        var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;	//  8~15자리 이하의 숫자,문자,특수문자 조합 
	        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
			
			if(!bool) {  // 데이터가 조건에 맞지않으면
				$("form[name=changePwdFrm] span#pwdSuccess").hide();
				$("form[name=changePwdFrm] span#pwdError").html("숫자,문자,특수문자 조합으로 8~15자리만 입력 가능합니다.").show();
				$("form[name=changePwdFrm] input#pwd").addClass("wrong");  
				return;
			} else {	// 데이터가 조건에 맞다면
				$("form[name=changePwdFrm] span#pwdSuccess").show();
				$("form[name=changePwdFrm] input#pwd").removeClass("wrong");
			}
			$("form[name=changePwdFrm] span#pwdError").hide();
			$(":input").prop("disabled",false).removeClass("wrong"); 
			return;
		}
	});

	
	
	// ------------ 비밀번호 확인 ------------ // 
	$("form[name=changePwdFrm] span#pwdError2").hide();
	$("form[name=changePwdFrm] span#pwdSuccess2").hide();

	$("form[name=changePwdFrm] #pwd2").keyup(function(){
		if($("form[name=changePwdFrm] input#pwd2").val().trim() == "") {	// 데이터가 없다면
			$("form[name=changePwdFrm] span#pwdSuccess2").hide();
			$("form[name=changePwdFrm] span#pwdError2").show();
			$("form[name=changePwdFrm] input#pwd2").addClass("wrong");
		} else {	// 데이터가 있다면
			var pwd = $("form[name=changePwdFrm] #pwd2").val();
	        var pwd2 = $(this).val();
	        
	        if(pwd != pwd2) {  // 데이터가 조건에 맞지않으면
				$("form[name=changePwdFrm] span#pwdSuccess2").hide();
				$("form[name=changePwdFrm] span#pwdError2").html("비밀번호가 맞지 않습니다.").show();
				$("form[name=changePwdFrm] input#pwd2").addClass("wrong");  
				return;
			} else {	// 데이터가 조건에 맞다면
				$("form[name=changePwdFrm] span#pwdSuccess2").show();
				$("form[name=changePwdFrm] input#pwd2").removeClass("wrong");
			}
			$("form[name=changePwdFrm] span#pwdError2").hide();
			$(":input").prop("disabled",false).removeClass("wrong"); 
			return;
		}
	});
});	
	
	
	
$(document).ready(function(){	
	
	// ------------ 비밀번호 ------------ // 
	/* $("form[name=changePwdFrm]").hide();
	$("form[name=hpChangePwdFrm]").show(); */
	
	$("form[name=hpChangePwdFrm] span#pwdError").hide();
	$("form[name=hpChangePwdFrm] span#pwdSuccess").hide();

	$("form[name=hpChangePwdFrm] #pwd").keyup(function(){
		if($("form[name=hpChangePwdFrm] input#pwd").val().trim() == "") {	// 데이터가 없다면
			$("form[name=hpChangePwdFrm] span#pwdSuccess").hide();
			$("form[name=hpChangePwdFrm] span#pwdError").show();
			$("form[name=hpChangePwdFrm] input#pwd").addClass("wrong");
		} else {	// 데이터가 있다면
			// 정규표현식
	        var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;	//  8~15자리 이하의 숫자,문자,특수문자 조합 
	        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
			
			if(!bool) {  // 데이터가 조건에 맞지않으면
				$("form[name=hpChangePwdFrm] span#pwdSuccess").hide();
				$("form[name=hpChangePwdFrm] span#pwdError").html("숫자,문자,특수문자 조합으로 8~15자리만 입력 가능합니다.").show();
				$("form[name=hpChangePwdFrm] input#pwd").addClass("wrong");  
				return;
			} else {	// 데이터가 조건에 맞다면
				$("form[name=hpChangePwdFrm] span#pwdSuccess").show();
				$("form[name=hpChangePwdFrm] input#pwd").removeClass("wrong");
			}
			$("form[name=hpChangePwdFrm] span#pwdError").hide();
			$(":input").prop("disabled",false).removeClass("wrong"); 
			return;
		}
	});

	
	
	// ------------ 비밀번호 확인 ------------ // 
	
	$("form[name=hpChangePwdFrm] span#pwdError2").hide();
	$("form[name=hpChangePwdFrm] span#pwdSuccess2").hide();

	$("form[name=hpChangePwdFrm] #pwd2").keyup(function(){
		if($("form[name=hpChangePwdFrm] input#pwd2").val().trim() == "") {	// 데이터가 없다면
			$("form[name=hpChangePwdFrm] span#pwdSuccess2").hide();
			$("form[name=hpChangePwdFrm] span#pwdError2").show();
			$("form[name=hpChangePwdFrm] input#pwd2").addClass("wrong");
			
		} else {	// 데이터가 있다면
			var pwd = $("form[name=hpChangePwdFrm] #pwd").val();
	        var pwd2 = $(this).val();
	        
	        if(pwd != pwd2) {  // 데이터가 조건에 맞지않으면
				$("form[name=hpChangePwdFrm] span#pwdSuccess2").hide();
				$("form[name=hpChangePwdFrm] span#pwdError2").html("비밀번호가 맞지 않습니다.").show();
				$("form[name=hpChangePwdFrm] input#pwd2").addClass("wrong");  
				return;
			} else {	// 데이터가 조건에 맞다면
				$("form[name=hpChangePwdFrm] span#pwdSuccess2").show();
				$("form[name=hpChangePwdFrm] input#pwd2").removeClass("wrong");
			}
			$("form[name=hpChangePwdFrm] span#pwdError2").hide();
			$(":input").prop("disabled",false).removeClass("wrong"); 
			return;
		}
	});
});		

function changePwd(){
	var form = document.changePwdFrm;
	form.action = "<%=ctxPath%>/changePwd.sd";
	form.submit();
}
function hpChangePwd(){
	var form = document.hpChangePwdFrm;
	form.action = "<%=ctxPath%>/hpChangePwd.sd";
	form.submit();
}
</script>



</head>

<div class="container">
   
	<div class="bowl">
		<h2 class="textPrimary">새 비밀번호 설정</h2>
   
   <!-- -------------------------------- 上 끝 ---------------------------------- -->
	 <c:if test="${type == 'mem'}">
		<form name="changePwdFrm" method="post">
	    	<div id="box">
				<div class="formGroup">
					<label for="pwd">비밀번호</label>
			        <input type="password" name="pwd" id="pwd" class="requiredInfo" autofocus placeholder="대소문자, 특수문자 조합하여 8자 이상으로 입력하세요" />
			        <span class="error" id="pwdError">비밀번호를 입력하세요.</span>
			        <span class="success" id="pwdSuccess">사용 가능한 비밀번호 입니다.</span> 
					
					<label for="pwd2">비밀번호 확인</label>
			        <input type="password" name="pwd2" id="pwd2" class="requiredInfo" placeholder="대소문자, 특수문자 조합하여 8자 이상으로 입력하세요" />
			        <span class="error" id="pwdError2">동일한 비밀번호를 입력하세요.</span>
			        <span class="success" id="pwdSuccess2">비밀번호가 일치합니다.</span> 
				</div>
		  			<input type="hidden" name="name" value="${name}">
		  			<input type="hidden" name="userid" value="${userid}">
		  			<input type="hidden" name="email" value="${email}">
				<div class="btnJoin">
					<input type="button" id="btnFind" value="변경" onClick="changePwd();" />
				</div> 
			</div>       
		</form>
	</c:if>
	
	<c:if test="${type == 'hpMem'}">	
		<form name="hpChangePwdFrm" method="post">
	    	<div id="box">
				<div class="formGroup">
					<label for="pwd">병원비밀번호</label>
			        <input type="password" name="pwd" id="pwd" class="requiredInfo" autofocus placeholder="대소문자, 특수문자 조합하여 8자 이상으로 입력하세요" />
			        <span class="error" id="pwdError">비밀번호를 입력하세요.</span>
			        <span class="success" id="pwdSuccess">사용 가능한 비밀번호 입니다.</span> 
					
					<label for="pwd2">비밀번호 확인</label>
			        <input type="password" name="pwd2" id="pwd2" class="requiredInfo" placeholder="대소문자, 특수문자 조합하여 8자 이상으로 입력하세요" />
			        <span class="error" id="pwdError2">동일한 비밀번호를 입력하세요.</span>
			        <span class="success" id="pwdSuccess2">비밀번호가 일치합니다.</span> 
				</div>
		  			<input type="hidden" name="name" value="${name}">
		  			<input type="hidden" name="userid" value="${userid}">
		  			<input type="hidden" name="email" value="${email}">
				<div class="btnJoin">
					<input type="button" id="btnFind" value="변경" onClick="hpChangePwd();" />
				</div> 
			</div>       
		</form>
	</c:if>
	
	</div>
</div>    