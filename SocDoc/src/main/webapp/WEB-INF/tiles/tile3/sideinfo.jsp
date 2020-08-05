<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
%>
    
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
	.sideBar {
	  width: 160px;
	  font-weight: bold;
	  font-size: 12pt;
	  position: fixed;
	  z-index: 1;
	  top: 200px;
	  left: 10px;
	  background: #eee;
	  overflow-x: hidden;
	  padding: 8px 0;
	  margin: 50px 30px 0px 30px;
	}
</style>


<script type="text/javascript">

	function myAccFunc() {
	  var x = document.getElementById("demoAcc");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	    x.previousElementSibling.className += " w3-blue";
	  } else { 
	    x.className = x.className.replace(" w3-show", "");
	    x.previousElementSibling.className = 
	    x.previousElementSibling.className.replace(" w3-blue", "");
	  }
	}
	
	function myDropFunc() {
	  var x = document.getElementById("demoDrop");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	    x.previousElementSibling.className += " w3-blue";
	  } else { 
	    x.className = x.className.replace(" w3-show", "");
	    x.previousElementSibling.className = 
	    x.previousElementSibling.className.replace(" w3-blue", "");
	  }
	}
	
</script>



	<div class="sideBar w3-bar-block w3-light-grey w3-card">
		  <a href="<%= ctxPath%>/adminMemberMng.sd" class="w3-bar-item w3-button">회원관리</a>
		  <a href="<%= ctxPath%>/adminHospitalMng.sd" class="w3-bar-item w3-button">병원회원관리</a>
		  <a href="<%= ctxPath%>/hospitalInfo.sd" class="w3-bar-item w3-button">병원등록</a>
		  <button class="w3-button w3-block w3-left-align" onclick="myAccFunc()">
		  	게시판관리 <i class="fa fa-caret-down"></i>
		  </button>
		  <div id="demoAcc" class="w3-hide w3-white w3-card">
		    <a href="<%= ctxPath%>/adminNoticeMng.sd" class="w3-bar-item w3-button">공지사항</a>
		    <a href="<%= ctxPath%>/healthInfoMng.sd" class="w3-bar-item w3-button">건강정보관리</a>
		    <a href="<%= ctxPath%>/reviewMng.sd" class="w3-bar-item w3-button">후기관리</a>
		    <a href="<%= ctxPath%>/qnaMng.sd" class="w3-bar-item w3-button">문의관리</a>
		  </div>
    </div>
		