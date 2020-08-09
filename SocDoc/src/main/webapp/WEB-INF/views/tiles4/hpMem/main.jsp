<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
%>

<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/hpMain.css" />
	<section class="hpMainSection">
		<table class="scheduleTbl">
			<thead>
				<tr>
					<th colspan="2" align="left"><a><h4>병원진료시간 ></h4></a></th>
				</tr>
				<tr>
					<td>평일</td>
					<td>주말</td>
				</tr>
			</thead>
			<tbody>
				<!-- 동적으로 생성되는 부분 ⬇️-->
				<tr>
					<td id="weekdaySchedule" rowspan="5">
					<c:if test="${ not empty openingHours }">
						<c:forEach var="map" items="${openingHours }" varStatus="status">
							<div>
							<c:choose>
						         <c:when test = "${status.index == 0}">
						            월요일
						         </c:when>
						         <c:when test = "${status.index == 1}">
						            화요일
						         </c:when>
						         <c:when test = "${status.index == 2}">
						            수요일
						         </c:when>
						         <c:when test = "${status.index == 3}">
						            목요일
						         </c:when>
						         <c:when test = "${status.index == 4}">
						            금요일
						         </c:when>
						         <c:when test = "${status.index == 5}">
						            토요일
						         </c:when>
						      </c:choose>
							&emsp;<span>${map.open}</span> ~ <span>${map.close}</span></div>
						</c:forEach>
					</c:if>
					</td>
				</tr>
				<tr>
					<td>토요일 오전 09:00 ~ 오후 06:00<br> 일요일 오전 09:00 ~ 오후 06:00<br>
					</td>
				</tr>
				<tr>
					<td>병원식사시간</td>
				</tr>
				<tr>
					<td rowspan="2">점심 오전 11:00 ~ 오후 01:00<br> 저녁 오전 06:00 ~
						오후 07:00<br>
					</td>
				</tr>
				<!-- 동적으로 생성되는 부분 ⬆️-->
			</tbody>
		</table>
	
		<br>
		<br>
		<!-- 후기 패널 -->
		<table class="reviewBoard">
			<thead>
				<tr>
					<th colspan="4" align="left"><a><h4>후기 ></h4></a></th>
				</tr>
			</thead>
			<tbody>
				<!-- 동적으로 생성되는 부분 ⬇️-->
				<tr>
					<td colspan="4">
						<span>
							woniyoon   ☆☆☆☆☆    좋아요 ~~~   2020-07-24
						</span>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<span>
							woniyoon   ☆☆☆☆☆    좋아요 ~~~   2020-07-24
						</span>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<span>
							woniyoon   ☆☆☆☆☆    좋아요 ~~~   2020-07-24
						</span>
					</td>
				</tr>
				<!-- 동적으로 생성되는 부분 ⬆️-->
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" align="right"><span style="cursor: pointer" onclick="location.href='<%=ctxPath %>/hpPanel/reservationInfo.sd'">더보기</span></td>
				</tr>
			</tfoot>
		</table>
	</section>
