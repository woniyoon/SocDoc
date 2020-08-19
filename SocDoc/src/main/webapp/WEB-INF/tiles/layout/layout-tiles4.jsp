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
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"> --></script>
</head>
<style type="text/css">
	body {
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	}

	#sideMenuList {
		padding-inline-start: 20px;
		margin: 10px 0 0 0;
	}
	
	#sideMenuList li{
		list-style-type: disc;
	}
	
	.mainContainer {
		margin: 240px auto;
	    width: 70vw;
	    min-height: 65vh;
	    height: auto;
	    flex-direction: row;
	    display: flex;
	    justify-content: center;
	}
	
	#sideMenu {
		flex: 1;
		padding: 40px 0 0 40px;
		font-size: 1.2em;
	}
	
	#contents {
		flex: 5;
		height: auto;
		margin: 0 auto;
	}
	
	#contents h3 {
		margin: 20px 0;
	}
	
	/* 파랑색 */
	.blueBtn {
	   background-color: #0080ff;
	   color:#fff;
	   cursor: pointer;   
	   border: 1px solid #dddddd;       
	   padding: 0.25em .75em;    
	   border-radius: .25em;       
	   font-weight: 500;
	   font-size: 10pt;   
	}
	
	/* 회색 */   
	.greyBtn {
	   background-color: #efefef;
	   cursor: pointer;   
	   border: 1px solid #dddddd;       
	   padding: 0.25em .75em;    
	   border-radius: .25em;       
	   font-weight: 500;
	   font-size: 10pt;   
	   margin-right: 1
	}
</style>

<body>
	<div id="myheader" align="center">
         <tiles:insertAttribute name="header" />
    </div>
	<div class="mainContainer" align="center">
		<tiles:insertAttribute name="sideinfo" />
		<div id="contents" align="center">
			<tiles:insertAttribute name="content" />
		</div>
	</div>

	<tiles:insertAttribute name="footer" />
</body>
</html>