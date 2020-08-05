<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
%>
<title>인터넷 진료예약</title>
<style type="text/css">
body {
	width: 1440px;	
}
#reservation_container{ /* 전체 박스 */
	/* border: solid 1px gray; */
	width: 90%;
    margin: 30px auto;
    min-height: 680px;
    max-height: auto;
}
#reservation_title{
	width: 40%;
	margin: 2%;
	padding-bottom: 2%;
	padding-top: 2%;
	/* border: solid 1px gray; */
}
#button{
	text-align: right;
}
#button{
	padding-top: 3%;
}
.result_title{
	text-align: center;
	padding-bottom: 5%;
}
table.resultbox{
	border: 1px solid #000;
    border-width: 2px 0 1px;
}
table.resultbox tr{
	border-top: solid 1px red;
}
table.resultbox td.myinfo{
	width: 450px;
}
table.resultbox td{
	width: 200px;	
	padding-top:1%;
	padding-bottom: 2%;
}
div#button{
	margin-right: 17%;
}
#button a {
	font-size: 12pt;
}
.btncheck{
	overflow: visible;
    vertical-align: top;
    height: 40px;
    padding: 0 20px;
    color: #000;
    font-size: 16px;
    text-align: center;
    line-height: 38px;
    background-color: #fff;
    cursor: pointer;
	border: 1px solid #2263bb;
    color: #fff;
    background-color: #2263bb;
}
.btncancel{
	overflow: visible;
    vertical-align: top;
    height: 40px;
    padding: 0 20px;
    color: #000;
    font-size: 16px;
    text-align: center;
    line-height: 38px;
    background-color: #fff;
    cursor: pointer;
    border: 1px solid #777;
    color: #fff;
    background-color: #777;
}
hr.line{
	width: 500px; 
	border-bottom:0px; 
	text-align:left; 
	margin-left:0px;
}
tr.tr{
	border-bottom: solid 1px gray;
}
#infoChange {
      width: 80%;
      margin-left: 15%;
   }
/* 기본정보 변경 form */
   table.type05 {
      width: 100%;
       border-collapse: separate;
       border-spacing: 1px;
       text-align: left;
       line-height: 1.5;
       border-top: 1px solid #ccc;
   }
   
   table.type05 th {
       width: 20%;
       padding: 10px;
       font-weight: bold;
       vertical-align: middle;
       border-bottom: 1px solid #ccc;
       background: #f2f2f2;
   }
   
   table.type05 td {
       width: 80%;
       padding: 10px;
       vertical-align: top;
       border-bottom: 1px solid #ccc;
   }
   
   .form-control-tel {
      width: 70px;
   }
   
   #infoChange {
      width: 69%;
   }
</style>

<script>
</script>

<div id="reservation_container">
	<div id="reservation_title">
	<h1 style="font-weight: bolder;">예약완료 및 확인</h1>
	</div>
	
	<div class="result_title">
		<img alt="" src="<%= ctxPath%>/resources/images/check.png" width="50px" height="50px">
	<h3>인터넷 진료예약 접수가 완료되었습니다.</h3>
	</div>
	

       <div id="infoChange">
         <table class="type05" style="border-top: solid 1px black; margin: 0 auto;">
            <tbody>
            <tr>
                 <th scope="row">예약자</th>
                 <td>
                   홍길동
               </td>
             </tr>
             <tr>
               <th scope="row">환자번호</th> 
               <td>
            123456789
               </td>
            </tr> 
            <tr>
               <th scope="row">병원/진료과</th> 
               <td>
            손유나닥터의원/피부과
               </td>
            </tr> 
            <tr>
               <th scope="row">예약일</th> 
               <td>
            2020-07-30
               </td>
            </tr> 
             <tr>
                 <th scope="row">연락처 </th>
                 <td>
           010-1234-5678
               </td>
             </tr>
             <tr>
                 <th scope="row">이메일주소 </th>
                 <td>
            hongkd@naver.com
               </td>
              </tr>
              <tr>
                 <th scope="row">주소 </th>
                 <td>
                       서울특별시 청담동 
               </td>
            </tr>   
            <tr>
               <th scope="row">키/몸무게/혈액형</th> 
               <td>
            160cm / 50kg / A형
               </td>
            </tr>         
             <tr>
               <th scope="row">알레르기</th> 
               <td>
                      없음
               </td>
            </tr>   
            <tr>
               <th scope="row">병력</th> 
               <td>
            없음
               </td>
            </tr> 
            <tr>
               <th scope="row">복용약</th> 
               <td>
            없음
               </td>
            </tr> 
             </tbody>
         </table>
       </div>
<!-- 회원정보 및 예약정보 끝 -->

	<div id="button">
			<a class="btncheck" onclick="">예약현황조회</a>
			<a class="btncancel" onclick="">예약취소</a>
	</div>

	</div>
	
	
