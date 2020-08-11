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
    
    .requiredInfo {
		width: 100%;
		height: 35px;
		padding-left: 10px;
		box-sizing: border-box;
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
	
	// 개인회원가입 버튼을 눌렀을 때
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

	
	
	// ------------ 이름 ------------ // 
	
	$("span#nameError").hide();

	$("#name").blur(function(){
	
		if($("input#name").val().trim() == "") {	// 데이터가 없다면
			$("span#nameError").show();
			$("input#name").addClass("wrong");
			
		} else {	// 데이터가 있다면
			// 정규표현식
	        var regExp = /^[가-힣]{2,4}$/;	//  2~4글자 한글만 
	        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
			
	        if(!bool) {  // 데이터가 조건에 맞지않으면
				$("span#nameError").show();
				$("input#name").addClass("wrong");
				
				return;
			} else {	// 데이터가 조건에 맞다면
				$("input#name").removeClass("wrong");
			}
			$("span#nameError").hide();
			$(":input").prop("disabled",false).removeClass("wrong"); 
			
			return;
		}
	});
	
	
	
	// ------------ 아이디 ------------ // 
	
	$("span#useridError").hide();
	$("span#useridSuccess").hide();

	$("#userid").blur(function(){
	
		if($("input#userid").val().trim() == "") {	// 데이터가 없다면
			$("span#useridSuccess").hide();
			$("span#useridError").show();
			$("input#userid").addClass("wrong"); 
			
		} else {	// 데이터가 있다면
			// 정규표현식
	        var regExp = /^[A-Za-z0-9]{5,10}$/;	// 5자 이상 10글자 이하의 영문과 숫자를 조합
	        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
			
	        console.log($("input#userid").val());
	        
			if(!bool) {  // 데이터가 조건에 맞지않으면
				$("span#useridSuccess").hide();
				$("span#useridError").html("영문,숫자 조합으로 5~10자리만 입력 가능합니다.").show();
				$("input#userid").addClass("wrong");  
				
				return;
			} else {	// 데이터가 조건에 맞다면
				$("span#useridSuccess").show();
				$("input#userid").removeClass("wrong");
			}
	        

			$("span#useridError").hide();
			$(":input").prop("disabled",false).removeClass("wrong"); 
			
			return;
		}
		
	});
	
	
	
	
	
	// ------------ 이메일 ------------ // 
	
	$("span#emailError").hide();

	$("#email").blur(function(){
		
		if($("input#email").val().trim() == "") {	// 데이터가 없다면
			$("span#emailError").show();
			$("input#email").addClass("wrong");
			
		} else {	// 데이터가 있다면
			// 정규표현식
			var email = $("#email").val();
			var regExp_EMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			var bool = regExp_EMAIL.test(email); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
			
			if(!bool) {  // 데이터가 조건에 맞지않으면
				$("span#emailError").html("이메일 형식에 맞게 입력해주세요.").show();
				$("input#email").addClass("wrong");  
				
				return;
			} else {	// 데이터가 조건에 맞다면
				$("input#email").removeClass("wrong");
			}

			$("span#emailError").hide();
			$(":input").prop("disabled",false).removeClass("wrong"); 
			
			return;
		}
	}); 
	
	
	
	
	
	
	/////////////////////////////////////
	
	
	
	
	// ------------ 이름 ------------ // 
	
	$("span#hpNameError").hide();

	$("#hpName").blur(function(){
	
		if($("input#hpName").val().trim() == "") {	// 데이터가 없다면
			$("span#hpNameError").show();
			$("input#hpName").addClass("wrong");
			
		} else {	// 데이터가 있다면
			// 정규표현식
	        var regExp = /^[가-힣]{2,4}$/;	//  2~4글자 한글만 
	        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
			
	        if(!bool) {  // 데이터가 조건에 맞지않으면
				$("span#hpNameError").show();
				$("input#hpName").addClass("wrong");
				
				return;
			} else {	// 데이터가 조건에 맞다면
				$("input#hpName").removeClass("wrong");
			}
			$("span#hpNameError").hide();
			$(":input").prop("disabled",false).removeClass("wrong"); 
			
			return;
		}
	});
	
	
	
	// ------------ 아이디 ------------ // 
	
	$("span#hpUseridError").hide();
	$("span#hpUseridSuccess").hide();

	$("#userid").blur(function(){
	
		if($("input#hpUserid").val().trim() == "") {	// 데이터가 없다면
			$("span#hpUseridSuccess").hide();
			$("span#hpUseridError").show();
			$("input#hpUserid").addClass("wrong"); 
			
		} else {	// 데이터가 있다면
			// 정규표현식
	        var regExp = /^[A-Za-z0-9]{5,10}$/;	// 5자 이상 10글자 이하의 영문과 숫자를 조합
	        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
			
	        console.log($("input#hpUserid").val());
	        
			if(!bool) {  // 데이터가 조건에 맞지않으면
				$("span#hpUseridSuccess").hide();
				$("span#hpUseridError").html("영문,숫자 조합으로 5~10자리만 입력 가능합니다.").show();
				$("input#hpUserid").addClass("wrong");  
				
				return;
			} else {	// 데이터가 조건에 맞다면
				$("span#hpUseridSuccess").show();
				$("input#hpUserid").removeClass("wrong");
			}
	        

			$("span#useridError").hide();
			$(":input").prop("disabled",false).removeClass("wrong"); 
			
			return;
		}
		
	});
	
	
	
	
	
	// ------------ 이메일 ------------ // 
	
	$("span#hpEmailError").hide();

	$("#hpEmail").blur(function(){
		
		if($("input#hpEmail").val().trim() == "") {	// 데이터가 없다면
			$("span#hpEmailError").show();
			$("input#hpEmail").addClass("wrong");
			
		} else {	// 데이터가 있다면
			// 정규표현식
			var email = $("#hpEmail").val();
			var regExp_EMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			var bool = regExp_EMAIL.test(email); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
			
			if(!bool) {  // 데이터가 조건에 맞지않으면
				$("span#hpEmailError").html("이메일 형식에 맞게 입력해주세요.").show();
				$("input#hpEmail").addClass("wrong");  
				
				return;
			} else {	// 데이터가 조건에 맞다면
				$("input#hpEmail").removeClass("wrong");
			}

			$("span#hpEmailError").hide();
			$(":input").prop("disabled",false).removeClass("wrong"); 
			
			return;
		}
	}); 	
});	
</script>

