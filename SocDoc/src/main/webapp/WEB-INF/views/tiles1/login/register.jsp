<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String ctxPath = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>속닥 회원가입</title>

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
		display: inline-block;
		padding: 5px 0;
		margin-top: 10px;
	}
    
    input {
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
     
    .btnJoin, .hpBtnJoin {
    	width: 100%;
    	margin: 20px auto;
    	text-align: center;
   	}
   	
	#btnRegister, #hpBtnRegister {
	    width: 200px;
	    height: 60px;
	    font-size: 20px;
	    font-weight: bold;
	    color: #fff;
	    background-color: #58ACFA;
	    border: solid 1px #ccc;
	}

	.textPosition {
		margin-top: 0;
		padding-right: 30px;
	}
	
	#idCheck, #hpIdCheck, #emailCheck, #hpEmailCheck {
		color: #ffffff;
		background-color: #58ACFA;
		border: solid 0px #ccc;
	}
	
	.birthday {
		overflow : hidden;
	    box-sizing: border-box;
	    border: solid 1px gray;
	}
	
	.birthday input[type=text] {
		float: left;
	    width: 100px;
	    height: 35px;
	    padding-left:4px;
	    text-align: center;
	    border: 0;
	}
	
	div.bar {
		display: inline-block;
		width: 20px;
		padding-top: 5px;
		text-align: center;
		position: relative;
		float: left;
		font-size: 12pt;
		color : #ccc;
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
	
	// 데이터 조건 여부
	var condition1 = false;
	var condition2 = false;
	var condition3 = false;
	var condition4 = false;
	var condition5 = false;
	
	// 아이디 정규표현식 성공 여부
	//var idOK = false;	
	var emailOK = false;

	
	$(document).ready(function(){
		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 아이디
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
		        //console.log($("input#userid").val());
				if(!bool) {  // 데이터가 조건에 맞지않으면
					$("span#useridSuccess").hide();
					$("span#useridError").html("영문,숫자 조합으로 5~10자리만 입력 가능합니다.").show();
					$("input#userid").addClass("wrong");  
					condition1 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					//$("span#useridSuccess").html("아이디 중복검사를 하세요 제발 plz").show();
					$("input#userid").removeClass("wrong");
					condition1 = true;
					
					$.ajax({
						url:"<%=ctxPath%>/idChk.sd",
						type:"POST",
						data:{"userid":$("#userid").val()},
						dataType:"json",
						success:function(json){
							if(json.isUse) {	// X 데이터가 중복된다면 X false
								$("span#useridError").html($("#userid").val()+"은(는) 이미 사용 중이거나, 탈퇴한 아이디로 사용 불가능합니다.").show();
								$("span#useridSuccess").hide();
							} else {	// O 데이터가 중복되지않는다면 O true
								if(condition1 == false){ // 정규표현식이 틀리다면
									$("span#useridError").html("조건 맞춰주세요ㅅㅂ").show();
									$("span#useridSuccess").hide();
									$("input#userid").addClass("wrong");  
								} else if(condition1 == true) {	// 정규표현식이 맞다면
									$("span#useridSuccess").html("사용 가능한 아이디 입니다.").show();
									$("span#useridError").hide();
								}
							}
						},
						error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
						}
					});
				}
		        
				$("span#useridError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		});
		
<%-- 		
		/// **** AJAX로 id중복확인하기  ****///
		$("#idCheck").click(function() {
			
			if($("input#userid").val().trim() == "") {	// 데이터 없을 때 중복검사를 하면
				alert('아이디를 입력하세요.');
			}else{ // 데이터 있을 때 중복검사를 하면
				$.ajax({
					url:"<%=ctxPath%>/idChk.sd",
					type:"POST",
					data:{"userid":$("#userid").val()},
					dataType:"json",
					success:function(json){
						if(json.isUse) {	// X 데이터가 중복된다면 X false
							$("span#useridError").html($("#userid").val()+"은(는) 이미 사용 중이거나, 탈퇴한 아이디로 사용 불가능합니다.").show();
							$("span#useridSuccess").hide();
						} else {	// O 데이터가 중복되지않는다면 O true
							if(condition1 == false){ // 정규표현식이 틀리다면
								$("span#useridError").html("조건 맞춰주세요ㅅㅂ").show();
								$("span#useridSuccess").hide();
								idOK = false;
							} else if(condition1 == true) {	// 정규표현식이 맞다면
								$("span#useridSuccess").html("사용 가능한 아이디 입니다.").show();
								$("span#useridError").hide();
								idOK = true;
							}
						}
					},
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
				});
			}
		}); 
--%>

		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 비밀번호
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
					condition2 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					$("span#pwdSuccess").show();
					$("input#pwd").removeClass("wrong");
					condition2 = true;
				}
				$("span#pwdError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		});
	
		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 이름
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
					condition3 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					$("input#name").removeClass("wrong");
					condition3 = true;
				}
				$("span#nameError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		});
	
		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 생년월일
		$("span#birthdayError").hide();
	    $("input#birthYY, input#birthMM, input#birthDD").keyup(validateBirth);
	    
	    // 생년월일에 0추가 
	    var mmhtml = "";
	    for(var i=1; i<=12; i++) {
	       if(i<10) {
	          mmhtml += "<option value ='0"+i+"'>0"+i+"</option>";
	       } else {
	          mmhtml += "<option value ='"+i+"'>"+i+"</option>";
	       }
	    }
	    $("#birthMM").html(mmhtml);
	      
	    var ddhtml = "";
	    for(var i=1; i<=31; i++) {
	       if(i<10) {
	          ddhtml += "<option value ='0"+i+"'>0"+i+"</option>";
	       } else {
	          ddhtml += "<option value ='"+i+"'>"+i+"</option>";
	       }
	    }
	    $("#birthDD").html(ddhtml);
	
		// 정규표현식
		function validateBirth(event) {
			event.preventDefault();
			var yearRegex = /^(19[0-9][0-9]|20\d{2})$/;
			var monthRegex = /^(0[0-9]|1[0-2])$/;
			var dateRegex = /^(0[1-9]|[1-2][0-9]|3[0-1])$/;
	
			// 년
			var yearValue = $("#birthYY").val();
			if (!yearRegex.test(yearValue)) {
				$(".birthday").addClass('wrong');
				$("span#birthdayError").html("연도를 정확하게 입력해주세요").show();
				return;
			}
			// 월
			var monthValue = $("#birthMM").val();
			if (!monthRegex.test(monthValue)) {
				// error , return
				$(".birthday").addClass('wrong');
				$("span#birthdayError").html("월을 정확하게 입력해주세요").show();
				return;
			}
			// 일
			var dateValue = $("#birthDD").val();
			if (!dateRegex.test(dateValue)) {
				// error , return
				$(".birthday").addClass('wrong');
				$("span#birthdayError").html("일을 정확하게 입력해주세요").show();
				return;
			}
			var userYearInt = parseInt(yearValue);
			var userMonthInt = parseInt(monthValue);
			var userDayInt = parseInt(dateValue);
			var userInputDate = new Date(userYearInt, userMonthInt, userDayInt);
			var today = new Date();
	
			var userAge = Math.floor((today - userInputDate) / (1000 * 60 * 60 * 24 * 365));
			//console.log('userAge', userAge);
	
			// 안맞을 때
			if (userAge < 0) {
				// error, return
				$(".birthday").addClass('wrong');
				$("span#birthdayError").html("정확한 날짜로 입력해주세요").show();
				return;
			}
			
			// 모두 맞으면
			$(".birthday").addClass('wrong');
			$("span#birthdayError").html("").hide();
			$(".birthday").prop("disabled",false).removeClass("wrong"); 
		}
	
		
		//  ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 이메일
		$("span#emailError").hide();
		$("span#emailSuccess").hide();
		
		$("#email").blur(function(){
			
			if($("input#email").val().trim() == "") {	// 데이터가 없다면
				$("span#emailSuccess").hide();
				$("span#emailError").show();
				$("input#email").addClass("wrong");
			} else {	// 데이터가 있다면
				// 정규표현식
				var email = $("#email").val();
				var regExp_EMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				var bool = regExp_EMAIL.test(email); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
				
				if(!bool) {  // 데이터가 조건에 맞지않으면
					$("span#emailSuccess").hide();
					$("span#emailError").html("이메일 형식에 맞게 입력해주세요.").show();
					$("input#email").addClass("wrong"); 
					condition4 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					//$("span#useridSuccess").show();
					$("span#emailSuccess").html("이메일 중복검사를 하세요 제발 plz").show();
					$("input#email").removeClass("wrong");
					condition4 = true;
				}
				
				$("span#emailError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		}); 

		/// **** AJAX로 email중복확인하기  ****///
		$("#emailCheck").click(function() {
			
			if($("input#email").val().trim() == "") {	// 데이터 없을 때 중복검사를 하면
				alert("이메일을 입력하세요.");
			} else { // 데이터 있을 때 중복검사를 하면
				$.ajax({
					url:"<%=ctxPath%>/emailChk.sd",
					type:"POST",
					data:{"email":$("#email").val()},
					dataType:"json",
					success:function(json){
						if(json.isUse) {	// X 데이터가 중복된다면 X false
							$("span#emailError").html($("#email").val()+"은(는) 이미 사용 중이거나, 탈퇴한 이메일로 사용 불가능합니다.").show();
							$("span#emailSuccess").hide();
						} else {	// O 데이터가 중복되지않는다면 O true
							if(condition4 == false){ // 정규표현식이 틀리다면
								$("span#emailError").html("조건 맞춰주세요ㅅㅂ").show();
								$("span#emailSuccess").hide();
								emailOK = false;
							} else if(condition4 == true) {	// 정규표현식이 맞다면
								$("span#emailSuccess").html("사용 가능한 이메일 입니다.").show();
								$("span#emailError").hide();
								emailOK = true;
								
<%-- 								var frm = document.registerFrm;
								frm.method = "POST";
								frm.action = "<%= ctxPath%>/register.sd";
								frm.submit(); --%>
							}
						}
					},
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
				});
			}
		});
		
		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 이메일로 인증번호 전송 
		$("#btnFind").click(function(){
			
			$.ajax({	
				url:"<%= ctxPath%>/emailCode.sd",
				type:"POST",
				data:{"email":$("#email").val().trim()},
				dataType:"json",
				success:function(json){
					console.log(json.isSent);
					if(isSent==true){
						alert('인증완료');
					} else {
						alert("재시도");
					}
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});
		});	
			<%-- $.ajax();
			var emailVal = $("#email").val().trim();
			
			if(emailVal != "") {
				var frm = document.registerFrm;
				frm.method = "POST";
				frm.action = "<%= ctxPath%>/emailCode.sd";
				frm.submit();
			}
			else {
				alert("이메일을 입력하세요!!");
				return;
			}
		});
		
		var method = "${method}";
		var email = "${email}";
		
		if(method=="POST") {
			$("#email").val(email);
			$("#div_btnFind").hide();
		}
		else {
			$("#div_btnFind").show();
		}
		
		$("#btnConfirmCode").click(function(){
			var frm = document.verifyCertificationFrm;
			frm.userCertificationCode.value = $("#input_confirmCode").val();
			
			frm.action = "<%= ctxPath%>/verifyCertification.sd";
			frm.method = "POST";
			frm.submit();
		}); --%>
		
	
		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 휴대폰 
		$("span#hpError").hide();
		
		$("#hp").keyup(function(event){
					
			// 숫자만 입력
			var keycode = event.keyCode;
	        if( !((48 <= keycode && keycode<=57) || (96<=keycode && keycode<=105)|| (keycode==8))){
	            var word = $(this).val().length;
	            var keyValue = $(this).val().substring(0,word-1);
	            $(this).val(keyValue);
	        }
	        if($("input#hp").val().trim() == "") {	// 데이터가 없다면
				$("span#hpError").show();
				$("input#hp").addClass("wrong");
			} else {	// 데이터가 있다면
				// 정규표현식
				var regExp = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
				var bool = regExp.test($(this).val());
	             
				if(!bool) { // 데이터가 조건에 맞지 않는다면
					$("span#hpError").html("휴대폰 형식에 맞게 입력해주세요.").show();
					$("input#hp").addClass("wrong"); 
					condition5 = false;
					return;
				} else { // 데이터가 조건에 맞다면
					$("input#hp").removeClass("wrong");
					condition5 = true;
				}
				$("span#hpError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		});
	});
		
		
	// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 회원///성별/약관동의 
	//------------------- 가입버튼 클릭 시 안 적은 항목이 있다면 알려주자~! ------------------- //
	function goRegister() {
		  
		var bFlag = false;
		
		if($("#userid").val().trim()=="" || condition1 == false) {
			alert("아이디를 확인하세요.");
			$("#userid").focus();
			return;
		}
		if(!idOK || idOK == false) {
			alert("아이디 중복검사를 하세요.");
			return;
		}
		if($("#pwd").val().trim()=="" || condition2 == false) {
			alert("비밀번호를 확인하세요.");
			$("#pwd").focus();
			return;
		}
		if($("#name").val().trim()=="" || condition3 == false) {
			alert("이름을 확인하세요.");
			$("#name").focus();
			return;
		}
		if($("#birthYY").val().trim()=="") {
			alert("생일을 확인하세요.");
			$("#birthYY").focus();
			return;
		}
		if($("#birthMM").val().trim()=="") {
			alert("생일을 확인하세요.");
			$("#birthMM").focus();
			return;
		}
		if($("#birthDD").val().trim()=="") {
			alert("생일을 확인하세요.");
			$("#birthDD").focus();
			return;
		}
		$("input:radio[name=gender]").each(function(){ // 반복문
			var bChecked = $(this).prop("checked");
			if(bChecked) {
				console.log(bChecked);
				bFlag = true;
				return false;
			} 
	   	}); 
		if(!bFlag) {
			alert("성별을 확인하세요.");
			$("#gender").focus();
			return;
		}
		if($("#email").val().trim()=="" || condition4 == false) {
			alert("이메일을 확인하세요.");
			$("#email").focus();
			return;
		}
		if(!emailOK || emailOK==false) {
			alert("이메일 중복검사를 하세요.");
			$("#email").focus();
			return;
		}
		if($("#hp").val().trim()=="" || condition5 == false) {
			alert("전화번호를 확인하세요.");
			$("#hp").focus();
			return;
		}
		if( !$("input:checkbox[id=agree]").prop("checked") ) {
			alert("이용약관에 동의하세요.");
			$("#agree").focus();
			return;
		} 
		var bRequiredInfo = false;
		$(".requiredInfo").each(function(){
			var data = $(this).val().trim();
			if(data == "") {
				bRequiredInfo = true;
				$(this).focus();
				return false;
			}
		}); 
		if(!bRequiredInfo) {
		var frm = document.registerFrm;
			frm.method = "POST";
			frm.action = "register.sd";
			frm.submit();
		} 
	}
	
</script>	
		
	
		
		
		
		
<!-- ----------------------------------------------------- 개인회원끝 / 병원시작 ----------------------------------------------------- -->		
		
		
		
		
		
		
		
<script type="text/javascript">
	
	// 데이터 조건 여부
	var hpCondition1 = false;
	var hpCondition2 = false;
	var hpCondition3 = false;
	var hpCondition4 = false;
	var hpCondition4 = false;
	
	// 아이디 정규표현식 성공 여부
	//var hpIdOK = false;	
	var hpEmailOK = false;
	
	$(document).ready(function(){	
		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 사업자등록번호
		$("span#businessNumberError").hide();
	
		$("#businessNumber").blur(function(){
	
			if($("input#businessNumber").val().trim() == "") {	// 데이터가 없다면
				$("span#businessNumberError").show();
				$("input#businessNumber").addClass("wrong"); 
			} else {	// 데이터가 있다면
				// 정규표현식
		        var regExp = /^[0-9]{10}$/;
		        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
				
				if(!bool) {  // 데이터가 조건에 맞지않으면
					$("span#businessNumberError").html("올바른 사업자번호가 아닙니다.").show();
					$("input#businessNumber").addClass("wrong");  
					hpCondition1 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					$("input#businessNumber").removeClass("wrong");
					hpCondition1 = true;
				}
				$("span#businessNumberError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		});	

		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 아이디
		$("span#hpUseridError").hide();
		$("span#hpUseridSuccess").hide();
	
		$("#hpUserid").blur(function(){
		
			if($("input#hpUserid").val().trim() == "") {	// 데이터가 없다면
				$("span#hpUseridSuccess").hide();
				$("span#hpUseridError").show();
				$("input#hpUserid").addClass("wrong"); 
			} else {	// 데이터가 있다면
				// 정규표현식
		        var regExp = /^[A-Za-z0-9]{5,10}$/;	// 5자 이상 10글자 이하의 영문과 숫자를 조합
		        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
		        //console.log($("input#hpUserid").val());
		        
				if(!bool) {  // 데이터가 조건에 맞지않으면
					$("span#hpUseridSuccess").hide();
					$("span#hpUseridError").html("영문,숫자 조합으로 5~10자리만 입력 가능합니다.").show();
					$("input#hpUserid").addClass("wrong");
					hpCondition2 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					//$("span#hpUseridSuccess").html("아이디 중복검사를 하세요 제발 plz").show();
					$("input#hpUserid").removeClass("wrong");
					hpCondition2 = true;
					
					$.ajax({	
						url:"<%= ctxPath%>/hpIdChk.sd",
						type:"POST",
						data:{"hpUserid":$("#hpUserid").val()},
						dataType:"json",
						success:function(json){
							if(json.isUse) {	// X 데이터가 중복된다면 X false
								$("span#hpUseridError").html($("#hpUserid").val()+"은(는) 이미 사용 중이거나, 탈퇴한 아이디로 사용 불가능합니다.").show();
								$("span#hpUseridSuccess").hide();
							} else {	// O 데이터가 중복되지않는다면 O true
								if(hpCondition2 == false){ // 정규표현식이 틀리다면
									$("span#hpUseridError").html("조건 맞춰주세요ㅅㅂ").show();
									$("span#hpUseridSuccess").hide();
									$("input#hpUserid").addClass("wrong");
								} else if(hpCondition2 == true) {	// 정규표현식이 맞다면
									$("span#hpUseridSuccess").html("사용 가능한 아이디 입니다.").show();
									$("span#hpUseridError").hide();
								}
							}
						},
						error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
						}
					});
				}
	
				$("span#hpUseridError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		});
		
<%-- 		/// **** AJAX로 id중복확인하기  ****///
		$("#hpIdCheck").click(function() {
			
			if($("input#hpUserid").val().trim() == "") {	// 데이터 없을 때 중복검사를 하면
				alert('아이디를 입력하세요.');
			} else {	// 데이터 있을 때 중복검사를 하면
				$.ajax({	
					url:"<%= ctxPath%>/hpIdChk.sd",
					type:"POST",
					data:{"hpUserid":$("#hpUserid").val()},
					dataType:"json",
					success:function(json){
						if(json.isUse) {	// X 데이터가 중복된다면 X false
							$("span#hpUseridError").html($("#hpUserid").val()+"은(는) 이미 사용 중이거나, 탈퇴한 아이디로 사용 불가능합니다.").show();
							$("span#hpUseridSuccess").hide();
						} else {	// O 데이터가 중복되지않는다면 O true
							if(hpCondition2 == false){ // 정규표현식이 틀리다면
								$("span#hpUseridError").html("조건 맞춰주세요ㅅㅂ").show();
								$("span#hpUseridSuccess").hide();
								hpIdOK = false;
							} else if(hpCondition2 == true) {	// 정규표현식이 맞다면
								$("span#hpUseridSuccess").html("사용 가능한 아이디 입니다.").show();
								$("span#hpUseridError").hide();
								hpIdOK  = true;
							}
						}
					},
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
				});
			}
		});
 --%>		
 
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 비밀번호
		$("span#hpPwdError").hide();
		$("span#hpPwdSuccess").hide();
	
		$("#hpPwd").blur(function(){
		
			if($("input#hpPwd").val().trim() == "") {	// 데이터가 없다면
				$("span#hpPwdSuccess").hide();
				$("span#hpPwdError").show();
				$("input#hpPwd").addClass("wrong");
				
			} else {	// 데이터가 있다면
				// 정규표현식
		        var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;	//  8~15자리 이하의 숫자,문자,특수문자 조합 
		        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
				
				if(!bool) {  // 데이터가 조건에 맞지않으면
					$("span#hpPwdSuccess").hide();
					$("span#hpPwdError").html("숫자,문자,특수문자 조합으로 8~15자리만 입력 가능합니다.").show();
					$("input#hpPwd").addClass("wrong");  
					hpCondition3 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					$("span#hpPwdSuccess").show();
					$("input#hpPwd").removeClass("wrong");
					hpCondition3 = true;
				}
				$("span#hpPwdError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		});

		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 이름
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
					hpCondition4 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					$("input#hpName").removeClass("wrong");
					hpCondition4 = true;
				}
				$("span#hpNameError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		});
		

		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 이메일 
		$("span#hpEmailError").hide();
		$("span#hpEmailSuccess").hide();
		
		$("#hpEmail").blur(function(){
			
			if($("input#hpEmail").val().trim() == "") {	// 데이터가 없다면
				$("span#hpEmailSuccess").hide();
				$("span#hpEmailError").show();
				$("input#hpEmail").addClass("wrong");
			} else {	// 데이터가 있다면
				// 정규표현식
				var email = $("#hpEmail").val();
				var regExp_EMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				var bool = regExp_EMAIL.test(email); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
				
				if(!bool) {  // 데이터가 조건에 맞지않으면
					$("span#hpEmailSuccess").hide();
					$("span#hpEmailError").html("이메일 형식에 맞게 입력해주세요.").show();
					$("input#hpEmail").addClass("wrong");  
					hpCondition5 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					$("span#hpEmailSuccess").html("이메일 중복검사를 하세요 제발 plz").show();
					$("input#hpEmail").removeClass("wrong");
					hpCondition5 = true;
				}
				$("span#hpEmailError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		}); 
		
		/// **** AJAX로 email중복확인하기  ****///
		$("#hpEmailCheck").click(function() {
			
			if($("input#hpEmail").val().trim() == "") {	// 데이터 없을 때 중복검사를 하면
				alert("이메일을 입력하세요.");
			} else { // 데이터 있을 때 중복검사를 하면
				$.ajax({
					url:"<%=ctxPath%>/hpEmailChk.sd",
					type:"POST",
					data:{"hpEmail":$("#hpEmail").val()},
					dataType:"json",
					success:function(json){
						if(json.isUse) {	// X 데이터가 중복된다면 X false
							$("span#hpEmailError").html($("#hpEmail").val()+"은(는) 이미 사용 중이거나, 탈퇴한 이메일로 사용 불가능합니다.").show();
							$("span#hpEmailSuccess").hide();
						} else {	// O 데이터가 중복되지않는다면 O true
							if(hpCondition5 == false){ // 정규표현식이 틀리다면
								$("span#hpEmailError").html("조건 맞춰주세요ㅅㅂ").show();
								$("span#hpEmailSuccess").hide();
								hpEmailOK = false;
							} else if(hpCondition5 == true) {	// 정규표현식이 맞다면
								$("span#hpEmailSuccess").html("사용 가능한 이메일 입니다.").show();
								$("span#hpEmailError").hide();
								hpEmailOK = true;
							}
						}
					},
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
				});
			}
		});
		
	});	
	// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 병원///약관동의 
	//------------------- 가입버튼 클릭 시 안 적은 항목이 있다면 알려주자~! ------------------- //
	function hpGoRegister() {
		  
		var bFlag = false;
	
		if($("#businessNumber").val().trim()=="" || hpCondition1 == false) {
			alert("사업자등록번호를 확인하세요.");
			$("#businessNumber").focus();
			return;
		}
		if($("#hpUserid").val().trim()=="" || hpCondition2 == false) {
			alert("아이디를 확인하세요.");
			$("#hpUserid").focus();
			return;
		}
		if(!hpIdOK || hpIdOK == false) {
			alert("아이디 중복검사를 하세요.");
			$("#hpUserid").focus();
			return;
		}		
		if($("#hpPwd").val().trim()=="" || hpCondition3 == false) {
			alert("비밀번호를 확인하세요.");
			$("#hpPwd").focus();
			return;
		}
		if($("#hpName").val().trim()=="" || hpCondition4 == false) {
			alert("담당자 이름을 확인하세요.");
			$("#hpName").focus();
			return;
		}
		if($("#hpEmail").val().trim()=="" || hpCondition5 == false) {
			alert("이메일을 확인하세요.");
			$("#hpEmail").focus();
			return;
		}
		if(!hpEmailOK || hpEmailOK == false) {
			alert("이메일 중복검사를 하세요.");
			$("#email").focus();
			return;
		}
		if( !$("input:checkbox[id=hpAgree]").prop("checked") ) {
			alert("이용약관에 동의하세요.");
			$("#hpAgree").focus();
			return;
		} 
		var bRequiredInfo = false;
		$(".requiredInfo").each(function(){
			var data = $(this).val().trim();
			if(data == "") {
				bRequiredInfo = true;
				$(this).focus();
				return false;
			}
		}); 
		if(!bRequiredInfo) {
		var frm = document.registerFrm;
			frm.method = "POST";
			frm.action = "register.sd";
			frm.submit();
		} 
	}
	
</script>



</head>

<div class="container">
   
	<h2 class="textPrimary">회원가입</h2>
	
	<div class="bowl">
	   
		<div id="tab" align="center">	
			<a href="#" class="buttonOn" id="memTab" role="button" title="개인회원 로그인">개인회원가입</a>
	        <a href="#" class="buttonOff" id="hpMemTab" role="button" title="병원관계자 로그인">병원회원가입</a>
		</div>
	   
		<!-- -------------------------------- 上 끝 ---------------------------------- --> 
	   
		<form name="registerFrm">
			<div id="box">
			
				<div class="individualMember"> 
					<div class="formGroup">
						<label for="userid" style="display: block;">아이디</label>
			         	<input type="text" name="userid" id="userid" class="requiredInfo" autofocus placeholder="5자 이상으로 입력하세요"/>
			         	<!-- 아이디 중복 체크
			        	<input type="button" id="idCheck" value="중복검사" style="width: 95px; height: 35px;"/>  -->
			         	<span class="error" id="useridError">아이디를 입력하세요.</span>
			        	<span class="success" id="useridSuccess">사용 가능한 아이디 입니다.</span> 
			
			         	<label for="pwd">비밀번호</label>
			         	<input type="password" name="pwd" id="pwd" class="requiredInfo" placeholder="대소문자, 특수문자 조합하여 8자 이상으로 입력하세요" />
			         	<span class="error" id="pwdError">비밀번호를 입력하세요.</span>
			         	<span class="success" id="pwdSuccess">사용 가능한 비밀번호 입니다.</span> 
			
			         	<label for="name">이름</label>
			         	<input type="text" name="name" id="name" class="requiredInfo" /> 
			         	<span class="error" id="nameError">이름을 입력하세요.</span>
		
			         	<label for="birthday">생년월일</label>
			         	<!-- <input type="number" name="birthday" id="birthday" class="requiredInfo" placeholder="YYYYMMDD"/>  -->
			         	<div class="birthday">
							<input type="text" name="birthYY" id="birthYY" class="requiredInfo" value="" size="4" maxlength="4" placeholder="YYYY">
			             	<div class="bar">년</div>
			             	<input type="text" name="birthMM" id="birthMM" class="requiredInfo" value="" size="2" maxlength="2" placeholder="MM">
			             	<div class="bar">월</div>
			             	<input type="text" name="birthDD" id="birthDD" class="requiredInfo" value="" size="2" maxlength="2" placeholder="DD">
							<div class="bar">일</div>
						</div>
						<span class="error" id="birthdayError">생년월일을 입력하세요.</span>
			         
			         	<label for="gender">성별</label>
						<div class="gender" >
							<input type="radio" class="gender" name="gender" value="0" id="female"/>
				            <label for="female" class="textPosition">여자</label>
				            <input type="radio" class="gender" name="gender" value="1" id="male"/>
				            <label for="male" class="textPosition">남자</label>
			            </div>
				        <!-- <span class="error" id="genderError">성별을 선택하세요.</span> -->
				         	         	
				        <label for="email" style="display: block;">이메일</label>
				        <input type="email" name="email" id="email" class="requiredInfo" placeholder="E-mail을 입력하세요" style="width: 75%;" /> 
				        <!-- 이메일 중복 체크 -->
			        	<input type="button" id="emailCheck" value="중복검사" style="width: 95px; height: 35px;"/>
				        <span class="error" id="emailError" >이메일 형식에 맞지 않습니다.</span> 
						<span class="success" id="emailSuccess">사용 가능한 이메일 입니다.</span> 
				        
				        <div id="div_btnFind">
							<label for="email2" style="display: block;">인증확인</label>
							<input type="text" name="email2" id="email2" class="requiredInfo" placeholder="E-mail로 발송된 인증번호를 입력하세요" style="width: 75%;" />
							<input type="button" id="btnFind" value="인증하기" style="width: 95px; height: 35px;"/>
						</div>		
						<span class="error" id="goCode" >${email}로 인증번호가 발송되었습니다.<br/>이메일로 전달받은 인증번호를 입력해주세요</span>
						<span class="error" id="codeError" style="color: red;">메일발송이 실패했습니다.</span>  						
				        
				      
							<%-- <div id="div_findResult">
								<div id="div_btnFind">
									<label for="email2" style="display: block;">인증확인</label>
									<input type="text" name="email2" id="email2" class="requiredInfo" placeholder="E-mail로 발송된 인증번호를 입력하세요" style="width: 75%;" />
									<input type="button" id="btnFind" value="인증하기" style="width: 95px; height: 35px;"/>
								</div>					   		
							
								<span class="error" id="goCode" >${email}로 인증번호가 발송되었습니다.<br/>이메일로 전달받은 인증번호를 입력해주세요</span>
								<span class="error" id="codeError" style="color: red;">메일발송이 실패했습니다.</span>  							
							</div>    --%>
	<!--   
	   						<div id="div_btnFind" align="center">
								<label for="email2" style="display: block;">인증확인</label>
								<input type="text" name="email2" id="email2" class="requiredInfo" placeholder="E-mail로 발송된 인증번호를 입력하세요" style="width: 75%;" />
								<input type="button" id="btnFind" value="인증하기" style="width: 95px; height: 35px;"/>
							</div>	
	   
	    -->
    					
   
   	       
				        <label for="hp">전화번호</label>
				        <input type="tel" id="hp" name="hp" maxlength="11" class="requiredInfo" placeholder="'-'없이 입력하세요" />
				        <span class="error" id="hpError">휴대폰 형식이 아닙니다.</span>
				
				        <label for="agree">약관 동의 &nbsp;&nbsp;<input type="checkbox" id="agree" /> </label>
				        <div style="text-align: center; vertical-align: middle;">
				           <iframe src="../iframeAgree/agree.html" width="100%" height="150px" class="box" ></iframe>
				        </div>
					</div>
					
					<div class="btnJoin">
						<input type="button" id="btnRegister" value="가입하기" onClick="goRegister();" />
					</div> 			 
				</div>
				
		<!-- -------------------------------- 일반고객 회원가입 끝 ---------------------------------- --> 
			 
				<div class="hospitalMember"> 
					<div class="formGroup" >
						<label for="businessNumber">사업자등록번호</label>
			         	<input type="text" name="businessNumber" id="businessNumber" class="requiredInfo" maxlength="10" autofocus placeholder="'-'없이 10자로입력하세요" />
			         	<span class="error" id="businessNumberError">사업자등록번호를 입력 하세요.</span>
			      
				        <label for="hpUserid" style="display: block;">아이디</label>
				        <input type="text" name="hpUserid" id="hpUserid" class="requiredInfo" placeholder="5자 이상으로 입력하세요"/>
			         	<!-- 아이디 중복 체크
			        	<input type="button" id="hpIdCheck" value="중복검사" style="width: 95px; height: 35px;"/> -->
				        <span class="error" id="hpUseridError">아이디를 입력 하세요.</span>
				        <span class="success" id="hpUseridSuccess">사용 가능한 아이디 입니다.</span> 
				
				        <label for="hpPwd">비밀번호</label>
				        <input type="password" name="hpPwd" id="hpPwd" class="requiredInfo" placeholder="대소문자, 특수문자 조합하여 8자 이상으로 입력하세요" />
				        <span class="error" id="hpPwdError">비밀번호를 입력 하세요.</span>
				        <span class="success" id="hpPwdSuccess">사용 가능한 비밀번호 입니다.</span> 
				
				        <label for="hpName">담당자 이름</label>
				        <input type="text" name="hpName" id="hpName" class="requiredInfo" /> 
				        <span class="error" id="hpNameError">담당자 이름을 입력 하세요.</span>
				
				        <label for="hpEmail" style="display: block;">이메일</label>
				        <input type="email" name="hpEmail" id="hpEmail" class="requiredInfo" placeholder="E-mail을 입력하세요" style="width: 75%;" /> 
				        <!-- 이메일 중복 체크 -->
			        	<input type="button" id="hpEmailCheck" value="중복검사" style="width: 95px; height: 35px;"/>
				        <span class="error" id="hpEmailError">이메일 형식에 맞지 않습니다.</span>
				        <span class="success" id="hpEmailSuccess">사용 가능한 이메일 입니다.</span>
						
						<div id="div_findResult" align="center">
							<span style="font-size: 10pt;">인증코드가 ${email}로 발송되었습니다.</span><br/>  
					   	   	<span style="font-size: 10pt;">인증코드를 입력해주세요</span><br/>
					   	   	<input type="text" name="input_confirmCode" id="input_confirmCode" required />
					   	  	<br/><br/>
					   	   	<button type="button" class="btn btn-info" id="btnConfirmCode">인증하기</button>
					   </div>
						
				        <label for="hpAgree">약관 동의 &nbsp;&nbsp;<input type="checkbox" id="hpAgree" /> </label>
				        <div style="text-align: center; vertical-align: middle;">
			            <iframe src="../iframeAgree/agree.html" width="100%" height="150px" class="box" ></iframe>
						</div>
					</div>	 
					
					<div class="hpBtnJoin">
						<input type="button" id="hpBtnRegister" value="가입하기" onClick="hpGoRegister();" />
					</div> 			 	
			 	</div>
			 	
		<!-- -------------------------------- 병원고객 회원가입 끝 ---------------------------------- --> 
	
			</div>
		</form>
		
<form name="verifyCertificationFrm">
	<input type="text" name="userid" />
	<input type="text" name="userCertificationCode" />
</form>


	</div>
</div>    