<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>속닥 아이디 찾기</title>

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



</head>
<div class="container">
		
	<h2 class="textPrimary">아이디 찾기</h2>

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
				
				         <label for="email">이메일</label>
				         <input type="text" name="email" id="email" class="requiredInfo" placeholder="E-mail을 입력하세요" /> 
				         <span class="error" id="emailError">이메일 형식에 맞지 않습니다.</span>
				
				         <label for="code">인증번호</label>
				         <input type="text" id="code" name="code" class="requiredInfo" placeholder="인증번호를 입력하세요" />
				         <span class="error" id="phoneError">인증번호를 입력하세요.</span>
				     </div>
				  </div>
				  
		<!-- -------------------------------- 일반고객 아이디찾기 끝 ---------------------------------- --> 	
		 
			      <div class="hospitalMember"> 
				      <div class="formGroup">
				      	 <label for="businessNumber">사업자등록번호</label>
				         <input type="text" name="businessNumber" id="businessNumber" class="requiredInfo" autofocus placeholder="5자 이상으로 입력하세요" />
				         <span class="error" id="business-numberError">사업자등록번호를 입력 하세요.</span>
			
				         <label for="email">이메일</label>
				         <input type="text" name="email" id="email" class="requiredInfo" placeholder="E-mail을 입력하세요" /> 
				         <span class="error" id="emailError">이메일 형식에 맞지 않습니다.</span>
				
				         <label for="code">인증번호</label>
				         <input type="text" id="code" name="code" class="requiredInfo" placeholder="인증번호를 입력하세요" />
				         <span class="error" id="phoneError">인증번호를 입력하세요.</span>
				     </div>
				 </div>	 
		
		<!-- -------------------------------- 병원고객 아이디찾기 끝 ---------------------------------- --> 
			 
				 <div class="btnJoin">
			     	<input type="button" id="btnFind" value="인증확인" onClick="goRegister();" />
			     </div> 
			     
		    </div>
		</form>
	</div>
</div>    