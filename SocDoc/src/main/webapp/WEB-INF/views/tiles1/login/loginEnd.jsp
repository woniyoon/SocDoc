<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>    

<script type="text/javascript"> 
	var loginuser = "${sessionScope.loginuser}";
	var hpLoginuser = "${sessionScope.hpLoginuser}";
	var gobackURL = "${requestScope.gobackURL}";
	
	if(loginuser != null && (gobackURL != null && gobackURL != "")) {  
		alert( "${sessionScope.loginuser.name} 님 로그인 . "); 
		location.href="<%= ctxPath%>/"+gobackURL;
	} else if(loginuser != null && (gobackURL == null || gobackURL == "")) { 
		alert( "${sessionScope.loginuser.name} 님 로그인 성공했습니다. ");
		location.href="<%= ctxPath%>/index.sd";	
		
	} else if(hpLoginuser != null && (gobackURL != null && gobackURL != "")) {
		alert( "${sessionScope.hpLoginuser.userid} 님 로그인 성공했습니다.@#$ "); 
		location.href="<%= ctxPath%>/"+gobackURL;
	} else if(hpLoginuser != null && (gobackURL == null || gobackURL == "")) {
		alert( "${sessionScope.hpLoginuser.name} 님 로그인 성공했습니다.ㅎㅎ ");
		location.href="<%= ctxPath%>/index.sd";
	}
</script>