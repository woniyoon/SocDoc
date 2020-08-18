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
   
	/* 아디비번 입력 */
	.formGroup, .hpFormGroup {   
		padding-top: 5px;
		box-sizing: border-box;
	}
   
	.formControl {
		float:left;
		width: 70%;
		height: 35px;
		margin-bottom: 5px;
		padding-left: 10px;
		border: solid 1px #ccc; 
	}

	#btnLogin {
		display: inline-block;
		width: 30%;
		height: 75px;
		padding: 0 10px;
		background-color: #58ACFA;
		border: solid 0px #ccc;
		color: white;
		font-weight: bold; 
	}
   
	#bottomBtn > ul li, #hpBottomBtn > ul li {
		display: inline-block;
		padding-right: 10px;
		margin-top: 15px;
	}

	.textPrimary {
		margin-bottom: 5px;
		color: #585858;
	}
	
	a {
		text-decoration: none;
	}
    
	.bottom {
		//width: fit-content;
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
		$("form[name=loginFrm] #btnLogin").click(function(event){
			goLogin(); // 로그인 시도한다.
				
		});
	      
		$("form[name=loginFrm] #pwd").keydown(function(event){
        	if(event.keyCode == 13) { // 암호입력란에 엔터를 했을 경우 
        		goLogin(); // 로그인 시도한다.
			} 
		});
		
/* 		var userid = localStorage.getItem('form[name=loginFrm] saveid');
			if(userid != null){
				$("form[name=loginFrm] #userid").val(userid);
	    	  	$("form[name=loginFrm] input:checkbox[id=saveid]").prop("checked",true);
		}
			 */
			
			
			////////////////////// 아이디 저장
		    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
		    var key = getCookie("key");
		    $("form[name=loginFrm] #userid").val(key); 
		     
		    if($("form[name=loginFrm] #userid").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
		        $("#saveid").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		    }
		     
		    $("#saveid").change(function(){ // 체크박스에 변화가 있다면,
		        if($("#saveid").is(":checked")){ // ID 저장하기 체크했을 때,
		        	//console.log("아이디저장 체크");
		            setCookie("key", $("form[name=loginFrm] #userid").val(), 7); // 7일 동안 쿠키 보관
		        } else { // ID 저장하기 체크 해제 시,
		            //console.log("아이디저장 해제"+key);
		            deleteCookie("key", $("form[name=loginFrm] #userid").val());
		        }
		    });
		     
		    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		    $("form[name=loginFrm] #userid").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
		        if($("#saveid").is(":checked")){ // ID 저장하기를 체크한 상태라면,
		            setCookie("key", $("form[name=loginFrm] #userid").val(), 7); // 7일 동안 쿠키 보관
		        } else {
		        	deleteCookie("key", $("form[name=loginFrm] #userid").val());
		        }
		    })
			/////////////////////
	});	
	
	/* === 로그인 처리 함수 === */
	function goLogin() {
   
		var userid = $("form[name=loginFrm] #userid").val().trim();
		var pwd = $("form[name=loginFrm] #pwd").val().trim();
		
		if(userid == "") {
			alert("아이디를 입력하세요");
			$("form[name=loginFrm] #userid").val("");
			$("form[name=loginFrm] #userid").focus();
			return; 
      	}
      	if(pwd == "") {
        	alert("비밀번호를 입력하세요");
        	$("form[name=loginFrm] #pwd").val("");
         	$("form[name=loginFrm] #pwd").focus();
         	return;  
      	}
		
/* 		// === 로컬 스토리지(localStorage)에 userid 값 저장시키기 === //
	  	if($("form[name=loginFrm] input:checkbox[id=saveid]").prop("checked")){
	  		alert("아이디 저장을 클릭하셨네요");
  		   	localStorage.setItem('saveid', $("form[name=loginFrm] #userid").val());
  	   	} else {
  	   		alert("아이디 저장을 해제하셨네요");
			localStorage.removeItem('saveid');
  	   	} */
      	var frm = document.loginFrm;  
      	frm.method = "POST";
      	frm.action = "loginEnd.sd";
      	frm.submit();
	}
	
 	/* === 로그아웃 처리 함수 === */	
	function goLogout() {
		location.href="logout.sd";
	}

	/////////////// 아이디 저장
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	///////////////
	






