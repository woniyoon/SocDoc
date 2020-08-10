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
                                  <strong>관리자 ｜ 2020.07.01</strong><br/>
                                  		비밀번호 설정은 마이페이지에서 가능합니다.<br/>
                                  		비밀번호를 잊으신 경우에는 고객센터로 연락 주시어 개인 정보가 포함된 자료를 송부하여 주시기 바랍니다.
                                  <br/>
                               </div>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <p id="listBtn"><a href="adminNotice.sd" class="notice_view">목록</a></p>

                <p id="deleteBtn"><a href="noticeList.sb" class="notice_view">삭제</a></p>             

                <p id="modifyBtn"><a href="noticeList.sb" class="notice_view">수정</a></p>
                
                <table>
                    <tr>
                        <th class="next_post th">윗글</th>
                        <!-- <td class="noticeNO" ></td>
                        <td class="noticeNO postrno" ></td> -->
                        <td class="next_post postNotice titlePointer">윗글 제목이 보일 예정</td>
                    </tr>
                    <tr>
                        <th class="pre_post th">아랫글</th>
                        <td class="pre_post preNotice titlePointer">아랫글 제목이 보일 예정</td>
                    </tr>
                </table>

                <br/><br/><br/>
	
	</div>
