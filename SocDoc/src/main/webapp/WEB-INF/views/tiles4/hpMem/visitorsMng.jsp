<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
 
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
		margin: 10px;
		display: flex;
	    flex-direction: row;
	    justify-content: space-between;
	    margin: 10px;
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
	
	.excelBtnContainer {
		margin: 10px;
	}
</style>

<div class="visitorsListContainer">
	<h3 align="left">방문회원관리</h3>
	<div class="searchContainer" align="right">
		<span>총 <span id="numOfVisitors">${numOfVisitors}</span> 건</span>
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
			<c:if test="${not empty visitorsList }">
				<c:forEach var="map" items="${visitorsList }">
					<tr>
						<td>${map.rno}</td>
						<td>${map.name}</td>
						<td>${map.birthDate}</td>
						<td>${map.age}</td>
						<td>${map.phone}</td>
						<td>${map.visitDate}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty visitorsList }">
				<tr align="center">
					<td colspan="6">속닥을 이용해 예약방문한 고객이 없어요!</td>
				</tr>
			</c:if>
	</table>
	<div class="excelBtnContainer" align="right">
		<button class="blueBtn" type="button">엑셀로 내보내기</button>
	</div>
	<div class="pageContainer" align="center">
		<span>${pageBar }</span>
	</div>
</div>