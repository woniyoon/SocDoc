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
	var condition4 = false;
	var btnChange = false;
	$(document).ready(function(){
		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 이름
		$("form[name=pwdFindFrm] span#nameError").hide();
	
		$("form[name=pwdFindFrm] #name").keyup(function(){
		
			if($("form[name=pwdFindFrm] input#name").val().trim() == "") {	// 데이터가 없다면
				$("form[name=pwdFindFrm] span#nameError").show();
				$("form[name=pwdFindFrm] #name").addClass("wrong");
			} else {	// 데이터가 있다면
				// 정규표현식
		        var regExp = /^[가-힣]{2,4}$/;	//  2~4글자 한글만 
		        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
				
		        if(!bool) {  // 데이터가 조건에 맞지않으면
					$("form[name=pwdFindFrm] span#nameError").show();
					$("form[name=pwdFindFrm] input#name").addClass("wrong");
					condition1 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					$("form[name=pwdFindFrm] input#name").removeClass("wrong");
					condition1 = true;
				}
				$("form[name=pwdFindFrm] span#nameError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		});
		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 아이디
		$("form[name=pwdFindFrm] span#useridError").hide();
	
		$("form[name=pwdFindFrm] #userid").keyup(function(){
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ).trim() ); // 한글 막기
			if($("form[name=pwdFindFrm] input#userid").val().trim() == "") {	// 데이터가 없다면
				$("form[name=pwdFindFrm] span#userid").hide();
				$("form[name=pwdFindFrm] input#userid").addClass("wrong"); 
			} else {	// 데이터가 있다면
				// 정규표현식
				var regExp = /^[A-Za-z0-9]{5,10}$/;	// 5자 이상 10글자 이하의 영문과 숫자를 조합
		        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
		        
				if(!bool) {  // 데이터가 조건에 맞지않으면
					$("form[name=pwdFindFrm] span#useridError").html("영문,숫자 조합으로 5~10자리만 입력 가능합니다.").show();
					$("form[name=pwdFindFrm] input#userid").addClass("wrong");  
					condition2 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					$("form[name=pwdFindFrm] input#userid").removeClass("wrong");
					condition2 = true;
				}
				$("form[name=pwdFindFrm] span#useridError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		});
		
		//  ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 이메일
		$("form[name=pwdFindFrm] span#emailError").hide();
		$("form[name=pwdFindFrm] #btnChkNext").hide();
		$("form[name=pwdFindFrm] #email").keyup(function(){
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ).trim() ); // 한글 막기
			if($("form[name=pwdFindFrm] input#email").val().trim() == "") {	// 데이터가 없다면
				$("form[name=pwdFindFrm] span#emailError").show();
				$("form[name=pwdFindFrm] input#email").addClass("wrong");
			} else {	// 데이터가 있다면
				// 정규표현식
				var email = $("form[name=pwdFindFrm] #email").val();
				var regExp_EMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				var bool = regExp_EMAIL.test(email); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
				
				if(!bool) {  // 데이터가 조건에 맞지않으면
					$("form[name=pwdFindFrm] span#emailError").html("이메일 형식에 맞게 입력해주세요.").show();
					$("form[name=pwdFindFrm] input#email").addClass("wrong");  
					condition3 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					console.log("개인회원 데이터 조건 맞음");
					$("form[name=pwdFindFrm] input#email").removeClass("wrong");
					condition3 = true;
				}
				$("form[name=pwdFindFrm] span#emailError").hide();
				$(":input").prop("disabled",false).removeClass("wrong");
				return;
			}
		}); 
		
		// 이메일 '인증하기' 버튼 눌렀을 때..////////////////////////////////
		$("form[name=pwdFindFrm] #btnChk").click(sendVerificationCode);	
		///////////////////////////////////////////////////////////
		
		//  ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 인증번호
		$("form[name=pwdFindFrm] span#codeError").hide();
		
		$("form[name=pwdFindFrm] #code").keyup(function(){
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ).trim() ); // 한글 막기
			if($("form[name=pwdFindFrm] input#code").val().trim() == "") {	// 데이터가 없다면
				$("form[name=pwdFindFrm] #codeError").show();
				$("form[name=pwdFindFrm] input#code").addClass("wrong");	
			} else { // 데이터가 있다면(인증성공여부)
				$.ajax({	
					url:"<%= ctxPath%>/verifyCertificationFrm.sd",
					type:"POST",
					data:{"userCertificationCode" : $("form[name=pwdFindFrm] #code").val().trim()},
					dataType:"json",
					success:function(json){
						if(json.isbool){ // 메일 인증 성공
							$("form[name=pwdFindFrm] #codeError").hide();
							$("form[name=pwdFindFrm] input#code").removeClass("wrong");
							//alert("인증성공");
							condition4 = true;
						} else { // 메일 인증 실패
							$("form[name=pwdFindFrm] #codeError").html("메일 인증 실패. 다시 시도해주세요.").show();
							$("form[name=pwdFindFrm] input#code").addClass("wrong");
							condition4 = false;
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
		if(condition3 == true){
			$("form[name=pwdFindFrm] #codeError").hide();
			$("form[name=pwdFindFrm] #code").val(''); // 입력칸 비우기
			$("form[name=pwdFindFrm] #code").focus();
			$.ajax({	
				url:"<%= ctxPath%>/emailCode.sd",
				type:"POST",
				data:{"email":$("form[name=pwdFindFrm] #email").val().trim()},
				dataType:"json",
				success:function(json){
					alert("입력하신 이메일("+$("form[name=pwdFindFrm] #email").val()+")로 인증번호가 발송되었습니다.\n전달받은 인증번호를 입력해주세요");					
					var btnChange = true;
					if(btnChange == true){ // 발송되었다면 인증->재인증으로 바꾸자
						$("form[name=pwdFindFrm] #btnChk").hide();
						$("form[name=pwdFindFrm] #btnChkNext").show();
					} 
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					$("form[name=pwdFindFrm]input #email").addClass("wrong");
					$("form[name=pwdFindFrm] #codeError").html("메일발송이 실패했습니다. 다시 시도해주세요.").show();
				}
			}); 
		} else {
			alert('이메일을 알맞게 입력해주세요.');	
			$("form[name=pwdFindFrm] input#email").addClass("wrong");
			$("form[name=pwdFindFrm] #email").focus();
		}
	}
	
	
	// 아이디 찾기 버튼 눌렀을 때
	function goPwdFind() {
		var bFlag = false;
		if($("form[name=pwdFindFrm] #name").val().trim()=="" || condition1 == false) {
			alert("이름을 확인하세요.");
			$("form[name=pwdFindFrm] #name").focus();
			return;
		}
		if($("form[name=pwdFindFrm] #userid").val().trim()=="" || condition2 == false) {
			alert("아이디를 확인하세요.");
			$("form[name=pwdFindFrm] #userid").focus();
			return;
		}
		if($("form[name=pwdFindFrm] #email").val().trim()=="" || condition3 == false) {
			alert("이메일을 확인하세요.");
			$("form[name=pwdFindFrm] #email").focus();
			return;
		}
 		if($("form[name=pwdFindFrm] #code").val().trim()=="" || condition4 == false) {
			alert("인증번호를 확인하세요.");
			$("form[name=pwdFindFrm] #code").focus();
			return;
		} 
		
		var bRequiredInfo = false;
		var data="";
		$("form[name=pwdFindFrm] .requiredInfo").each(function(){
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
			frm.action = "<%=ctxPath%>/pwdUpdate.sd";
			frm.submit();
		}
	}
</script>		
		
		

		
<script type="text/javascript">		
	var hpCondition1 = false;
	var hpCondition2 = false;
	var hpCondition3 = false;
	var hpCondition4 = false;
	var btnChange = false;
$(document).ready(function(){
		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 이름
		$("form[name=hpPwdFindFrm] span#nameError").hide();
	
		$("form[name=hpPwdFindFrm] #name").keyup(function(){
		
			if($("form[name=hpPwdFindFrm] input#name").val().trim() == "") {	// 데이터가 없다면
				$("form[name=hpPwdFindFrm] span#nameError").show();
				$("form[name=hpPwdFindFrm] #name").addClass("wrong");
			} else {	// 데이터가 있다면
				// 정규표현식
		        var regExp = /^[가-힣]{2,4}$/;	//  2~4글자 한글만 
		        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
				
		        if(!bool) {  // 데이터가 조건에 맞지않으면
					$("form[name=hpPwdFindFrm] span#nameError").show();
					$("form[name=hpPwdFindFrm] input#name").addClass("wrong");
					hpCondition1 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					$("form[name=hpPwdFindFrm] input#name").removeClass("wrong");
					hpCondition1 = true;
				}
				$("form[name=hpPwdFindFrm] span#nameError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		});
		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 아이디
		$("form[name=hpPwdFindFrm] span#useridError").hide();
	
		$("form[name=hpPwdFindFrm] #userid").keyup(function(){
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ).trim() ); // 한글 막기
			if($("form[name=hpPwdFindFrm] input#userid").val().trim() == "") {	// 데이터가 없다면
				$("form[name=hpPwdFindFrm] span#userid").hide();
				$("form[name=hpPwdFindFrm] input#userid").addClass("wrong"); 
			} else {	// 데이터가 있다면
				// 정규표현식
				var regExp = /^[A-Za-z0-9]{5,10}$/;	// 5자 이상 10글자 이하의 영문과 숫자를 조합
		        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
		        
				if(!bool) {  // 데이터가 조건에 맞지않으면
					$("form[name=hpPwdFindFrm] span#useridError").html("영문,숫자 조합으로 5~10자리만 입력 가능합니다.").show();
					$("form[name=hpPwdFindFrm] input#userid").addClass("wrong");  
					hpCondition2 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					$("form[name=hpPwdFindFrm] input#userid").removeClass("wrong");
					hpCondition2 = true;
				}
				$("form[name=hpPwdFindFrm] span#useridError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		});
		
		//  ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 이메일
		$("form[name=hpPwdFindFrm] span#emailError").hide();
		$("form[name=hpPwdFindFrm] #btnChkNext").hide();
		$("form[name=hpPwdFindFrm] #email").keyup(function(){
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ).trim() ); // 한글 막기
			if($("form[name=hpPwdFindFrm] input#email").val().trim() == "") {	// 데이터가 없다면
				$("form[name=hpPwdFindFrm] span#emailError").show();
				$("form[name=hpPwdFindFrm] input#email").addClass("wrong");
			} else {	// 데이터가 있다면
				// 정규표현식
				var email = $("form[name=hpPwdFindFrm] #email").val();
				var regExp_EMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				var bool = regExp_EMAIL.test(email); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
				
				if(!bool) {  // 데이터가 조건에 맞지않으면
					$("form[name=hpPwdFindFrm] span#emailError").html("이메일 형식에 맞게 입력해주세요.").show();
					$("form[name=hpPwdFindFrm] input#email").addClass("wrong");  
					hpCondition3 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					console.log("개인회원 데이터 조건 맞음");
					$("form[name=hpPwdFindFrm] input#email").removeClass("wrong");
					hpCondition3 = true;
				}
				$("form[name=hpPwdFindFrm] span#emailError").hide();
				$(":input").prop("disabled",false).removeClass("wrong");
				return;
			}
		}); 
		
		// 이메일 '인증하기' 버튼 눌렀을 때..////////////////////////////////
		$("form[name=hpPwdFindFrm] #btnChk").click(hpSendVerificationCode);	
		///////////////////////////////////////////////////////////
		
		//  ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 인증번호
		$("form[name=hpPwdFindFrm] span#codeError").hide();
		
		$("form[name=hpPwdFindFrm] #code").keyup(function(){
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ).trim() ); // 한글 막기
			if($("form[name=hpPwdFindFrm] input#code").val().trim() == "") {	// 데이터가 없다면
				$("form[name=hpPwdFindFrm] #codeError").show();
				$("form[name=hpPwdFindFrm] input#code").addClass("wrong");	
			} else { // 데이터가 있다면(인증성공여부)
				$.ajax({	
					url:"<%= ctxPath%>/verifyCertificationFrm.sd",
					type:"POST",
					data:{"userCertificationCode" : $("form[name=hpPwdFindFrm] #code").val().trim()},
					dataType:"json",
					success:function(json){
						if(json.isbool){ // 메일 인증 성공
							$("form[name=hpPwdFindFrm] #codeError").hide();
							$("form[name=hpPwdFindFrm] input#code").removeClass("wrong");
							//alert("인증성공");
							hpCondition4 = true;
						} else { // 메일 인증 실패
							$("form[name=hpPwdFindFrm] #codeError").html("메일 인증 실패. 다시 시도해주세요.").show();
							$("form[name=hpPwdFindFrm] input#code").addClass("wrong");
							hpCondition4 = false;
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
		if(hpCondition3 == true){
			$("form[name=hpPwdFindFrm] #codeError").hide();
			$("form[name=hpPwdFindFrm] #code").val(''); // 입력칸 비우기
			$("form[name=hpPwdFindFrm] #code").focus();
			$.ajax({	
				url:"<%= ctxPath%>/emailCode.sd",
				type:"POST",
				data:{"email":$("form[name=hpPwdFindFrm] #email").val().trim()},
				dataType:"json",
				success:function(json){
					alert("입력하신 이메일("+$("form[name=hpPwdFindFrm] #email").val()+")로 인증번호가 발송되었습니다.\n전달받은 인증번호를 입력해주세요");					
					var btnChange = true;
					if(btnChange == true){ // 발송되었다면 인증->재인증으로 바꾸자
						$("form[name=hpPwdFindFrm] #btnChk").hide();
						$("form[name=hpPwdFindFrm] #btnChkNext").show();
					} 
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					$("form[name=hpPwdFindFrm]input #email").addClass("wrong");
					$("form[name=hpPwdFindFrm] #codeError").html("메일발송이 실패했습니다. 다시 시도해주세요.").show();
				}
			}); 
		} else {
			alert('이메일을 알맞게 입력해주세요.');	
			$("form[name=hpPwdFindFrm] input#email").addClass("wrong");
			$("form[name=hpPwdFindFrm] #email").focus();
		}
	}
	
	
	// 아이디 찾기 버튼 눌렀을 때
	function goHpPwdFind() {
		var bFlag = false;
		if($("form[name=hpPwdFindFrm] #name").val().trim()=="" || hpCondition1 == false) {
			alert("이름을 확인하세요.");
			$("form[name=hpPwdFindFrm] #name").focus();
			return;
		}
		if($("form[name=hpPwdFindFrm] #userid").val().trim()=="" || hpCondition2 == false) {
			alert("아이디를 확인하세요.");
			$("form[name=hpPwdFindFrm] #userid").focus();
			return;
		}
		if($("form[name=hpPwdFindFrm] #email").val().trim()=="" || hpCondition3 == false) {
			alert("이메일을 확인하세요.");
			$("form[name=hpPwdFindFrm] #email").focus();
			return;
 		}
 		if($("form[name=hpPwdFindFrm] #code").val().trim()=="" || hpCondition4 == false) {
			alert("인증번호를 확인하세요.");
			$("form[name=hpPwdFindFrm] #code").focus();
			return;
		} 
		
		var bRequiredInfo = false;
		var data="";
		$("form[name=hpPwdFindFrm] .requiredInfo").each(function(){
			var data = $(this).val().trim();
			if(data == "") {
				bRequiredInfo = true;
				console.log($(this));
				$(this).focus();
				return false;
			}
		}); 
		
		if(!bRequiredInfo) {
			var frm = document.hpPwdFindFrm;
			frm.method = "POST";
			frm.action = "<%=ctxPath%>/hpPwdUpdate.sd";
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
						<input type="button" id="btnFind" value="비밀번호 찾기" onClick="goPwdFind();" />
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
						<input type="button" id="btnFind" value="비밀번호 찾기" onClick="goHpPwdFind();" />
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