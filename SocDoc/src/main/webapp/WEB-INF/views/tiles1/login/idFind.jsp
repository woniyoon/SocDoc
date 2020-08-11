<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
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
   	
   	.textPrimary {
   		margin-bottom: 5px;
   		color: #454545; 
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
    
    .input {
		padding: 0px;
    }
    
	span {
		display: block;
		padding: 5px 0 10px 15px;
		font-size: 8pt;
		color: red;
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

	// 데이터 조건 여부
	var condition1 = false;
	var condition2 = false;
	var condition3 = false;
	
	$(document).ready(function(){
		
		// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 아이디
		$("span#useridError").hide();
	
		$("form[name=findFrm] #userid").blur(function(){
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ).trim() ); // 한글 막기
			if($("form[name=findFrm] input#userid").val().trim() == "") {	// 데이터가 없다면
				$("span#useridError").show();
				$("form[name=findFrm] input#userid").addClass("wrong"); 				
			} else {	// 데이터가 있다면
				// 정규표현식
		        var regExp = /^[A-Za-z0-9]{5,10}$/;	// 5자 이상 10글자 이하의 영문과 숫자를 조합
		        var bool = regExp.test($(this).val()); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
				
				if(!bool) {  // 데이터가 조건에 맞지않으면
					$("span#useridError").html("영문,숫자 조합으로 5~10자리만 입력 가능합니다.").show();
					$("form[name=findFrm] input#userid").addClass("wrong");  
					condition1 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					$("form[name=findFrm] input#userid").removeClass("wrong");
					condition1 = true;
					
					$.ajax({
						url:"<%=ctxPath%>/idFind.sd",
						type:"POST",
						data:{"userid":$("form[name=findFrm] #userid").val()},
						dataType:"json",
						success:function(json){
							if(json.isUse) {	// X 데이터가 중복된다면 X false
								if(condition1 == true) {
									$("span#useridError").hide();
								}
							} else {	// O 데이터가 중복되지않는다면 O true
								$("span#useridError").html($("이미 사용 중이거나, 탈퇴한 아이디로 사용 불가능합니다.").show();
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
		
		
		
		
		
		
		
		
		///////////////////////////////////////
		
		
		
		
		
		
		
		// ------------ 사업자등록번호 ------------ // 
		
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
					
					return;
				} else {	// 데이터가 조건에 맞다면
					$("input#businessNumber").removeClass("wrong");
				}
	
				$("span#businessNumberError").hide();
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

					<div class="btnJoin">
						<input type="button" id="btnFind" value="인증확인" onClick="goRegister();" />
					</div> 
				</div>
			</div>
		</form>		
		  
		<!-- -------------------------------- 일반고객 아이디찾기 끝 ---------------------------------- --> 	
		
		<form name="hpFindFrm">
			<div id="box">
				<div class="hospitalMember"> 
					<div class="formGroup">
						<label for="businessNumber">사업자등록번호</label>
				        <input type="text" name="businessNumber" id="businessNumber" class="requiredInfo" autofocus placeholder="'-'없이 10자로입력하세요" />
				        <span class="error" id="businessNumberError">사업자등록번호를 입력 하세요.</span>
						<label for="hpEmail">이메일</label>
					    <input type="text" name="hpEmail" id="hpEmail" class="requiredInfo" placeholder="E-mail을 입력하세요" /> 
				        <span class="error" id="hpEmailError">이메일 형식에 맞지 않습니다.</span>
				
				        <label for="code">인증번호</label>
				        <input type="text" id="hpCode" name="hpCode" class="requiredInfo" placeholder="인증번호를 입력하세요" />
				        <span class="error" id="hpCodeError">인증번호를 입력하세요.</span>
					</div>
					
					<div class="btnJoin">
						<input type="button" id="btnFind" value="인증확인" onClick="goRegister();" />
					</div>  
				 </div>	
			</div>
		</form>
		
		<!-- -------------------------------- 병원고객 아이디찾기 끝 ---------------------------------- --> 
			 
		    
	</div>
</div>    