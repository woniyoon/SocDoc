<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">

	h2 {
		font-weight: bold;
		padding-top: 30px;
	}
	
    .searchWord {
        font-size: 12px;
        width: 150px;
        height: 10px;
        padding: 10px;
        border: solid 1.3px #1b5ac2;
        float: right;
        margin-left: 5px;
    }

    .searchBtn {
        width: 40px;
        height: 23px;
        border: 0px;
        float: right;
        color: #ffffff;
        background-color: #1b5ac2;
    }
	
    select {
        float: right;
		margin: 15px 10px 20px 0px;
	}
    
    table {
		width: 100%;
		border-collapse: collapse;
		margin-top: 25px;
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
	
	#hospitalList {
		width: 1000px;
		margin-left: auto;
		margin-right: auto;
	}
	
	#hospitalList:after {
		content: '';
		clear: both;
		display: block;
	}

	th {
		text-align: center;
	}

</style>


	<div id="container" style="min-height: 70vh;">
		
		<div id="hospitalList">
			<h2>병원회원관리</h2>
			 
            <button class="searchBtn">검색</button>
            <input type="text" class="searchWord" placeholder="검색어를 입력하세요">
            <select>
                <option selected="selected">아이디</option>
                <option>사업자번호</option>
                <option>담당자</option>
                <option>이메일</option>
                <option>병원명</option>
            </select>
            <p>전체 회원 수 : 2981명</p>	
			
			<table class="table table-hover" style="text-align: center;">
				<tr>
					<th>아이디</th>
					<th>사업자번호</th>
					<th>담당자</th>
					<th>이메일</th>
					<th>병원명</th>
					<th>가입일자</th>
					<th>등록</th>
				</tr>
				
				<tr>
					<td>hospital1</td>			
					<td>123456-78910</td>			
					<td>김관리</td>			
					<td>hoskim@gmail.com</td>			
					<td>강남병원</td>			
					<td>2020-07-31</td>			
					<td style="color:blue; font-weight:bold;">Y</td>			
				</tr>
               
                <tr>
					<td>hospital2</td>			
					<td>123456-78910</td>			
					<td>나관리</td>			
					<td>hoskim@gmail.com</td>	
					<td>종로병원</td>		
					<td>2020-07-31</td>			
					<td style="font-weight:bold;">N</td>			
				</tr>

			</table>
			
		</div>
		
	</div>