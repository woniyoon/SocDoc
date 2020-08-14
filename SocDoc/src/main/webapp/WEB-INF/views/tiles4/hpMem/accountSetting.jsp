<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String ctxPath = request.getContextPath();
	// 	   /board
%>

<style>
	.container {
		width: 50vw;
		margin: 20px 0;
	}
	
	.instructionContainer {
		margin: 50px auto;
	}
	
	.inputContainer {
		display: flex;
		flex-direction: row;
		justify-content: center;
		align-items: center;
	}
</style>

<script type="text/javascript">
 
     $(document).ready(function(){
    	 
    	 $("#ok").click(function() {
    		 func_Login();
    	 }); // end of $("#btnLOGIN").click();-----------------------
    	 
    	 $("#pwd").keydown(function(event){
  			
  			if(event.keyCode == 13) { // 엔터를 했을 경우
  				func_Login();
  			}
    	 }); // end of $("#pwd").keydown();-----------------------	
    	 
    }); // end of $(document).ready()---------------------------	 

    
    function func_Login() {
    		 
		 var pwd = $("#pwd").val(); 
		
		 if(pwd.trim()=="") {
			 alert("비밀번호를 입력하세요!!");
			 $("#pwd").val(""); 
			 $("#pwd").focus();
			 return;
		 }

		 var frm = document.infoLoginFrm;
		 
		 frm.action = "<%=ctxPath%>/infoEdit2.sd";
		 frm.method = "POST";
		 frm.submit();
		 
    } // end of function func_Login(event)-----------------------------
     
</script>

	<div class="container" align="center">
		<h2 style="text-align: left;">계정정보수정</h2>
		<div class="instructionContainer">
			<img id="findPW" src="<%= ctxPath%>/resources/images/findPW.png" />
			<h2>회원정보를 수정하시려면 비밀번호를 입력해 주세요.</h2>
			 <div>회원님의 소중한 개인정보의 보호를 위하여 비밀번호를 한번 더 입력하여 주시기 바랍니다.</div>
		</div>
		<!-- <div id="box2" style="margin-top:10px;  border-left: none; border-right: none;">
			<span style="font-size: 15pt;">비밀번호<input type="password" style="margin-left: 30px; margin-top: 50px; width: 300px; height: 40px;"/></span>
		</div> -->
		<form name="infoLoginFrm" align="center">
			<div class="inputContainer" style="margin-top:35px;  border-left: none; border-right: none;" align="center">
				<div>
					<label for="password" style="font-size: 1.3em;">비밀번호&nbsp;</label><input id="pwd" name="password" type="password" style="margin: 10px; width: 300px; height: 40px;"/>
				</div>
				<button type="button" id="ok" style="background-color: skyblue; color:white; width: 150px; height: 50px; border-radius: 4px; border: none; font-size: 14pt;">확인</button>
			</div>
		</form>
	</div>