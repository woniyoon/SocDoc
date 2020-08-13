<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">

	h2 {
		font-weight: bold;
		padding-top: 30px;
	}
	
    .searchWord {
        font-size: 12px;
        width: 150px;
        height: 10px;
        padding: 10px;
        border: solid 1.3px #1b5ac2;
        float: right;
        margin-left: 5px;
    }

    .searchBtn {
        width: 40px;
        height: 23px;
        border: 0px;
        float: right;
        color: #ffffff;
        background-color: #1b5ac2;
    }
	
    select {
        float: right;
		margin: 15px 10px 20px 0px;
	}
    
    table {
		width: 100%;
		border-collapse: collapse;
		margin-top: 25px;
	}
	
    th {
		font-size: 14px;
	    font-weight: bold;
	    color: #222222;
	    text-align: center;
	    padding: 17px 3px;
	    border-top: 1px solid #333333;
	    border-bottom: 1px solid #333333;
	}
	
	td {
		font-size: 14px;
	    color: #666666;
	    text-align: center;
	    padding: 17px 0;
	    border-bottom: 1px solid #dddddd;
	    line-height: 1.8;
	
	}
	
	#hospitalInfoList {
		width: 1000px;
		margin-left: auto;
		margin-right: auto;
	}
	
	#hospitalInfoList:after {
		content: '';
		clear: both;
		display: block;
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
	    height: auto;
	    min-height: 50%;
	    max-height: 60%;
	    position: relative;
	    padding: 30px;
	    border: 1px solid rgb(230, 230, 230);
	}
	
	.modalContentHeader {
	    display: flex;
	    flex-direction: row;
	    justify-content: space-between;
	}

	th {
		text-align: center;
	}
	
    #updateBtn {
     	margin-right: 10px;
     	float: right;
		margin-top: 30px;
        background-color: #efefef;
        cursor: pointer;   
      	border: 1px solid #dddddd;       
      	padding: 0.25em .75em;    
      	border-radius: .25em;       
      	font-weight: 500;
      	font-size: 10pt;  
	}
	
	#deleteBtn {
		float: right;
		margin-top: 30px;
        background-color: #efefef;
        cursor: pointer;   
      	border: 1px solid #dddddd;       
      	padding: 0.25em .75em;    
      	border-radius: .25em;       
      	font-weight: 500;
      	font-size: 10pt;  
	}

</style>


	<div id="container" style="min-height: 70vh;">
		
		<div id="hospitalInfoList">
			<h2>병원등록</h2>
			 
			<form name="searchFrm">  
	            <button class="searchBtn" onclick="goSearch()">검색</button>
	            <input type="text" class="searchWord" id="searchWord" name="searchWord" placeholder="검색어를 입력하세요">
	            <select id="searchType" name="searchType">
	                <option selected="selected" value="userid">아이디</option>
	                <option value="regId">사업자번호</option>
	                <option value="hpName">병원명</option>
	            </select>
            </form>
            
            <p>전체 등록 수 : ${totalCount}명</p>		
			
			<table class="table table-hover" style="text-align: center;">
				<tr>
					<th>선택</th>
					<th>아이디</th>
					<th>사업자번호</th>
					<th>담당자</th>
					<th>병원명</th>
					<th>상태</th>
				</tr>
				
				<c:forEach var="hpvo" items="${hpinfovoList}">
				<tr class="detailRow">
                    <td><input type="checkbox"/></td>	
					<td>${hpvo.userid}</td>			
					<td>${hpvo.regId}</td>			
					<td>${hpvo.name}</td>			
					<td>${hpvo.hpName}</td>	
					<c:choose>
						<c:when test="${hpvo.infoStatus eq 1}">
							<td style="color:red; font-weight:bold;">대기</td>
						</c:when>			
						<c:when test="${hpvo.infoStatus eq 3}">
							<td style="color:blue; font-weight:bold;">수정</td>
						</c:when>			
					</c:choose>
				</tr>
				</c:forEach>
			</table>
			
			<button id="deleteBtn">반려</button>
            <button id="updateBtn" data-toggle="modal" data-target="#myModal">승인</button> 
            
		</div>
		
		<div align="center">
			${pageBar}
		</div>
		
		<div class="modalContainer hidden">
		<div class="modalOverlay">
			<div class="modalContent" align="center">
				<div class="modalContentHeader">
					<h4 align="left">환자정보</h4>
					<span style="font-size: 1.2em; cursor: pointer;"
						onclick="closeModal()">X</span>
				</div>
				<table class="hospitalDetail customTable" >
					병원상세정보
				</table>
				</div>
			</div>
		</div>
		
		
	</div>
	

<script type="text/javascript">
	$(document).ready(function(){
		
		$("#searchWord").keydown(function(event){
			if(event.keyCode == 13) {
				goSearch();
			}
		});
		
		if(${paraMap != null}) {
			$("#searchType").val("${paraMap.searchType}");
			$("#searchWord").val("${paraMap.searchWord}");
		}
		
		$(".detailRow").each(function() {
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
	
	
	function goSearch() {
		var frm = document.searchFrm;
			frm.method = "GET";
			frm.action = "<%= request.getContextPath()%>/hospitalInfo.sd";
			frm.submit();
	}
	
	function closeModal() {
		$(".modalContainer").addClass("hidden");
	}

</script>	