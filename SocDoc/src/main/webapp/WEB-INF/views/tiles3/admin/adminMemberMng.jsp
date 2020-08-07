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
	
	#memberList {
		width: 1000px;
		margin-left: auto;
		margin-right: auto;
	}
	
	#memberList:after {
		content: '';
		clear: both;
		display: block;
	}

	th {
		text-align: center;
	}
	
	.deleteBtn {
      background-color: #efefef;
      cursor: pointer;   
      border: 1px solid #dddddd;       
      padding: 0.25em .75em;    
      border-radius: .25em;       
      font-weight: 500;
      font-size: 10pt;   
      margin-top: 30px;
    }

</style>


	<div id="container" style="min-height: 100vh;">
		
		<div id="memberList">
			<h2>회원관리</h2>
			
			<form name="searchFrm"> 
	            <button class="searchBtn" onclick="goSearch()">검색</button>
	            <input type="text" class="searchWord" id="searchWord" name="searchWord" autocomplete="off" placeholder="검색어를 입력하세요">
	            <select name="searchType" id="searchType">
	                <option selected="selected" value="userid">아이디</option>
	                <option value="name">이름</option>
	                <option value="email">이메일</option>
	                <option value="phone">전화번호</option>
	            </select>
            </form>
            
            <p>전체 회원 수 : ${totalCount}명</p>		
			<table class="table" style="text-align: center;">
				<tr>
					<th>선택</th>
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>가입일자</th>
					<th>상태</th>
				</tr>
				<c:forEach var="membervo" items="${membervoList}">
					<tr>
						<td><input type="checkbox" /></td>		
						<td>${membervo.userid}</td>			
						<td>${membervo.name}</td>			
						<td>${membervo.birthDate}</td>			
						<td>${membervo.email}</td>			
						<td>${membervo.phone}</td>			
						<td>${membervo.registerDate}</td>	
						<c:choose>
							<c:when test="${membervo.status eq 1}">
								<td style="font-weight:bold;">회원</td>	
							</c:when>
							<c:when test="${membervo.status eq 0}">
								<td style="font-weight:bold; color:red;">탈퇴</td>	
							</c:when>
						</c:choose>		
					</tr>
				</c:forEach>
				
			</table>
			
			<div align="right">
		      <button type="button" id="deleteBtn" class="deleteBtn"> 탈퇴 </button>   
		   </div>
		   
		   <div align="center">
				${pageBar}
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
		
	});
	
	
	function goSearch() {
		var frm = document.searchFrm;
			frm.method = "GET";
			frm.action = "<%= request.getContextPath()%>/adminMemberMng.sd";
			frm.submit();
	}

</script>	