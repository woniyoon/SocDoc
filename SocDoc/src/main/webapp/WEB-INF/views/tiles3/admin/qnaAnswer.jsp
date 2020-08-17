<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css" >

	.container { 
		width: 1000px;
		margin: auto;
		padding: 0;
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

   table {
		width: 100%;
		border-collapse: collapse;
	}
	
   tbody > tr > td {
      font-size: 14px;
       color: #666666;
       text-align: left;
       /* padding: 10px 10px 10px 10px; */
       border-bottom: 1px solid #dddddd;
       line-height: 1.8;
   
   }
   
   table.type05 {
       width: 1000px;
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
   
   #comment {
      padding: 10px;
      background-color: #f2f2f2;
      border-radius: 4px;
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
   }
   
   a.delete {
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
    
   .btnComment {
   		background-color: #efefef;
        cursor: pointer;   
      	border: 1px solid #dddddd;       
      	padding: 0.25em .75em;    
      	border-radius: .25em;       
      	font-weight: 500;
      	font-size: 10pt;  
   }
    
   .long {
   	  width: 600px;
    } 
   
</style>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>


	<div class="container">

        <h1><strong>문의내역</strong></h1>

                <table>
                    <thead>
                        <tr>
                           <th>
                           <table class="type05" style= " margin: 0 auto;">
	                           <tbody>
		                           <tr>
		                             <th scope="row" style="border: none;">제목 </th>
		                             <td style="border: none;">
		                               	${qnavo.subject}
		                           	 </td>
		                           </tr>
		                           <tr>
		                             <th scope="row" style="border: none;">작성자 </th>
		                             <td style="border: none;">
		                                 ${qnavo.userid}
		                           	 </td>
		                           </tr>
		                           <tr>
		                             <th scope="row" style="border: none;">작성일 </th>
		                             <td style="border: none;">
		                               	${qnavo.regDate}
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
				                 ${qnavo.content}<br/><br/><br/><br/><br/>
                               <div id="comment">
                                  	<span id="commentDisplay"></span>
                               </div>
                            </td>
                        </tr>
                    </tbody>
                </table>

                
				<br/>	
				
                <form name="addWriteFrm" style="margin-top: 20px;">
					댓글 : <input type="text" name="content" class="long" id="commentContent" />
					<button id="btnComment" type="button" onclick="goAddWrite()">확인</button>
					<input type="hidden" name="parentSeq" value="${qnaSeq}" />
				</form>
				
				<p id="listBtn"><a href="qnaMng.sd" class="notice_view">목록</a></p>
				
                <table>
                        <tr>
                            <th class="next_post th">윗글</th>
                            <td class="next_post postNotice titlePointer">${qnavo.previoussubject}</td>
                        </tr>
                        <tr>
                            <th class="pre_post th">아랫글</th>
                            <td class="pre_post preNotice titlePointer">${qnavo.nextsubject}</td>
                        </tr>
                </table>

                <br/><br/><br/>
	
	</div>

	
<script type="text/javascript">
	$(document).ready(function(){
		goReadComment();
	});
	
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
			data:{"parentSeq":"${qnavo.qnaSeq}"},
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