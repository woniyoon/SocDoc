<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
%>
<%-- ======= #28. tile2 중 sideinfo 페이지 만들기  ======= --%>

<style type="text/css">
	ul#sideMenuList {
		list-style-type: disc !important;
		padding-inline-start: 20px !important;
		margin: 10px 0 0 0;
	}
	
	main {
		padding: 30px auto;
		width: 100vw;
		min-height: 75vh;
		height: auto;
		display: flex;
		flex-direction: row;
	}
	
	#sideMenu {
		flex: 1;
		border: 1px solid navy;
		padding: 40px 0 0 40px;
		font-size: 1.2em;
	}
	
	#contents {
		flex: 6;
		height: auto;
		margin: auto;
	}	
</style>

<div id="sideMenu">
	<span style="font-size: 1.4em;"><b>Menu</b></span>
	<ul id="sideMenuList">
		<li><a href="<%=ctxPath%>/hpPanel/main.sd">홈</a></li>
		<li><a href="<%=ctxPath%>/hpPanel/hpInfo.sd">병원 정보 관리</a></li>
		<li><a>예약관리</a></li>
		<li><a>방문 고객 관리</a></li>
		<li><a>후기 보기</a></li>
		<li><a>통계 보기</a></li>
		<li><a>계정 관리</a></li>
	</ul>
</div>