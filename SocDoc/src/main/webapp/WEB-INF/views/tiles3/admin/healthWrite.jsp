<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>
    
<style type="text/css" >

	.container { 
		width: 60%;
		margin: auto;
		padding: 0;
	}

	.textPrimary {
		margin-bottom: 50px;
	}
	
	h2 {
        font-weight: bold;
		padding-top: 30px;
	}

	th {
		text-align: center;
	}
	
    table {
      width: 100%;
      border-collapse: collapse;
   }
   
   #table th, #table td {
      padding: 5px;
   }
   
   #table th {
      width: 120px;
      background-color: #dddddd;
   }
   
   #table td {
      width: 860px;
      border: solid 1px #ccc;
   }
	
	div#notice_button_wrap {
		display: inline-block;
		width: 850px;	
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
	
	a.notice_write {
		display: inline-block;
	    font-size: 14px;
	    color: #fff;
	    text-align: center;
	    height: 45px;
	    line-height: 45px;
	    width: 100%;
	    text-decoration: none;
	}
	
	a.delete, a.create, a.list {
		cursor: pointer;
	}
    
	.th {
		font-size: 16px;
	    font-weight: bold;
	    color: #222222;
		background: #f4f4f2;
	}
	
	a {
      text-decoration: none;
    }
</style>


<div class="container">

	<header>
		<h2 class="textPrimary">건강정보 글쓰기</h2>
	</header>
			
	<form name="addFrm">
      <table id="table">
         <thead>
            <tr>
               <th>제목</th>
               <td>
                  <input type="text" id="subject" name="subject" class="input_title" style="width: 95%;" />
               </td>
            </tr>
         </thead>
            
         <tbody>
            <tr>
               <th>내용</th>
               <td>
                  <textarea rows="10" cols="100" style="width: 95%; height: 412px;" name="content" id="content"></textarea>
               </td>
            </tr>
            <tr>
               <th>파일첨부</th>
               <td>
                  <input type="file" name="attach" />   
               </td>
            </tr>
         </tbody>
      </table>
   </form>   
   
   <div id="notice_button_wrap">
		<p id="notice_button">
			<a type="button" id="btnNoticeSubmit" class="create notice_write">작성</a> 
		</p>
		<p id="notice_button">
			<a type="reset" class="delete notice_write">취소</a> 
		</p>
	</div>
</div>

