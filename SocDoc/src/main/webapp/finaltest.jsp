<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        
<%	String ctxPath = request.getContextPath();%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<style>


	.container{
		width:1080px;
		margin: 10px auto;
	}
	
	.content{
		width:80%;
		margin:0px auto;
	}
		
	.select{
		width: 250px;
		height: 30px;
		border: 1px solid #999999;
		border-radius: .25em; 
		margin-right: 10px;
		margin-bottom: 5px;
	}
	
	
	ul.tabs{
		margin: 0px;
		padding: 0px;
		list-style: none;
	}
	
	ul.tabs li{
		background: none;
		display: inline-block;
 		padding: 10px 15px;
 		width:49.7%;
 		margin:0px;
		border: solid 1px #ddd;
		text-align: center;
		cursor: pointer;		
	}
	
	ul.tabs li.current{
		background: #0080ff;
		color: #fff;
		font-weight: 1000;
	}
	
	.tab-content{
		display: none;
	}
	
	.tab-content.current{
		display: inherit;
	}
	
	.tab-general{
		margin : 10px auto;
		background-color: #f2f2f2;
		padding:20px 35px;
	}
	
	.btnSearch{
  		padding: 0 .75em; 
 		height:30px;
		background-color: #bfbfbf; 
		cursor: pointer; 
		border: 1px solid #999999; 
		border-radius: .25em; 
		margin-left: -10px;	
	}
	
	
	.hospitalList{
		border-bottom : 1px solid #999999;
		padding: 10px 25px 20px 25px;
	}
	
	.hospitalName{
		font-weight: 1000;
		font-size: 13pt;
		margin:0 10px 10px 0;
	}
	
	.btnDetail{
		border-radius: .25em; 
		cursor: pointer; 
		border: 1px solid #999999; 
	}
	
	.info{
		margin:0px;
	}
	
	
	   
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/SocDoc/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/SocDoc/util/myutil.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');
	
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
	
			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		})
	
	})
	
</script>



<body>

	<div class="container">
	
		<div class="content">
		
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">지도</li>
				<li class="tab-link" data-tab="tab-2">일반</li>
			</ul>
		
			<div id="tab-1" class="tab-content current">
				
			</div>
			<div id="tab-2" class="tab-content">
				<div class="tab-general">
					<div>
						<select id="city" name="city" class="select">
							<option value="city">시</option>
						</select>
						<select id="county" name="county" class="select">
							<option value="county">군</option>
						</select>
						<select id="district" name="district" class="select">
							<option value="district">구</option>
						</select>
					</div>
					<div>
						<select id="category" name="category" class="select">
							<option value="category">진료과목</option>
						</select>
						<input type="text" id ="searchWord" name="searchWord" class="select"/>	
						<button type="button" class="btnSearch" onclick="goSearch();">검색</button>
					</div>					
					
				</div>
				
				<hr style="width:100%; border:solid 1px #999999; margin: 20px 0;">
				
				<div class="hospitalList">
					<span class="hospitalName">어쩌고 병원</span><button type="button" class="btnDetail" onClick="goDetail();">상세보기</button>
					<p class="info">내과</p>
					<p class="info">02-1234-5678</p>
					<p class="info">서울특별시 강남구 어쩌고로 저쩌고 1층</p>				
				</div>
				
			</div>
			
			
			
		</div>
		
	</div>

</body>