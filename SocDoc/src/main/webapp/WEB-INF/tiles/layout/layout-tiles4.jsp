<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- === #25. tiles 를 사용하는 레이아웃2 페이지 만들기 === --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<%
   String ctxPath = request.getContextPath();
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원관계자 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/hpMain.css" />
</head>

<body>
	<tiles:insertAttribute name="header" />
	<main>
		<tiles:insertAttribute name="sideinfo" />
		<tiles:insertAttribute name="content" />
	</main>

	<tiles:insertAttribute name="footer" />
</body>
</html>