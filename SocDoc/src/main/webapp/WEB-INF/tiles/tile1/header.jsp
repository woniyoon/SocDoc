<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctxPath = request.getContextPath();
%>
    

<meta charset="UTF-8">

<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
 <%-- 테이블 스타일을 위해 common.css 적용 --%>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/common.css" />


<title>속닥속닥</title>

<title>속닥속닥</title>
    
    <style>
        
        /* header START ---------------*/
        
        * {
            padding: 0px;
            margin: 0px;
            box-sizing: border-box
        }

        ul,li {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: inherit;
        }
        
        .logo {
            text-align: center;
            height: 100px;
        }

        .miniTitle {
            text-align: center;
            margin-top: 20px;
            font-weight: bolder;
            font-size: 20px;
        }
        
        .util {
            position: absolute;
            top: 0px;
            right: 0px;
        }

        .util li{
            float: left;
        }
        
        ul.util {
          padding-right: 50px;
          list-style: none;
        }
        
        ul.util li {
          display: inline;
          font-size: 16px;
        }
        
        ul.util li+li:before {
          padding: 8px;
          color: black;
          content: "/\00a0";
        }
        
        ul.util li a {
          text-decoration: none;
        }
        
        ul.util li a:hover {
          color: #4375DB;
        }
        
        .menu:after {
            content: '';
            display: block;
            clear: both;
        }

        .menu {
            margin-top: 45px;
            position: absolute;
            right: 0px;
            top: 0px;
        }

        .menu li{
            float: left;
            padding-left: 50px;
        }
        
        .menu {
          position: relative;
          display: inline-block;
        }

        /* --------------------------------------------------- */
       
        body {
          margin: 0;
        }

        .navbar {
          overflow: hidden;
          border: solid 1px #F6F6F6;
          display: flex;
          justify-content: center;
        }
        
        .navbar a {
          float: left;
          font-size: 16px;
          padding: 14px 16px;
          text-decoration: none;
          margin-left: 30px;
        }

        .subnav {
          float: left;    
          overflow: hidden;          
        }

        .subnav .subnavbtn {
          font-size: 20px;  
          border: none;
          outline: none;
          padding: 14px 16px;
          background-color: inherit;
          font-family: inherit;
          margin: 0;
          margin-left: 50px;
        }

        .navbar a:hover, .subnav:hover .subnavbtn {
          color: white;
          background-color: #4375DB;  
        }

        .subnav-content {
          display: none;
          position: absolute;
          left: 0;
          background-color: #4375DB;
          width: 100%;
          height: 85px;
          z-index: 1;
        }

        .subnav-content a {
          float: left;
          color: white;
          font-size: 18px;
          text-decoration: none;
        }

        .subnav-content a:hover {
          color: black;
        }

        .subnav:hover .subnav-content {
          display: block;
          display: flex;
          justify-content: center;
        }

        /* header END ---------------*/
</style>


    <p class="logo"><img src="<%= ctxPath%>/resources/images/logo.jpg" width="150px" height="100px" class="logo" /></p>

    <ul class="util">     
        <li><a href="#">로그인</a></li>
        <li><a href="#">회원가입</a></li>
        <li><a href="<%= request.getContextPath()%>/mypage.sd">마이페이지</a></li>
        <li><a href="#">고객센터</a></li>
    </ul>


    <div class="navbar">
      <div class="subnav">
        <button class="subnavbtn">찾기<i class="fa fa-caret-down"></i></button>
        <div class="subnav-content">
          <a href="#"><img src="<%= ctxPath%>/resources/images/hospital.png"/>병원찾기</a>
          <a href="#"><img src="<%= ctxPath%>/resources/images/pharmacy.png"/>약국찾기</a>
        </div>
      </div> 

      <div class="subnav">
        <button class="subnavbtn">예약<i class="fa fa-caret-down"></i></button>
        <div class="subnav-content">
          <a href="#"><img src="<%= ctxPath%>/resources/images/reservation.png"/>병원예약</a>
        </div>
      </div> 

      <div class="subnav">
        <button class="subnavbtn">후기<i class="fa fa-caret-down"></i></button>
        <div class="subnav-content">
          <a href="#"><img src="<%= ctxPath%>/resources/images/review.png"/>병원후기</a>
          <a href="#"><img src="<%= ctxPath%>/resources/images/review2.png"/>약국후기</a>
        </div>
      </div> 

      <div class="subnav">
        <button class="subnavbtn">알림·소식<i class="fa fa-caret-down"></i></button>
        <div class="subnav-content">
          <a href="#"><img src="<%= ctxPath%>/resources/images/notice.png"/>공지사항</a>
          <a href="#"><img src="<%= ctxPath%>/resources/images/health.png"/>건강정보</a>
          <a href="#"><img src="<%= ctxPath%>/resources/images/question.png"/>Q&A</a>
        </div>
      </div>
    </div>
