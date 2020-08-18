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
    
    div#search_header {
		
	}
	
	div#search_bar {
		width: 85%;
		height: 76px;
		/* background-color: #f4f4f2; */
		border-radius: 3px;
    	margin-bottom: 40px;
	}
	
	div#search_bar_right {
		float: right;
		margin-right: 6%;
	}

	
	input#searchWord {
		margin-top: 20px;
		display: inline;
		width: 200px;
	    height: 36px;
	    line-height: 36px;
	    border: 1px solid #ddd;
	    border-radius: 3px;
	    text-indent: 10px;
	    color: #666;
	}
	
	/* 버튼 타입이라 밑에 그림자 지는게 맘에 안듬 */
	input#search_button {
		display: inline;
	    width: 54px;
	    height: 37px;
	    line-height: 38px;
	    background: #157bb9;
	    border-radius: 3px;
	    font-size: 14px;
	    font-weight: bold;
	    color: white;
	    text-align: center;
	    padding: 0;
	    cursor: pointer;
	    border: none;
	}
	
	p.search_button {
		display: inline;
	    width: 54px;
	    height: 38px;
	    line-height: 38px;
	}
	

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
		
		
		// == 체크박스 전체선택 / 전체해제 == //
		$("input:checkbox[id=allCheck]").click(function(){
		 // var bool = $(this).is(":checked"); 
		 // 또는	
			var bool = $(this).prop("checked"); 
		    $("input:checkbox[name=items]").prop("checked", bool);
		});
		
		// == 체크박스 전체선택 / 전체해제 에서 
		//    하위 체크박스에 체크가 1개라도 체크가 해제되면 체크박스 전체선택/전체해제 체크박스도 체크가 해제되고
		//    하위 체크박스에 체크가 모두 체크가 되어지지면  체크박스 전체선택/전체해제 체크박스도 체크가 되어지도록 하는 것 == // 
		
		$("input:checkbox[name=items]").click(function(){
			 
			 var bFlag = false;
			 
			 $("input:checkbox[name=items]").each(function() {
				 var bool = $(this).prop("checked");
				 if(!bool) {
					 $("input:checkbox[id=allCheck]").prop("checked", false);
					 bFlag = true;
					 return false;
				 }
			 });
			 
			 if(!bFlag)
				 $("input:checkbox[id=allCheck]").prop("checked", true); 
			 
		 });
		
		/* // 목록에서 삭제버튼을 누르면 
		
		$("#printBtn").click(function(){
			
			alert("정말 삭제하시겠습니까?");
			document.
			
		}); */
	    
