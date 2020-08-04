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
</head>
<style type="text/css">
	#sideMenuList {
		list-style-type: disc;
		padding-inline-start: 20px;
		margin: 10px 0 0 0;
	}
	
	main {
		padding: 30px auto;
		width: 100vw;
		min-height: 65vh;
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
		margin: 30px auto;
	}
</style>

<body>
	<tiles:insertAttribute name="header" />
	<main>
		<tiles:insertAttribute name="sideinfo" />
		<div id="contents" align="center">
			<tiles:insertAttribute name="content" />
		</div>
	</main>

	<tiles:insertAttribute name="footer" />
</body>
</html>