</head>
<div class="container">
   
	<h2 class="textPrimary">비밀번호 찾기</h2>
   	
   	<div class="bowl">
		<div id="tab" align="center">	
			<a href="#" class="buttonOn" id="memTab" role="button" title="개인회원 로그인">개인회원</a>
	        <a href="#" class="buttonOff" id="hpMemTab" role="button" title="병원관계자 로그인">병원회원</a>
		</div>
		
		<!-- -------------------------------- 上 끝 ---------------------------------- --> 
		
		<form name="findFrm">
	    <div id="box">
	    
			<div class="individualMember"> 
				<div class="formGroup">
					<label for="name">이름</label>
		         	<input type="text" name="name" id="name" class="requiredInfo" autofocus /> 
		        	 <span class="error" id="useridError">이름을 입력하세요.</span>
				 
					 <label for="userid">아이디</label>
			         <input type="text" name="userid" id="userid" class="requiredInfo" autofocus placeholder="5자 이상으로 입력하세요" />
			         <span class="error" id="useridError">아이디를 입력하세요.</span>
			         
			         <label for="email">이메일</label>
			         <input type="text" name="email" id="email" class="requiredInfo" placeholder="E-mail을 입력하세요" /> 
			         <span class="error" id="emailError">이메일 형식에 맞지 않습니다.</span>
			
			         <label for="code">인증번호</label>
			         <input type="text" id="code" name="code" class="requiredInfo" placeholder="인증번호를 입력하세요" />
			         <span class="error" id="codeError">인증번호를 입력하세요.</span>
				</div>
			</div>
			
		<!-- -------------------------------- 일반고객 비번찾기 끝 ---------------------------------- -->  
		
			<div class="hospitalMember"> 
				<div class="formGroup">
					<label for="hpName">담당자 이름</label>
		         	<input type="text" name="hpName" id="hpName" class="requiredInfo" autofocus /> 
		         	<span class="error" id="hpNameError">이름을 입력하세요.</span>
		      	 
			      	<label for="hpUserid">아이디</label>
			        <input type="text" name="hpUserid" id="hpUserid" class="requiredInfo" autofocus placeholder="5자 이상으로 입력하세요" />
			        <span class="error" id="hpUseridError">아이디를 입력하세요.</span>
			
			        <label for="hpEmail">이메일</label>
			        <input type="text" name="hpEmail" id="hpEmail" class="requiredInfo" placeholder="E-mail을 입력하세요" /> 
			        <span class="error" id="hpEmailError">이메일 형식에 맞지 않습니다.</span>
			         
			        <label for="hpCode">인증번호</label>
			        <input type="text" id="hpCode" name="hpCode" class="requiredInfo" placeholder="인증번호를 입력하세요" />
			        <span class="error" id="hpCodeError">인증번호를 입력하세요.</span>
				</div>
			</div>	 
			
		 <!-- -------------------------------- 병원고객 비번찾기 끝 ---------------------------------- --> 
		 
			<div class="btnJoin">
				<input type="button" id="btnFind" value="인증확인" onClick="goRegister();" />
			</div> 
			
	    </div>
	</form>
	</div>
</div>    