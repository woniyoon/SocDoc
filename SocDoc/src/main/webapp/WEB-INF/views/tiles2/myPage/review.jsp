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
        /* border: 1px solid pink; */
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
        margin: 0 auto;
        width: 90vw;
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
   
   .nameTbl{
   	   width:25%;
   }

   .starTbl{
      width: 20%;
   }
   
   .dateTbl{
      width: 15%;
   }
   
   .contentTbl{
      width:35%;
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
  
  
  .page_wrap {
	text-align:center;
	font-size:0;
 }
.page_nation {
	display:inline-block;
}
.page_nation .none {
	display:none;
}
.page_nation a {
	display:block;
	margin:0 3px;
	float:left;
	border:1px solid #e6e6e6;
	width:28px;
	height:28px;
	line-height:28px;
	text-align:center;
	background-color:#fff;
	font-size:13px;
	color:#999999;
	text-decoration:none;
}
.page_nation .arrow {
	border:1px solid #ccc;
}
.page_nation .pprev {
	background:#f8f8f8 url('/socdoc/resources/images/page_pprev.png') no-repeat center center;
	margin-left:0;
}
.page_nation .prev {
	background:#f8f8f8 url('/socdoc/resources/images/page_prev.png') no-repeat center center;
	margin-right:7px;
}
.page_nation .next {
	background:#f8f8f8 url('/socdoc/resources/images/page_next.png') no-repeat center center;
	margin-left:7px;
}
.page_nation .nnext {
	background:#f8f8f8 url('/socdoc/resources/images/page_nnext.png') no-repeat center center;
	margin-right:0;
}
.page_nation a.active {
	background-color:#42454c;
	color:#fff;
	border:1px solid #42454c;
}

</style>



<script type="text/javascript">

   $(document).ready(function(){
      
		// 검색시 검색조건 및 검색어 값 유지시키기 
	    if(${paraMap != null}) {
	       $("#searchType").val("${paraMap.searchType}");
	    }
		
		$("#searchType").change(function(){
			searchType = $(this).val();
			goSearch(searchType);
		});
	   
	   
      $(".starRating").each(function(){
         $("#starRating3").addClass("on").prevAll("span").addClass("on");
         return false;
      })
   
   });

   
   
   function goDelete(){
      
      
         
   }
   
   function goSearch(searchType) {
	    var frm = document.searchFrm;
	    frm.searchType.value = searchType;
	    
	    frm.method = "GET";
	    frm.action = "<%= request.getContextPath()%>/review.sd";
	    frm.submit();
	  }// end of function goSearch()-------------------------
   

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
            	<li><h3 style="font-weight: bolder; color: #4e4e4b;">관련 콘텐츠</h3></li>
                <li><a href="<%= request.getContextPath()%>/infoEdit.sd">· 회원정보수정</a></li>
                <li><a href="<%= request.getContextPath()%>/askList.sd">· 문의내역</a></li>
                <li><a href="<%= request.getContextPath()%>/myHealth.sd">· 내 건강</a></li>
                <li><a href="<%= request.getContextPath()%>/bookMark.sd">· 병원 즐겨찾기</a></li>
                <li><a href="<%= request.getContextPath()%>/reservation.sd">· 예약확인</a></li>
                <li><a href="<%= request.getContextPath()%>/viewHistory.sd">· 최근 진료이력조회</a></li>
           		<li><a style="color: #157bb9; font-weight: bolder;" href="<%= request.getContextPath()%>/review.sd">· 내 후기</a></li>
            </ul>
            <ul style="display:inline-block; margin-top: 20px; margin-left: 50px; font-size: 14pt; color:#157bb9;">
            	<li><h3 style="font-weight: bolder; color: #4e4e4b;">자주 찾는 서비스</h3></li>
                <li><a>FAQ</a>&nbsp;&nbsp;&nbsp;<a>병원찾기</a></li>
                <li><a>내 건강</a></li>
            </ul>  
        </div>
        
        <div id="contents">
		   <h1 style="text-align: left;"><strong>내 후기</strong></h1>
    <div>총 후기 : <span style="color: #157bb9;">${totalCount}</span></div>
    <div style="width:80%; display: inline-block; ">
        	<form name="searchFrm">
       			<select id="searchType" name="searchType" style="height:25px; float: right;" >
  				<option id="searchType1" value="1" >전체</option>
  				<option id="searchType2" value="2" >최신순</option>
  				<option id="searchType3" value="3" >오래된순</option>
  			</select>
  			</form>
       		</div>
    <div>
    
    <form name="noticeListFrm">
       <table style="margin-top: 30px;">
          <thead>
              <tr>
                 <th class="checkTbl"><input type="checkbox"/></th>
                 <th class="nameTbl">기관이름</th>
                 <th class="starTbl">별점</th>
                 <th class="contentTbl">내용</th>
                 <th class="dateTbl">등록일</th>
              </tr>
          </thead>
          
          <c:forEach var="reviewList" items="${reviewList}" varStatus="status">
          <tbody>
             <tr>
                <td class="checkTbl"><input type="checkbox" /></td>
                <td class="noticeTitle">${reviewList.name}</td>
                <td class="starTbl">
                <c:if test="${reviewList.rating==5}">★★★★★</c:if>
                <c:if test="${reviewList.rating==4}">★★★★</c:if>
                <c:if test="${reviewList.rating==3}">★★★</c:if>
                <c:if test="${reviewList.rating==2}">★★</c:if>
                <c:if test="${reviewList.rating==1}">★</c:if>
                   <!-- <span class="starRating" id="starRating1">별1</span>
               <span class="starRating" id="starRating2">별2</span>
               <span class="starRating" id="starRating3">별3</span>
               <span class="starRating" id="starRating4">별4</span>
               <span class="starRating" id="starRating5">별5</span> -->
               
                </td>
                <td class="contentTbl">${reviewList.content}</td>
                <td class="dateTbl">${reviewList.regDate}</td>
              </tr>
          </tbody> 
          </c:forEach>              
       </table>
    
    </div>
    <div style="width: 80%;" align="right">
      <!-- <button type="button" class="btnDelete" onClick="goDelete();">삭제</button> -->
   </div>
   
  <!-- 페이지바 -->
	<%-- <div id="center" style="width: 30%; border: solid 0px gray; margin: 20px auto;">
		${pageBar}
	</div> --%>
	<div class="page_wrap">
	   <div class="page_nation" style="width: 30%; border: solid 0px gray; margin: 20px auto;">
	      ${pageBar}
	   </div>
	</div>
	</form>
        </div>
    </body>
 </html>