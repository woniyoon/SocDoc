<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String ctxPath = request.getContextPath();
	// 	   /board
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Page Title</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" media="screen" href="main.css" />
<script src="main.js"></script>
<style>

	body {
        height: auto;
        margin: 0 auto;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        border: 1px solid pink;
        min-height: 100vh;
    }

    header {
        position: sticky;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 10px 0;
        width: 100vw;
        background-color: white;
        box-shadow: 2px 2px 2px 0 #b6b6b65a, 0 2px 2px 0 rgba(155, 155, 155, 0.337);
    }

    .headerMenu {
        width: 80vw;
        display: flex;
        flex-direction: row;
        justify-content: space-around;
        padding: 0;
    }

    /*  header 끝  */


	ul {
        list-style-type: none;
    }

    main {
        padding: 30px auto;
        width: 100vw;
        min-height: 75vh;
        height: auto;
        display: flex;
        flex-direction: row;
    }

    #sideMenu {
        flex: 1;
        /* border: 1px solid navy; */
    }

    #contents {
        flex: 4;
        height: auto;
        margin: 0 30px;
		flex-direction: row;
        justify-content: space-around;
    }

    
    /*  main 끝  */
    footer {
        position: absolute;
        height: 5rem;
        width: 100vw;
        background-color: rgb(241, 241, 241);
    }

    table {
      width: 80%;
      border-collapse: collapse;
      margin-bottom: 10px;
   }
   
    th {
       font-size: 14px;
       font-weight: bold;
       color: #222222;
       text-align: center;
       padding: 17px 3px;
       border-top: 1px solid #333333;
       border-bottom: 1px solid #333333;
    }
   
   td {
       font-size: 14px;
       color: #666666;
       text-align: center;
       padding: 17px 0;
       border-bottom: 1px solid #dddddd;
       line-height: 1.8;
   
   }
   
   
   .checkTbl{
      width:5%;
   }

   .starTbl{
      width: 10%;
   }
   
   .dateTbl{
      width: 15%;
   }
   
   .contentTbl{
      width:50%;
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
     
   a.notice_list {
       display: inline-block;
       font-size: 14px;
       color: #fff;
       font-weight: bold;
       text-align: center;
       height: 45px;
       line-height: 45px;
       width: 100%;
       text-decoration: none;
      cursor: pointer;
   }
     
   td.noticeTitle:hover {
      cursor: pointer;
   }
   
   div#pageBar {
      text-align: center;
      
   }
   
     
   .starRating{
      background: url('/socdoc/resources/images/icoReview.png') no-repeat right 0;
      background-size: auto 100%;
      width: 10px;
      height: 10px;
      display: inline-block;
      text-indent: -9999px;
   }
     
   .on{
      background-position:0 0;
   }
     
   .btnDelete{
      background-color: #efefef;
      cursor: pointer;   
      border: 1px solid #dddddd;       
      padding: 0.25em .75em;    
      border-radius: .25em;       
      font-weight: 500;
      font-size: 10pt;   
   }
  
</style>



<script type="text/javascript">

   $(document).ready(function(){
      
      
      $(".starRating").each(function(){
         $("#starRating3").addClass("on").prevAll("span").addClass("on");
         return false;
      })
   
   })

   
   
   function goDelete(){
      
      
         
   }
   

</script>
</head>
<body>
   <%--  <header>
        <img id="logo" src="<%= ctxPath%>/resources/images/logo.jpg" width=80px height=80px />
        <ul class="headerMenu">
            <li><a>찾기</a></li>
            <li><a>예약</a></li>
            <li><a>후기</a></li>
            <li><a>알림소식</a></li>
        </ul>
    </header> --%>
    <main>
        <div id="sideMenu">
            <ul style="margin-left: 50px;">
            	<li><h3>관련 콘텐츠</h3></li>
            	<li><a href="<%= request.getContextPath()%>/infoEdit.sd">· 회원정보수정</a></li>
                <li><a href="<%= request.getContextPath()%>/askList.sd">· 문의내역</a></li>
                <li><a href="<%= request.getContextPath()%>/myHealth.sd">· 내 건강</a></li>
                <li><a href="<%= request.getContextPath()%>/bookMark.sd">· 병원 즐겨찾기</a></li>
                <li><a href="<%= request.getContextPath()%>/reservation.sd">· 예약확인</a></li>
                <li><a href="<%= request.getContextPath()%>/viewHistory.sd">· 최근 진료이력조회</a></li>
            	<li><a href="<%= request.getContextPath()%>/review.sd">· 내 후기</a></li>
            </ul>
            <ul style="display:inline-block; margin-top: 20px; margin-left: 50px;">
            	<li><h3>자주 찾는 서비스</h3></li>
                <li><a>FAQ</a>&nbsp;&nbsp;&nbsp;<a>병원찾기</a></li>
                <li><a>내 건강</a></li>
            </ul>
        </div>
        
        <div id="contents">
		   <h1 style="text-align: left;"><strong>내 후기</strong></h1>
    <div>총 후기 : <span style="color: skyblue;">1</span></div>
    <div>
       <table style="margin-top: 30px;">
          <thead>
              <tr>
                 <th class="checkTbl"><input type="checkbox"/></th>
                 <th >병원이름</th>
                 <th class="starTbl">별점</th>
                 <th class="contentTbl">내용</th>
                 <th class="dateTbl">등록일</th>
              </tr>
          </thead>
          
          <tbody>
             <tr>
                <td class="checkTbl"><input type="checkbox" /></td>
                <td class="noticeTitle">똑닥병원</td>
                <td class="starTbl">
                   <span class="starRating" id="starRating1">별1</span>
               <span class="starRating" id="starRating2">별2</span>
               <span class="starRating" id="starRating3">별3</span>
               <span class="starRating" id="starRating4">별4</span>
               <span class="starRating" id="starRating5">별5</span>
                </td>
                <td class="contentTbl">너무 좋은 병원입니다.너무 좋은 병원입니다.너무 좋은 병원입니다.너무 좋은 병원입니다.너무 좋은 병원입니다.너무 좋은 병원입니다.<br/>너무 좋은 병원입니다.<br/>너무 좋은 병원입니다.<br/></td>
                <td class="dateTbl">2020-07-30</td>
              </tr>
              <tr>
                <td class="checkTbl"><input type="checkbox" /></td>
                <td class="noticeTitle">어쩌고저쩌고약국</td>
                <td class="starTbl">
                   <span class="starRating" id="starRating1">별1</span>
               <span class="starRating" id="starRating2">별2</span>
               <span class="starRating" id="starRating3">별3</span>
               <span class="starRating" id="starRating4">별4</span>
               <span class="starRating" id="starRating5">별5</span>
                </td>
                <td class="contentTbl">또 가고 싶은 약국<br/></td>
                <td class="dateTbl">2020-07-30</td>
              </tr>
          </tbody>               
       </table>
    </div>
    <div style="width: 80%;" align="right">
      <button type="button" class="btnDelete" onClick="goDelete();">삭제</button>
   </div>
        </div>
    </body>
 </html>