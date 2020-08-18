<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	
	h2 {
		font-weight: bold;
		padding-top: 30px;
	}

	th {
		text-align: center;
	}
	
	#healthInfoView {
		width: 900px;
		margin-left: auto;
		margin-right: auto;
	}
    
    table {
		width: 100%;
		border-collapse: collapse;
	}
	
	thead > tr > th {
		font-size: 20px;
	    font-weight: bold;
	    color: #222222;
	    text-align: left;
	    padding: 20px 20px 20px 10px;
	    border-top: 1px solid #333333;
	    border-bottom: 1px solid #333333;
	}
	
	tbody > tr > td {
		font-size: 14px;
	    color: #666666;
	    text-align: left;
	    padding: 10px 10px 10px 10px;
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
		float: left;
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
	}
	
	a.delete {
		cursor: pointer;
	}
	
	.th {
		background: #f4f4f2;
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
</style> 

	<div id="healthInfoView">
		    <h2 class="textPrimary">건강정보관리</h2>
		    
			<section>
			
			<form name="deleteFrm">	
				<input type="hidden" name="infoSeq" class="infoSeq" value="${healthvo.infoSeq}" />
                <table>
                    <thead>
                        <tr>
							<th>${healthvo.subject}</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>${healthvo.content}<br/><img src="<%= request.getContextPath()%>/resources/files/${healthvo.imgName}" style="width: 200px; height: 200px;"/></td>
                        </tr>
                    </tbody>
                </table>
                
            </form>

                <p id="listBtn"><a href="healthInfoMng.sd" class="notice_view">목록</a></p>

                <p id="deleteBtn"><a class="notice_view">삭제</a></p>             

                <p id="modifyBtn"><a href="noticeList.sb" class="notice_view">수정</a></p>
                
                <div>
                    <table>
                        <tr>
                            <th class="next_post th">윗글</th>
                            <td class="next_post postNotice titlePointer">${healthvo.presubject}</td>
                        </tr>
                        <tr>
                            <th class="pre_post th">아랫글</th>
                            <td class="pre_post preNotice titlePointer">${healthvo.nextsubject}</td>
                        </tr>
                    </table>
                </div>

                <br/><br/><br/>

            </section>
	</div>   
	
	
<script type="text/javascript">
$(document).ready(function($){	

	$("#deleteBtn").click(function() {
		goDel();
	});
	
	
});	 // end of $(document).ready(function($){}) ----------------------------

function goDel() {
	<%-- 
	var con = confirm("삭제하시겠습니까?");
	
	if(con == true) {
        var frm = document.deleteFrm;
        frm.method = "POST";
        frm.action = "<%= request.getContextPath()%>/healthDel.sd"
        frm.submit();
     }
     else if(con == false){ 
        location.href="history.back()";
     }
     --%>
	
	var infoSeq = $(".infoSeq").val();
	//alert(notice_seq);
	
	var bool = confirm("글을 삭제하시겠습니까?");
	
	if(bool) {
		
		$.ajax({ 
			url: "/socdoc/healthDel.sd",
			type: "GET",
			data: {"infoSeq":infoSeq},
			dataType: "JSON",
			success:function(json){
				if(json.n == 1) {
					// alert("삭제성공!");
					location.href="healthInfoMng.sd"; // 페이지 넘어가기
				}
				
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
			
		}); 
	}
	else {
		alert("삭제 취소!");
	}
	
	
}
</script>