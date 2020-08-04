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
	}
    
    p {
        margin-top: 30px;
    }
    
    .searchWord {
        font-size: 12px;
        width: 150px;
        height: 10px;
        padding: 10px;
        border: solid 1.3px #1b5ac2;
        float: right;
        margin-top: 15px;
        margin-left: 5px;
    }

    .searchBtn {
        width: 40px;
        height: 23px;
        border: 0px;
        margin-top: 15px;
        float: right;
        color: #ffffff;
        background-color: #1b5ac2;
    }
	
    select {
        float: right;
		margin: 15px 10px 20px 0px;
	}
    
	#memberList {
		width: 1000px;
		margin-left: auto;
		margin-right: auto;
	}
	
	#memberList:after {
		content: '';
		clear: both;
		display: block;
	}

	th {
		text-align: center;
	}

</style>


	<div id="container">
		
		<div id="memberList">
			<h2>회원관리</h2>
			 
            <button class="searchBtn">검색</button>
            <input type="text" class="searchWord" placeholder="검색어를 입력하세요">
            <select>
                <option selected="selected">아이디</option>
                <option>이름</option>
                <option>이메일</option>
                <option>전화번호</option>
            </select>
            <p>전체 회원 수 : 2981명</p>		
			
			<table class="table table-hover" style="text-align: center;">
				<tr>
					<th>선택</th>
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>가입일자</th>
					<th>상태</th>
				</tr>
				
				<tr>
					<td><input type="checkbox" /></td>		
					<td>hongs</td>			
					<td>홍길동</td>			
					<td>2020-08-01</td>
					<td>hong@naver.com</td>			
				    <td>010-2838-0212</td>
				    <td>2020-08-01</td>	
					<td style="font-weight:bold;">회원</td>	
				</tr>
                
                <tr>
					<td><input type="checkbox" /></td>		
					<td>nana</td>			
					<td>김나나</td>			
					<td>2020-07-31</td>
					<td>nana@naver.com</td>			
				    <td>010-1133-2566</td>
				    <td>2020-07-31</td>	
					<td style="color: red; font-weight:bold;">탈퇴</td>	
				</tr>
				
			</table>
			
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