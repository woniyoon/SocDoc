<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>

<link rel="stylesheet" type="text/css" media="screen" href="<%=ctxPath %>/resources/css/reservationInfo.css" />
<!-- Pignose 캘린더 라이브러리 임포트 -->
<link rel="stylesheet" href="<%=ctxPath %>/resources/pg-calendar/dist//css/pignose.calendar.min.css">
<link rel="stylesheet" href="<%=ctxPath %>/resources/pg-calendar/dist//css/pignose.calendar.css">
<script src="<%=ctxPath %>/resources/pg-calendar/dist/js/pignose.calendar.min.js"></script>
<script src="<%=ctxPath %>/resources/pg-calendar/dist/js/pignose.calendar.full.min.js"></script>
<script src="<%=ctxPath %>/resources/pg-calendar/dist/js/pignose.calendar.full.js"></script>
<script src="<%=ctxPath %>/resources/pg-calendar/dist/js/pignose.calendar.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>

<script>
	$(document).ready(function() {
		console.log("document ready function");
		$(".visitorRow").each(function() {
			$(this).click(function(e) {
				// 체크박스 클릭시, 이벤트를 취소
				if (e.target.type == "checkbox") {
					e.stopPropagation();
					console.log("event canceled!!");
				} else {
					$(".modalContainer").removeClass("hidden");
					console.log("event going on");
				}
			});
		});
	});

	$(function() {
		$('.calendar').pignoseCalendar({
			init : function(context) {

				// 캘린더가 처음 로딩되기 전에 실행되는 코드블럭

				// This is chaining Element, It is exactly same as the each elements of $('.calendar').
				var $this = $(this);

				// You can get target element in `context` variable.
				var $element = context.element;

				// You can also get calendar element, It is calendar view DOM.
				var $calendar = context.calendar;

				console.log("test");
			},
			click : function(event, context) {
				// This is clicked button Element.
				var $this = $(this);

				// You can access event parameter.
				event.preventDefault();

				// You can get target element in `context` variable, This element is same `$(this)`.
				var $element = context.element;

				// You can also get calendar element, It is calendar view DOM.
				var $calendar = context.calendar;

				// 선택된 날짜
				console.log(context.current[0]._i);
			},
			prev : function(info, context) {
				// DB에서 이전 달 정보를 새로 가져온다
			},
			next : function(info, context) {
				// DB에서 다음 달 정보를 새로 가져온다
			},
			lang : 'ko',
			disabledWeekdays : [ 0 ]
		// SUN (0), SAT (6)
		});

		getTimetable();
		console.log("this should be printed");
	});

	function getTimetable() {
		var html = "<table class='timetable'>";

		for (var i = 9; i <= 18; i++) {
			html += "<tr><td>" + i + ":00</td><td>0/6 명</td></tr>";
		}

		html += "</table>";
		$(".timetableContainer").html(html);
	}

	function closeModal() {
		$(".modalContainer").addClass("hidden");
	}
</script>

<div class="container" align="center">
	<h2 align="left">예약관리</h2>
	<div class="schedulePanel">
<!-- 		<div class="calendarContainer"> -->
			<div class="calendar"></div>
<!-- 		</div> -->
		<div class="timetableContainer">
			<table>
				<tr>
					<td>9:00</td>
					<td>0/6 명</td>
				</tr>
				<tr>
					<td>10:00</td>
					<td>0/6 명</td>
				</tr>
				<tr>
					<td>11:00</td>
					<td>0/6 명</td>
				</tr>
				<tr>
					<td>12:00</td>
					<td>0/6 명</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="reservationPanel">
		<h3>오늘의 방문예정자</h3>
		<table class="customTable" id="visitorTbl" align="center">
			<thead>
				<tr>
					<th>번호</th>
					<th>시간</th>
					<th>예약자명</th>
					<th>연락처</th>
					<th>초진/재진</th>
					<th>방문상태</th>
					<th>방문여부설정</th>
				</tr>
			</thead>
			<!-- 동적으로 생성되는 부분 ⬇️-->
			<tbody>
				<tr class="visitorRow">
					<td>1</td>
					<td>9:00</td>
					<td>김무명</td>
					<td>010-0000-0000</td>
					<td>초진</td>
					<td>방문</td>
					<td><input type="checkbox" /></td>
				</tr>
				<tr class="visitorRow">
					<td>2</td>
					<td>10:00</td>
					<td>이무명</td>
					<td>010-0000-0000</td>
					<td>재진</td>
					<td>예정</td>
					<td><input type="checkbox" /></td>
				</tr>
				<tr class="visitorRow">
					<td>3</td>
					<td>10:00</td>
					<td>박무명</td>
					<td>010-0000-0000</td>
					<td>초진</td>
					<td>예정</td>
					<td><input type="checkbox" /></td>
				</tr>
			</tbody>
			<!-- 동적으로 생성되는 부분 ⬆️-->
		</table>
	</div>
	<div class="modalContainer hidden">
		<div class="modalOverlay" onclick="closeModal()">
			<div class="modalContent" align="center">
				<div class="modalContentHeader">
					<h4 align="left">환자정보</h4>
					<span style="font-size: 1.2em; cursor: pointer;"
						onclick="closeModal()">X</span>
				</div>
				<!-- ajax를 이용해, 동적으로 생성 ⬇️-->
				<table class="visitorDetail customTable" >
					<tr align="center">
						<td>성명</td>
						<td>김나나</td>
					</tr>
					<tr align="center">
						<td>생년월일</td>
						<td>1999.02.02</td>
					</tr>
					<tr align="center">
						<td>나이</td>
						<td>만 20세</td>
					</tr>
					<tr align="center">
						<td>성별</td>
						<td>여자</td>
					</tr>
					<tr align="center">
						<td>연락처</td>
						<td>010-4012-3123</td>
					</tr>
					<tr align="center">
						<td>방문이력</td>
						<td>^^)7
						</td>
					</tr>
				</table>
				<!-- 동적으로 생성되는 부분 ⬆️-->
			</div>
		</div>
	</div>
</div>