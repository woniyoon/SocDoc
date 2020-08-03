<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- ======= #28. tile2 중 header 페이지 만들기  ======= --%>
<%
   String ctxPath = request.getContextPath();
%>
<header>
	<img id="logo" src="https://image.flaticon.com/icons/svg/3017/3017701.svg" width=80px height=80px />
	<ul class="headerMenu">
		<li><a>찾기</a></li>
		<li><a>예약</a></li>
		<li><a>후기</a></li>
		<li><a>알림소식</a></li>
	</ul>
</header>