<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String ctxPath = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>속닥 게시판</title>

<style type="text/css" >

/* 	body {
		font-family: Arial, "MS Trebuchet", sans-serif;
		width: 1100px;
		margin: 0 auto;
	} */

	.container { 
		width: 50%;
		height: 150%;
		margin: 100px auto 200px auto;
		padding: 0;
		border: solid 0px red;
	}
	
   	.bowl {
   		//border: solid 1px #ccc;
   	}
   	
	.textPrimary {
		margin-bottom: 50px;
	}
	
	/* -------------------------------- 上 끝 ---------------------------------- */
	
	div#search_bar {
		width: 100%;
    	display: flex;
    	margin: 20px 0 10px 0;
	}
	
	div#search_bar_left {
		flex: 1;
		margin-top: 5px;
	}
	
	div#search_bar_right {
		flex: 1;
	}

	input#searchWord {
		display: inline-block;
		width: 250px;
	    height: 35px;
	    line-height: 36px;
	    text-indent: 10px;
	    color: #666;
	    border: 1px solid #ddd;
	}
	
	input#search_button {
		display: inline-block;
	    width: 54px;
	    height: 35px;
	    padding: 0;
	    text-align: center;
	    font-size: 14px;
	    font-weight: bold;
	    color: #fff;
	    background: #777;
	    cursor: pointer;
	}
	
	p.search_button {
	    width: 54px;
	    height: 35px;
	    line-height: 38px;
	}
		
	/* ---------------------------- 헤더 끝 -------------------------- */
	
	table {
		width: 100%;
		border-collapse: collapse;
	}
	
	thead > tr > th {
		font-size: 20px;
	    font-weight: bold;
	    color: #222222;
	    text-align: left;
	    padding: 20px 20px 20px 10px;
	    border-top: 1px solid #333333;
	    border-bottom: 1px solid #333333;
	}
	
	tbody > tr > td {
		font-size: 14px;
	    color: #666666;
	    text-align: left;
	    padding: 10px 10px 10px 10px;
	    border-bottom: 1px solid #dddddd;
	    line-height: 1.8;
	
	}
	
	div#notice_button_wrap{
		display: inline-block;
		width: 100%;	
	}
	
	p#notice_button {
		display: inline-block;
		border-radius: 3px;
	    height: 45px;
	    width: 84px;
	    background: #666666;
		color: white;
		float: right;
		margin: 30px 20px 50px 0px;
	}
	
	a.notice_view {
		display: inline-block;
	    font-size: 14px;
	    color: #fff;
	    font-weight: bold;
	    text-align: center;
	    height: 45px;
	    line-height: 45px;
	    width: 100%;
	    text-decoration: none;
	}
	
	a.delete {
		cursor: pointer;
	}
	
	.th {
		background: #f4f4f2;
	}
	
	.next_post {
		border-top: 1px solid #333333;
		border-bottom: 1px solid #dddddd;
	}
	
	.pre_post {
		border-bottom: 1px solid #333333;
	}
	
	.titlePointer:hover {
		cursor: pointer;
	}
	
	a {
      text-decoration: none;
    }
   	
</style>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<script type="text/javascript">

$(window).ready(function(){

});		
</script>
</head>

<div class="container">

	<header>
		<h2 class="textPrimary">공지사항</h2>
	</header>
			
	<!-- -------------------------------- 上 끝 ---------------------------------- -->
	
	<section>
		<table>
			<thead>
				<tr>
					<th>제목 어쩌거</th>
					<!-- <input type="hidden" class="delNotice" value="${notice_seq}"/> -->
				</tr>
			</thead>
				
			<tbody>
				<tr>
					<td>내용 어쩌거<br/><br/><br/><br/><br/></td>
				</tr>
			</tbody>
		</table>
		
		<div id="notice_button_wrap">
			<p id="notice_button">
				<a href="noticeList.sb" class="notice_view">목록</a>
			</p>
				<!-- <c:if test="${(sessionScope.loginuser).userid == 'admin' }">
					<p id="notice_button">
						<a class="delete notice_view" onclick="deleteNotice();">삭제</a>
					</p>
				</c:if> -->
		</div>	
			
		<div>
			<table>
				<tr>
					<!-- <th class="next_post th">윗글</th>
					<td class="noticeNO" >${map.POSTNUM}</td>
					<td class="noticeNO postrno" >${rno}</td>
					<td class="next_post postNotice titlePointer">${map.POSTTITLE}</td> -->
					
					<th class="next_post th">윗글</th>
					<!-- <td class="noticeNO" ></td>
					<td class="noticeNO postrno" ></td> -->
					<td class="next_post postNotice titlePointer">윗글 제목 어쩌거</td>
				</tr>
				<tr>
					<!-- <th class="pre_post th">아랫글</th>
					<td class="noticeNO" >${map.PRENUM}</td>
					<td class="noticeNO prerno" >${rno}</td>
					<td class="pre_post preNotice titlePointer">${map.PRETITLE}</td> -->
					
					<th class="pre_post th">아랫글</th>
					<!-- <td class="noticeNO" ></td>
					<td class="noticeNO prerno" ></td> -->
					<td class="pre_post preNotice titlePointer">아랫글 제목 어쩌거</td>
				</tr>
			</table>
		</div>
			
		<br/><br/><br/>

	</section>
</div>