<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String ctxPath = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>속닥 게시판</title>

<style type="text/css" >

/* 	body {
		font-family: Arial, "MS Trebuchet", sans-serif;
		width: 1100px;
		margin: 0 auto;
	} */

	.container { 
		width: 55%;
		height: 150%;
		margin: 100px auto 200px auto;
		padding: 0;
		border: solid 0px red;
	}
	
	.bowl {
   		//border: solid 1px #ccc;
   	}
	
	/* ---------------------------- 탭(공지사항/건강정보) -------------------------- */
	
	ul.tabs {
		margin: 0px;
		padding: 0px;
		list-style: none;
	}
   
	ul.tabs li {
		background: none;
		display: inline-block;
       	padding: 10px 15px;
       	width: 49.49%;
      	margin:0px;
      	border: solid 1px #ddd;
      	text-align: center;
      	cursor: pointer;      
		box-sizing: border-box;
	}
   
	ul.tabs li.current {
		background: #0080ff;
		color: #fff;
		font-weight: 1000;
	}
   
	.tabContent {
		display: none;
	}
   
	.tabContent.current {
		display: inherit;
	}

   	
	/* -------------------------------- 페이지 글 수 / 검색 ---------------------------------- */
	
	div#searchBar {
    	display: flex;
		width: 100%;
    	margin: 50px 0 10px 0;
	}
	
	div#searchBarLeft {
		flex: 1;
		margin-top: 5px;
	}
	
	div#searchBarRight {
	 /* flex: 1;
		flex-direction: row;
		justify-content: flex-end; */
		display: contents;
	}

	#searchButton {
		width: 50px;
		height: 35px;
	    text-align: center;
	    font-size: 14px;
	    font-weight: bold;
		color: #ffffff;
		background-color: #58ACFA;
		border: solid 0px #ccc;
	    cursor: pointer;
	}
	
	#noticeSearchWord, #noticeSearchWord2  {
		display: inline-block;
		width: 200px;
	    height: 35px;
	    margin: 0;
	    padding-left: 7px;
	    text-indent: 10px;
	    color: #666;
	    border: 1px solid #ccc;
	}
   	
   	/* #noticeSearchWord, #noticeSearchWord2 {
 		height: 34px;
 		padding-left: 7px;
 		border: solid 1px #ccc;
   	} */
   	
	/* input#search_button {
		display: inline-block;
	    width: 50px;
	    height: 35px;
	    padding: 0;
	    text-align: center;
	    font-size: 14px;
	    font-weight: bold;
	    color: #fff;
	    background: #777;
	    cursor: pointer;
	}
	
	p.search_button {
	    width: 54px;
	    height: 35px;
	    line-height: 38px;
	} */
		
	
	/* ---------------------------- 공지사항 -------------------------- */
	
	table {
		width: 100%;
		border-collapse: collapse;
	}
	
	 th {
	    padding: 17px 3px;
	    text-align: center;
		font-size: 14px;
	    font-weight: bold;
	    color: #222222;
	    border-top: 1px solid #333333;
	    border-bottom: 1px solid #333333;
	}
	
	td {
	    padding: 17px 0;
	    text-align: center;
		font-size: 14px;
	    color: #666666;
	    border-bottom: 1px solid #dddddd;
	    //line-height: 1.8;
	}
	
	/* div#notice_button_wrap {
		display: inline-block;
		width: 100%;	
	}
	
	p#notice_button {
		display: inline-block;
		float: right;
	    width: 84px;
	    height: 45px;
		margin: 30px 20px 50px 0px;
	    background: #666666;
		color: white;
	} */
	
	a.noticeList {
		display: inline-block;
	    width: 100%;
	    height: 45px;
	    text-align: center;
	    font-size: 14px;
	    font-weight: bold;
	    text-decoration: none;
	    color: #fff;
		cursor: pointer;
	}
	
	td.noticeTitle:hover {
		cursor: pointer;
	}
	
	div#pageBar {
		text-align: center;
	}
	
	.noticePagination {
		margin-top: 10px;
	}
	
	a {
      text-decoration: none;
    }
    
    /* ---------------------------- 건강정보 -------------------------- */
    
    #infoBoard {
	    display: grid;
	    padding: 0px;
	    margin-bottom: 80px;
	    grid-row-gap: 50px;
	    grid-template-columns: 33.333% 33.333% 33.333%;
	}	
	
	div > img {
		width: 245px;
		height: 200px;
		//border: solid 1px red;
	}
	
	td.subject:hover, div>img:hover {
		cursor:pointer !important;
	}
	
	/* 사진 더보기 버튼 */
	#photo {
	    position:relative;
		width: 100px;
		height: 40px;
	    top:50%; 
	    left:50%;
	    margin: -20px -50px; 
		border: solid 1px #ccc;
		background-color: #FAFAFA;	
		border-radius: 5px;
	}
	
