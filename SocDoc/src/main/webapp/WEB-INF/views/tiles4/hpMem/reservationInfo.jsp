<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
				getReservationList();
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
				var visitDate = context.current[0]._i;
				
				getReservationList(visitDate);
				getTimetable(visitDate);
				
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

		console.log("this should be printed");
	});

	// 선택한 날짜의 예약 현황 확인
	function getTimetable(visitDate) {
		
		$.ajax({
			url:"<%=ctxPath%>/ajax/getNumPerHour.sd",
			type:"POST",
			data:{"visitDate": visitDate},
			dataType: "JSON",
            success: function(json){
            	console.log(json);
            	var html = "<table class='timetable'>";
				
            	console.log(typeof json);
            	$.each(json, function(index, item){
            		console.log("?????");
            		html += "<tr><th>" + item.hour + "</th><td>"+ item.cnt +" / 6 명</td></tr>";
           		
           		});

        		html += "</table>";
        		$(".timetableContainer").html(html);
            },
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				target.checked = !newVisitStatus;
			}
		});
	}

	function closeModal() {
		$(".modalContainer").addClass("hidden");
	}
	
	function getReservationList(visitDate){
		$.ajax({
			url:"<%=ctxPath%>/ajax/reservationList.sd",
			type:"GET",
			data:{"visitDate": visitDate},
			dataType: "JSON",
            success: function(json){
                var html = "";
               	console.log(json);
                
               	if(json.length > 0) {
               		$.each(json, function(index, item){
               			var num = index + 1;
               			console.log(typeof item.hasVisited);
               			var checked = item.hasVisited ? "checked" : "unchecked";
               			
               			html += "<tr id='"+item.userid+"' onclick='popModal(event)'>"
               					+	"<td>"+num+"</td>"
               					+	"<td>"+item.hour+"</td>"
               					+	"<td>"+item.name+"</td>"
               					+	"<td>"+item.phone+"</td>"
/*                					+	"<td>초진</td>" */
               					+	"<td id='visitStatus"+item.reservSeq+"'>"+(item.hasVisited?  "방문" : "미방문" ) +"</td>"
               					+	"<td><input onclick='updateVisitStatus(this,"+!item.hasVisited+")' id="+ item.reservSeq +" type='checkbox' "+checked+" /></td>"
               			 		+"</tr>";
               		});
               		
               	} else {
               		html = "<tr> <td colspan='6'>내역이 없습니다.</td></tr>"
               	}
                	
               	$("#reservationList").html(html);
            },
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
	}

	function updateVisitStatus(target){
		console.log(target);
		var hasVisited = target.checked;
		
		$.ajax({
			url:"<%=ctxPath%>/ajax/updateVisitStatus.sd",
			type:"POST",
			data:{"reservSeq": target.id,
				  "status": hasVisited},
			dataType: "JSON",
            success: function(json){
                var html = "";
               	console.log(json);
              	if(json.isDone) {
 					var status = hasVisited ? "방문" : "미방문";
	               	$("#visitStatus"+target.id).html(status);
              	} else {
              		alert("문제가 발생했습니다.\n다시 시도해주세요!");
    				target.checked = !hasVisited;
              	}
            },
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				target.checked = !newVisitStatus;
			}
		});
	}

	function popModal(e){
		console.log("?!");

		// 체크박스 클릭시, 이벤트를 취소
		if (e.target.type == "checkbox") {
			e.stopPropagation();
			console.log("event canceled!!");
		} else {
			var userid = e.target.parentElement.id;
			
			$.ajax({
				url:"<%=ctxPath%>/ajax/getVisitorDetail.sd",
				type:"POST",
				data:{"userid": userid, 
					  "currentShowPageNoStr": 1},
				dataType: "JSON",
	            success: function(json){
	               console.log(json);
	               
	               var html = "<tr align='center'><td>성명</td><td>"+json.name+"</td></tr>"
          			+ "<tr align='center'><td>생년월일</td><td>"+json.birthDate+"</td></tr>"
          			+ "<tr align='center'><td>나이</td><td>"+json.age+"</td></tr>"
          			+ "<tr align='center'><td>성별</td><td>"+json.gender+"</td></tr>"
          			+ "<tr align='center'><td>연락처</td><td>"+json.phone+"</td></tr>"
          			+ "<tr align='center'><td>키</td><td>"+(json.height != -1 ? json.height : "정보없음")+"</td></tr>"
          			+ "<tr align='center'><td>몸무게</td><td>"+(json.weight != -1 ? json.weight : "정보없음")+"</td></tr>"
          			+ "<tr align='center'><td>혈액형</td><td>"+json.bloodType+"</td></tr>"
          			+ "<tr align='center'><td>알레르기</td><td>"+json.allergy+"</td></tr>"
          			+ "<tr align='center'><td>병력</td><td>"+json.history+"</td></tr>"
          			+ "<tr align='center'><td>복용약</td><td>"+json.medicine+"</td></tr>";
          			
	               $(".visitorDetail").html(html);
	               
	               var recordArr = JSON.parse(json.record);
	               var recordHtml;
	               for(var i=0; i<recordArr.length; i++) {
	            	   recordHtml += "<tr><td>" + recordArr[i].visitDate + "</td></tr>";
	               }
	               
	               console.log(recordHtml);
	               $(".recordTbl").html(recordHtml);
	               
	               $(".modalContainer").removeClass("hidden");
					console.log("event going on");
	            },
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					target.checked = !newVisitStatus;
				}
			});
			
			
		}
	}
	
</script>

<div class="container" align="center">
	<h3 align="left">예약관리</h3>
	<div class="schedulePanel">
		<div class="calendar"></div>
		<div class="timetableContainer" align="center">
			<span>날짜를 선택해주세요.</span>
		</div>
	</div>
	<div class="reservationPanel">
		<h3>오늘의 방문예정자</h3>
		<table class="customTable" id="visitorTbl" align="center">
			<thead>
				<tr>
					<th></th>
					<th>시간</th>
					<th>예약자명</th>
					<th>연락처</th>
<!-- 					<th>초진/재진</th> -->
					<th>방문상태</th>
					<th>방문여부설정</th>
				</tr>
			</thead>
			<tbody id="reservationList">
			</tbody>
		</table>
	</div>
	<div class="modalContainer hidden">
		<div class="modalOverlay">
			<div class="modalContent" align="center">
				<div class="modalContentHeader">
					<h4 align="left">환자정보</h4>
					<span style="font-size: 1.2em; cursor: pointer;"
						onclick="closeModal()">X</span>
				</div>
				<table class="visitorDetail customTable" >
				</table>
			</div>
		</div>
	</div>
</div>