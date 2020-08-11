<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%
	String ctxPath = request.getContextPath();
%>

<style type="text/css">

	h2 {
		font-weight: bold;
		padding-top: 30px;
	}
    
    table {
		width: 100%;
		border-collapse: collapse;
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
	
	span.noticeTitle:hover {
		cursor: pointer;
	}
    
    #noticeList {
		width: 1000px;
		margin-left: auto;
		margin-right: auto;
	}
	
	#noticeList:after {
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

	#writeBtn {
		float: right;
		margin-top: 30px;
        margin-right: 20px;
        background-color: #0080ff;
      	color:#fff;
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

	<div id="container" style="min-height: 100vh;">

        <div id="noticeList">
           
            <h2>공지사항관리</h2>
            
            <p style="margin: 20px 0 20px 0;">전체 글 : ${totalCount}개</p>
           	
           	<form name="deleteFrm">
	            <table class="table" style="text-align: center;">
	                <thead>
	                     <tr>
	                        <th>선택</th>
	                        <th>No.</th>
	                        <th>제목</th>
	                        <th>등록일</th>
	                     </tr>
	                </thead>
	
					
	                <c:forEach var="noticevo" items="${noticevoList}">
	                    <tr>
	                        <td><input type="checkbox" name="noticeck" class="noticeck" value="${noticevo.noticeSeq}" /></td>
	                        <td>${noticevo.noticeSeq}</td>
	                        <td><span class="noticeTitle" onclick="goView('${noticevo.noticeSeq}')">${noticevo.subject}</span></td>
	                        <td>${noticevo.regDate}</td>
	                    </tr>
					</c:forEach>
	            </table>
	            <input type="hidden" id="noticeJoin" name="noticeJoin" />
            </form>
            
            <button id="ckAll">전체선택</button>
            <button id="deleteBtn">삭제</button>
            <button id="writeBtn" onclick="location.href='<%= ctxPath%>/noticeWrite.sd'">글쓰기</button>
            
        </div>		
        
        <div align="center">
			${pageBar}
		</div>
        
        <form name="goViewFrm">
        	<input type="hidden" name="noticeSeq" />
        </form>
	
	</div>



<script type="text/javascript">
	
	<%-- 
	$(".noticeTitle").click(function(){ 
		
	    location.href='<%= ctxPath%>/noticeView.sd';
	    
	});
	 --%>
	

	$(document).ready(function($){	
		
		$("#ckAll").click(function(){
			
			if($("input:checkbox[name=noticeck]").is(":checked")==true) {

				$("input[name=noticeck]:checkbox").attr("checked", false);
			}
			else {
				$("input[name=noticeck]:checkbox").attr("checked", true);
			}
			
		});
		
		$("#deleteBtn").click(function() {
			goDel();
		});
		
		
		$("#noticeck").click(function(){
			alert("글번호:"+$("input:checkbox[name=noticeck]").val());
		});
		
	});	 // end of $(document).ready(function($){}) ----------------------------
	

	function goView(noticeSeq) {
	//	console.log(noticeSeq);
 		var frm = document.goViewFrm;
		frm.noticeSeq.value = noticeSeq; 
		
		frm.method = "GET";
		frm.action = "<%=ctxPath%>/noticeView.sd";
		frm.submit();
	}
	
	
	function goDel() {
        
        var cnt = $("input[name='noticeck']:checked").length;
        
        var arr = new Array();
       
        $("input[name='noticeck']:checked").each(function() {
            arr.push($(this).attr('id'));
        });
        
        if(cnt == 0){
            alert("선택된 글이 없습니다.");
        }
        else{
           var con = confirm("삭제하시겠습니까?");
           
           var allCnt = $("input[name='noticeck']").length;
           
           var noticeArr = new Array();
           
           for(var i=0; i<allCnt; i++) {
        	   
        	   if($("input:checkbox[class=noticeck]").eq(i).is(":checked")) {
        		   	noticeArr.push($("input:checkbox[class=noticeck]").eq(i).val());   
        	   }
           }

           var noticeJoin = noticeArr.join();
           
           $("#noticeJoin").val(noticeJoin);
           
        // alert(noticeJoin);
           
           if(con == true) {
              var frm = document.deleteFrm;
              frm.method = "POST";
              frm.action = "<%= request.getContextPath()%>/goDel.sd"
              frm.submit();
           }
           else if(con == false){ 
              location.href="history.back()";

           }
        } 
           
     }
	
</script>    