</style>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<script type="text/javascript">

$(window).ready(function(){
	
	// 탭전환(공지사항)
	$('#one').click(function(){
		var tab_id = $(this).attr('data-tab');
		$('ul.tabs li').removeClass('current');
		$('.tabContent').removeClass('current');
		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
		//getNoticeBoard(currentShowPageNo);
		getNoticeBoard();
	});
	
	getNoticeBoard(1, "");
	
	// 탭전환(건강정보)
	$('#two').click(function(){
		var tab_id = $(this).attr('data-tab');
		$('ul.tabs li').removeClass('current');
		$('.tabContent').removeClass('current');
		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
		getHealthInfoBoard();
	});
	
	// 공지사항 검색 엔터키
	$("#one").keydown(function(event) {
		//console.log($(this).prop("value"));
		 if(event.keyCode == 13) { // 엔터를 했을 경우
			 getNoticeBoard();
		 }
	});
	
	// 건강정보 검색 엔터키	
	$("#two").keydown(function(event) {
		//console.log($(this).prop("value"));
		 if(event.keyCode == 13) { // 엔터를 했을 경우
			 // getHealthInfoBoard(1, $(this).prop("value"));
			 getHealthInfoBoard();
		 }
	});
	
	// 더보기 초기값
	infoBoard("1");
	$("#photo").click(function(){
		if($(this).text()=="처음으로"){
			$("#infoBoard").empty();
			$("#end").empty();
			infoBoard("1");
			$(this).text("더보기");
		} else {
			//console.log($(this).val() + " 267번째 줄  ");
			infoBoard($(this).val());
		}
	});
});		

	
	
	

// 공지사항 탭 클릭 /////////////////////////////////////////////////////////////////	
function getNoticeBoard(currentShowPageNo){
	$.ajax({	
		url:"<%= ctxPath%>/ajax/noticeBoard.sd",
		type:"get",
		data:{"searchWord": $("#noticeSearchWord").prop("value")
			 ,"currentShowPageNo": currentShowPageNo},
		dataType:"json",
		success:function(json){	
			var html = "";
			var jsonArr = JSON.parse(json.list);
			if(jsonArr.length > 0) {
				$.each(jsonArr, function(index, item){
					html += "<tr>"
						 + "<td class='noticeSeq'>"+item.noticeSeq+"</td>"
						 + "<td class='subject' onclick='goView("+item.noticeSeq+")'>"+item.subject+"</td>"
						 + "<td class='content'>"+item.regDate+"</td>"
						 + "</tr>";	
				});
			} else {
				$(".noticeList").html("<tr align='center'><td colspan='3'>검색 결과가 없습니다!</td></tr>");
			}
			$(".noticeList").html(html);
			$(".noticePagination").html(json.pageBar);
			$("#totalNotice").html(json.totalCount);
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	 	} 
	}); 
}

// 공지사항 게시글 클릭
function goView(noticeSeq) {
	//	console.log(noticeSeq);
 		var frm = document.goViewFrm;
		frm.noticeSeq.value = noticeSeq; 
		
		frm.method = "GET";
		frm.action = "<%=ctxPath%>/noticeView.sd";
		frm.submit();
}
/////////////////////////////////////////////////////////////////////////////////







// 건강정보 탭 클릭  ///////////////////////////////////////////////////////////////////
function getHealthInfoBoard(){
	$.ajax({	
		url:"<%= ctxPath%>/ajax/infoBoard.sd",
		type:"get",
		data:{"searchWord": $("#noticeSearchWord2").prop("value")},
		dataType:"json",
		success:function(json){
			var html = "";
			var jsonArr = JSON.parse(json.list);
			if(jsonArr.length > 0) {
				$.each(jsonArr, function(index, item){
					html += "<div align='center' id="+item.subject+"  onclick='goInfoView("+item.infoSeq+")'>"
							+ "<img src='/socdoc/resources/files/"+item.imgName+"'/>"
							+ item.subject
							+ "</div>";
				});			
			} else {
				$("#infoBoard").html("검색 결과가 없습니다!");
			}
			$("#infoBoard").html(html);
			$(".infoPagination").html(json.pageBar);
			$("#totalInfo").html(json.totalCount);
    		$("#totalCount").html(json.totalCount); 
			// $("#totalCount").text(json.totalCount); 
			// console.log(json.totalCount + " getHealthInfoBoard()에서 total count  ");
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	 	}
	}); 
}

// 건강정보 게시글 클릭
function goInfoView(infoSeq) {
 		var frm = document.goInfoFrm;
		frm.infoSeq.value = infoSeq; 
		
		frm.method = "GET";
		frm.action = "<%=ctxPath%>/infoView.sd";
		frm.submit();
}
///////////////////////////////////////////////////////////////////////////////






