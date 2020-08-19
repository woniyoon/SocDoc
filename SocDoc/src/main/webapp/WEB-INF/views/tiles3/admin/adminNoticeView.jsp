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
	
	#noticeView {
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
      	margin: 30px 20px 50px 0px;
       	width: 84px;
       	height: 45px;
      	float: right;
       	text-align: center;
      	color: white;
       	font-size: 14px;
       	font-weight: bold;
      	line-height: 45px;
       	background: #157bb9;
      	border-radius: 3px;
      	cursor: pointer;
	} 
    
    p#deleteBtn {
		display: inline-block;
      	margin: 30px 20px 50px 0px;
       	width: 84px;
       	height: 45px;
      	float: right;
       	text-align: center;
      	color: white;
       	font-size: 14px;
       	font-weight: bold;
      	line-height: 45px;
       	background: #157bb9;
      	border-radius: 3px;
      	cursor: pointer;
	}
	
	a.notice_view {
	    display: inline-block;
       	width: 84px;
       	height: 45px;
      	float: left;
       	text-align: center;
      	color: white;
       	font-size: 14px;
       	font-weight: bold;
      	line-height: 45px;
       	background: #157bb9;
      	border-radius: 3px;
      	cursor: pointer;
	}
	
	a.delete {
		cursor: pointer;
	}
	
	.th {
		background: #e6f5ff;
	}
	
	.next_post {
		border-top: 1px solid gray;
		border-bottom: 1px solid #dddddd;
	}
	
	.pre_post {
		border-bottom: 1px solid gray;
	}
	
	.titlePointer:hover {
		cursor: pointer;
	}
	
	a {
      text-decoration: none;
    }
</style> 

	<div id="noticeView">
		    <h2 class="textPrimary">공지사항</h2>
			<section>
                <table>
                    <thead>
                        <tr>
                            <th>${noticevo.subject}</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td><p style="word-break: break-all;">${noticevo.content}</p></td>
                        </tr>
                    </tbody>
                </table>

           <%-- <p id="listBtn"><a href="#" onclick="javascript:location.href='${gobackURL}'" class="notice_view">목록</a></p> --%>
                <p id="listBtn"><a href="adminNoticeMng.sd" class="notice_view">목록</a></p>

                <p id="deleteBtn"><a href="#" class="notice_view">삭제</a></p>             

                <p id="modifyBtn"><a href="#" onclick="javascript:location.href='editNotice.sd?noticeSeq=${noticevo.noticeSeq}'" class="notice_view">수정</a></p>
                
                <div>
                    <table>
                        <tr>
                            <th class="next_post th">윗글</th>
                            <td class="next_post postNotice titlePointer">${noticevo.presubject}</td>
                        </tr>
                        <tr>
                            <th class="pre_post th">아랫글</th>
                            <td class="pre_post preNotice titlePointer">${noticevo.nextsubject}</td>
                        </tr>
                    </table>
                </div>

                <br/><br/><br/>

            </section>
	</div>   