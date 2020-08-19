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
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
</head>
<style type="text/css">

	#sideMenuList {
		padding-inline-start: 20px;
		margin: 10px 0 0 0;
	}
	
	/* .mainContainer {
		margin-top: 250px;
	    width: 90%;
	    min-height: 70vh;
	    height: auto;
	    flex-direction: row;
	    display: flex;
	    justify-content: space-between;	
	   	flex-shrink:0 !important;	
	   	justify-content: center;
	} */
	/* 
	.centerMain{
		background : url('/socdoc/resources/images/centerMain.jpg'); 
		background-size: auto;
		background-repeat : repeat;
		height:200px;
		margin-top: -20px;
	} */
	
/* 	#sideMenu {
		padding: 40px 0 0 40px;
		width:18%;
	}
	
	#contents {
		width:90%;
		height: 100%;
	} */
	
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
	
</style>

<body>
	  <div id="myheader">
         <tiles:insertAttribute name="header" />
      </div>
<!-- 	<div class="centerMain"></div>
 --><div class="mainContainer" align="center">
		<tiles:insertAttribute name="sideinfo" />
		<div id="contents">		
			<tiles:insertAttribute name="content" />
		</div>
	</div>
	<tiles:insertAttribute name="footer" />
</body>
</html>