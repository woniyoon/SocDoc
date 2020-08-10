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

	th {
		text-align: center;
	}
	
    #updateBtn {
		float: right;
		margin-top: 30px;
     	margin-right: 10px;
	}
	
	#deleteBtn {
		float: right;
		margin-top: 30px;
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
	                <option value="">병원명</option>
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
				<tr>
                    <td><input type="checkbox"/></td>	
					<td>${hpvo.userid}</td>			
					<td>${hpvo.regId}</td>			
					<td>${hpvo.name}</td>			
					<td>강남병원</td>	
					<c:choose>
						<c:when test="${hpvo.infoStatus eq 1}">
							<td style="color:red; font-weight:bold;">신청</td>
						</c:when>			
						<c:when test="${hpvo.infoStatus eq 3}">
							<td style="color:green; font-weight:bold;">수정</td>
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
		
	});
	
	
	function goSearch() {
		var frm = document.searchFrm;
			frm.method = "GET";
			frm.action = "<%= request.getContextPath()%>/hospitalInfo.sd";
			frm.submit();
	}

</script>	