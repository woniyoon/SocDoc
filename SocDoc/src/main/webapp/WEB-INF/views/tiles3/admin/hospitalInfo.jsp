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
	    width: 70%;
	    height: auto;
	    min-height: 85%;
	    max-height: 85%;
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
	
	#rejectBtn {
		float: right;
		margin-right: 20px;
		margin-top: 30px;
        background-color: #efefef;
        cursor: pointer;   
      	border: 1px solid #dddddd;       
      	padding: 0.25em .75em;    
      	border-radius: .25em;       
      	font-weight: 500;
      	font-size: 10pt;  
	}

      
/* =========================================================================== */
   
   .hospitalDetail{
      margin:0px auto;
   }
   
   .hospitalName{
      font-size : 15pt;
      font-weight: 900;
   }   

   .info{
      margin-top:10px;
   }
   
   .one {
      display:inline-block;
      width:55%;
      height:450px;
      padding-right:10px;      
   }
   
   .two{
      float:right;
      width:45%;
      height:300px;
   }
   
   .infoTable{
      width:100%;
      font-size: 10pt;
      height:100%;
   }
   
   .infoTable th, td{
      padding:10px !important;
      border-top: 1px solid #ddd;
      border-bottom: 1px solid #ddd;
   }
   
   .infoTable th{
      background-color: #f2f2f2;
      width:80px;
      height:25px;
   }
   
   .review{
      width:100%;
      height:70px;
      margin-bottom: 5px;
      border: 1px solid #999999;    
      border-radius: .25em;       
      font-size: 10pt;
      padding:5px;   
      resize: none;
      padding-bottom: 30px;
   }
   
   textarea:focus{
      outline: none; 
   }
   
   .name{
      margin-right: 10px;
      font-weight: bolder;
   }

   #okBtn {
 	  float: right;
	  margin-top: 10px;
      background-color: #0080ff;
      color:#fff;
      cursor: pointer;   
      border: 1px solid #dddddd;       
      padding: 0.25em .75em;    
      border-radius: .25em;       
      font-weight: 500;
      font-size: 10pt;  
   }

   #noBtn {
 	  float: right;
	  margin-top: 10px;
	  margin-right: 10px;	  
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
			
			<%--  
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
			
			 --%>
			<form name="updateFrm">
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
					<tr class="detailRow" onclick="goDetail('${hpvo.hpSeq}','${hpvo.submitId}')">
	                    <td>
 	                    <%--<input type="checkbox" name="infock" class="infock" value="${hpvo.submitId}" onclick="saveIds();" /> --%>
	                    	<input type="checkbox" name="infock" class="infock" value="${hpvo.submitId}" />
	                    	<input class="hiddenValue" type="hidden" value="${hpvo.hpSeq}" />
	                    </td>	
						<td>${hpvo.submitId}</td>			
						<td>${hpvo.name}</td>			
						<td>${hpvo.regId}</td>			
						<td>${hpvo.hpName}</td>	
						<c:choose>
							<c:when test="${hpvo.status eq 1}">
								<td style="color:red; font-weight:bold;">대기</td>
							</c:when>			
							<c:when test="${hpvo.status eq 3}">
								<td style="color:blue; font-weight:bold;">수정</td>
							</c:when>			
						</c:choose>
					</tr>
					</c:forEach>
				</table>
					<input type="hidden" id="infoJoin" name="infoJoin" />
					<input type="hidden" id="hpSeq" name="hpSeq" />
        <%--<button id="updateBtn" onclick="goUpdate('${hpvo.hpSeq}')" data-toggle="modal" data-target="#myModal">승인</button> --%> 
            <button id="updateBtn" data-toggle="modal" data-target="#myModal">승인</button>
            <button id="rejectBtn" data-toggle="modal" data-target="#myModal" onclick="reject();">반려</button>
		</form>
            
		</div>
		
		<div align="center">
			${pageBar}
		</div>
		
		
		<!-- Modal section -->
		<div class="modalContainer hidden">
		<div class="modalOverlay">
			<div class="modalContent" align="center">
				<div class="modalContentHeader">
					<h4 align="left">병원정보</h4>
					<span style="font-size: 1.2em; cursor: pointer;"
						onclick="closeModal()">X</span>
				</div>
				   <div class="hospitalDetail customTable">
				<%-- 
				      
				      <div>
				         <span class="hospitalName">${hpDetail.hpName}</span>
					  </div>
				      <div class="info">
				         <div class="one">      
				              	${hpDetail.mainImg}
				         </div>
				         <div class="two">
				          --%>
				            <%-- 
				            <table class="infoTable">
				               <tr>
				                  <th>주소</th>
				                  <td>${hpDetail.address}</td>
				               </tr>
				               <tr>
				                  <th>대표전화</th>
				                  <td>${hpDetail.phone}</td>
				               </tr>
				               <tr>
				                  <th>기관</th>
				                  <td>${hpDetail.dept}</td>
				               </tr>
				               <tr>
				                  <th>소개</th>
				                  <td>${hpDetail.info}</td>
				               </tr>
				               <tr>
				                  <th>진료시간</th>
				                  <td>월요일<br/>
							                   화요일<br/>
							                   수요일<br/>
							                   목요일<br/>
							                   금요일<br/>
							                   토요일<br/></td>
							   </tr>
				            </table>
				            --%>    
				<!--                    
				         </div>
				      </div>
						      
				      <div>
				         <textarea id="review" name="review" class="review" maxlength="199" placeholder="반려사유 작성란"></textarea>
				      </div>
				      
				 -->
					</div>
					<button id="okBtn" class="okBtn" data-toggle="modal" data-target="#myModal">승인</button>
					<button id="noBtn" class="noBtn" data-toggle="modal" data-target="#myModal">반려</button>
					
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
		

		$("#updateBtn").click(function() {
//			goUpdate(hpSeq);
			saveIds();
		});
		
	});
	
	<%-- 
	function goSearch() {
		var frm = document.searchFrm;
			frm.method = "GET";
			frm.action = "<%= request.getContextPath()%>/hospitalInfo.sd";
			frm.submit();
	}
	--%>
	
	function closeModal() {
		$(".modalContainer").addClass("hidden");
	}
	
	function goDetail(hpSeq, submitId) {
		
		console.log(submitId);
		
		  $.ajax({
	             url:"<%= request.getContextPath()%>/detailInfo.sd",
	             type:"GET",
	             data:{"hpSeq":hpSeq, "submitId": submitId},
	             dataType:"JSON",
	             success:function(json){
	               // json결과가 오면 데이터를 동적으로 모달 안에 삽입.
	            	var html = "";

	               	console.log(json);
	               	
	                if(json != null) {
	              	 	console.log(json.address);

	               		html += "<div>";
 	               		html += "<span class='hospitalName'>"+json.hpName+"</span>";
	               		html += "</div>";
	               		html += "<div class='info'>";
	               		html += "<div class='one'>"+json.mainImg+"</div>";
	               		html += "<div class='two'>";
	               			
	                	html += "<table class='infoTable'>";
	                	html += "<tr>";
	                	html += "<th>주소</th>";
	                	html += "<td>"+json.address+"</td>";
	                	html += "</tr>";
	                	html += "<tr>";
	                	html += "<th>대표전화</th>";
	                	html += "<td>"+json.phone+"</td>";
	                	html += "</tr>";
	                	html += "<tr>";
	                	html += "<th>기관</th>";
	                	html += "<td>"+json.dept+"</td>";
	                	html += "</tr>";
	                	html += "<tr>";
	                	html += "<th>소개</th>";
	                	html += "<td>"+json.info+"</td>";
	                	html += "</tr>";
	                	html += "<tr>";
	                	html += "<th>진료시간</th>";
	                	
	                	html += "<td>월요일: "+json.openingHours[0].open+"~"+json.openingHours[0].close+"<br/>";
	                	html += "화요일: "+json.openingHours[1].open+"~"+json.openingHours[1].close+"<br/>";
	                	html += "수요일: "+json.openingHours[2].open+"~"+json.openingHours[2].close+"<br/>";
	                	html += "목요일: "+json.openingHours[3].open+"~"+json.openingHours[3].close+"<br/>";
	                	html += "금요일: "+json.openingHours[4].open+"~"+json.openingHours[4].close+"<br/>";
	                	html += "토요일: "+json.openingHours[5].open+"~"+json.openingHours[5].close+"<br/></td>";
	                	
	                	html += "</tr>";
	                	html += "</table>";
						
	                	html += "</div>";
	                	html += "</div>";
	                	html += "<div>";
	                	html += "<textarea id='review' name='review' class='review' maxlength='199' placeholder='반려사유 작성란'></textarea>";
	                	html += "</div>";
	                	
	 				}
	 				
	 				$(".hospitalDetail").html(html); 
	             },
	             error: function(request, status, error){
	                      alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	             }
		  });
	}
	
	function saveIds(){
         
         var cnt = $("input[name='infock']:checked").length;
         
         var arr = new Array();
     
         $("input[name='infock']:checked").each(function() {
             arr.push($(this).attr('id'));
         });
         
         if(cnt == 0){
             alert("선택된 승인 목록이 없습니다.");
         }
         else{
            	 
            var con = confirm("승인하겠습니까?");
            
            var allCnt = $("input[name='infock']").length;
            
            var infoArr = new Array();
            var hpSeqArr = new Array(); 
           
            
            for(var i=0; i<allCnt; i++) {
         	   
         	   if($("input:checkbox[class=infock]").eq(i).is(":checked")) {
         		   	infoArr.push($("input:checkbox[class=infock]").eq(i).val());   
         		   	hpSeqArr.push($("input:checkbox[class=infock]").eq(i).siblings().val());
         	   }
            }

            
            console.log(hpSeqArr);
            var infoJoin = infoArr.join();
            var hpSeq = hpSeqArr.join();
            
            $("#infoJoin").val(infoJoin);
            $("#hpSeq").val(hpSeq);
            
            // alert(con);
            
            if(con == true) {
         	   var frm = document.updateFrm;
                frm.method = "GET";
                frm.action = "<%= request.getContextPath()%>/updateMemStatus.sd"
                frm.submit();
            }
           	else if(con == false){ 
               //location.href="history.back()";
               return;
 	       }
 	     
         }	 
         
	}	
	
	function reject() {
		
		var cnt = $("input[name='infock']:checked").length;
        
        var arr = new Array();
    
        $("input[name='infock']:checked").each(function() {
            arr.push($(this).attr('id'));
        });
        
        if(cnt == 0){
            alert("선택된 반려 목록이 없습니다.");
        }
        else{
           	 
           var con = confirm("반려시키겠습니까?");
           
           var allCnt = $("input[name='infock']").length;
           
           var infoArr = new Array();
           var hpSeqArr = new Array(); 
          
           
           for(var i=0; i<allCnt; i++) {
        	   
        	   if($("input:checkbox[class=infock]").eq(i).is(":checked")) {
        		   	infoArr.push($("input:checkbox[class=infock]").eq(i).val());   
        		   	hpSeqArr.push($("input:checkbox[class=infock]").eq(i).siblings().val());
        	   }
           }

           
           console.log(hpSeqArr);
           var infoJoin = infoArr.join();
           var hpSeq = hpSeqArr.join();
           
           $("#infoJoin").val(infoJoin);
           $("#hpSeq").val(hpSeq);
           
           if(con == true) {
        	   var frm = document.updateFrm;
               frm.method = "GET";
               frm.action = "<%= request.getContextPath()%>/rejectInfo.sd"
               frm.submit();
           }
          	else if(con == false){ 
              //location.href="history.back()";
              return;
	       }
	     
        }	 
	}

</script>	