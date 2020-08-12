<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	String ctxPath = request.getContextPath();	%>
    
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
		width: 30%;
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
   		border-bottom: solid 1px #ccc;
   		//border-bottom: solid 2px #58ACFA;
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
	
	.textPrimary {
		margin-bottom: 5px;
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
   	
   	input[type=button] {
    	color: #fff;
    	background-color: #58ACFA;
	    border: solid 0px #ccc;
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
	var condition1 = false;
	var condition2 = false;
	var condition3 = false;
	$(document).ready(function(){
		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 이름
		$("span#nameError").hide();
	
		$("#name").keyup(function(){
		
			if($("input#name").val().trim() == "") {	// 데이터가 없다면
				$("span#nameError").show();
				$("#name").addClass("wrong");
			} else {	// 데이터가 있다면
				// 정규표현식
		        var regExp = /^[가-힣]{2,4}$/;	//  2~4글자 한글만 
		        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
				
		        if(!bool) {  // 데이터가 조건에 맞지않으면
					$("span#nameError").show();
					$("input#name").addClass("wrong");
					condition1 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					$("input#name").removeClass("wrong");
					condition1 = true;
				}
				$("span#nameError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		});
		
		
		//  ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 이메일
		$("form[name=idFindFrm] span#emailError").hide();
		$("form[name=idFindFrm] #btnChkNext").hide();
		$("form[name=idFindFrm] #email").keyup(function(){
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ).trim() ); // 한글 막기
			if($("form[name=idFindFrm] input#email").val().trim() == "") {	// 데이터가 없다면
				$("form[name=idFindFrm] span#emailError").show();
				$("form[name=idFindFrm] input#email").addClass("wrong");
			} else {	// 데이터가 있다면
				// 정규표현식
				var email = $("form[name=idFindFrm] #email").val();
				var regExp_EMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				var bool = regExp_EMAIL.test(email); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
				
				if(!bool) {  // 데이터가 조건에 맞지않으면
					$("form[name=idFindFrm] span#emailError").html("이메일 형식에 맞게 입력해주세요.").show();
					$("form[name=idFindFrm] input#email").addClass("wrong");  
					condition2 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					console.log("개인회원 데이터 조건 맞음");
					$("form[name=idFindFrm] input#email").removeClass("wrong");
					condition2 = true;
				}
				$("form[name=idFindFrm] span#emailError").hide();
				$(":input").prop("disabled",false).removeClass("wrong");
				return;
			}
		}); 
		
		// 이메일 '인증하기' 버튼 눌렀을 때..////////////////////////////////
		$("form[name=idFindFrm] #btnChk").click(sendVerificationCode);	
		///////////////////////////////////////////////////////////
		
		//  ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 인증번호
		$("form[name=idFindFrm] span#codeError").hide();
		
		$("form[name=idFindFrm] #code").keyup(function(){
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ).trim() ); // 한글 막기
			if($("form[name=idFindFrm] input#code").val().trim() == "") {	// 데이터가 없다면
				$("form[name=idFindFrm] #codeError").show();
				$("form[name=idFindFrm] input#code").addClass("wrong");	
			} else { // 데이터가 있다면(인증성공여부)
				$.ajax({	
					url:"<%= ctxPath%>/verifyCertificationFrm.sd",
					type:"POST",
					data:{"userCertificationCode" : $("form[name=idFindFrm] #code").val().trim()},
					dataType:"json",
					success:function(json){
						if(json.isbool){ // 메일 인증 성공
							$("form[name=idFindFrm] #codeError").hide();
							$("form[name=idFindFrm] input#code").removeClass("wrong");
							alert("인증성공");
							condition3 = true;
						} else { // 메일 인증 실패
							$("form[name=idFindFrm] #codeError").html("메일 인증 실패. 다시 시도해주세요.").show();
							$("form[name=idFindFrm] input#code").addClass("wrong");
							condition3 = false;
						}
					},
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
				}); 
			}
		});
	});
	
	
	// 이메일 '인증하기'버튼 눌렀을 때 
	function sendVerificationCode(){
		if(condition2 == true){
			$("form[name=idFindFrm] #codeError").hide();
			$("form[name=idFindFrm] #code").val(''); // 입력칸 비우기
			$("form[name=idFindFrm] #code").focus();
			disabled = false;
			$.ajax({	
				url:"<%= ctxPath%>/emailCode.sd",
				type:"POST",
				data:{"email":$("form[name=idFindFrm] #email").val().trim()},
				dataType:"json",
				success:function(json){
					alert("입력하신 이메일("+$("form[name=idFindFrm] #email").val()+")로 인증번호가 발송되었습니다.\n전달받은 인증번호를 입력해주세요");					
					var btnChange = true;
					if(btnChange == true){ // 발송되었다면 인증->재인증으로 바꾸자
						$("form[name=idFindFrm] #btnChk").hide();
						$("form[name=idFindFrm] #btnChkNext").show();
					} 
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					$("form[name=idFindFrm]input #email").addClass("wrong");
					$("form[name=idFindFrm] #codeError").html("메일발송이 실패했습니다. 다시 시도해주세요.").show();
				}
			}); 
		} else {
			alert('이메일을 알맞게 입력해주세요.');	// 접속자가 많아 지연됩니다. 다시 시도해주세요.
			$("form[name=idFindFrm] input#email").addClass("wrong");
			$("form[name=idFindFrm] #email").focus();
		}
	}
	
	
	// 아이디 찾기 버튼 눌렀을 때
	function goIdFind() {
		var bFlag = false;
		if($("form[name=idFindFrm] #name").val().trim()=="" || condition1 == false) {
			alert("이름을 확인하세요.");
			$("form[name=idFindFrm] #name").focus();
			return;
		}
		if($("form[name=idFindFrm] #email").val().trim()=="" || condition2 == false) {
			alert("이메일을 확인하세요.");
			$("form[name=idFindFrm] #email").focus();
			return;
		}
 		if($("form[name=idFindFrm] #btnChk").val().trim()=="") {
			alert("이메일 인증을 완료하세요.");
			$("form[name=idFindFrm] #email").focus();
			return;
		} 
 		if($("form[name=idFindFrm] #code").val().trim()=="" || condition3 == false) {
			alert("인증번호를 확인하세요.");
			$("form[name=idFindFrm] #code").focus();
			return;
		} 
		
		var bRequiredInfo = false;
		var data="";
		$("form[name=idFindFrm] .requiredInfo").each(function(){
			var data = $(this).val().trim();
			if(data == "") {
				bRequiredInfo = true;
				console.log($(this));
				$(this).focus();
				return false;
			}
		}); 
		
		if(!bRequiredInfo) {
			var frm = document.pwdFindFrm;
			frm.method = "POST";
			frm.action = "<%=ctxPath%>/idFindResult.sd";
			frm.submit();
		}
	}
</script>		
		
		

		
<script type="text/javascript">		
	var hpCondition1 = false;
	var hpCondition2 = false;
	var hpCondition3 = false;
	
	$(document).ready(function(){
	
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 이름
		$("span#nameError").hide();
	
		$("#name").keyup(function(){
		
			if($("input#name").val().trim() == "") {	// 데이터가 없다면
				$("span#nameError").show();
				$("#name").addClass("wrong");
			} else {	// 데이터가 있다면
				// 정규표현식
		        var regExp = /^[가-힣]{2,4}$/;	//  2~4글자 한글만 
		        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
				
		        if(!bool) {  // 데이터가 조건에 맞지않으면
					$("span#nameError").show();
					$("input#name").addClass("wrong");
					condition1 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					$("input#name").removeClass("wrong");
					condition1 = true;
				}
				$("span#nameError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		});
		
		
		//  ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 이메일
		$("form[name=hpIdFindFrm] span#emailError").hide();
		$("form[name=hpIdFindFrm] #btnChkNext").hide();
		$("form[name=hpIdFindFrm] #email").keyup(function(){
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ).trim() ); // 한글 막기
			if($("form[name=hpIdFindFrm] input#email").val().trim() == "") {	// 데이터가 없다면
				$("form[name=hpIdFindFrm] span#emailError").show();
				$("form[name=hpIdFindFrm] input#email").addClass("wrong");
			} else {	// 데이터가 있다면
				// 정규표현식
				var email = $("form[name=hpIdFindFrm] #email").val();
				var regExp_EMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				var bool = regExp_EMAIL.test(email); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
				
				if(!bool) {  // 데이터가 조건에 맞지않으면
					$("form[name=hpIdFindFrm] span#emailError").html("이메일 형식에 맞게 입력해주세요.").show();
					$("form[name=hpIdFindFrm] input#email").addClass("wrong");  
					hpCondition2 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					$("form[name=hpIdFindFrm] input#email").removeClass("wrong");
					hpCondition2 = true;
					console.log("데이터가 조건에 맞음!!!!");
				}
				$("form[name=hpIdFindFrm] span#emailError").hide();
				$(":input").prop("disabled",false).removeClass("wrong");

				return;
			}
		}); 
		
		// 이메일 '인증하기' 버튼 눌렀을 때..////////////////////////////////
		$("form[name=hpIdFindFrm] #btnChk").click(hpSendVerificationCode);	
		///////////////////////////////////////////////////////////
		
		//  ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 인증번호
		$("form[name=hpIdFindFrm] span#codeError").hide();
		
		$("form[name=hpIdFindFrm] #code").keyup(function(){
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ).trim() ); // 한글 막기
			if($("form[name=hpIdFindFrm] input#code").val().trim() == "") {	// 데이터가 없다면
				$("form[name=hpIdFindFrm] #codeError").show();
				$("form[name=hpIdFindFrm] input#code").addClass("wrong");	
			} else { // 데이터가 있다면(인증성공여부)
				$.ajax({	
					url:"<%= ctxPath%>/verifyCertificationFrm.sd",
					type:"POST",
					data:{"userCertificationCode" : $("form[name=hpIdFindFrm] #code").val().trim()},
					dataType:"json",
					success:function(json){
						if(json.isbool){ // 메일 인증 성공
							$("form[name=hpIdFindFrm] #codeError").hide();
							$("form[name=hpIdFindFrm] input#code").removeClass("wrong");
							alert("인증성공");
							hpCondition3 = true;
						} else { // 메일 인증 실패
							$("form[name=hpIdFindFrm] #codeError").html("메일 인증 실패. 다시 시도해주세요.").show();
							$("form[name=hpIdFindFrm] input#code").addClass("wrong");
							hpCondition3 = false;
						}
					},
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
				}); 
			}
		});
	});
	
	
	// 이메일 '인증하기'버튼 눌렀을 때 
	function hpSendVerificationCode(){
		console.log(hpCondition2);
		if(hpCondition2 == true){
			$("form[name=hpIdFindFrm] #codeError").hide();
			$("form[name=hpIdFindFrm] #code").val(''); // 입력칸 비우기
			$("form[name=hpIdFindFrm] #code").focus();
			disabled = false;
			$.ajax({	
				url:"<%= ctxPath%>/emailCode.sd",
				type:"POST",
				data:{"email":$("form[name=hpIdFindFrm] #email").val().trim()},
				dataType:"json",
				success:function(json){
					alert("입력하신 이메일("+$("form[name=hpIdFindFrm] #email").val()+")로 인증번호가 발송되었습니다.\n전달받은 인증번호를 입력해주세요");					
					var btnChange = true;
					if(btnChange == true){ // 발송되었다면 인증->재인증으로 바꾸자
						$("form[name=hpIdFindFrm] #btnChk").hide();
						$("form[name=hpIdFindFrm] #btnChkNext").show();
					} 
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					$("form[name=hpIdFindFrm]input #email").addClass("wrong");
					$("form[name=hpIdFindFrm] #codeError").html("메일발송이 실패했습니다. 다시 시도해주세요.").show();
				}
			}); 
		} else {
			alert('이메일을 알맞게 입력해주세요.'); // 접속자가 많아 지연됩니다. 다시 시도해주세요.
			$("form[name=hpIdFindFrm] input#email").addClass("wrong");
			$("form[name=hpIdFindFrm] #email").focus();
		}
	}
	
	
	
	
	function goHpIdFind() {
		var bFlag = false;
		if($("form[name=hpIdFindFrm] #regId").val().trim()=="" || hpCondition1 == false) {
			alert("사업자번호를 확인하세요.");
			$("form[name=hpIdFindFrm] #regId").focus();
			return;
		}
		if($("form[name=hpIdFindFrm] #email").val().trim()=="" || hpCondition2 == false) {
			alert("이메일을 확인하세요.");
			$("form[name=hpIdFindFrm] #email").focus();
			return;
		}
 		if($("form[name=hpIdFindFrm] #btnChk").val().trim()=="") {
			alert("이메일 인증을 완료하세요.");
			$("form[name=hpIdFindFrm] #email").focus();
			return;
		} 
 		if($("form[name=hpIdFindFrm] #code").val().trim()=="" || hpCondition3 == false) {
			alert("인증번호를 확인하세요.");
			$("form[name=hpIdFindFrm] #code").focus();
			return;
		} 
 		
		var bHpRequiredInfo = false;
		$("form[name=hpIdFindFrm] .requiredInfo").each(function(){
			var data = $(this).val().trim();
			if(data == "") {
				bHpRequiredInfo = true;
				$(this).focus();
				return false;
			}
		}); 

		if(!bHpRequiredInfo) {
			var frm = document.hpPwdFindFrm;
				frm.method = "POST";
				frm.action = "<%=ctxPath%>/hpIdFindResult.sd";
				frm.submit();
		} 
	}
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
	   
		<form name="pwdFindFrm">
			<div id="box">
			
				<div class="individualMember"> 
					<div class="formGroup">
						<label for="name">이름</label>
				        <input type="text" name="name" id="name" class="requiredInfo" autofocus /> 
				        <span class="error" id="nameError">이름을 입력하세요.</span>
						
						<label for="userid">아이디</label>
				        <input type="text" name="userid" id="userid" class="requiredInfo" autofocus /> 
				        <span class="error" id="useridError">아이디를 입력하세요.</span>
				        
				        <label for="email" style="display: block;">이메일</label>
				        <input type="text" name="email" id="email" class="requiredInfo" placeholder="E-mail을 입력하세요" style="width: 70%; height:35px;" /> 
				        <input type="button" id="btnChk" class="btnChk" value="인증" style="width: 28%; height:35px;"/>
				        <input type="button" id="btnChkNext" class="btnChk" onclick="sendVerificationCode()" value="재인증" style="width: 28%; height: 35px;"/>
				        <span class="error" id="emailError">이메일 형식에 맞지 않습니다.</span>
				
				        <label for="code">인증번호</label>
				        <input type="text" id="code" name="code" class="requiredInfo" maxlength="7" placeholder="인증번호를 입력하세요" />
						<span class="error" id="codeError">인증번호가 맞지 않습니다.</span>
					</div>

					<div class="btnJoin">
						<input type="button" id="btnFind" value="아이디 찾기" onClick="goIdFind();" />
					</div> 
				</div>
			</div>
		</form>		
		  
		<!-- -------------------------------- 일반고객 비밀번호 찾기 끝 ---------------------------------- --> 	
		
		<form name="hpPwdFindFrm">
			<div id="box">
				<div class="hospitalMember"> 
					<div class="formGroup">
					
						<label for="name">담당자 이름</label>
				        <input type="text" name="name" id="name" class="requiredInfo" autofocus /> 
				        <span class="error" id="nameError">이름을 입력하세요.</span>
				        
						<label for="userid">아이디</label>
				        <input type="text" name="userid" id="userid" class="requiredInfo" autofocus /> 
				        <span class="error" id="useridError">아이디를 입력하세요.</span>
				        				
						<label for="email" style="display: block;">이메일</label>
				        <input type="text" name="email" id="email" class="requiredInfo" placeholder="E-mail을 입력하세요" style="width: 70%; height:35px;" /> 
				        <input type="button" id="btnChk" class="btnChk" value="인증" style="width: 28%; height:35px;"/>
				        <input type="button" id="btnChkNext" class="btnChk" onclick="hpSendVerificationCode()" value="재인증" style="width: 28%; height: 35px;"/>
				        <span class="error" id="emailError">이메일 형식에 맞지 않습니다.</span>
						
				        <label for="code">인증번호</label>
				        <input type="text" id="code" name="code" class="requiredInfo" maxlength="7" placeholder="인증번호를 입력하세요" />
						<span class="error" id="codeError">인증번호가 맞지 않습니다.</span>
					</div>
					
					<div class="btnJoin">
						<input type="button" id="btnFind" value="아이디 찾기" onClick="goHpIdFind();" />
					</div>  
				 </div>	
			</div>
		</form> 
		
		<!-- -------------------------------- 병원고객 비밀번호 찾기 끝 ---------------------------------- --> 
		<form name="verifyCertificationFrm">
			<input type="hidden" name="userid" />
			<input type="hidden" name="userCertificationCode" />
		</form>
		
		<form name="hpVerifyCertificationFrm">
			<input type="hidden" name="hpUserid" />
			<input type="hidden" name="hpUserCertificationCode" />
		</form>	 
	</div>
</div>    