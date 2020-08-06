<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        
<%	String ctxPath = request.getContextPath();%>   

<title>FAQ</title>

<style>

	.container{		
		align-content: center;
		width:90%;
	}
	
	.info{
		margin:10px;
		font-size: 9pt;
	}
	
	.faqTbl{
		width:100%;	
		margin: 30px 0;	
	}	
	
	td{
		border-top: 1px solid #999999;
		border-bottom: 1px solid #999999; 
		padding:25px !important;		
	}
	
	.accordion {
		cursor: pointer;
		transition: 0.4s;
	} 
	
	.panel {		
		background-color: #e6f5ff;/*하늘색*/
		overflow: hidden;
		margin : 0px ; 	
	}
	
	.panel-none{
		display: none;
	}
	

</style>


<script type="text/javascript">

	$(document).ready(function(){
	
		$(document).on("click", ".accordion", function(){
			var $target = $(this).next();
			var $other = $target.siblings();	
						

			$other.each(function(index, item){
				if($(item).hasClass("panel")){
					$(item).addClass("panel-none");	
				}
			});			 
			
		
			$target.toggleClass("panel-none");		
			
		})
		
		
		
	})
	


</script>



<div class="container">

	<h3 style="font-weight: bolder;">자주하는 질문</h3>
	<div class="info">회원 여러분께서 자주하는 질문을 모아두었습니다.<br/>
		더 필요하신 문의사항은 <strong>[고객센터] > [문의하기]</strong> 메뉴를 이용해주세요.</div>

	<table class="faqTbl">
		<c:forEach var="faqList" items="${faqList}">
			<tr class="accordion">
				<td >${faqList.question}</td>
			</tr>
			<tr class="panel panel-none">
				<td >${faqList.answer}</td>
			</tr>
		</c:forEach>		
		
	
	</table>


</div>

