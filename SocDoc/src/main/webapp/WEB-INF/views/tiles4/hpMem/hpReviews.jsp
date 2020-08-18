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
		display: flex;
		flex-direction: row;
		justify-content: flex-end;
		margin: 10px 0;
	}
	
	.searchTypeSelect {
		height: 40px;
	    background-position: right;
	    /* border-radius: 5px; */
	    padding: 10px 0;
	    right: 0;
	}
	
	.reviewerSearch {
	    height: 40px;
	    background-image: url("https://img.icons8.com/material-outlined/24/000000/search.png");
	    background-repeat: no-repeat;
	    background-position: right;
	    border: 1px solid #cccccc;
/* 	    border-radius: 5px; */
	    padding: 10px;
	}
	
	.reviewListBottom {
		/* width: 100%;
		display: flex;
	    flex-direction: row;
	    justify-content: space-between; */
	    margin: 10px;
	}
	
	.hospitalRatingStar {
      background: url('/socdoc/resources/images/starsBlue.png') no-repeat right 0;
      background-size: auto 100%;
      width: 50px;
      height: 50px;
      display: inline-block;
      text-indent: -9999px;
      cursor: pointer;
      margin-bottom: 10px;
   }
	
	.reviewStar {
      background: url('/socdoc/resources/images/starsYellow.png') no-repeat right 0;
      background-size: auto 100%;
      width: 20px;
      height: 20px;
      display: inline-block;
      text-indent: -9999px;
      cursor: pointer;
      margin-bottom: 10px;
   }

	.on{
      background-position:0 0;
   }    
   
</style>

<script src="<%=ctxPath%>/resources/js/util/common.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
	      if("${searchType != null}" && "${searchWord != null}") {
	    	  $("#searchType").val("${searchType}");
	    	  $("#searchWord").val("${searchWord}");
	      }
		
	      $(".hospitalRatingStar").each(function(){
		      $("#hospitalRatingStar"+"${avgRating}").addClass("on").prevAll("span").addClass("on");
		      console.log("??????");
		      return false;
		  });
	});
	
	function search(){
		var form = document.reviewSearchFrm; 
		form.method = "GET";
		form.action = "<%=ctxPath%>/hpPanel/hpReviews.sd";
		form.submit();
	}
	
</script>

<div class="reviewsContainer">
	<h3 align="left">후기</h3>
	<section>
		<div class="hospitalRating" style="height:40px; margin: 30px;">
               <span class="hospitalRatingStar" id="hospitalRatingStar1">별1</span>
               <span class="hospitalRatingStar" id="hospitalRatingStar2">별2</span>
               <span class="hospitalRatingStar" id="hospitalRatingStar3">별3</span>
               <span class="hospitalRatingStar" id="hospitalRatingStar4">별4</span>
               <span class="hospitalRatingStar" id="hospitalRatingStar5">별5</span>
        </div>      
		<div> 총 <span>${numOfReviews} / ${totalNum }</span> 후기 | 평균 ${avgRating}<span>.0</span></div>
	</section>
	<div class="searchContainer" align="right">
		<form name="reviewSearchFrm">
			<select class="searchTypeSelect" id="searchType" name="searchType">
				<option value="content" selected>후기</option>
				<option value="userid">회원아이디</option>
			</select>
			<input class="reviewerSearch" type="text" id="searchWord" name="searchWord"  placeholder="회원 검색" value="${searchWord}"/>
		</form>
		<button class="blueBtn" id="searchBtn" onclick="search()">검색</button>
	</div>
	<table class="customTable" id="reviewListTbl" style="width: 100%;">
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
					<td style="width: 120px;">
						<c:forEach var="i" begin="1" end="5">
						   <c:if test="${review.rating >= i}">
						   		<span class="reviewStar on" id="hospitalRatingStar${i}">별</span>
						   </c:if>
						   <c:if test="${review.rating < i}">
						   		<span class="reviewStar" id="hospitalRatingStar${i}">별</span>
						   </c:if>
						</c:forEach>
					</td>
					<td>${review.content}</td>
					<td style="width: 100px;">${review.regDate}</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty reviewList}">
			<tr align="center">
				<td colspan="4">검색 결과가 없습니다.</td>
			</tr>
		</c:if>
	</table>
	<c:if test="${not empty reviewList}">
		<div class="reviewListBottom" align="right">
			<button class="blueBtn" type="button" onclick="exportAsExcel('reviewListTbl', '후기 목록')">엑셀로 내보내기</button>
		</div>	
	</c:if>
	<div class="page_wrap" align="center">
		<span>${pageBar}</span>
	</div>
</div>