///// 더 보 기  ///////////////////////////////////////////////////////////////////
function infoBoard(start){ 
	var len = 6;
	//var start = 1;
	$.ajax({
		url:"<%= ctxPath%>/photo.sd",
		type:"GET",
		data:{"start":start, "len":len},
		dataType:"JSON",
		success:function(json){
			var html = "";
			if(start=="1" && json.length == 0) { // 데이터가 없다면
	    		html += "건강 정보 게시글 준비 중...";
	    		$("#infoBoard").html(html);
	    		$("#photo").attr("disabled", true).css("cursor","not-allowed");
			} else { // 데이터가 있다면
				$.each(json, function(index, item){
					html += "<div align='center' id="+item.subject+" onclick='goInfoView("+item.infoSeq+")'>"
						+ "<img src='/socdoc/resources/files/"+item.imgName+"'/>"
						+ item.subject
						+ "</div>";
				});
				$("#infoBoard").append(html); //게시글 결과 출력하기	 
	    		$("#photo").val(Number(start) + len); // ★ 더보기 버튼 value 값 지정
                $("#countHIT").text(Number($("#countHIT").text())+(json.length)); // 출력된 상품 개수 누적
				/* console.log("countHit에 뭐가 있어"+$("#countHIT").text()) // 나와있는 게시글 수
				console.log("json.length에 뭐가 있어"+json.length)	// 몇개가 더 추가되어있는 지
				console.log("totalCount에 뭐가 있어"+$("#totalCount").text()); */
				
            	// 더이상 보여줄 제품이 없다면
                if($("#countHIT").text()==$("#totalCount").text()){
                   $("#photo").text("처음으로");
                   //$("#end").html("더이상 조회할 항목이 없습니다.");
                   $("#countHIT").text("0");
                }
			}
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});
}
///////////////////////////////////////////////////////////////////////////////	

</script>
</head>

<div class="container">

	<!-- -------------------------------- 上  ---------------------------------- -->
	<div class="bowl">
		<ul class="tabs">
			<li id="one" class="tab-link current tab1" data-tab="tab-1" onclick="getNoticeBoard(1, '')">공지사항</li>
			<li id="two" class="tab-link tab2" data-tab="tab-2" >건강정보</li>
		</ul>
	
		
		
		
		
		<!-- -------------------------------- 공지사항 ---------------------------------- -->
		<div class="notice">
			<form name="tab1">	
				<div id="tab-1" class="tabContent current">
					<div id="search_header">
						<div id="searchBar">
							<div id="searchBarLeft" class="total">전체 <span id="totalNotice"></span>건</div>
							<div id="searchBarRight">
								<input id="noticeSearchWord" name="searchWord" type="text" placeholder="검색어를 입력해 주세요." />
								<input id="searchButton" onclick="getNoticeBoard();" type="button" value="검색" /> 
							</div>
						</div>
					</div>	
					
					<table>
						<thead>
							<tr>
								<th>NO</th>
							 	<th>제목</th>
							 	<th>날짜</th>
							</tr>
						</thead>
						<tbody class="noticeList"><%-- 공지사항 게시글 들어감 --%></tbody>
					</table>
					
					<!-- ${totalPage} --><div class="noticePagination" id="pageBar"><!-- ${pageBar} -->
					</div>
				</div>
			</form>
	
		
		
		
			
			<!-- -------------------------------- 건강정보 ---------------------------------- -->	
			
			<form name="tab2">
				<div id="tab-2" class="tabContent">
				
					<div id="search_header">
						<div id="searchBar">
							<div id="searchBarLeft" class="total">전체 <span id="totalInfo"></span>건</div>
							<div id="searchBarRight">
								<input id="noticeSearchWord2" name="searchWord" type="text" placeholder="검색어를 입력해 주세요." />
								<input id="searchButton" onclick="getHealthInfoBoard();" type="button" value="검색" /> 
							</div>
						</div>
					</div>	
				
					<div id="infoBoard"><%-- 건강정보 게시글 들어감 --%></div>	
					
					<%-- 더보기 버튼 --%>
			       	<div style="margin: 20px 0;">
			         	<button type="button" id="photo" value="">더보기</button>
			         	<span id="end" style="font-size: 10pt; font-weight: bold; color: #ccc; align-items: center"></span>
			         	<span id="totalCount" style="color: #ffffff;"></span>   
			         	<span id="countHIT" style="color: #ffffff;"></span>
			       	</div>
		       
				</div>
			</form>
				
		
		
		
		
		<!-- -------------------------------- 下  ---------------------------------- -->	
			<form name="goViewFrm">
	        	<input type="hidden" name="noticeSeq" />
	        </form>
	        <form name="goInfoFrm">
	        	<input type="hidden" name="infoSeq" />
	        </form>
		</div>
	</div>
</div>