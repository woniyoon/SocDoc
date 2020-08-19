<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>
    
<style type="text/css" >

	.container { 
		width: 70%;
		margin: auto;
		padding: 0;
	}

	.textPrimary {
		margin-bottom: 50px;
	}
	
	h2 {
        font-weight: bold;
		padding-top: 30px;
	}

	th {
		text-align: center;
	}
	
    table {
      width: 90%;
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
	
	div#notice_button_wrap {
		display: inline-block;
		width: 900px;	
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
       	width: 100%;
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
	
	a.delete, a.create, a.list {
		cursor: pointer;
	}
    
	.th {
		font-size: 16px;
	    font-weight: bold;
	    color: #222222;
		background: #f4f4f2;
	}
	
	a {
      text-decoration: none;
    }
</style>


<div class="container">

	<header>
		<h2 class="textPrimary">건강정보 글쓰기</h2>
	</header>
			
	<form name="infoFrm" enctype="multipart/form-data">
      <table id="table">
         <thead>
            <tr>
               <th>제목</th>
               <td>
                  <input type="text" id="subject" name="subject" class="input_title" style="width: 95%;" />
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
                  <input type="file" id="img" name="attach" />   
               </td>
            </tr>
         </tbody>
      </table>
   </form>   
   
   <div id="notice_button_wrap">
		<p id="notice_button">
			<a type="button" id="btnInfoSubmit" class="create notice_write">작성</a> 
		</p>
		<p id="notice_button">
			<a type="reset" class="delete notice_write">취소</a> 
		</p>
	</div>
</div>


<script type="text/javascript">
	$(document).ready(function(){
		
		$("#btnInfoSubmit").click(function(){
			goWrite();
		});
	
	});
	
	
	function goWrite() {
		var subject = $("#subject").val().trim();
		var content = $("#content").val().trim();
		var img = $("#img").val().trim();
		
		if (subject == "") {
			alert("제목을 입력해주세요");
			return "admin/adminNoticeWrite.sd";
		}
		
		if (content == "") {
			alert("내용을 입력해주세요");
			return;	
		}
		
		if (img == ""){
			alert("파일첨부는 필수입니다");
			return;
		}
		
		var frm = document.infoFrm;
		frm.action = "<%= ctxPath%>/healthWriteEnd.sd";
		frm.method = "POST";
		frm.submit();
	}

</script>