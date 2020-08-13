<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	
	.title {
		background-color: #F8F8F8;
	}

    .requiredInfo {
		width: 100%;
		height: 35px;
		padding-left: 10px;
		box-sizing: border-box;
		border: solid 1px #ddd;
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
	
	$("span#pwdError").hide();
	$("span#pwdSuccess").hide();

	$("#pwd").blur(function(){
	
		if($("input#pwd").val().trim() == "") {	// 데이터가 없다면
			$("span#pwdSuccess").hide();
			$("span#pwdError").show();
			$("input#pwd").addClass("wrong");
			
		} else {	// 데이터가 있다면
			// 정규표현식
	        var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;	//  8~15자리 이하의 숫자,문자,특수문자 조합 
	        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
			
			if(!bool) {  // 데이터가 조건에 맞지않으면
				$("span#pwdSuccess").hide();
				$("span#pwdError").html("숫자,문자,특수문자 조합으로 8~15자리만 입력 가능합니다.").show();
				$("input#pwd").addClass("wrong");  
				
				return;
			} else {	// 데이터가 조건에 맞다면
				$("span#pwdSuccess").show();
				$("input#pwd").removeClass("wrong");
			}

			$("span#pwdError").hide();
			$(":input").prop("disabled",false).removeClass("wrong"); 
			
			return;
		}
	});

	
	
	// ------------ 비밀번호 확인 ------------ // 
	
	$("span#pwdError2").hide();
	$("span#pwdSuccess2").hide();

	$("#pwd2").blur(function(){
	
		if($("input#pwd2").val().trim() == "") {	// 데이터가 없다면
			$("span#pwdSuccess2").hide();
			$("span#pwdError2").show();
			$("input#pwd2").addClass("wrong");
			
		} else {	// 데이터가 있다면
			var pwd = $("#pwd").val();
	        var pwd2 = $(this).val();
			
	        if(pwd != pwd2) {  // 데이터가 조건에 맞지않으면
				$("span#pwdSuccess2").hide();
				$("span#pwdError2").html("비밀번호가 맞지 않습니다.").show();
				$("input#pwd2").addClass("wrong");  
				
				return;
			} else {	// 데이터가 조건에 맞다면
				$("span#pwdSuccess2").show();
				$("input#pwd2").removeClass("wrong");
			}

			$("span#pwdError2").hide();
			$(":input").prop("disabled",false).removeClass("wrong"); 
			
			return;
		}
	});
});		
</script>



</head>

<div class="container">
   
   <h2 class="textPrimary">새 비밀번호 설정</h2>
   
   <!-- -------------------------------- 上 끝 ---------------------------------- -->

<!--     
   <form name="findFrm">
    
   	 <div id="box">
   	 	
     	 <table>
	      	<tr>
	      		<td class=title>비밀번호</td>
	      		<td class="password1">   
                     <input type="password" name="pwd" id="pwd" class="requiredInfo" placeholder="대소문자, 특수문자 조합하여 8자 이상으로 입력하세요" />               
                     <span class="error" id="passwordError">비밀번호를 입력 하세요.</span>                          
                </td>
	      	</tr>
	      	<tr>	
	      		<td class=title>비밀번호 확인</td>
	      		<td class="password2">
                     <input type="password" name="pwdChk" id="pwdChk" class="requiredInfo" />
                     <span class="error" id="passwordChkError">동일한 비밀번호를 입력해주세요.</span>
                 </td>
	      	</tr>
	      
	      </table>
      
	 </div>	 
	 --> 
	 
	 
	 <div class="bowl">
		<form name="registerFrm">
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
		  
				<div class="btnJoin">
					<input type="button" id="btnFind" value="변경" onClick="goRegister();" />
				</div> 
			</div>       
		</form>
	</div>
</div>    