/////////////////////////////////////////////////////////////////







	$(document).ready(function(){
		$("form[name=hpLoginFrm] #btnLogin").click(function(){
			goHpLogin(); // 로그인 시도한다.
		});
	      
		$("form[name=hpLoginFrm] #pwd").keydown(function(event){
	         if(event.keyCode == 13) { // 암호입력란에 엔터를 했을 경우 
	        	 goHpLogin(); // 로그인 시도한다.
			} 
		});
		
/* 		var userid = localStorage.getItem('form[name=hpLoginFrm] saveid');
			if(userid != null){
				$("form[name=hpLoginFrm] #userid").val(userid);
	    	  	$("form[name=hpLoginFrm] input:checkbox[id=saveid]").prop("checked",true);
		} */
		
		////////////////////// 아이디 저장
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var key2 = getHpCookie("key2");
	    $("form[name=hpLoginFrm] #userid").val(key2); 
	     
	    if($("form[name=hpLoginFrm] #userid").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#hpSaveid").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#hpSaveid").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#hpSaveid").is(":checked")){ // ID 저장하기 체크했을 때,
	        	//console.log("hp아이디저장 체크");
	            setHpCookie("key2", $("form[name=hpLoginFrm] #userid").val(), 7); // 7일 동안 쿠키 보관
	        } else { // ID 저장하기 체크 해제 시,
	        	//console.log("hp아이디저장 해제"+key2);
	            deleteHpCookie("key2", $("form[name=hpLoginFrm] #userid").val());
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("form[name=hpLoginFrm] #userid").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#hpSaveid").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            setHpCookie("key2", $("form[name=hpLoginFrm] #userid").val(), 7); // 7일 동안 쿠키 보관
	        } else { 
	            deleteHpCookie("key2", $("form[name=hpLoginFrm] #userid").val());
	        }
	    })
		/////////////////////
	});	
	
	/* === 로그인 처리 함수 === */
	function goHpLogin() {
   
		var userid = $("form[name=hpLoginFrm] #userid").val().trim();
		var pwd = $("form[name=hpLoginFrm] #pwd").val().trim();
      	
		if(userid == "") {
			alert("아이디를 입력하세요");
			$("form[name=hpLoginFrm] #userid").val("");
			$("form[name=hpLoginFrm] #userid").focus();
			return; 
      	}
      	if(pwd == "") {
        	alert("비밀번호를 입력하세요");
        	$("form[name=hpLoginFrm] #pwd").val("");
         	$("form[name=hpLoginFrm] #pwd").focus();
         	return;  
      	}
		
      	var frm = document.hpLoginFrm;  
      	frm.method = "POST";
      	frm.action = "hpLoginEnd.sd";
      	frm.submit();
	}
	
	/* === 로그아웃 처리 함수 === */	
 	function goHpLogout() {
		location.href="hpLogout.sd";
	}
	
	
	/////////////// 아이디 저장
	function setHpCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteHpCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getHpCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	///////////////
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
				<div class="individualMember">

<!-- 					<div class="checkbox" style="font-size: 8.5pt;">
						<label for="saveid"><input type="checkbox" id="saveid" name="saveid" style="vertical-align: top;" />&nbsp;&nbsp;아이디저장</label> -->
<!-- 혹시 아니면 밑부분을 지우세요... -->
					<div class="checkbox" style="vertical-align: middle; font-size: 9pt;">
						<label for="saveid"><input type="checkbox" id="saveid" name="saveid" />&nbsp;&nbsp;아이디저장</label>
					</div>
			         
					<div class="formGroup">
			            <div class="input">
							<input type="text" class="formControl" name="userid" id="userid" value="" placeholder="아이디" /> 
						</div>
			             
			            <div class="input">
							<input type="password" class="formControl" name="pwd" id="pwd" value="" placeholder="비밀번호"/> 
			            </div>
			
				        <div class="btnJoin">
							<input type="button" id="btnLogin" value="로그인" /> 
				        </div>
					</div>
			         
					<div id="bottomBtn">
						<ul id="input" class="bottom" style="font-size: 8.5pt;">
							<li><a href="/socdoc/register.sd" class="bottom btnJoin" style="font-weight: bold;">회원가입</a></li>
							<li>|</li>
							<li><a href="/socdoc/idFind.sd" class="bottom btnSearchId">아이디 찾기</a></li>
							<li>|</li>
							<li><a href="/socdoc/pwdFind.sd" class="bottom btnSearchPasswd">비밀번호 찾기</a></li>
						</ul>
					</div>
				</div>
			</div>
		</form>
		
		<form name="hpLoginFrm">
			<div id="box">
				<div class="hospitalMember">
<!-- <<<<<<< HEAD
					<div class="checkbox" style="font-size: 8.5pt;"	>
						<label for="saveid"><input type="checkbox" id="saveid" name="saveid" style="vertical-align: top;" />&nbsp;&nbsp;아이디저장</label> -->
<!-- 혹시 아니면 밑부분을 지우세요... -->
					<div class="checkbox" style="vertical-align: top; font-size: 9pt;">
						<label for="hpSaveid"><input type="checkbox" id="hpSaveid" name="hpSaveid" />&nbsp;&nbsp;아이디저장</label>
					</div>
			         
					<div class="hpFormGroup">
			            <div class="input">
							<input type="text" class="formControl" name="userid" id="userid" value="" placeholder="아이디" /> 
						</div>
			             
			            <div class="input">
							<input type="password" class="formControl" name="pwd" id="pwd" value="" placeholder="비밀번호"/> 
			            </div>
			
				        <div class="btnJoin">
							<input type="button" id="btnLogin" value="로그인" /> 
				        </div>
					</div>
			         
					<div id="hpBottomBtn">
						<ul id="input" class="bottom" style="font-size: 8.5pt;">
							<li><a href="/socdoc/register.sd" class="bottom btnJoin" style="font-weight: bold;">회원가입</a></li>
							<li>|</li>
							<li><a href="/socdoc/idFind.sd" class="bottom btnSearchId">아이디 찾기</a></li>
							<li>|</li>
							<li><a href="/socdoc/pwdFind.sd" class="bottom btnSearchPasswd">비밀번호 찾기</a></li>
						</ul>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