<%-- 	    $(".subject").bind("mouseover", function(event){
	       var $target = $(event.target);
	       $target.addClass("subjectStyle");
	    });
	    
	    $(".subject").bind("mouseout", function(event){
	       var $target = $(event.target);
	       $target.removeClass("subjectStyle");
	    });
	 --%>   
	    
	    $("#searchWord").keydown(function(event) {
	        if(event.keyCode == 13) {
	           // 엔터를 했을 경우
	           goSearch();
	        }
	     });
	    
	 // 검색시 검색조건 및 검색어 값 유지시키기 
	    if(${paraMap != null}) {
	       $("#searchWord").val("${paraMap.searchWord}");
	    }
	 
	    <%--
	 === #105. 검색어 입력시 자동글 완성하기 2 ===
	    $("#displayList").hide();
	    
	    $("#searchWord").keyup(function(){
	       
	       var wordLength = $(this).val().length;
	       // 검색어의 길이를 알아온다.
	       
	       // 검색어 입력후 백스페이스키를 눌러서 검색어를 모두 지우면 검색된 내용이 안 나오도록 해야 한다.
	       if( wordLength == 0) {
	          $("#displayList").hide();
	       }
	       else {
	          
	          $.ajax({
	             url:"<%= request.getContextPath()%>/wordSearchShow.action",
	             type:"GET",
	             data:{searchType:$("#searchType").val()
	                 ,searchWord:$("#searchWord").val()},
	             dataType:"JSON",
	             success:function(json){
	                
	                 === #110. 검색어 입력시 자동글 완성하기 7 ===
	                 if(json.length > 0) {
	                    // 검색된 데이터가 있는 경우임.
	                    
	                    var html = "";
	                    
	                    $.each(json, function(entryIndex, item){
	                       var word = item.word;
	                       
	                       var index = word.toLowerCase().indexOf( $("#searchWord").val().toLowerCase());
	                   //    console.log("index : " + index);
	                       
	                       var len = $("#searchWord").val().length;
	                       
	                       var result = "";
	                       
	                   //    console.log( word.substr(0,index) );   // 검색어 앞까지의 글자
	                   //    console.log( word.substr(index,len) ); // 검색어 글자
	                   //    console.log( word.substr(index+len) ); // 검색어 뒤부터 끝까지의 글자
	                       
	                       result = "<span style='color:blue;'>"+word.substr(0,index)+"</span>" + "<span style='color:red;'>"+word.substr(index,len)+"</span>" + "<span style='color:blue;'>"+word.substr(index+len)+"</span>";
	
	                       html += "<span style='cursor:pointer;' class='result'>"+result+"</span><br/>";
	                    });
	                    
	                    $("#displayList").html(html);
	                    $("#displayList").show();
	                 }
	                 else {
	                   // 검색된 데이터가 존재하지 않는 경우임.
	                    $("#displayList").hide();
	                 }
	                
	             },
	             error: function(request, status, error){
	                      alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	               }
	          });
	       }
	       
	    });// end of $("#searchWord").keyup()-------------------------------
	    
	    
	    
	    === #111. 검색어 입력시 자동글 완성하기 8 ===
	    $(document).on("click",".result",function(){
	       var word = $(this).text();
	       $("#searchWord").val(word);
	       $("#displayList").hide();
	       goSearch();
	       //alert(word);
	    });
	    
	/*     $("#displayList").click(function(event){
	          var $target = $(event.target);
	          if($target.is(".result")){
	          alert("호호호");
	        }
	    });
	     */
	     --%>
	     
	     
	  });// end of $(document).ready(function(){})-------------------
	
	 function goView(qnaSeq) {
	     
	     <%-- location.href="<%= request.getContextPath()%>/myPage/ask.sd?qnaSeq="+qnaSeq; --%>
	     
	  // === #121. 페이징 처리되어진 후 특정글제목을 클릭하여 상세내용을 본 이후
			// 			  사용자가 목록보기 버튼을 클릭했을때 돌아갈 페이지를 알려주기 위해
			// 			  현재 페이지 주소를 뷰단으로 넘겨준다.
			var frm = document.goViewfrm;
	  		frm.qnaSeq.value = qnaSeq;
	  		
	  		frm.method= "GET";
	  		frm.action = "<%= request.getContextPath()%>/ask.sd";
	  		frm.submit();
	  }// end of function goView(seq)---------------------------------- 
	
	  function goSearch() {
	    var frm = document.searchFrm;
	    frm.method = "GET";
	    frm.action = "<%= request.getContextPath()%>/askList.sd";
	    frm.submit();
	  }// end of function goSearch()-------------------------
	  
	  function goDel() {
		  
		  var cnt = $("input[name='items']:checked").length;
	        var arr = new Array();
	        $("input[name='items']:checked").each(function() {
	            arr.push($(this).attr('id'));
	        });
	        if(cnt == 0){
	            alert("선택된 글이 없습니다.");
	        }
	        else{
	           
	        	var con = confirm("선택된 글을 삭제합니다.");
	        	
	        	if(con == true) {
	        		var frm = document.delFrm;
		        	frm.method = "POST";
		        	frm.action = "<%= request.getContextPath()%>/goDel.sd"
		        	frm.submit();
	        	}
	        	else if(con == false){ 
	        		location.href="history.back()";
	        	}
	        	
	        } 
	        
	  }
</script>


