<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
%>

<%-- <link rel="stylesheet" type="text/css" media="screen" href="<%=ctxPath %>/resources/css/hpInfo.css" /> --%>

<style type="text/css">
	.reviewsContainer {
		width: 50vw;
	}
	
	h3 {
		margin: 20px 0;
		margin-left: 0;
	}
	
	.searchContainer {
		margin: 10px 0;
	}
	
	.searchTypeSelect {
		height: 40px;
	    background-position: right;
	    border-radius: 5px;
	    padding: 10px 0;
	    right: 0;
	}
	
	.reviewerSearch {
	    height: 40px;
	    background-image: url("https://img.icons8.com/material-outlined/24/000000/search.png");
	    background-repeat: no-repeat;
	    background-position: right;
	    border: 1px solid #cccccc;
	    border-radius: 5px;
	    padding: 10px;
	}
	
	.reviewListBottom {
		/* width: 100%;
		display: flex;
	    flex-direction: row;
	    justify-content: space-between; */
	    margin: 10px;
	}
</style>

<div class="reviewsContainer">
	<h3 align="left">후기</h3>
	<section>
		<div> ⭐️⭐️⭐️⭐️⭐️ </div>
		<div> 총 <span>${numOfReviews}</span> 후기 | 평균점수 85.5점 </div>
	</section>
	<div class="searchContainer" align="right">
		<select class="searchTypeSelect" name="searchType">
			<option value="content" selected>후기</option>
			<option value="userid">회원아이디</option>
		</select>
		<input class="reviewerSearch" type="text" placeholder="회원 검색"/>
	</div>
	<table class="customTable" style="width: 100%;">
		<tr>
			<th>아이디</th>
			<th>별점</th>
			<th>후기</th>
			<th>작성일</th>
		</tr>
		<c:if test="${not empty reviewList}">
			<c:forEach var="review" items="${reviewList}">
				<tr>
					<td>${review.userid}</td>
					<td>${review.rating}</td>
					<td>${review.content}</td>
					<td>${review.regDate}</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty reviewList}">
			<tr align="center">
				<td colspan="4">아직 리뷰가 없습니다 ^^;;</td>
			</tr>
		</c:if>
	</table>
	<div class="reviewListBottom" align="right">
		<button type="button">엑셀로 내보내기</button>
	</div>
	<div class="pageContainer" align="center">
		<span>${pageBar}</span>
	</div>
</div>