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
	
	.listHeader {
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

	.searchContainer {
		display: flex;
		flex-direction: row;		
	}
	
	.excelBtnContainer {
		margin: 10px;
	}
	
	
	/* 모달창 만들기 */
	
	.hidden {
	    display: none;
	}
	
	.modalContainer {
	    position: fixed;
	    left: 0;
	    top: 0;
	    width: 100%;
	    height: 100%;
	    z-index: 1000;	/* 달력의 화살표가 튀어나오지 않게 방지 */
	}
	
	.modalOverlay {
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    background-color: rgba(0, 0, 0, 0.2);
	    width: 100%;
	    height: 100%;
	    position: absolute;
	}
	
	.modalContent {
	    background-color: white;
	    width: 30%;
	    /* min-height: 70%; */
	    overflow-y: auto;
	    /* max-height: 60%; */
	    position: relative;
	    padding: 30px;
	    border: 1px solid rgb(230, 230, 230);
	}
	
	.modalContentHeader {
	    display: flex;
	    flex-direction: row;
	    justify-content: space-between;
	}
	
	.visitorDetail {
		width: 90%;
		margin: 40px 0 0 0;	
	}
	
	.visitorDetail tr, .visitorDetail td {
		border-top: 1px solid #dddddd;
		border-collapse: collapse;
		padding: 10px 0;	
	}
</style>

<script src="<%=ctxPath%>/resources/js/util/common.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#searchWord").keydown(function(e){
		    if (e.keyCode == 13) {
		    	search();
		    }
		});
		
	});
	
	function search() {
		var searchWord = $("#searchWord").prop("value");	
		
		location.href = "<%=ctxPath%>/hpPanel/visitorsMng.sd?currentShowPageNoStr=1&searchWord=" + searchWord;
	}

	function displayInfoModal(userid){
		

		$.ajax({
			url:"<%=ctxPath%>/ajax/getVisitorDetail.sd",
			type:"POST",
			data:{"userid": userid },
			dataType: "JSON",
            success: function(json){
               console.log(json);
               
               console.log("???????");
               console.log(json.height);
               
               
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
             
/*  	               			+ "<tr align='center'><td>방문이력</td><td>"+json.record+"</td></tr>"; */
/* 	               			+ "<tr align='center'><td>방문이력</td><td><table class='recordTbl' align='center'></table></td></tr>" */
			
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
	
	function closeModal() {
		$(".modalContainer").addClass("hidden");
	}

</script>

<div class="visitorsListContainer">
	<h3 align="left">방문회원관리</h3>
	<div class="listHeader" align="right">
		<span>총 <span id="numOfVisitors">${numOfVisitors}</span> 건</span>
		<div class="searchContainer">
			<input class="visitorSearch" id="searchWord" type="text" placeholder="회원 검색" value="${searchWord}" />
			<button class="blueBtn" id="searchBtn" onclick="search()">검색</button>
		</div>
	</div>
	<table class="customTable" id="visitorList" style="width: 100%;">
		<caption> </caption>
		<thead>
			<tr>
				<th class="header">순번</th>
				<th class="header">이름</th>
				<th class="header">생년월일</th>
				<th class="header">나이</th>
				<th class="header">연락처</th>
				<th class="header">마지막방문일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${not empty visitorsList }">
				<c:forEach var="map" items="${visitorsList }">
					<tr class="visitors" id="${map.memberSeq }" onclick="displayInfoModal('${map.userid}')">
						<td class="rno">${map.rno}</td>
						<td class="name">${map.name}</td>
						<td class="birthDate">${map.birthDate}</td>
						<td class="age">${map.age}</td>
						<td class="phone">${map.phone}</td>
						<td class="visitDate">${map.visitDate}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty visitorsList }">
				<tr align="center">
					<td colspan="6">결과가 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	<div class="modalContainer hidden">
		<div class="modalOverlay">
			<div class="modalContent" align="center">
				<div class="modalContentHeader">
					<h4 align="left">환자정보</h4>
					<span style="font-size: 1.2em; cursor: pointer;" onclick="closeModal()">X</span>
				</div>
				<table class="visitorDetail customTable" >
				</table>
			</div>
		</div>
	</div>
	<c:if test="${not empty visitorsList }">
		<div class="excelBtnContainer" align="right">
			<button class="blueBtn" type="button" onclick="exportAsExcel('visitorList','방문자 리스트')">엑셀로 내보내기</button>
		</div>	
	</c:if>
	<div class="page_wrap" align="center">
		<span>${pageBar }</span>
	</div>
</div>