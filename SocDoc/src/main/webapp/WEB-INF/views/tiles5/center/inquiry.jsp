<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        
<%	String ctxPath = request.getContextPath();%>   



<style>


	.container{		
		align-content: center;
		width:100%;
		padding : 0 !important;		
	}
	
	.info{
		margin:10px;
		font-size: 9pt;
	}			
	
	.inquiryTbl{
		width:100%;	
	}
	
	th, td{		
		padding-top:25px !important;				
	}
	
	th{
		width: 10%;
		min-width : 50px;
		font-weight: 900;
		color:#0080ff;
	}
	
	.subject{
		border:1px solid #999999;
		width:690px;
		height:25px;
		resize: none;
	}	
	
	.subject:focus{
		outline:1px solid #0080ff;
	}
	
	.content{
		width:100%;
		height:350px;
		padding:5px;	
		resize: none;
	}
	
	.content:focus{
		outline:1px solid #0080ff;
	}
	
	.userBtn{
		margin-bottom: 30px;	
	}
	
	.btnRegister{
		background-color: #0080ff;
		color:#fff;
		cursor: pointer;	
		border: 1px solid #aaa9aa; 		
		padding: 0.25em .75em; 	
		border-radius: .25em; 		
		font-weight: 550;
		font-size: 10pt;	
	}
	
	.btnCancel{
		background-color: #efefef;
		cursor: pointer;	
		border: 1px solid #aaa9aa; 		
		padding: 0.25em .75em; 	
		border-radius: .25em; 		
		font-weight: 550;
		font-size: 10pt;	
		margin-right: 1
	}
	
	.inquiryMain{
		background : url('/socdoc/resources/images/inquiryMain.jpg'); 
		background-size: auto;
		background-repeat : repeat;
		height:200px;
		margin-top: -20px;
		width:100%;
	}
	
</style>


<script type="text/javascript">

	$(document).ready(function(){
		
		$("#subject").keyup(function(){
			cntSubject = $("#subject").val().length;
			$("#bytesSubject").val('');
			$("#bytesSubject").text(cntSubject);		
			
			if(cntSubject==0){
				$("#bytesSubject").text('0');		
			}
			
		});
		

		$("#content").keyup(function(){
			cntContent = $("#content").val().length;
			$("#bytesContent").val('');
			$("#bytesContent").text(cntContent);		
			
			if(cntSubject==0){
				$("#bytesContent").text('0');		
			}
			
		});
	
	
	})

	
	function goInquiry() {
			
		if($("#subject").val().trim()==""){
			alert("문의글 제목을 입력해주세요");
			$(this).focus();					
			return;
		}
		
		if($("#content").val().trim()==""){
			alert("내용을 입력해주세요");
			$(this).focus();
			return;
		}	
		
		var frm = document.inquiryFrm;
		frm.method = "POST";
		frm.action = "<%=ctxPath%>/inquiryAdd.sd";
		frm.submit();
		
	}
	
	


</script>


<div class="container">

	<div class="inquiryMain"></div>
	<!-- <h3 style="font-weight: bolder;">1:1 문의하기</h3>
	<div class="info"> 질문하신 내용은 <strong>[마이페이지] > [문의내역]</strong> 에서 확인 가능합니다.</div>
	 -->	
	<form name="inquiryFrm">
		<table class="inquiryTbl">
			<tr>
				<th>&nbsp;&nbsp;문의글 제목</th>
				<td><textarea id="subject" name="subject" class="subject" maxlength="50" autofocus></textarea>
				<span id="bytesSubject">0</span>/50자</td>
			</tr>
			<tr>			
				<td colspan="2"><textarea id="content" name="content" class="content" maxlength="1500"></textarea>
				<div><span id="bytesContent">0</span>/1500자</div>
				</td>
			</tr>	
		</table>
		<div class="userBtn" align="right">
			<button type="button" class="btnRegister" onClick="goInquiry()">등록</button>
			<button type="button" class="btnCancel" onClick="javascript:history.back()">취소</button>
		</div>
	</form>

</div>
