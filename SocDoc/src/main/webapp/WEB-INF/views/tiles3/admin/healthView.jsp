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

                <p id="listBtn"><a href="adminNotice.sd" class="notice_view">목록</a></p>

                <p id="deleteBtn"><a href="noticeList.sb" class="notice_view">삭제</a></p>             

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