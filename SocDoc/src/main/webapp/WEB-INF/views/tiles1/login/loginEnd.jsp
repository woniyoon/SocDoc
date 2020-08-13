<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>    

<script type="text/javascript"> 
	var loginuser = "${sessionScope.loginuser}";
	var gobackURL = "${requestScope.gobackURL}";
	
	if(loginuser != null && (gobackURL != null && gobackURL != "")) {  
		alert( "${sessionScope.loginuser.name} 님 로그인 성공했습니다. "); 
		location.href="<%= ctxPath%>/"+gobackURL; // 돌아갈 페이지 
	}
	else if(loginuser != null && (gobackURL == null || gobackURL == "")) { 
		alert( "${sessionScope.loginuser.name} 님 로그인 성공했습니다. ");
		location.href="<%= ctxPath%>/index.action";	// 시작페이지로 ㄱㄱ
	}
	
	
<%-- 	<c:if test="${sessionScope.loginuser != null}">	/*  스크립트/html이라면 안되지만 .jsp라서 이렇게 쓸 수 있다.// sessionScope에 있는 loginuser은  null이 아닐테지만, 한번 더 확인 */
		alert( "${sessionScope.loginuser.name} 님 로그인 성공했습니다. ");  // sessionScope.loginuser 이건 memberVO// getname의 name을 불러오자.
		location.href="<%= ctxPath%>/index.action";	
	</c:if> --%>
</script>