</head>
<body>
    <main>
        <div id="sideMenu">
            <ul style="margin-left: 50px;">
            	<li><h3 style="font-weight: bolder; color: #4e4e4b;">관련 콘텐츠</h3></li>
                <li><a href="<%= request.getContextPath()%>/infoEdit.sd">· 회원정보수정</a></li>
                <li><a style="color: #157bb9; font-weight: bolder;" href="<%= request.getContextPath()%>/askList.sd">· 문의내역</a></li>
                <li><a href="<%= request.getContextPath()%>/myHealth.sd">· 내 건강</a></li>
                <li><a href="<%= request.getContextPath()%>/bookMark.sd">· 병원 즐겨찾기</a></li>
                <li><a href="<%= request.getContextPath()%>/reservation.sd">· 예약확인</a></li>
                <li><a href="<%= request.getContextPath()%>/viewHistory.sd">· 최근 진료이력조회</a></li>
           		<li><a href="<%= request.getContextPath()%>/review.sd">· 내 후기</a></li>
            </ul>
            <ul style="display:inline-block; margin-top: 20px; margin-left: 50px; font-size: 14pt; color:#157bb9;">
            	<li><h3 style="font-weight: bolder; color: #4e4e4b;">자주 찾는 서비스</h3></li>
                <li><a>FAQ</a>&nbsp;&nbsp;&nbsp;<a>병원찾기</a></li>
                <li><a>내 건강</a></li>
            </ul>
        </div>
        
        <div id="contents">
        <h1><strong>문의내역</strong></h1>
        <div>총 문의내역: <span style="color: #157bb9;">
				        <c:if test="${not empty(totalCount)}">
				         		${totalCount}
				        </c:if>
				         <c:if test="${empty(totalCount)}">
				         	0
				        </c:if> 
				       </span></div>
        <div>
        	<form name="searchFrm">
				<div id="search_header">
					<div id="search_bar">
						<div id="search_bar_right">
	
							<input id="searchWord" name="searchWord" type="text" placeholder="검색어를 입력해 주세요." />
							<input id="search_button" onclick="goSearch();" type="button" value="검색" /> 
						</div>
					</div>
				</div>	
			</form>
        </div>
			
			<form name="delFrm">
			<table style="margin-top: 30px;">
				<thead>
					 <tr>
					 	<th><input type="checkbox" id="allCheck"/></th>
					 	<th>글번호</th>
					 	<th>제목</th>
					 	<th>등록일</th>
					 	<th>처리과정</th>
					 </tr>
				</thead>
				
				
				<tbody>
				<c:forEach var="askList" items="${askList}" varStatus="status">
					<tr>
						<td><input type="checkbox" name="items" value="${askList.qnaSeq}"/></td>
					    <td class="notice_seq" >${status.count}</td>
						<td class="noticeTitle"><span onclick="goView('${askList.qnaSeq}')">${askList.subject}</span></td>
						<td>${askList.regDate}</td>
						<c:if test="${askList.status == 0}">
						<td style="color: red;">
								접수완료
						</td>
						</c:if>
						<c:if test="${askList.status == 1}">
						<td style="color: #157bb9;">
				         		답변완료
				        </td> 		
				        </c:if>
					</tr>
				</c:forEach>	
				</tbody>	
						
			</table>
			
			
			</br></br>
			
			<!-- 페이지바 -->
			<%-- <div id="center" style="width: 30%; border: solid 0px gray; margin: 20px auto;">
				${pageBar}
			</div> --%>
			<div class="page_wrap">
			   <div class="page_nation" style="width: 30%; border: solid 0px gray; margin: 20px auto;">
			      ${pageBar}
			   </div>
			</div>
			
			<div id="btn" style="width:80%; text-align: right;">
				<%-- <button id="printBtn" style="background-color: skyblue; color:white; width: 80px; height: 30px; border-radius: 4px; border: none; font-size: 10pt;" onclick="javascript:location.href='<%= request.getContextPath()%>/ask.sd'">문의하기</button>
				<button id="printBtn" style="background-color: white; color:skyblue; width: 50px; height: 30px; border-radius: 4px; border: solid 1px skyblue; font-size: 10pt;">삭제</button>
			 --%>
			 	<button id="printBtn" style="background-color: #157bb9; color:white; width: 50px; height: 30px; border-radius: 4px; border: none; font-size: 10pt;" onClick="goDel()">삭제</button>
			</div>
			</form>
			
			
			
			
			</div>
			</br></br>
			
			<%--  === 페이징 처리되어진 후 특정글제목을 클릭하여 상세내용을 본 이후
					사용자가 목록보기 버튼을 클릭했을때 돌아갈 페이지를 알려주기 위해
					현재 페이지 주소를 뷰단으로 넘겨준다. --%>
			<form name="goViewfrm">
				<input type="hidden" name="qnaSeq"/>
				<input type="hidden" name="gobackURL" value="${gobackURL}"/>
			</form>
			
		</section>
		</div>
		
    </main>
    <footer>
    </footer>
</body>
</html>