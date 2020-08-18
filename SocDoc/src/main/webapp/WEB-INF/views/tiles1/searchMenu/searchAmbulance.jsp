<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        
<%	String ctxPath = request.getContextPath();%> 
  
<title>민간구급차 검색</title>

<style>

	/* .container{		
		align-content: center;
		width:1080px;
		min-height : 65vh;
		margin-bottom: 20px;
	} */
	
/* 	div.container{
		background : url('/socdoc/resources/images/ambulanceMain.jpg'); 
		background-size: contain;
 		padding-top:15%;
	} */
	
	.ambulanceMain{
		background : url('/socdoc/resources/images/ambulanceMain.jpg'); 
		background-size: auto;
		background-repeat : repeat;
		height:200px;
	}
	
	.contentbody{
		width:80%;
 		margin:20px auto;
 		min-width: 864px;
	}
	
	.info{
		margin:10px;
		font-size: 9pt;
	}
	
	.select{
		width: 90px;
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
		background-color: #19577d; 
		color:#fff;
		cursor: pointer; 
/* 		border: 1px solid #999999; 
 */		border-radius: .25em; 
	}
	
	
	.ambulanceTbl{
		width:100%;	
		margin: 10px 0 30px 0;	
		text-align: center;
		border-collapse: collapse;			
	}	
	
	th{
		border-top: 1px solid #404040;
		padding:15px 0 !important;
		text-align: center;
		font-weight: bolder;	
		background-color: #f2f2f2;
	}
	
	
	tr, td{
		border-top: 1px solid #999999;
		border-bottom: 1px solid #999999; 
		padding:25px !important;	
	}
	
	
	.page_wrap {
		text-align:center;
		font-size:0;
	}
	.page_nation {
		display:inline-block;
	}
	.page_nation .none {
		display:none;
	}
	.page_nation a {
		display:block;
		margin:0 3px;
		float:left;
		border:1px solid #e6e6e6;
		width:28px;
		height:28px;
		line-height:28px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}
	
	.page_nation .arrow {
		border:1px solid #ccc;
	}
	
	.page_nation .pprev {
		background:#f8f8f8 url('/socdoc/resources/images/page_pprev.png') no-repeat center center;
		margin-left:0;
	}
	
	.page_nation .prev {
		background:#f8f8f8 url('/socdoc/resources/images/page_prev.png') no-repeat center center;
		margin-right:7px;
	}
	
	.page_nation .next {
		background:#f8f8f8 url('/socdoc/resources/images/page_next.png') no-repeat center center;
		margin-left:7px;
	}
	
	.page_nation .nnext {
		background:#f8f8f8 url('/socdoc/resources/images/page_nnext.png') no-repeat center center;
		margin-left:7px;
	}
	
	.page_nation a.active {
		background-color:#42454c;
		color:#fff;
		border:1px solid #42454c;
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
	<div class="ambulanceMain"></div>
	<div class="contentbody">
<!-- 
	<h3 style="font-weight: bolder;">민간구급차 검색</h3>
	<div class="info">지역별 민간구급차 현황 정보를 확인하실 수 있습니다.</div> -->
	
		<div style="width:100%;">
			<div class="ambulanceSelect">
			     <button type="button" class="btnExcel" onclick="downloadExcel();" >엑셀다운로드</button>
			</div>
			<div align="right" class="ambulanceSelect" style="float:right;">
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
			           <option value="제주특별자치도">제주도</option>
			           <option value="충청남도">충청남도</option>
			           <option value="충청북도">충청북도</option>
			        </select>          
			     </div>	     
			     <div class="ambulanceSelect">
			        <button type="button" class="btnSearch" onclick="showAmList();" >검색</button>
			     </div>
			</div>
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
		
		
		<div class="page_wrap">
			<div class="page_nation" id="pageBar"></div>
		</div>

	</div>
</div>


