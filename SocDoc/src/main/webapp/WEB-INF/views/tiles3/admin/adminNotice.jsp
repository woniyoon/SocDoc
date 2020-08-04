<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">

	.sideBar {
	  width: 160px;
	  font-weight: bold;
	  font-size: 12pt;
	  position: fixed;
	  z-index: 1;
	  top: 150px;
	  left: 10px;
	  background: #eee;
	  overflow-x: hidden;
	  padding: 8px 0;
	  margin: 50px 30px 0px 30px;
	}

	h2 {
		font-weight: bold;
		margin-bottom: 50px;
	}
    
    table {
		width: 100%;
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
    
    #noticeList {
		width: 1000px;
		margin-left: auto;
		margin-right: auto;
	}
	
	#noticeList:after {
		content: '';
		clear: both;
		display: block;
	}    
    
    #ckAll {
        float: left;
		margin-top: 30px;
    }

	#writeBtn {
		float: right;
		margin-top: 30px;
        margin-right: 20px;
	}
	
	#deleteBtn {
		float: right;
		margin-top: 30px;
	}
	
</style>



	<div id="container">

        <div id="noticeList">
           
            <h2>공지사항관리</h2>
            
            <p>전체 글 : 12개</p>
           
            <table class="table table-hover" style="text-align: center;">
                <thead>
                     <tr>
                        <th>선택</th>
                        <th>No.</th>
                        <th>제목</th>
                        <th>등록일</th>
                        <th>조회수</th>
                     </tr>
                </thead>

                <tbody>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td>1</td>
                        <td>시스템 점검 공지</td>
                        <td>2020.08.01</td>
                        <td>124</td>
                    </tr>
                </tbody>

            </table>
            <button id="ckAll">전체선택</button>
            <button id="deleteBtn">삭제</button>
            <button id="writeBtn">글쓰기</button>
            
        </div>

		
		<div class="sideBar w3-bar-block w3-light-grey w3-card">
		  <a href="#" class="w3-bar-item w3-button">회원관리</a>
		  <a href="#" class="w3-bar-item w3-button">병원회원관리</a>
		  <a href="#" class="w3-bar-item w3-button">병원등록</a>
		  <button class="w3-button w3-block w3-left-align" onclick="myAccFunc()">
		  	게시판관리 <i class="fa fa-caret-down"></i>
		  </button>
		  <div id="demoAcc" class="w3-hide w3-white w3-card">
		    <a href="#" class="w3-bar-item w3-button">공지사항</a>
		    <a href="#" class="w3-bar-item w3-button">건강정보관리</a>
		    <a href="#" class="w3-bar-item w3-button">후기관리</a>
		    <a href="#" class="w3-bar-item w3-button">문의관리</a>
		  </div>
		</div>
		
		
	
	</div>



<script type="text/javascript">

	function myAccFunc() {
	  var x = document.getElementById("demoAcc");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	    x.previousElementSibling.className += " w3-blue";
	  } else { 
	    x.className = x.className.replace(" w3-show", "");
	    x.previousElementSibling.className = 
	    x.previousElementSibling.className.replace(" w3-blue", "");
	  }
	}
	
	function myDropFunc() {
	  var x = document.getElementById("demoDrop");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	    x.previousElementSibling.className += " w3-blue";
	  } else { 
	    x.className = x.className.replace(" w3-show", "");
	    x.previousElementSibling.className = 
	    x.previousElementSibling.className.replace(" w3-blue", "");
	  }
	}
	
</script>    