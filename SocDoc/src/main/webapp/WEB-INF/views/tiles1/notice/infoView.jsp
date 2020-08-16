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
		//border: solid 1px red;
	}
   	
	.textPrimary {
		margin-bottom: 5px;
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
   
    th {
		font-size: 14px;
		font-weight: bold;
		color: #222222;
		text-align: center;
		border: solid 1px #f2f2f2;
	}
   
   	td {
      	font-size: 14px;
       	color: #666666;
       	padding: 17px 10px;
       	line-height: 1.8;
   	}
   
   	/* 글보기 */
   	section {
      	width: 100%;
   	}
   
/*    	tbody > tr > td {
      	font-size: 14px;
       	color: #666666;
       	text-align: left;
       	border-bottom: 1px solid #dddddd;
       	line-height: 1.8;   
   	} */
   
   	p#listBtn {
      	display: inline-block;
      	border-radius: 3px;
       	height: 45px;
       	width: 84px;
       	background: #666666;
      	color: white;
      	float: right;
      	margin: 20px 0 50px 0;
   	}   
   
   	a.noticeView {
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
   	
   	.titlePointer:hover {
      	cursor: pointer;
   	}
   
   	a {
      	text-decoration: none;
   	}
    
    /* 기본정보 변경 form */
   	table.type05 {
      	width: 100%;
       	border-collapse: separate;
       	border-spacing: 1px;
       	text-align: left;
       	line-height: 1.5;
       	border: 1px solid #ccc;
   	}
   
   	table.type05 th {
       	width: 20%;
       	padding: 10px;
       	font-weight: bold;
       	vertical-align: middle;
       	background: #f2f2f2;
   	}
   
   	table.type05 td {
   		width: 80%;
       	padding: 10px;
       	vertical-align: top;
   	}
   
   	table.type06 {
      	width: 100%;
       	border-collapse: separate;
       	border-spacing: 1px;
       	text-align: left;
       	line-height: 1.5;
       	border: 1px solid #ccc;
   	}
   
   	table.type06 th {
       	width: 20%;
       	padding: 10px;
       	font-weight: bold;
       	vertical-align: middle;
       	background: #f2f2f2;
   	}
   
   	table.type06 td {
       	padding: 10px;
       	vertical-align: top;
   	}
      
	.form-control-tel {
      	width: 70px;
   	}
   
   	#infoChange {
      	width: 69%;
   	}
   
   /* 코멘트란 */
   	#comment {
      	padding: 10px;
      	background-color: #f2f2f2;
      	border-radius: 4px;
   	}
    
    
</style>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>

<script type="text/javascript">
	$(window).ready(function(){
		$(".noticeNo").hide();
		// 윗글 보기 
		$(".postNotice").click(function(){ 
			var noticeSeq = $(this).prev().prev().text();
			 var rno = $(this).prev().text();
			 rno = parseInt(rno);
			 
			// seq가 없는 경우 클릭 지우기
			if ( $(".postNotice").val() == null ) {
				$(this).removeClass('titlePointer');
			}
			location.href="?noticeSeq="+${noticevo.preseq}
		});
		
		// 아랫글 보기
		$(".preNotice").click(function(){ 
			var noticeSeq = $(this).prev().prev().text();
			var rno = $(this).prev().prev().text();
			rno = parseInt(rno);
			// seq가 없는 경우 클릭 지우기
			if ( $(".preNotice").val() == null ) {
				$(this).removeClass('titlePointer');
			}
			location.href="?noticeSeq="+${noticevo.nextseq}
		});
	});
</script>

</head>

<div class="container">

	<header>
		<h1 class="textPrimary"><strong>건강정보</strong></h1>
	</header>
			
	<!-- -------------------------------- 上 끝 ---------------------------------- -->
	<!-- 
	<section>
		<table>
			<thead>
				<tr>
					<th>제목 어쩌거</th>
					<input type="hidden" class="delNotice" value="${notice_seq}"/>
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
				<c:if test="${(sessionScope.loginuser).userid == 'admin' }">
					<p id="notice_button">
						<a class="delete notice_view" onclick="deleteNotice();">삭제</a>
					</p>
				</c:if>
		</div>	
			
		<div>
			<table>
				<tr>
					<th class="next_post th">윗글</th>
					<td class="noticeNO" >${map.POSTNUM}</td>
					<td class="noticeNO postrno" >${rno}</td>
					<td class="next_post postNotice titlePointer">${map.POSTTITLE}</td>
					
					<th class="next_post th">윗글</th>
					<td class="noticeNO" ></td>
					<td class="noticeNO postrno" ></td>
					<td class="next_post postNotice titlePointer">윗글 제목 어쩌거</td>
				</tr>
				<tr>
					<th class="pre_post th">아랫글</th>
					<td class="noticeNO" >${map.PRENUM}</td>
					<td class="noticeNO prerno" >${rno}</td>
					<td class="pre_post preNotice titlePointer">${map.PRETITLE}</td>
					
					<th class="pre_post th">아랫글</th>
					<td class="noticeNO" ></td>
					<td class="noticeNO prerno" ></td>
					<td class="pre_post preNotice titlePointer">아랫글 제목 어쩌거</td>
				</tr>
			</table>
		</div>
			
		<br/><br/><br/>

	</section> -->
	
	<section>
		<table>
			<thead>
				<tr>
					<th>
						<table class="type05" style= " margin: 0 auto;">
							<tbody>
                             	<tr>
									<th scope="row" style="border: none;">제목 </th>
                                	<td style="border-bottom: solid 1px #ccc;">${infovo.subject}</td>
								</tr>
                            	<tr>
	                                <th scope="row" style="border: none;">작성일 </th>
	                                <td style="border: none;">${infovo.regDate}</td>
                             	</tr>
							</tbody>
						</table>
					</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td style="border-bottom: solid 1px #ccc; padding: 30px 0 200px 0;">
						${infovo.content}
                    </td>
               </tr>
           	</tbody>
		</table>

		<p id="listBtn"><a href="#" onclick="javascript:location.href='<%= request.getContextPath()%>/noticeList.sd'" class="noticeView">목록</a></p>
                
        <div>
            <table class="type06" style="margin: 0 auto;">
                <tr>
                    <th class="next_post th">이전글</th>
                    <td class="next_post postNotice titlePointer" style="border-bottom: solid 1px #ccc;" onclick="javascript:location.href='infoView.sd?infoSeq=${infovo.preseq}'">${infovo.presubject}</td>
                </tr>
                <tr>
                    <th class="pre_post th">다음글</th>
                    <td class="pre_post preNotice titlePointer" onclick="javascript:location.href='infoView.sd?infoSeq=${infovo.nextseq}'">${infovo.nextsubject}</td>
                </tr>
            </table>
   		</div>
		<br/><br/><br/>
	</section>
</div>