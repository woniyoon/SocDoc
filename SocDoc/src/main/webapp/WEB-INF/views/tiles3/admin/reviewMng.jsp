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

	th {
		text-align: center;
	}
	
	#reviewList {
		width: 1000px;
		margin-left: auto;
		margin-right: auto;
	}
	
	#reviewList:after {
		content: '';
		clear: both;
		display: block;
	}
	
    #ckAll {
        margin-top: 30px;
	  	background-color: #efefef;
      	cursor: pointer;   
      	float: left;
      	border: 1px solid #dddddd;       
      	padding: 0.25em .75em;    
      	border-radius: .25em;       
      	font-weight: 500;
      	font-size: 10pt;   
      	margin-right: 1	
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
	
	
	/* ---------- */
	
	.hospitalRatingStar {
      background: url('/socdoc/resources/images/starsBlue.png') no-repeat right 0;
      background-size: auto 100%;
      width: 30px;
      height: 30px;
      display: inline-block;
      text-indent: -9999px;
      cursor: pointer;
      margin-bottom: 10px;
   }
	
	.reviewStar {
      background: url('/socdoc/resources/images/starsYellow.png') no-repeat right 0;
      background-size: auto 100%;
      width: 15px;
      height: 15px;
      display: inline-block;
      text-indent: -9999px;
      cursor: pointer;
      margin-bottom: 10px;
   }

   .on{
      background-position:0 0;
   }

</style>

	<div id="container" style="min-height: 70vh;">
		
		<div id="reviewList">
			<h2>후기관리</h2>
				
		   <form name="searchFrm">		
	           <button class="searchBtn" onclick="goSearch()">검색</button>
	            <input type="text" class="searchWord" id="searchWord" name="searchWord" placeholder="검색어를 입력하세요">
	            <select name="searchType" id="searchType">
	                <option selected="selected" value="">기관명</option>
	                <option value="userid">작성자</option>
	            </select>
            </form>
            
            <p>전체 후기: ${totalCount}개</p>
            
			<form name="deleteFrm">
				<table class="table table-hover" style="text-align: center;">
	                <thead>
	                     <tr>
	                        <th>선택</th>
	                        <th>기관명</th>
	                        <th>내용</th>
	                        <th style="width: 100px;">별점</th>
	                        <th>작성자</th>
	                        <th>작성일</th>
	                     </tr>
	                </thead>
	                
					<c:forEach var="reviewvo" items="${reviewvoList}">
	                    <tr>
	                        <td><input type="checkbox" name="reviewck" class="reviewck" value="${reviewvo.rno}" /></td>
	                        <td>${reviewvo.name}</td>
	                        <td>${reviewvo.content}</td>
	                   		<%-- 
	                   		<td>
		                        <c:if test="${reviewvo.rating==5}">★★★★★</c:if>
				                <c:if test="${reviewvo.rating==4}">★★★★</c:if>
				                <c:if test="${reviewvo.rating==3}">★★★</c:if>
				                <c:if test="${reviewvo.rating==2}">★★</c:if>
				                <c:if test="${reviewvo.rating==1}">★</c:if>
			                </td>
			                 --%>
			                <td style="width: 30px;"> 
				                <c:if test="${not empty reviewvoList}">
									    <c:forEach var="i" begin="1" end="5">
										   <c:if test="${reviewvo.rating >= i}">
										   		<span class="reviewStar on" id="hospitalRatingStar${i}">별</span>
										   </c:if>
										   <c:if test="${reviewvo.rating < i}">
										   		<span class="reviewStar" id="hospitalRatingStar${i}">별</span>
										   </c:if>
										</c:forEach>
								</c:if>
							</td>
	                        <td>${reviewvo.userid}</td>
	                        <td>${reviewvo.regDate}</td>
	                    </tr>
					</c:forEach>
	
	            </table>
					<input type="hidden" id="reviewJoin" name="reviewJoin" />	
            </form>
            <!-- 
            <button id="ckAll">전체선택</button>
            <button id="deleteBtn">삭제</button>
             -->
		</div>
		
            <div align="center" style="margin: 30px 0px 30px 0px;">
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
		
		$("#deleteBtn").click(function() {
			goDel();
		});
		
		
	});
	
	
	function goSearch() {
		var frm = document.searchFrm;
			frm.method = "GET";
			frm.action = "<%= request.getContextPath()%>/reviewMng.sd";
			frm.submit();
	}

	function goDel() {
        
        var cnt = $("input[name='reviewck']:checked").length;
        
        var arr = new Array();
       
        $("input[name='reviewck']:checked").each(function() {
            arr.push($(this).attr('id'));
        });
        
        if(cnt == 0){
            alert("선택된 글이 없습니다.");
        }
        else{
           var con = confirm("리뷰를 삭제하시겠습니까?");
           
           var allCnt = $("input[name='reviewck']").length;
           
           var reviewArr = new Array();
           
           for(var i=0; i<allCnt; i++) {
        	   
        	   if($("input:checkbox[class=reviewck]").eq(i).is(":checked")) {
        		   	reviewArr.push($("input:checkbox[class=reviewck]").eq(i).val());   
        	   }
           }

           var reviewJoin = reviewArr.join();
           
           $("#reviewJoin").val(reviewJoin);
           
        // alert(reviewJoin);
           
           if(con == true) {
              var frm = document.deleteFrm;
              frm.method = "POST";
              frm.action = "<%= request.getContextPath()%>/reviewDel.sd"
              frm.submit();
           }
           else if(con == false){ 
              location.href="history.back()";

           }
        } 
           
     }
</script>		