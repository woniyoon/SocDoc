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
		width: 55%;
		height: 150%;
		margin: 100px auto 200px auto;
		padding: 0;
		//border: solid 1px red;
	}
   	
	.textPrimary {
		margin-bottom: 5px;
	}
	
	/* -------------------------------- 게시글 ---------------------------------- */
	    
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
   
   	section {
      	width: 100%;
   	}
   	
    /* 목록 버튼 */
   	p#listBtn {
      	display: inline-block;
      	margin: 20px 0 50px 0;
       	width: 84px;
       	height: 45px;
      	float: right;
       	text-align: center;
      	color: white;
       	font-size: 14px;
       	font-weight: bold;
      	line-height: 45px;
       	background: #157bb9;
      	border-radius: 3px;
      	cursor: pointer;
   	} 
    
    /* -------------------------------- 이전/다음글 ---------------------------------- */
    
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
      
	.titlePointer:hover {
      	cursor: pointer;
   	}
   
   	a {
      	text-decoration: none;
   	}
    
    
</style>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>

<script type="text/javascript">
	
	// 이전글
 	function goPostInfo(e){
		var infoeSeq = $(this).prev().prev().text();
		var rno = $(this).prev().text();
		rno = parseInt(rno);
	 
		// 이전글이 없다면 안보이게
		if ( $(".postNotice").text() == "" ) {
			$(this).removeClass('titlePointer');		
		} else {
			location.href="?infoSeq="+'${infovo.preseq}';
		}	
	} 
 	
 	// 다음글
 	function goPreInfo(e){
		var infoeSeq = $(this).prev().prev().text();
		var rno = $(this).prev().text();
		rno = parseInt(rno);
	 
		// 다음글이 없다면 안보이게
		if ( $(".preNotice").text() == "" ) {
			$(this).removeClass('titlePointer');		
		} else {
			location.href="?infoSeq="+'${infovo.nextseq}';
		}	
	} 
</script>

</head>

<div class="container">
	
	<!-- -------------------------------- 上 ---------------------------------- -->
	
	<header>
		<h1 class="textPrimary"><strong>건강정보</strong></h1>
	</header>
			
	<!-- -------------------------------- 게시글 내용물 ---------------------------------- -->
	
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
		
		<!-- -------------------------------- 下 ---------------------------------- -->
		
		<p id="listBtn"><a href="#" onclick="javascript:location.href='<%= request.getContextPath()%>/noticeList.sd'" class="noticeView">목록</a></p>
        <div>
            <table class="type06" style="margin: 0 auto;">
                <tr>
                    <th class="next_post th">이전글</th>
                    <td class="next_post postNotice titlePointer" style="border-bottom: solid 1px #ccc;" onclick="goPostInfo(this);" >${infovo.presubject}</td>
                </tr>
                <tr>
                    <th class="pre_post th">다음글</th>
                    <td class="pre_post preNotice titlePointer" onclick="goPreInfo(this);">${infovo.nextsubject}</td>
                </tr>
            </table>
   		</div>
		<br/><br/><br/>
	</section>
</div>