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
	 $(document).ready(function(){
		 
		 showAmList();	 
		 
	 })

	 function showAmList(){
		 
		 var html = "";

		 $.ajax({
			 url: "<%= ctxPath %>/api/amList.sd",
	         type: "GET",
	         dataType: "JSON",
	         success: function(json){	
	        		
				$.each(json, function(index,item){		

					var adr = item.dutyAddr;
					var adrArr = adr.split(' ');					
					
				 	html+="<tr><td>"+adrArr[0]+"</td>"
						+"<td>"+adrArr[1]+"</td>"
						+"<td>"+item.dutyName+"</td>"
						+"<td>"+item.carSeq+"</td></tr>";
						 
				})		
					        	
				$("#ambulanceTblBody").html(html);
	        	 
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
	           <option value="0">시도</option>                                 
	        </select>          
	     </div>	     
	     <div class="ambulanceSelect">
	        <input type="text" id="search" name="search" class="select" style="width:120px;">
	        <button type="button" class="btnSearch" onclick="goSearch();" >검색</button>
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
			<tr>
				<td>서울</td>
				<td>서울</td>
				<td>사회복지법인대한구조봉사회</td>
				<td>11가1111</td>
			</tr>			
		</tbody>
		
	</table>


</div>


