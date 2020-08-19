<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<% String ctxPath = request.getContextPath(); %>
    
<style type="text/css" >

	.container { 
		width: 1000px;
		margin: auto;
		padding: 0;
	}

	.faqTbl{
      margin-top:40px;   
      margin-bottom:10px;      
      width:100%;   
   }
   
   th, td{      
      padding:25px !important;   
      border-top:1px solid #999999;   
      border-bottom:1px solid #999999;               
   }
   
   th{
      width: 15%;
      font-weight: bolder;
      color:#0080ff;
   }
      
   .bar{
      margin:0 30px;
      color: #404040;
   }
   
   .subject{
      width:80%;
      height:25px;
      resize: none;
   }   
   
   .subject:focus{
      outline:1px solid #0080ff;
   }
   
   .content{
      width:80%;
      height:350px;
      padding:5px;   
      resize: none;
   }
   
   .content:focus{
      outline:1px solid #0080ff;
   }
   
   .btnRegister{
      background-color: #0080ff;
      color:#fff;
      cursor: pointer;   
      border: 1px solid #dddddd;             
      padding: 0.25em .75em;    
      border-radius: .25em;       
      font-weight: 500;
      font-size: 10pt;
      margin-bottom: 30px;   
   }
   
   .btnCancel{
      background-color: #efefef;
      cursor: pointer;   
      border: 1px solid #dddddd;       
      padding: 0.25em .75em;    
      border-radius: .25em;       
      font-weight: 500;
      font-size: 10pt;   
   }
</style>


<div class="container">

	<header>
		<h2 class="textPrimary">FAQ 글쓰기</h2>
	</header>
			
	<form name="faqFrm">
      <table class="faqTbl">
         <tr>
            <th><span>Q .</span><span class="bar">│</span></th>
            <td class="tblSubject"><textarea id="subject" name="question" class="subject" maxlength="50" autofocus></textarea>
            <span id="bytesSubject">0</span>/50자</td>
         </tr>
         <tr>      
            <th><span>A .</span><span class="bar">│</span></th>               
            <td ><textarea id="content" name="answer" class="content" maxlength="1500"></textarea>
                <span id="bytesContent">0</span>/1500자
            </td>
         </tr>   
      </table>
      <div class="userBtn" align="right">
         <button type="button" class="btnRegister" onClick="gofaq()">등록</button>
         <button type="button" class="btnCancel" onClick="">취소</button>
      </div>
   </form>
   
   
</div>



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
         
         if(cntContent==0){
            $("#bytesContent").text('0');      
         }
         
      });
      
   
   })

   
   function gofaq() {
         
      if($("#subject").val().trim()==""){
         alert("제목을 입력해주세요");
         $(this).focus();               
         return;
      }
      
      if($("#content").val().trim()==""){
         alert("내용을 입력해주세요");
         $(this).focus();
         return;
      }   
      
      var frm = document.faqFrm;
      frm.method = "GET";
      frm.action = "<%= ctxPath%>/faqWriteEnd.sd";
      frm.submit();
      
      alert("자주 찾는 질문이 등록되었습니다");
   
   }

</script>
