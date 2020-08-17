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
	    /* padding: 17px 3px; */
	    border: 1px solid #f2f2f2;
	    /* border-top: 1px solid #333333;
	    border-bottom: 1px solid #333333; */
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
	
	/* 문의내역 글보기 */
	
	section {
		width: 80%;
		margin-top: 30px;
	}
	
	#noticeView {
      width: 900px;
      margin-left: auto;
      margin-right: auto;
   }
   
    
    table {
      width: 100%;
      border-collapse: collapse;
   }
   
  /*  thead > tr > th {
      font-size: 20px;
       font-weight: bold;
       color: #222222;
       text-align: left;
       padding: 20px 20px 20px 10px;
       border-top: 1px solid #333333;
       border-bottom: 1px solid #333333;
   } */
   
   tbody > tr > td {
      font-size: 14px;
       color: #666666;
       text-align: left;
       /* padding: 10px 10px 10px 10px; */
       border-bottom: 1px solid #dddddd;
       line-height: 1.8;
   
   }
   
   p#listBtn {
      display: inline-block;
      border-radius: 3px;
       height: 45px;
       width: 84px;
       background: #666666;
      color: white;
      float: right;
      margin: 30px 20px 50px 0px;
   }   
    
    p#modifyBtn {
      display: inline-block;
      border-radius: 3px;
       height: 45px;
       width: 84px;
       background: #666666;
      color: white;
      float: right;
      margin: 30px 20px 50px 0px;
   } 
    
    p#deleteBtn {
      display: inline-block;
      border-radius: 3px;
       height: 45px;
       width: 84px;
       background: #666666;
      color: white;
      float: right;
      margin: 30px 20px 50px 0px;
   }
   
   a.notice_view {
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
   
   span.delete {
      cursor: pointer;
   }
   
   
   .th {
      background: #f2f2f2;
   }
   
   .next_post {
      border-top: 1px solid #333333;
      border-bottom: 1px solid #dddddd;
   }
   
   .pre_post {
      border-bottom: 1px solid #333333;
   }
   
   .titlePointer:hover {
      cursor: pointer;
   }
   
   a {
      text-decoration: none;
    }
    
    /* 기본정보 변경 form */
	table.type05 {
		width: 100%;
	    border-collapse: separate;
	    border-spacing: 1px;
	    text-align: left;
	    line-height: 1.5;
	    border: 1px solid #ccc;
	}
	
	table.type05 th {
	    width: 20%;
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: middle;
	    background: #f2f2f2;
	}
	
	table.type05 td {
	    width: 80%;
	    padding: 10px;
	    vertical-align: top;
	}
	
	.form-control-tel {
		width: 70px;
	}
	
	#infoChange {
		width: 69%;
	}
	
	/* 코멘트란 */
	#comment {
		padding: 10px;
		background-color: #f2f2f2;
		border-radius: 4px;
	}
	
	 .long {
   	  width: 600px;
    } 
    
       .btnComment {
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
		goReadComment();
	});
	
	function goDelete(qnaSeq,parentSeq) {
	    var frm = document.addWriteFrm;
	    frm.qnaSeq.value = qnaSeq;
	    frm.parentSeq.value = parentSeq;
	    
	    frm.method = "GET";
	    frm.action = "<%= request.getContextPath()%>/deleteAsk.sd";
	    frm.submit();
	  }// end of function goSearch()-------------------------
	  
	  
	//=== 댓글쓰기 === //
	function goAddWrite() {
		var frm = document.addWriteFrm;
		var contentVal = frm.content.value.trim();
		if(contentVal=="") {
			alert("댓글 내용을 입력하세요");
			return;
		}
		
		var form_data = $("form[name=addWriteFrm]").serialize();
		
		$.ajax({
			url:"<%= request.getContextPath()%>/addComment.sd",
			data:form_data,
			type:"POST",
			dataType:"JSON",
			success:function(json){
				if(json.n == 1) {
				//	alert("댓글쓰기 성공");
					goReadComment();
				}
				else {
					alert("댓글쓰기 실패");
				}
				
				frm.content.value = "";
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
		
	}// end of function goAddWrite()----------------------  
	
	
	// === 페이징 처리 안한 댓글 읽어오기  === //
	function goReadComment() {
		$.ajax({
			url:"<%= request.getContextPath()%>/readComment.sd",
			data:{"parentSeq":"${boardvo.qnaSeq}"},
			dataType:"JSON",
			success:function(json){
			//	console.log(json);
				var html = "";
				if(json.length > 0) {
					$.each(json, function(index, item){
						html += "<div style='border-bottom: solid 1px #ccc;'>";
						html += "관리자 | ";
						html += item.regDate;
						html += "<br/>";
						html += item.content;
						html += "</div>";
					});
				}
				else {
					html += "댓글이 없습니다.";
				}
	
				$("#commentDisplay").html(html);
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});	
	
	}// end of function goReadComment()--------------------
	
</script>	
</head>
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
        <h1><strong>문의내역</strong></h1>
        <!-- <div>총 문의내역: <span style="color: skyblue;">1</span></div>
        <div>
        	<form name="seachFrm">
				<div id="search_header">
					<div id="search_bar">
						<div id="search_bar_right">
	
							<input id="searchWord" name="searchWord" type="text" placeholder="검색어를 입력해 주세요." />
							<input id="search_button" onclick="goSearch();" type="button" value="검색" /> 
						</div>
					</div>
				</div>	
			</form>
        </div> -->
			<section>
                <table>
                    <thead>
                        <tr>
                            <th>
                            	<table class="type05" style= " margin: 0 auto;">
									<tbody>
									<tr>
								        <th scope="row" style="border: none;">제목 </th>
								        <td style="border: none;">
										    ${boardvo.subject}
										</td>
								    </tr>
								    <tr>
								        <th scope="row" style="border: none;">작성자 </th>
								        <td style="border: none;">
										      ${boardvo.userid}
										</td>
								    </tr>
								    <tr>
								        <th scope="row" style="border: none;">작성일 </th>
								        <td style="border: none;">
										   ${boardvo.regDate}
										</td>
							        </tr>
								    </tbody>
								</table>
                            </th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>
                            	${boardvo.content}<br/><br/><br/><br/><br/>
                            	<div id="comment">
                                  	<span id="commentDisplay"></span>
                               </div>
                            </td>
                        </tr>
                       
                    </tbody>
                  
                </table>
                
                <form name="addWriteFrm" style="margin-top: 20px;">
					<!-- 댓글 : <input type="text" name="content" class="long" id="commentContent" />
					<button id="btnComment" type="button" onclick="goAddWrite()">확인</button> -->
					<input type="hidden" name="parentSeq" value="${qnaSeq}" />
					<input type="hidden" name="qnaSeq"/>
				</form>
                
                <p id="listBtn"><a onClick="javascript:location.href='<%= request.getContextPath()%>/askList.sd'" class="notice_view">목록</a></p>
                 <p id="deleteBtn"><a onclick="goDelete('${boardvo.qnaSeq}','${qnaSeq}')" class="notice_view">삭제</a></p>             
									
                <!-- <p id="modifyBtn"><a href="noticeList.sb" class="notice_view">수정</a></p> -->
                 <input type="hidden" id="status" value="${boardvo.status}" /> 
                <div>
                    <table>
                        <tr>
                            <th class="next_post th">이전글</th>
                            <!-- <td class="noticeNO" ></td>
                            <td class="noticeNO postrno" ></td> -->
                            <td class="next_post postNotice titlePointer" style="padding-left: 10px;" onclick="javascript:location.href='ask.sd?qnaSeq=${boardvo.previousseq}'">${boardvo.previoussubject}</td>
                        </tr>
                        <tr>
                            <th class="pre_post th">다음글</th>
                            <td class="pre_post preNotice titlePointer" style="padding-left: 10px;" onclick="javascript:location.href='ask.sd?qnaSeq=${boardvo.nextseq}'">${boardvo.nextsubject}</td>
                        </tr>
                    </table>
                </div>
                
              
                
				</div>
                <br/><br/><br/>

            </section>
			</br></br>
			
			
			
			</br></br>
			
		</section>
		</div>
		
    </main>
    <footer>
    </footer>
</body>
</html>