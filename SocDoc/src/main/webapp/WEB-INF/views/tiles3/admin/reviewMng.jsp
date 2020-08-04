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

	th {
		text-align: center;
	}
	
	#reviewList {
		width: 1000px;
		margin-left: auto;
		margin-right: auto;
	}
	
	#reviewList:after {
		content: '';
		clear: both;
		display: block;
	}
	
    #ckAll {
        float: left;
		margin-top: 30px;
    }
	
	#deleteBtn {
		float: right;
		margin-top: 30px;
	}	

</style>

	<div id="container" style="min-height: 70vh;">
		
		<div id="reviewList">
			<h2>후기관리</h2>
				
           <button class="searchBtn">검색</button>
            <input type="text" class="searchWord" placeholder="검색어를 입력하세요">
            <select>
                <option selected="selected">기관명</option>
                <option>작성자</option>
            </select>
            <p>전체 회원 수 : 2981명</p>
			
			<table class="table table-hover" style="text-align: center;">
                <thead>
                     <tr>
                        <th>선택</th>
                        <th>기관명</th>
                        <th>내용</th>
                        <th>작성자</th>
                        <th>작성일</th>
                     </tr>
                </thead>

                <tbody>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td>어쩌고병원</td>
                        <td>최고의 병원 추천합니다.</td>
                        <td>김나나</td>
                        <td>2020.08.04</td>
                    </tr>

                </tbody>

            </table>
            
            <button id="ckAll">전체선택</button>
            <button id="deleteBtn">삭제</button>
            
		</div>
	
	</div>