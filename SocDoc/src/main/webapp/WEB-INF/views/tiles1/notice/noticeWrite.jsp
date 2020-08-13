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
   	
	.textPrimary {
		margin-bottom: 50px;
	}
	
	table {
		width: 100%;
		border-collapse: collapse;
	}
	
	#table th, #table td {
		padding: 5px;
	}
	
	#table th {
		width: 120px;
		background-color: #dddddd;
	}
	
	#table td {
		width: 860px;
		border: solid 1px #ccc;
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
	
	a.notice_write {
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
	
	a.delete, a.create, a.list {
		cursor: pointer;
	}
	
	.th {
		font-size: 16px;
	    font-weight: bold;
	    color: #222222;
		background: #f4f4f2;
	}
	
	.next_post {
		font-size: 14px;
	    font-weight: normal;
	    color: #666666;
		border-top: 1px solid #333333;
		border-bottom: 1px solid #dddddd;
	}
	
	.pre_post {
		font-size: 14px;
	    font-weight: normal;
	    color: #666666;
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
	$(document).ready(function(){
		
		/* === 스마트 에디터 구현 시작 === */
	    var obj = [];
	    //스마트에디터 프레임생성
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: obj,
	        elPlaceHolder: "content",
	        sSkinURI: "<%= request.getContextPath() %>/resources/smarteditor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : true,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true,
	        }
	    });
		/* === 스마트 에디터 구현 끝 === */

		
		// 쓰기 버튼
		$("#btnWrite").click(function(){

			/* === 스마트에디터 구현 시작 === */
	        obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			/* === 스마트에디터 구현 끝 === */

			// 글제목 유효성 검사
			var subjectVal = $("#subject").val().trim();
			if(subjectVal == ""){
				alert("글제목을 입력하세요!!");
				return;
			}
			
			/* === 스마트에디터 구현 시작 === */
	        var contentval = $("#content").val();
	        
	        // 글내용 유효성 검사 
	        if(contentval == "" || contentval == "<p>&nbsp;</p>") {
	        	alert("글내용을 입력하세요!!");
	        	return;
	        }
	        
	        contentval = $("#content").val().replace(/<p><br><\/p>/gi, "<br>"); //<p><br></p> -> <br>로 변환
		        contentval = contentval.replace(/<\/p><p>/gi, "<br>"); //</p><p> -> <br>로 변환  
		        contentval = contentval.replace(/(<\/p><br>|<p><br>)/gi, "<br><br>"); //</p><br>, <p><br> -> <br><br>로 변환
		        contentval = contentval.replace(/(<p>|<\/p>)/gi, ""); //<p> 또는 </p> 모두 제거시
		    
		        $("#content").val(contentval);
			/* === 스마트에디터 구현 끝 === */
		 		
			var frm = document.addFrm;
			frm.method = "POST";
			frm.action = "<%= ctxPath%>/addEnd.action";
			frm.submit();
		});
		
	});

</script>

</head>
<div class="container">

	<header>
		<h2 class="textPrimary">공지사항 글쓰기</h2>
	</header>

	<form name="addFrm">
		<table id="table">
			<thead>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" id="subject" name="subject" class="input_title" />
					</td>
				</tr>
			</thead>
				
			<tbody>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="10" cols="100" style="width: 95%; height: 412px;" name="content" id="content"></textarea>
					</td>
				</tr>
				<tr>
					<th>파일첨부</th>
					<td>
						<input type="file" name="attach" />	
					</td>
				</tr>
			</tbody>
		</table>
	</form>	
	
	<div id="notice_button">
		<p id="notice_button">
			<a type="button" id="btnWrite" class="create notice_write">작성</a> 
		</p>
		<p id="notice_button">
			<a type="reset" class="delete notice_write">취소</a> 
		</p>
		<p id="notice_button">
			<a type="button" class="list notice_write" class="list notice_view" href="noticeList.html" >목록</a> 
		</p>
	</div>	
</div>