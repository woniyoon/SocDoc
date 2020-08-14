<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<%
	String ctxPath = request.getContextPath();
%>

<%-- <link rel="stylesheet" type="text/css" media="screen" href="<%=ctxPath %>/resources/css/hpInfo.css" /> --%>

<style type="text/css">
	.applicationInfoContainer {
		width: 50vw;
	}
	
	h3 {
		margin: 20px 0;
		margin-left: 0;
	}
	
	.reviewListBottom {
		width: 100%;
		display: flex;
	    flex-direction: row;
	    justify-content: space-between;
	    margin: 10px;
	}
	
	.applyBtnContainer {
		margin: 10px;
	}
</style>

<div class="applicationInfoContainer">
	<h3 align="left">정보관리</h3>
	<div style="margin: 10px;" align="left">총 <span>${numOfUpdates }</span>건</div>
	<table class="customTable" style="width: 100%;">
		<tr>
			<th></th>
			<th>신청번호</th>
			<th>병원명</th>
			<th>신청일</th>
			<th>상태</th>
		</tr>
		<c:if test="${not empty infoUpdateList }">
			<c:forEach var="item" items="${infoUpdateList }" varStatus="status">
				<tr style="cursor: pointer;" onclick="javascript:location.href='<%=ctxPath%>/hpPanel/updateHpInfo.sd?submitId=${item.submitId}'">
					<td>${status.count }</td>
					<td>${item.submitId}</td>
					<td>${item.hpName }</td>
					<td>${item.uploadDate}</td>
					<td>
						<c:choose>
							<c:when test="${item.status == 1}">
								<span>신청</span>
							</c:when>
							<c:when test="${item.status == 2}">
								<span>반려</span>
							</c:when>
							<c:when test="${item.status == 3}">
								<span>수정</span>
							</c:when>
							<c:otherwise>
								<span>승인</span>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty infoUpdateList }">
			<tr>
				<td colspan="5">
					<span>신청 정보가 존재하지 않습니다! 신청해주세요! </span>
					<button type="button" class="blueBtn" onclick="javascript:location.href='<%=ctxPath%>/hpPanel/updateHpInfo.sd'">신청하기</button>
				</td>
			</tr>
		</c:if>
	</table>
	<div class="applyBtnContainer" align="right">
		<button type="button" class="blueBtn" onclick="javascript:location.href='<%=ctxPath%>/hpPanel/updateHpInfo.sd'">신청하기</button>
	</div>
	<div class="pageContainer" align="center">
		${pageBar }
	</div>
</div>