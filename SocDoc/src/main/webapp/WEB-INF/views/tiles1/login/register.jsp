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
    input[type=button] {
    	color: #fff;
    	background-color: #58ACFA;
	    border: solid 0px #ccc;
    }
    
    .requiredInfo, .hpRequiredInfo {
		width: 100%;
		height: 35px;
		padding-left: 10px;
		box-sizing: border-box;
		border: solid 1px #ccc;
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
	
	.textPrimary {
		margin-bottom: 5px;
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
	
	.birthDate {
		overflow : hidden;
	    box-sizing: border-box;
	    border: solid 1px #ccc;
	}
	
	.birthDate input[type=text] {
		float: left;
	    width: 100px;
	    height: 35px;
	    padding-left:4px;
	    text-align: center;
	    border: 0;
	}
	
	div.bar {
		display: inline-block;
		//width: 20px;
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
	var emailOK = false;
	// 이메일 인증 성공 여부
	var certification = false;
	
	// 버튼재인증
	var btnChange = false;
	
	
	$(document).ready(function(){
		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 아이디
		$("span#useridError").hide();
		$("span#useridSuccess").hide();
	
		$("form[name=registerFrm] #userid").keyup(function(){
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ).trim() ); // 한글 막기
			if($("form[name=registerFrm] input#userid").val().trim() == "") {	// 데이터가 없다면
				$("span#useridSuccess").hide();
				$("span#useridError").show();
				$("form[name=registerFrm] input#userid").addClass("wrong"); 
			} else {	// 데이터가 있다면
				// 정규표현식
				var regExp = /^[A-Za-z0-9]{5,10}$/;	// 5자 이상 10글자 이하의 영문과 숫자를 조합
		        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
		        
				if(!bool) {  // 데이터가 조건에 맞지않으면
					$("span#useridSuccess").hide();
					$("span#useridError").html("영문,숫자 조합으로 5~10자리만 입력 가능합니다.").show();
					$("form[name=registerFrm] input#userid").addClass("wrong");  
					condition1 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					$("form[name=registerFrm] input#userid").removeClass("wrong");
					condition1 = true;
					
					$.ajax({ // 아이디 중복검사
						url:"<%=ctxPath%>/idChk.sd",
						type:"POST",
						data:{"userid":$("form[name=registerFrm] #userid").val()},
						dataType:"json",
						success:function(json){
							if(json.isUse) {	// X 데이터가 중복된다면 X false
								$("span#useridError").html($("form[name=registerFrm] #userid").val()+"은(는) 이미 사용 중이거나, 탈퇴한 아이디로 사용 불가능합니다.").show();
								$("span#useridSuccess").hide();
							} else {	// O 데이터가 중복되지않는다면 O true
								if(condition1 == true) {	// 정규표현식이 맞다면
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
		
		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 비밀번호
		$("span#pwdError").hide();
		$("span#pwdSuccess").hide();
	
		$("form[name=registerFrm] #pwd").keyup(function(){
		
			if($("form[name=registerFrm] input#pwd").val().trim() == "") {	// 데이터가 없다면
				$("span#pwdSuccess").hide();
				$("span#pwdError").show();
				$("form[name=registerFrm] input#pwd").addClass("wrong");
			} else {	// 데이터가 있다면
				// 정규표현식
		        var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;	//  8~15자리 이하의 숫자,문자,특수문자 조합 
		        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
				
				if(!bool) {  // 데이터가 조건에 맞지않으면
					$("span#pwdSuccess").hide();
					$("span#pwdError").html("숫자,문자,특수문자 조합으로 8~15자리만 입력 가능합니다.").show();
					$("form[name=registerFrm] input#pwd").addClass("wrong");  
					condition2 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					$("span#pwdSuccess").show();
					$("form[name=registerFrm] input#pwd").removeClass("wrong");
					condition2 = true;
				}
				$("span#pwdError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		});
	
		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 이름
		$("span#nameError").hide();
	
		$("form[name=registerFrm] #name").keyup(function(){
		
			if($("form[name=registerFrm] input#name").val().trim() == "") {	// 데이터가 없다면
				$("span#nameError").show();
				$("form[name=registerFrm] input#name").addClass("wrong");
			} else {	// 데이터가 있다면
				// 정규표현식
		        var regExp = /^[가-힣]{2,4}$/;	//  2~4글자 한글만 
		        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
				
		        if(!bool) {  // 데이터가 조건에 맞지않으면
					$("span#nameError").show();
					$("form[name=registerFrm] input#name").addClass("wrong");
					condition3 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					$("form[name=registerFrm] input#name").removeClass("wrong");
					condition3 = true;
				}
				$("span#nameError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		});
	
		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 생년월일
		$("span#birthdateError").hide();
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
				$(".birthDate").addClass('wrong');
				$("span#birthdateError").html("연도를 정확하게 입력해주세요").show();
				return;
			}
			// 월
			var monthValue = $("#birthMM").val();
			if (!monthRegex.test(monthValue)) {
				// error , return
				$(".birthDate").addClass('wrong');
				$("span#birthdateError").html("월을 정확하게 입력해주세요").show();
				return;
			}
			// 일
			var dateValue = $("#birthDD").val();
			if (!dateRegex.test(dateValue)) {
				// error , return
				$(".birthDate").addClass('wrong');
				$("span#birthdateError").html("일을 정확하게 입력해주세요").show();
				return;
			}
			var userYearInt = parseInt(yearValue);
			var userMonthInt = parseInt(monthValue);
			var userDayInt = parseInt(dateValue);
			var userInputDate = new Date(userYearInt, userMonthInt, userDayInt);
			var today = new Date();
	
			var userAge = Math.floor((today - userInputDate) / (1000 * 60 * 60 * 24 * 365));
			//console.log('userAge', userAge);
	
			// 미래
			if (userAge < 0) {
				// error, return
				$(".birthDate").addClass('wrong');
				$("span#birthdateError").html("정확한 날짜로 입력해주세요").show();
				return;
			}
			
			// 모두 맞으면
			$(".birthDate").addClass('wrong');
			$("span#birthdateError").html("").hide();
			$(".birthDate").prop("disabled",false).removeClass("wrong"); 
		}
	
		
		//  ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 이메일
		$("span#emailError").hide();
		$("span#emailSuccess").hide();
		$("#email2").hide();
		$("#btnFind2").hide();
		$("#btnFindNext").hide();
		$("span#emailCkError").hide();
		$("span#emailCkSuccess").hide();
		$("#btnFind3").hide();
		
		$("form[name=registerFrm] #email").keyup(function(){
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ).trim() ); // 한글 막기
			if($("form[name=registerFrm] input#email").val().trim() == "") {	// 데이터가 없다면
				$("span#emailSuccess").hide();
				$("span#emailError").show();
				$("form[name=registerFrm] input#email").addClass("wrong");
				$("form[name=registerFrm] #div_btnFind").hide();
			} else {	// 데이터가 있다면
				// 정규표현식
				var email = $("form[name=registerFrm] #email").val();
				var regExp_EMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				var bool = regExp_EMAIL.test(email); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
				
				if(!bool) {  // 데이터가 조건에 맞지않으면
					$("span#emailSuccess").hide();
					$("span#emailError").html("이메일 형식에 맞게 입력해주세요.").show();
					$("form[name=registerFrm] input#email").addClass("wrong"); 
					condition4 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					$("form[name=registerFrm] input#email").removeClass("wrong");
					condition4 = true;
					
					$.ajax({
						url:"<%=ctxPath%>/emailChk.sd",
						type:"POST",
						data:{"email":$("form[name=registerFrm]  #email").val()},
						dataType:"json",
						success:function(json){
							if(json.isUse) {	// X 데이터가 중복된다면 X false
								$("span#emailError").html($("form[name=registerFrm] #email").val()+"은(는) 이미 사용 중이거나, 탈퇴한 이메일로 사용 불가능합니다.").show();
								$("span#emailSuccess").hide();
							} else {	// O 데이터가 중복되지않는다면 O true
								if(condition4 == true) {	// 정규표현식이 맞다면
									$("span#emailSuccess").html("사용 가능한 이메일 입니다.").show();
									$("span#emailError").hide();
									emailOK = true;
								}
							}
						},
						error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
						}
					});
				}
				$("span#emailError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		}); 
		
		// 이메일 '인증하기' 버튼 눌렀을 때..///////////////////////////////
		$("form[name=registerFrm] #btnFind").click(sendVerificationCode);	
		///////////////////////////////////////////////////////////
		
		var method = "${method}";
		var email = "${email}";
		if(method=="POST") {
			$("form[name=registerFrm] #email").val(email);
			$("form[name=registerFrm] #div_btnFind").hide();
		} else {
			$("form[name=registerFrm] #div_btnFind").show();
		}
		
		// 이메일 '인증확인하기'버튼 눌렀을 때..///////////////////////////// 
  		$("form[name=registerFrm] #btnFind2").click(function() {
  			disabled=false; // 버튼 비활성화
  			
			$.ajax({	
				url:"<%= ctxPath%>/verifyCertificationFrm.sd",
				type:"POST",
				data:{"userCertificationCode" : $("#email2").val().trim()},
				dataType:"json",
				success:function(json){
					//console.log(json.isbool)
					if(json.isbool){
						console.log("!!!메일인증성공!!!");
						$("#emailCkSuccess").html("인증 성공. 회원가입을 진행하세요.").show();
						$("form[name=registerFrm] input#email2").removeClass("wrong");
						$("span#emailCkSuccess").hide();
						$("#btnFind2").hide();
						$("#btnFind3").show();
						certification = true;
						$("#btnFind3").click(function(){ // 인증성공 후 '인증확인' 버튼 재클릭 시 막아버리기
							disabled = 'disabled';
							alert("해당 이메일은 인증 확인이 되었습니다. 다음 단계로 넘어가세요");
						});
					} else {
						console.log("!!!메일인증실패!!!");
						$("#emailCkError").html("인증 실패. 다시 시도해주세요.").show();
						$("input#email2").addClass("wrong");
						certification = false;
					}
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			}); 
		});	
		/////////////////////////////////////////////////////////////// 
		
		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 휴대폰 
		$("span#phoneError").hide();
		
		$("#phone").keyup(function(event){
					
			// 숫자만 입력
			var keycode = event.keyCode;
	        if( !((48 <= keycode && keycode<=57) || (96<=keycode && keycode<=105) || (keycode==8))){
	            var word = $(this).val().length;
	            var keyValue = $(this).val().substring(0,word-1);
	            $(this).val(keyValue);
	        }
	        if($("input#phone").val().trim() == "") {	// 데이터가 없다면
				$("span#phoneError").show();
				$("input#phone").addClass("wrong");
			} else {	// 데이터가 있다면
				// 정규표현식
				var regExp = $(this).val( $(this).val().replace(/[^0-9]/g,"").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--","-") );
				var bool = regExp.val(); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
				
				if(!bool || bool.length < 13) { // 데이터가 조건에 맞지 않는다면
					$("span#phoneError").html("휴대폰 형식에 맞게 입력해주세요.").show();
					$("input#phone").addClass("wrong"); 
					condition5 = false;
					return;
				} else { // 데이터가 조건에 맞다면
					$("input#phone").removeClass("wrong");
					condition5 = true;
				}
				$("span#phoneError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		});
	});
	
	// 이메일 '인증하기'버튼 눌렀을 때 
	function sendVerificationCode(){
		
		if(emailOK == true){
			$("#email2").show();
			$("#btnFind2").show();
			$("#emailCkError").hide();
			$("#emailCkSuccess").hide();
			$("#btnFind3").hide();
			disabled = false;
			$("#email2").val(''); // 입력칸 비우기
			$("#email2").focus();
			$.ajax({	
				url:"<%= ctxPath%>/emailCode.sd",
				type:"POST",
				data:{"email":$("#email").val().trim()},
				dataType:"json",
				success:function(json){
					//console.log(json.isSent);
					console.log("!!!!!!!!!!!!!!!!!!!!발송성공!!!!!!!!!!!!!!!!!!!!");
					alert("입력하신 이메일("+$("form[name=registerFrm] #email").val()+")로 인증번호가 발송되었습니다.\n전달받은 인증번호를 입력해주세요");					
					var btnChange = true;
					if(btnChange == true){
						$("#btnFind").hide();
						$("#btnFindNext").show();
					} 
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					$("input#email").addClass("wrong");
					$("#emailCkError").html("메일발송이 실패했습니다. 다시 시도해주세요.").show();
				}
			}); 
		} else {
			alert('이메일을 알맞게 입력해주세요.');
		}
	
	}
	
	
	
	// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 회원///성별/약관동의 
	//------------------- 가입버튼 클릭 시 안 적은 항목이 있다면 알려주자~! ------------------- //
	function goRegister() {
		  
		var bFlag = false;
		
		if($("form[name=registerFrm] #userid").val().trim()=="" || condition1 == false) {
			alert("아이디를 확인하세요.");
			$("form[name=registerFrm] #userid").focus();
			return;
		}
		if($("form[name=registerFrm] #pwd").val().trim()=="" || condition2 == false) {
			alert("비밀번호를 확인하세요.");
			$("form[name=registerFrm] #pwd").focus();
			return;
		}
		if($("form[name=registerFrm] #name").val().trim()=="" || condition3 == false) {
			alert("이름을 확인하세요.");
			$("form[name=registerFrm] #name").focus();
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
				//console.log(bChecked);
				bFlag = true;
				return false;
			} 
	   	}); 
		if(!bFlag) {
			alert("성별을 확인하세요.");
			$("#gender").focus();
			return;
		}
		if($("form[name=registerFrm] #email").val().trim()=="" || condition4 == false) {
			alert("이메일을 확인하세요.");
			$("#email").focus();
			return;
		}
 		if(!certification || certification == false) {
			alert("이메일 인증을 완료하세요.");
			$("form[name=registerFrm] #email").focus();
			return;
		} 
		if($("#phone").val().trim()=="" || condition5 == false) {
			alert("전화번호를 확인하세요.");
			$("#phone").focus();
			return;
		}
		if( !$("input:checkbox[id=agree]").prop("checked") ) {
			alert("이용약관에 동의하세요.");
			$("#agree").focus();
			return;
		} 
		var bRequiredInfo = false;
		var data="";
		$(".requiredInfo").each(function(){
			var data = $(this).val().trim();
			if(data == "") {
				bRequiredInfo = true;
				console.log("data가 비어있음");
				console.log($(this));
				$(this).focus();
				return false;
			}
		}); 
		
		console.log(bRequiredInfo);
		if(!bRequiredInfo) {
			var frm = document.registerFrm;
			frm.birthDate.value = frm.birthYY.value + "-" + frm.birthMM.value + "-" + frm.birthDD.value;
			console.log(frm.birthDate.value);
			frm.method = "POST";
			frm.action = "<%=ctxPath%>/registerEnd.sd";
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
	var hpEmailOK = false;
	// 이메일 인증 성공 여부
	var hpCertification = false;
	
	
	$(document).ready(function(){	
		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 사업자등록번호
		$("span#regIdError").hide();
	
		$("#regId").keyup(function(){
			
			// 숫자만 입력
			var keycode = event.keyCode;
	        if( !((48 <= keycode && keycode<=57) || (96<=keycode && keycode<=105) || (keycode==8))){
	            var word = $(this).val().length;
	            var keyValue = $(this).val().substring(0,word-1);
	            $(this).val(keyValue);
	        }
			if($("input#regId").val().trim() == "") {	// 데이터가 없다면
				$("span#regIdError").show();
				$("input#regId").addClass("wrong"); 
			} else {	// 데이터가 있다면
				// 정규표현식
		        var regExp = $(this).val( $(this).val().replace(/[^0-9]/g,"").replace(/^([0-9]{3})([0-9]{2})([0-9]{5})?/,"$1-$2-$3").replace("--","-") );
				var bool = regExp.val(); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
		
				if(!bool || bool.length < 12) {  // 데이터가 조건에 맞지않으면
					$("span#regIdError").html("올바른 사업자번호가 아닙니다.").show();
					$("input#regId").addClass("wrong");  
					return;
					hpCondition1 = false;
				} else {	// 데이터가 조건에 맞다면
					$("input#regId").removeClass("wrong");
					hpCondition1 = true;
				}
				$("span#regIdError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		});	

		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 아이디
		$("span#hpUseridError").hide();
		$("span#hpUseridSuccess").hide();
	
		$("form[name=hpRegisterFrm] #userid").keyup(function(){
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) ); // 한글 막기
			if($("form[name=hpRegisterFrm] input#userid").val().trim() == "") {	// 데이터가 없다면
				$("span#hpUseridSuccess").hide();
				$("span#hpUseridError").show();
				$("form[name=hpRegisterFrm] input#userid").addClass("wrong"); 
			} else {	// 데이터가 있다면
				// 정규표현식
		        var regExp = /^[A-Za-z0-9]{5,10}$/;	// 5자 이상 10글자 이하의 영문과 숫자를 조합
		        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
		        
				if(!bool) {  // 데이터가 조건에 맞지않으면
					$("span#hpUseridSuccess").hide();
					$("span#hpUseridError").html("영문,숫자 조합으로 5~10자리만 입력 가능합니다.").show();
					$("input#userid").addClass("wrong");
					hpCondition2 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					$("form[name=hpRegisterFrm] input#userid").removeClass("wrong");
					hpCondition2 = true;
					
					$.ajax({	
						url:"<%= ctxPath%>/hpIdChk.sd",
						type:"POST",
						data:{"userid":$("form[name=hpRegisterFrm] #userid").val()},
						dataType:"json",
						success:function(json){
							if(json.isUse) {	// X 데이터가 중복된다면 X false
								$("span#hpUseridError").html($("form[name=hpRegisterFrm] #userid").val()+"은(는) 이미 사용 중이거나, 탈퇴한 아이디로 사용 불가능합니다.").show();
								$("span#hpUseridSuccess").hide();
							} else {	// O 데이터가 중복되지않는다면 O true
								if(hpCondition2 == true) {	// 정규표현식이 맞다면
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

		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 비밀번호
		$("span#hpPwdError").hide();
		$("span#hpPwdSuccess").hide();
	
		$("form[name=hpRegisterFrm] #pwd").keyup(function(){
		
			if($("form[name=hpRegisterFrm] input#pwd").val().trim() == "") {	// 데이터가 없다면
				$("span#hpPwdSuccess").hide();
				$("span#hpPwdError").show();
				$("form[name=hpRegisterFrm] input#pwd").addClass("wrong");
			} else {	// 데이터가 있다면
				// 정규표현식
		        var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;	//  8~15자리 이하의 숫자,문자,특수문자 조합 
		        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
				
				if(!bool) {  // 데이터가 조건에 맞지않으면
					$("span#hpPwdSuccess").hide();
					$("span#hpPwdError").html("숫자,문자,특수문자 조합으로 8~15자리만 입력 가능합니다.").show();
					$("form[name=hpRegisterFrm] input#pwd").addClass("wrong");  
					hpCondition3 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					$("span#hpPwdSuccess").show();
					$("form[name=hpRegisterFrm] input#pwd").removeClass("wrong");
					hpCondition3 = true;
				}
				$("span#hpPwdError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		});

		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 이름
		$("span#hpNameError").hide();
	
		$("form[name=hpRegisterFrm] #name").keyup(function(){
		
			if($("form[name=hpRegisterFrm] input#name").val().trim() == "") {	// 데이터가 없다면
				$("span#hpNameError").show();
				$("form[name=hpRegisterFrm] input#name").addClass("wrong");
			} else {	// 데이터가 있다면
				// 정규표현식
		        var regExp = /^[가-힣]{2,4}$/;	//  2~4글자 한글만 
		        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
				
		        if(!bool) {  // 데이터가 조건에 맞지않으면
					$("span#hpNameError").show();
					$("form[name=hpRegisterFrm] input#name").addClass("wrong");
					hpCondition4 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					$("form[name=hpRegisterFrm] input#name").removeClass("wrong");
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
		$("#hpEmail2").hide();
		$("#hpBtnFind2").hide();
		$("#hpBtnFindNext").hide();
		$("span#hpEmailCkError").hide();
		$("span#hpEmailCkSuccess").hide();
		$("#hpBtnFind3").hide();
		
		$("form[name=hpRegisterFrm] #email").keyup(function(){
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ).trim() ); // 한글 막기
			if($("form[name=hpRegisterFrm] input#email").val().trim() == "") {	// 데이터가 없다면
				$("span#hpEmailSuccess").hide();
				$("span#hpEmailError").show();
				$("form[name=hpRegisterFrm] input#email").addClass("wrong");
			} else {	// 데이터가 있다면
				// 정규표현식
				var email = $("form[name=hpRegisterFrm] #email").val();
				var regExp_EMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				var bool = regExp_EMAIL.test(email); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
				
				if(!bool) {  // 데이터가 조건에 맞지않으면
					$("span#hpEmailSuccess").hide();
					$("span#hpEmailError").html("이메일 형식에 맞게 입력해주세요.").show();
					$("form[name=hpRegisterFrm] input#email").addClass("wrong");  
					hpCondition5 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					$("form[name=hpRegisterFrm] input#email").removeClass("wrong");
					hpCondition5 = true;
					
					$.ajax({
						url:"<%=ctxPath%>/hpEmailChk.sd",
						type:"POST",
						data:{"email":$("form[name=hpRegisterFrm] #email").val()},
						dataType:"json",
						success:function(json){
							if(json.isUse) {	// X 데이터가 중복된다면 X false
								$("span#hpEmailError").html($("form[name=hpRegisterFrm] #email").val()+"은(는) 이미 사용 중이거나, 탈퇴한 이메일로 사용 불가능합니다.").show();
								$("span#hpEmailSuccess").hide();
							} else {	// O 데이터가 중복되지않는다면 O true
								if(hpCondition5 == true) {	// 정규표현식이 맞다면
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
				$("span#hpEmailError").hide();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		}); 
		
		// 이메일 '인증하기' 버튼 눌렀을 때..///////////////////////////////
		$("#hpBtnFind").click(hpSendVerificationCode);	
		///////////////////////////////////////////////////////////		
		
		var method = "${method}";
		var email = "${email}";
		if(method=="POST") {
			$("form[name=hpRegisterFrm] #email").val(email);
			$("form[name=hpRegisterFrm] #DivBtnFind").hide();
		} else {
			$("form[name=hpRegisterFrm] #DivBtnFind").show();
		}
		
		// 이메일 '인증확인하기'버튼 눌렀을 때..///////////////////////////// 
  		$("#hpBtnFind2").click(function() {
  			disabled=false; // 버튼 비활성화
  			
			$.ajax({	
				url:"<%= ctxPath%>/hpVerifyCertificationFrm.sd",
				type:"POST",
				data:{"hpUserCertificationCode" : $("#hpEmail2").val().trim()},
				dataType:"json",
				success:function(json){
					//console.log(json.isbool)
					if(json.isbool){
						console.log("!!!메일인증성공!!!");
						hpCertification = true;
						$("#hpEmailCkSuccess").html("인증 성공. 회원가입을 진행하세요.").show();
						$("input#hpEmail2").removeClass("wrong");
						$("span#hpEmailCkSuccess").hide();
						$("#hpBtnFind2").hide();
						$("#hpBtnFind3").show();
						$("#hpBtnFind3").click(function(){ // 인증성공 후 '인증확인' 버튼 재클릭 시 막아버리기
							disabled = 'disabled';
							alert("해당 이메일은 인증 확인이 되었습니다. 다음 단계로 넘어가세요");
						});
					}else{
						console.log("!!!메일인증실패!!!");
						$("#hpEmailCkError").html("인증 실패. 다시 시도해주세요.").show();
						$("input#hpEmail2").addClass("wrong");
						hpCertification = false;
					}
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			}); 
		});	
	});
		/////////////////////////////////////////////////////////////// 	
	

	// 이메일 '인증하기'버튼 눌렀을 때 
	function hpSendVerificationCode(){
  			
		if(hpEmailOK == true){
			$("#hpEmail2").show();
			$("#hpBtnFind2").show();
			$("#hpEmailCkError").hide();
			$("#hpEmailCkSuccess").hide();
			$("#hpBtnFind3").hide();
			disabled = false;
			$("#hpEmail2").val(''); // 입력칸 비우기
				
			$.ajax({	
				url:"<%= ctxPath%>/hpEmailCode.sd",
				type:"POST",
				data:{"email":$("form[name=hpRegisterFrm] #email").val().trim()},
				dataType:"json",
				success:function(json){
					//console.log(json.isSent);
					console.log("!!!!!!!!!!!!!!!!!!!!발송성공!!!!!!!!!!!!!!!!!!!!");
					alert("입력하신 이메일("+$("form[name=hpRegisterFrm] #email").val()+")로 인증번호가 발송되었습니다.\n전달받은 인증번호를 입력해주세요");					
					var btnChange = true;
					if(btnChange == true){
						$("#hpBtnFind").hide();
						$("#hpBtnFindNext").show();
					} 
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					$("input#email").addClass("wrong");
					$("#hpEmailCkError").html("메일발송이 실패했습니다. 다시 시도해주세요.").show();
				}
			}); 
		} else {
			alert('이메일을 알맞게 입력해주세요.');
		}	
	}
		
		
	// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 병원///약관동의 
	//------------------- 가입버튼 클릭 시 안 적은 항목이 있다면 알려주자~! ------------------- //
	function hpGoRegister() {
		  
		var bFlag = false;
	
		if($("#regId").val().trim()=="" || hpCondition1 == false) {
			alert("사업자등록번호를 확인하세요.");
			$("#regId").focus();
			return;
		}
		if($("form[name=hpRegisterFrm] #userid").val().trim()=="" || hpCondition2 == false) {
			alert("아이디를 확인하세요.");
			$("form[name=hpRegisterFrm] #userid").focus();
			return;
		}		
		if($("form[name=hpRegisterFrm] #pwd").val().trim()=="" || hpCondition3 == false) {
			alert("비밀번호를 확인하세요.");
			$("form[name=hpRegisterFrm] #pwd").focus();
			return;
		}
		if($("form[name=hpRegisterFrm] #name").val().trim()=="" || hpCondition4 == false) {
			alert("담당자 이름을 확인하세요.");
			$("form[name=hpRegisterFrm] #name").focus();
			return;
		}
		if($("form[name=hpRegisterFrm] #email").val().trim()=="" || hpCondition5 == false) {
			alert("이메일을 확인하세요.");
			$("form[name=hpRegisterFrm] #email").focus();
			return;
		}
 		if(!hpCertification || hpCertification == false) {
			alert("이메일 인증을 확인하세요.");
			$("form[name=hpRegisterFrm] #email").focus();
			return;
		}
		if( !$("input:checkbox[id=hpAgree]").prop("checked") ) {
			alert("이용약관에 동의하세요.");
			$("#hpAgree").focus();
			return;
		} 
		var bHpRequiredInfo = false;
		$(".hpRequiredInfo").each(function(){
			var data = $(this).val().trim();
			if(data == "") {
				bHpRequiredInfo = true;
				$(this).focus();
				return false;
			}
		}); 
	
		if(!bHpRequiredInfo) {
			var frm = document.hpRegisterFrm;
				frm.method = "POST";
				frm.action = "hpRegisterEnd.sd";
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
			         	<span class="error" id="useridError">아이디를 입력하세요.</span>
			        	<span class="success" id="useridSuccess">사용 가능한 아이디 입니다.</span> 
			
			         	<label for="pwd">비밀번호</label>
			         	<input type="password" name="pwd" id="pwd" class="requiredInfo" placeholder="대소문자, 특수문자 조합하여 8자 이상으로 입력하세요" />
			         	<span class="error" id="pwdError">비밀번호를 입력하세요.</span>
			         	<span class="success" id="pwdSuccess">사용 가능한 비밀번호 입니다.</span> 
			
			         	<label for="name">이름</label>
			         	<input type="text" name="name" id="name" class="requiredInfo" /> 
			         	<span class="error" id="nameError">이름을 입력하세요.</span>
		
			         	<label for="birthDate">생년월일</label>
			         	<div class="birthDate">
							<input type="text" name="birthYY" id="birthYY" class="requiredInfo" value="" size="4" maxlength="4" placeholder="YYYY">
			             	<div class="bar">/</div>
			             	<input type="text" name="birthMM" id="birthMM" class="requiredInfo" value="" size="2" maxlength="2" placeholder="MM">
			             	<div class="bar">/</div>
			             	<input type="text" name="birthDD" id="birthDD" class="requiredInfo" value="" size="2" maxlength="2" placeholder="DD">
							<input type="hidden" name="birthDate" />
						</div>
						<span class="error" id="birthdateError">생년월일을 입력하세요.</span>
			         
			         	<label for="gender">성별</label>
						<div class="gender" >
							<input type="radio" class="gender" name="gender" value="여" id="female"/>
				            <label for="female" class="textPosition">여자</label>
				            <input type="radio" class="gender" name="gender" value="남" id="male"/>
				            <label for="male" class="textPosition">남자</label>
			            </div>
				         	         	
				        <label for="email" style="display: block;">이메일</label>
				        <div style="width:100%; height:35px;">
					        <input type="email" name="email" id="email" class="requiredInfo" placeholder="E-mail을 입력하세요" style="width: 70%; height:100%;" />
 				        	<input type="button" id="btnFind" class="btnFind" value="인증" style="width: 28%; height: 100%;"/>
			        		<input type="button" id="btnFindNext" class="btnFind" onclick="sendVerificationCode()" value="재인증" style="width: 28%; height: 35px;"/>
				        </div>
				        <span class="error" id="emailError" >이메일 형식에 맞지 않습니다.</span> 
						<span class="success" id="emailSuccess">사용 가능한 이메일 입니다.</span> 
				        <div id="div_btnFind" style="width:100%;">
					        <input type="text" name="email2" id="email2" class="requiredInfo" maxlength="7" placeholder="E-mail로 발송된 인증번호를 입력하세요" style="width: 70%;" />
							<input type="button" id="btnFind2" value="인증확인하기" disabled="disabled" style="width: 28%; height:35px; background-color: #f4f4f1; color: black;"/>
							<input type="button" id="btnFind3" value="인증완료" disabled="disabled" style="width: 28%; height:35px;"/>
				        </div>   
						<span class="error" id="emailCkError" >이메일 형식에 맞지 않습니다.</span> 
						<span class="success" id="emailCkSuccess">사용 가능한 이메일 입니다.</span>
   	       				
				        <label for="phone">전화번호</label>
				        <input type="tel" id="phone" name="phone" maxlength="13" class="requiredInfo" placeholder="'-'없이 입력하세요" />
				        <span class="error" id="phoneError">휴대폰 형식이 아닙니다.</span>
				
				        <label for="agree">약관 동의 &nbsp;&nbsp;<input type="checkbox" id="agree" /> </label>
				        <div style="text-align: center; vertical-align: middle;">
				           <iframe src="<%=ctxPath %>/resources/html/agree.html" width="100%" height="150px" class="box" ></iframe>
				        </div>
					</div>
					
					<div class="btnJoin">
						<input type="button" id="btnRegister" value="가입하기" onClick="goRegister();" />
					</div> 			 
				</div>
			</div>
		</form>
		
		
		<!-- -------------------------------- 일반고객 회원가입 끝 ---------------------------------- --> 
		
		
		<form name="hpRegisterFrm">
			<div id="box">
						 
				<div class="hospitalMember"> 
					<div class="formGroup" >
						<label for="regId">사업자등록번호</label>
			         	<input type="text" name="regId" id="regId" class="hpRequiredInfo" maxlength="12" autofocus placeholder="'-'없이 10자로입력하세요" />
			         	<span class="error" id="regIdError">사업자등록번호를 입력 하세요.</span>
			      
				        <label for="userid" style="display: block;">아이디</label>
				        <input type="text" name="userid" id="userid" class="hpRequiredInfo" placeholder="5자 이상으로 입력하세요"/>
				        <span class="error" id="hpUseridError">아이디를 입력 하세요.</span>
				        <span class="success" id="hpUseridSuccess">사용 가능한 아이디 입니다.</span> 
				
				        <label for="pwd">비밀번호</label>
				        <input type="password" name="pwd" id="pwd" class="hpRequiredInfo" placeholder="대소문자, 특수문자 조합하여 8자 이상으로 입력하세요" />
				        <span class="error" id="hpPwdError">비밀번호를 입력 하세요.</span>
				        <span class="success" id="hpPwdSuccess">사용 가능한 비밀번호 입니다.</span> 
				
				        <label for="name">담당자 이름</label>
				        <input type="text" name="name" id="name" class="hpRequiredInfo" /> 
				        <span class="error" id="hpNameError">담당자 이름을 입력 하세요.</span>
			
				        <label for="email" style="display: block;">이메일</label>	
				        <div style="width:100%; height:35px;">			   
					        <input type="email" name="email" id="email" class="hpRequiredInfo" placeholder="E-mail을 입력하세요" style="width: 70%; height:100%;" /> 
							<input type="button" id="hpBtnFind" class="hpBtnFind" value="인증" style="width: 28%; height: 100%;"/>
							<input type="button" id="hpBtnFindNext" class="hpBtnFind" onclick="hpSendVerificationCode()" value="재인증" style="width: 28%; height: 35px;"/>
				        </div>
				        <span class="error" id="hpEmailError">이메일 형식에 맞지 않습니다.</span>
				        <span class="success" id="hpEmailSuccess">사용 가능한 이메일 입니다.</span>
						<div id="hpDivBtnFind" style="width:100%;">
							<input type="text" name="hpEmail2" id="hpEmail2" class="hpRequiredInfo" maxlength="7" placeholder="E-mail로 발송된 인증번호를 입력하세요" style="width: 70%;" />
							<input type="button" id="hpBtnFind2" value="인증확인하기" disabled="disabled" style="width: 28%; height:35px; background-color: #f4f4f1; color: black;"/>
							<input type="button" id="hpBtnFind3" value="인증완료" disabled="disabled" style="width: 28%; height:35px;"/>
						</div>
						<span class="error" id="hpEmailCkError" >이메일 형식에 맞지 않습니다.</span> 
						<span class="success" id="hpEmailCkSuccess">사용 가능한 이메일 입니다.</span>
					   
						
				        <label for="hpAgree">약관 동의 &nbsp;&nbsp;<input type="checkbox" id="hpAgree" /> </label>
				        <div style="text-align: center; vertical-align: middle;">
			            <iframe src="<%=ctxPath %>/resources/html/agree.html" width="100%" height="150px" class="box" ></iframe>
						</div>
					</div>	 
					
					<div class="hpBtnJoin">
						<input type="button" id="hpBtnRegister" value="가입하기" onClick="hpGoRegister();" />
					</div> 			 	
			 	</div>
			</div>
		</form>
			 	
			 	
		<!-- -------------------------------- 병원고객 회원가입 끝 ---------------------------------- --> 
	
		
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