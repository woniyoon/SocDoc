<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
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
	
	.visitorSearch {
	    height: 40px;
	    background-image: url("https://img.icons8.com/material-outlined/24/000000/search.png");
	    background-repeat: no-repeat;
	    background-position: right;
	    border: 1px solid #cccccc;
	    border-radius: 5px;
	    padding: 10px;
	}
	
	.reviewListBottom {
		width: 100%;
		display: flex;
	    flex-direction: row;
	    justify-content: space-between;
	    margin: 10px;
	}
</style>

<div class="reviewsContainer">
	<h3 align="left">후기</h3>
	<section>
		<div> ⭐️⭐️⭐️⭐️⭐️ </div>
		<div> 총 13445 후기 | 평균점수 85.5점 </div>
	</section>
	<div class="searchContainer" align="right">
		<input class="reviewerSearch" type="text" placeholder="회원 검색"/>
	</div>
	<table class="customTable" style="width: 100%;">
		<tr>
			<th>회원명</th>
			<th>별점</th>
			<th>후기</th>
			<th>작성일</th>
		</tr>
		<tr>
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
		</tr>
		<tr>
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
		</tr>

	</table>
	<div class="reviewListBottom">
		<span>총 <span id="numOfVisitors">13445</span> 건</span>
		<button type="button">엑셀로 내보내기</button>
	</div>
	<div class="pageContainer" align="center">
		<span>< 1 2 3 4 5 6 7 8 9 10 ></span>
	</div>
</div>