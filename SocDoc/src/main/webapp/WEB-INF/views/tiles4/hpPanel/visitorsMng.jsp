<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%
	String ctxPath = request.getContextPath();
%>

<%-- <link rel="stylesheet" type="text/css" media="screen" href="<%=ctxPath %>/resources/css/hpInfo.css" /> --%>

<style type="text/css">
	.visitorsListContainer {
		width: 50vw;
	}
	
	h3 {
		margin: 20px 0;
		margin-left: 0;
	}
	
	.searchContainer {
		margin: 10px 0;
	}
	
	.visitorSearch {
	    height: 40px;
	    background-image: url("https://img.icons8.com/material-outlined/24/000000/search.png");
	    background-repeat: no-repeat;
	    background-position: right;
	    border: 1px solid #cccccc;
	    border-radius: 5px;
	    padding: 10px;
	}
	
	.visitorsListBottom {
		width: 100%;
		display: flex;
	    flex-direction: row;
	    justify-content: space-around;
	    margin: 10px;
	}
</style>

<div class="visitorsListContainer">
	<h3 align="left">방문회원관리</h3>
	<div class="searchContainer" align="right">
		<input class="visitorSearch" type="text" placeholder="회원 검색"/>
	</div>
	<table class="customTable" style="width: 100%;">
		<tr>
			<th>순번</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>나이</th>
			<th>연락처</th>
			<th>마지막방문일</th>
		</tr>
		<tr>
			<td>대표전화</td>
			<td>대표전화</td>
			<td>대표전화</td>
			<td>대표전화</td>
			<td>대표전화</td>
			<td>대표전화</td>
		</tr>
		<tr>
			<td>대표전화</td>
			<td>대표전화</td>
			<td>대표전화</td>
			<td>대표전화</td>
			<td>대표전화</td>
			<td>대표전화</td>
		</tr>
		<tr>
			<td>대표전화</td>
			<td>대표전화</td>
			<td>대표전화</td>
			<td>대표전화</td>
			<td>대표전화</td>
			<td>대표전화</td>
		</tr>
		<tr>
			<td>대표전화</td>
			<td>대표전화</td>
			<td>대표전화</td>
			<td>대표전화</td>
			<td>대표전화</td>
			<td>대표전화</td>
		</tr>

	</table>
	<div class="visitorsListBottom">
		<span>총 <span id="numOfVisitors">13445</span> 건</span>
		<button type="button">엑셀로 내보내기</button>
	</div>
	<div class="pageContainer" align="center">
		<span>< 1 2 3 4 5 6 7 8 9 10 ></span>
	</div>
</div>