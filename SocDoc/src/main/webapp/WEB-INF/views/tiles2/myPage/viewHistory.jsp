<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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
        /* height: auto; */
        margin: 0 auto;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
       /*  border: 1px solid pink; */
        /* min-height: 100vh; */
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
		height: 50px;
		padding:15px;
		background-color: #E3E3E3;
		border-radius: 4px;
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
	 
	 
	 function goSearch(searchType) {
		    var frm = document.searchFrm;
		    frm.searchType.value = searchType;
		    
		    frm.method = "GET";
		    frm.action = "<%= request.getContextPath()%>/viewHistory.sd";
		    frm.submit();
		  }// end of function goSearch()-------------------------
		  
	function goPrint(title) {
				
			//(단위안주면 px)
			var sw=screen.width;  // 화면 가로길이
			var sh=screen.height; // 화면 세로길이
			var popw=800; // 팝업창 가로길이 
			var poph=600; // 팝업창 세로길이
			var xpos=(sw-popw)/2; // 화면 중앙에 띄우도록 한다.
			var ypos=(sh-poph)/2; // 화면 중앙에 띄우도록 한다.

			var popWin=window.open("","print","width="+popw+",height="+poph+",top="+ypos+",left="+xpos+",status=yes,scrollbars=yes");
			// 일단 내용이 없는 팝업윈도창을 만든다.
			
			popWin.document.open();  // 팝업윈도창에 내용을 넣을 수 있도록 열어주어야한다. (오픈한다.)

			// 팝업윈도창에 내용을 입력한다.hpname
			popWin.document.write("<html><head><style type='text/css'>*{hpname:width:50%;}{table:width:100%;}</style><bod onload='window.print()'>");
			popWin.document.write(document.getElementById("print_page").innerHTML);
			popWin.document.write("<br/>");
			popWin.document.write("</body></html>");
		
			popWin.document.close(); // 팝업윈도창 문서를 닫는다.
			
			popWin.print(); // 팝업윈도창에 대한 인쇄창을 띄우고
			popWin.close(); // 인쇄를 하던가 또는 취소를 누르면 팝업윈도창을 닫는다.
			
		}// end of function goPrint(title)-----------------------------------------------------	  
		  
</script>	 
</head>
<body>
    <main>
        <div id="sideMenu">
            <ul style="margin-left: 50px;">
            	<li><h3 style="font-weight: bolder; color: #4e4e4b;">관련 콘텐츠</h3></li>
                <li><a href="<%= request.getContextPath()%>/infoEdit.sd">· 회원정보수정</a></li>
                <li><a href="<%= request.getContextPath()%>/askList.sd">· 문의내역</a></li>
                <li><a href="<%= request.getContextPath()%>/myHealth.sd">· 내 건강</a></li>
                <li><a href="<%= request.getContextPath()%>/bookMark.sd">· 병원 즐겨찾기</a></li>
                <li><a href="<%= request.getContextPath()%>/reservation.sd">· 예약확인</a></li>
                <li><a style="color: #157bb9; font-weight: bolder;" href="<%= request.getContextPath()%>/viewHistory.sd">· 최근 진료이력조회</a></li>
           		<li><a href="<%= request.getContextPath()%>/review.sd">· 내 후기</a></li>
            </ul>
            <ul style="display:inline-block; margin-top: 20px; margin-left: 50px; font-size: 14pt; color:#157bb9;">
               <li><h3 style="font-weight: bolder; color: #4e4e4b;">자주 찾는 서비스</h3></li>
                <li><a href="<%= request.getContextPath()%>/faq.sd" style="color: #157bb9; cursor: pointer;">FAQ</a>&nbsp;&nbsp;&nbsp;<a href="<%= request.getContextPath()%>/searchHospital.sd" style="cursor: pointer; color: #157bb9;">병원찾기</a></li>
                <li><a style="color: #157bb9; cursor: pointer;" href="<%= request.getContextPath()%>/myHealth.sd">내 건강</a></li>
            </ul>
        </div>
        
        <div id="contents">
        <div id="print_page">
        <h1 style="text-align: left;"><strong>최근 진료이력조회</strong></h1>
        
        <div><span style="color: #157bb9;">${membervo.name}</span> 님(환자번호:${membervo.memberSeq})의 과거 1년간 수진이력입니다.</div>
        <div style="width:80%; display: inline-block; ">
        	<form name="searchFrm">
       			<select id="searchType" name="searchType" style="height:25px; float: right;" >
  				<option id="searchType1" value="1" >전체</option>
  				<option id="searchType2" value="2" >최신순</option>
  				<option id="searchType3" value="3" >오래된순</option>
  			</select>
  			</form>
       		</div>
       		
			<form name="noticeListFrm">
			<table style="margin-top: 30px;">
				<thead>
					 <tr>
					 	<th>번호</th>
					 	<th id="hpname">병원이름</th>
					 	<th>진료과목</th>
					 	<th>방문일</th>
					 </tr>
				</thead>
				
				
				<c:forEach var="historyList" items="${historyList}" varStatus="status">
				<tbody>
					<tr>
						<td>${status.count}</td>
					    <td class="notice_seq">${historyList.hpName}</td>
						<td class="">${historyList.dept}</td>
						<td>${historyList.visitdate}</td>
					</tr>
				</tbody>	
				</c:forEach>		
				
				<!--  
				<tbody>
					<c:forEach var="feedback" items="${feedbackList}" >
					<tr>
					    <td>${feedback.rno}</td>
						<td>${feedback.status}</td>
						<td class="notice_seq">${feedback.feedback_board_seq}</td>
						<td class="noticeTitle">${feedback.title}</td>
						<a href="/notice/noticeView.sb?notice_seq=${notice.notice_seq}">
						<td>${feedback.username}</td>
						<td>${feedback.write_day}</td>
						<td>${feedback.hit}</td>
					</tr>
					</c:forEach>
				</tbody>
				-->
			</table>
			</form>
			
			</br></br>
			
			<div id="notice">
				<span style="font-size: 10pt;">
					※ 1년 이전의 수진 이력은 조회되지 않습니다.
				</span>
			</div>
			</div>
			<div style="width:80%; margin-top: 30px; text-align: right;">
				<span><button id="printBtn" style="background-color: #157bb9; color:white; width: 50px; height: 30px; border-radius: 4px; border: none; font-size: 10pt;" onclick="goPrint()">인쇄</button></span>
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
		
    </main>
    <footer>
    </footer>
</body>
</html>