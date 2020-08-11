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
       /*  height: auto; */
		flex-direction: row;
        justify-content: space-around;
        margin: 0 30px;
    }

    /*  main 끝  */
    footer {
        position: absolute;
        height: 5rem;
        width: 100vw;
        background-color: rgb(241, 241, 241);
    }
    
    /* @media (max-width:1000px) {
		CSS 스타일 !
	
	}
       */

	/* 게시판  */
	table {
		width: 80%;
		border-collapse: collapse;
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
	
	#notice {
		/* border: solid 1px red; */
		width: 80%;
		height: 160px;
		padding:15px;
		background-color: #E3E3E3;
		border-radius: 4px;
	}
	
	/* 기본정보 변경 form */
	table.type05 {
		width: 100%;
	    border-collapse: separate;
	    border-spacing: 1px;
	    text-align: left;
	    line-height: 1.5;
	    /* border-top: 1px solid #ccc; */
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
		width: 100%;
	}
	
	div#pageBar {
		text-align: center;
		
	}

</style>

<script type="text/javascript" src="/StarbucksWeb/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/StarbucksWeb/util/myutil.js"></script>

<script type="text/javascript">

	 $(document).ready(function() {
		
		// 검색시 검색조건 및 검색어 값 유지시키기 
	    if(${paraMap != null}) {
	       $("#searchType").val("${paraMap.searchType}");
	    }
		
		$("#searchType").change(function(){
			searchType = $(this).val();
			goSearch(searchType);
		});
		
		
	});
 
	function hospitalName(){
		
		// 팝업창 띄우기
		var url = "<%= request.getContextPath()%>/hospitalNamePopup.sd";
		
		window.open(url, "hospitalNamePopup",
					"left=350px, top=100px, width=350px, height=250px, resizable = no, scrollbars = no"); // 팝업창 띄움(view단주소, 팝업창이름, 위치) --%>
		
	}
	
	function goSearch(searchType) {
	    var frm = document.searchFrm;
	    frm.searchType.value = searchType;
	    
	    frm.method = "GET";
	    frm.action = "<%= request.getContextPath()%>/reservation.sd";
	    frm.submit();
	  }// end of function goSearch()-------------------------

</script>


<body>
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
        <h1 style="text-align: left;"><strong>예약확인</strong></h1>
        <div>총 예약: <span style="color: skyblue;">${totalCount}</span></div>
        <div style="width:80%; display: inline-block; ">
        <form name="searchFrm">
  			<select id="searchType" name="searchType" style="height:25px; float: right;" >
  				<option id="searchType1" value="1" >전체</option>
  				<option id="searchType2" value="2" >방문날짜 최신순</option>
  				<option id="searchType3" value="3" >방문날짜 오래된순</option>
  			</select>
  		</form>
       </div>
			<form name="noticeListFrm">
			<table style="margin-top: 30px;">
				<thead>
					 <tr>
					 	<th>번호</th>
					 	<th>병원이름</th>
					 	<th>방문예정일</th>
					 	<th>방문여부</th>
					 </tr>
				</thead>
				
				<tbody>
				<c:forEach var="reservationList" items="${reservationList}" varStatus="status">
					<tr>
					    <td class="notice_seq">${reservationList.reservSeq}</td>
						<td id="hospitalName" class="noticeTitle"><a style="cursor: pointer;" class="btn" data-toggle="modal" data-target="#myModal">${reservationList.hpSeq}</a></td>
						<td>${reservationList.visitDate}</td>
						<td>${reservationList.status}</td>
					</tr>
				</c:forEach>
				</tbody>	
					
			</table>
			</form>
			</br></br>
			
			<div id="notice">
				<img id="warning" src="<%= ctxPath%>/resources/images/warning.png" width=70px height=70px /><span style="color: #02BAFF; font-size: 18pt; font-weight: bold;">주의</span><br/>
				<span style="font-size: 10pt;">
					진료예약취소는 진료일 이전(자정)까지 가능합니다. (수납기록 및 검사예약이 없는 진료만 변경/취소가 가능특정 진료과(정신건강의학과, 영상의학과, 마취통증의학과)의 예약이 조회되지 않을 수 있습니다.<br/>
					예약이 조회되지 않을 경우에는 예약센터나 해당 진료과로 문의해 주십시오.
				</span>
			</div>
			
			<!-- 페이지바 -->
			<div id="center" style="width: 30%; border: solid 0px gray; margin: 20px auto;">
				${pageBar}
			</div>
			
			</div>
			</br></br>
			
			<!--  
			<div id="notice_button_wrap">
				<p id="notice_button">
					<a class="write notice_list" href="feedbackWrite.sb" >글쓰기</a>
				</p>
			</div>
			-->
		</section>
		</div>
		
		<!-- 모달 영역 -->
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-ladelledby="myModalLabel">
   <div class="modal-dialog" role="document">
   <div class="modal-content">
      <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
      <h4 class="modal-title" id="myModalLabel" style="font-size: 18pt; font-weight: bold;">예약확인</h4>
      </div>
      
      <!-- 내용 -->
      <div class="modal-body">
      <div id="container" style="text-align: center; margin-top: 30px; width: 100%; margin: 0 auto;">
		<!-- 기본정보 변경 form시작 -->
	    <div id="infoChange">
		<form name="writeFrm" >
			<table class="type05" style="border-top: solid 1px black; margin: 0 auto;">
				<tbody>
				<tr>
			        <th scope="row" style="border: none;">병원명 </th>
			        <td>
					    똑딱병원
					</td>
			    </tr>
			    <tr>
			        <th scope="row" style="border: none;">진료과목 </th>
			        <td>
					      이비인후과
					</td>
			    </tr>
			    <tr>
			        <th scope="row" style="border: none;">방문예정일 </th>
			        <td>
					2020.0.18
					</td>
		        </tr>
		        <tr>
			        <th scope="row" style="border: none;">방문예정시간 </th>
			        <td>
			        	14:00
					</td>
				</tr>	
				<tr>
					<th scope="row" style="border: none;">전화번호</th> 
					<td>
					02-123-5567
					</td>
				</tr>			
			    <tr>
			        <th scope="row" style="border: none;">주소</th>
			        <td>
			        	서울특별시 중구 을지로 255, 기승빌딩 4층 (을지로6가)
					</td>
			    </tr>
			    </tbody>
			</table>
		  
	  </form>
	  </div>
   <!-- 기본정보 변경 form끝 -->
      </div>
      </div>
      
      <div class="modal_footer" style="text-align: center; margin-bottom: 30px;">
      <button type="button" class="btn btn-primary">예약변경</button>
      <button type="button" class="btn btn-default myclose" data-dismiss="modal">예약취소</button>
      </div>
   </div>
   </div>
   </div>
		
    </main>
    <footer>
    </footer>
</body>
</html>