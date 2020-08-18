<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        
<%	String ctxPath = request.getContextPath();%> 
  
<title>민간구급차 검색</title>

<style>

	.container{		
		align-content: center;
		width:1080px;
		min-height : 65vh;
		margin-bottom: 20px;
	}
	
	.info{
		margin:10px;
		font-size: 9pt;
	}
	
	.select{
		width: 80px;
		height: 30px;
		border: 1px solid #999999;
		border-radius: .25em; 
		margin-right: 10px;
		margin-bottom: 5px;
	}
	
	
	.ambulanceSelect{
		display:inline-block; 
	}
	
	
	.btnSearch{
  		padding: 0 .75em; 
 		height:30px;
		background-color: #efefef; 
		cursor: pointer; 
		border: 1px solid #999999; 
		border-radius: .25em; 
		margin-left: -10px;	
	}
	
	.btnExcel{
  		padding: 0 .75em; 
 		height:30px;
		background-color: #0080ff; 
		color:#fff;
		cursor: pointer; 
		border: 1px solid #999999; 
		border-radius: .25em; 
	}
	
	
	.ambulanceTbl{
		width:100%;	
		margin: 30px 0;	
		text-align: center;
	}	
	
	th{
		border-top: 1px solid #404040;
		padding:15px 0 !important;
		text-align: center;
		font-weight: bolder;	
		background-color: #f2f2f2;
	}
	
	
	td{
		border-top: 1px solid #999999;
		border-bottom: 1px solid #999999; 
		padding:25px !important;		
	}
	
	

</style>


<script type="text/javascript">

	$(document).ready(function(){
			
		
	})
	


</script>




<script type="text/javascript">

	 var currentShowPageNo = 1;
	 
	 $(document).ready(function(){
		 
		 showAmList(currentShowPageNo);	 
		 
	 })

	 function showAmList(currentShowPageNo){
		 
		 var html = "";

		 $.ajax({
			 url: "<%= ctxPath %>/api/amList.sd",
			 data:{"city":$("#city").val(),"currentShowPageNo":currentShowPageNo},
	         dataType: "JSON",
	         success: function(json){	
	        	 
	        	console.log(json);	
	        	 
	        	var result = JSON.parse(json.strResult);
	        	/* 	console.log(json.strResult[0].carSeq);
	        		console.log(typeof json.strResult[0])
	        	for(var i=0; i<json.strResult.length; i++) {
	        		
	        	} */
	        	
				 $.each(result, function(index,item){		
					
				 	var adr = item.dutyAddr;
					var adrArr = adr.split(' ');					
					
				 	html+="<tr><td>"+adrArr[0]+"</td>"
						+"<td>"+adrArr[1]+"</td>"
						+"<td>"+item.dutyName+"</td>"
						+"<td>"+item.carSeq+"</td></tr>";						 
				})		 
					        	
				$("#ambulanceTblBody").html(html);
				$("#pageBar").html(json.pageBar);	   
	         },
	         error: function(request, status, error){
	            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	         }   
		 })
		 
		 
	 }


</script>



<div class="container">

	<h3 style="font-weight: bolder;">민간구급차 검색</h3>
	<div class="info">지역별 민간구급차 현황 정보를 확인하실 수 있습니다.</div>
	
	<div align="right">
	     <div class="ambulanceSelect">
	        <select id="city" name="city" class="select">
	           <option value="">시도</option>
	           <option value="서울특별시">서울특별시</option>   
	           <option value="강원도">강원도</option>
	           <option value="경기도">경기도</option>
	           <option value="부산광역시">부산광역시</option>
	           <option value="대구광역시">대구광역시</option>
	           <option value="인천광역시">인천광역시</option>
	           <option value="광주광역시">광주광역시</option>
	           <option value="대전광역시">대전광역시</option>
	           <option value="울산광역시">울산광역시</option>
	           <option value="경상남도">경상남도</option>
	           <option value="경상북도">경상북도</option>
	           <option value="전라남도">전라남도</option>
	           <option value="전라북도">전라북도</option>
	           <option value="제주도">제주도</option>
	           <option value="충청남도">충청남도</option>
	           <option value="충청북도">충청북도</option>
	        </select>          
	     </div>	     
	     <div class="ambulanceSelect">
	        <button type="button" class="btnSearch" onclick="showAmList();" >검색</button>
	     </div>
	     <button type="button" class="btnExcel" onclick="downloadExcel();" >엑셀다운로드</button>
	</div>
	

	<table class="ambulanceTbl">
		<thead>
			<tr>
				<th>시도</th>
				<th>시군구</th>
				<th>기관명</th>
				<th>차량번호</th>
			</tr>
		</thead>
		<tbody id="ambulanceTblBody">
						
		</tbody>
		
	</table>
	
	<div id="pageBar"></div>


</div>


