<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
%>

<style>

	#sideMenuList li{
		font-size: 10pt;
		list-style: square;
		width:100%;
	}
	
	
	
</style>


<div id="sideMenu">
	<span style="font-size: 12pt; font-weight: 800;"><b>고객센터</b></span>
	<ul id="sideMenuList">
		<li><a href="<%=ctxPath%>/faq.sd">자주하는 질문</a></li>
		<li><a href="<%=ctxPath%>/inquiry.sd">문의하기</a></li>
	</ul>
</div>