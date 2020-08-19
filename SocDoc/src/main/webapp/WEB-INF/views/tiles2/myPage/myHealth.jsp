<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Page Title</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" media="screen" href="main.css" />
<script src="main.js"></script>
<style>

    body {
        /* height: auto; */
        margin: 0 auto;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        /* border: 1px solid pink; */
        /* min-height: 100vh; */
    }

    header {
        position: sticky;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 10px 0;
        width: 100vw;
        background-color: white;
        box-shadow: 2px 2px 2px 0 #b6b6b65a, 0 2px 2px 0 rgba(155, 155, 155, 0.337);
    }

    .headerMenu {
        width: 80vw;
        display: flex;
        flex-direction: row;
        justify-content: space-around;
        padding: 0;
    }

    /*  header 끝  */

    ul {
        list-style-type: none;
    }

    main {
        padding: 30px auto;
        margin: 0 auto;
        width: 90vw;
        min-height: 75vh;
        height: auto;
        display: flex;
        flex-direction: row;
    }

    #sideMenu {
        flex: 1;
        /* border: 1px solid navy; */
    }

    #contents {
        flex: 4;
       /*  height: auto; */
		flex-direction: row;
        justify-content: space-around;
        margin: 0 30px;
    }

    /*  main 끝  */
    footer {
        position: absolute;
        height: 5rem;
        width: 100vw;
        background-color: rgb(241, 241, 241);
    }
    
    @media (max-width:1000px) {
		CSS 스타일 !
	
	}
      
    /* 첫번째줄 셋팅- 예약확인 */
	div#box1 {
		width: 75%;
		margin: 0 auto;
		height: 55px;
		margin-top: 20px;
		/* border: 1px solid gray; */
		text-align: center;
	}
	
	/* 두번째줄 셋팅 */
	div#box2 {
		width: 70%;
		margin: 0 auto;
		height: 150px;
		/* border: 2px solid gray;  */
		text-align: center;
	}
	
	/* 세번째줄 셋팅 */
	div#box3 {
		width: 70%;
		margin: 0 auto;
		height: 230px;
		border: 2px solid gray; 
		text-align: center;
	}
	
	
	/* 탭메뉴  */
	.tabmenu{ 
	  width: 100%; 
	  margin: 0 auto; 
	  position:relative; 
	}
	.tabmenu ul li{
	  display:  inline-block;
	  width:48%; 
	  float:left;  
	  text-align:center; 
	  background: white;
	  line-height:40px;
	  border : 1px solid gray;
	}
	.tabmenu label{
	  display:block;
	  width:100%; 
	  height:55px;
	  line-height:50px;
	}
	.tabmenu input{display:none;}
	.tabCon{
	  display:none; 
	  text-align:left; 
	  padding: 20px;
	  position:absolute; 
	  left:0; top:40px; 
	  box-sizing: border-box; 
	  
	}
	.tabmenu input:checked ~ label{
	  background: #157bb9;
	}
	.tabmenu input:checked ~ .tabCon{
	  display:block;
	}
	
	/* 기본정보 변경 form */
	table.type05 {
		width: 70%;
	    border-collapse: separate;
	    border-spacing: 1px;
	    text-align: left;
	    line-height: 1.5;
	    border-top: 1px solid #ccc;
	}
	
	table.type05 th {
	    width: 20%;
	    height: 60px;
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: middle;
	    border-bottom: 1px solid #ccc;
	   /*  background: #f2f2f2; */
	}
	
	table.type05 td {
	    width: 80%;
	    height: 60px;
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	}
	
	.form-control-tel {
		width: 70px;
	}
	
	.textIpt {
		width: 400px;
	}
	
	input {
		line-height: 2;
	}
	

</style>
</head>

<script type="text/javascript" src="/StarbucksWeb/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/StarbucksWeb/util/myutil.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		
		bloodType = $("#blood").val();
		$("#bloodType").val(bloodType);
		$("#bloodType > option[@value=bloodType]").attr("selected", "true");
		
		$("#bloodType").change(function(){
			bloodType = $(this).val();
			var bloodType = $('input[name=bloodType]').val();
		});
		
	});
	
	function goStore() {
	    var frm = document.healthFrm;
	    frm.method = "GET";
	    frm.action = "<%= request.getContextPath()%>/addHealth.sd";
	    frm.submit();
	  }// end of function goSearch()-------------------------

    function godelHealth() {
	    var frm = document.healthFrm;
	    frm.method = "GET";
	    frm.action = "<%= request.getContextPath()%>/delHealth.sd";
	    frm.submit();
	  }// end of function goSearch()-------------------------  
	  
</script>

<body>
	<main>
        <div id="sideMenu">
            <ul style="margin-left: 50px;">
            	<li><h3 style="font-weight: bolder; color: #4e4e4b;">관련 콘텐츠</h3></li>
                <li><a href="<%= request.getContextPath()%>/infoEdit.sd">· 회원정보수정</a></li>
                <li><a href="<%= request.getContextPath()%>/askList.sd">· 문의내역</a></li>
                <li><a style="color: #157bb9; font-weight: bolder;" href="<%= request.getContextPath()%>/myHealth.sd">· 내 건강</a></li>
                <li><a href="<%= request.getContextPath()%>/bookMark.sd">· 병원 즐겨찾기</a></li>
                <li><a href="<%= request.getContextPath()%>/reservation.sd">· 예약확인</a></li>
                <li><a href="<%= request.getContextPath()%>/viewHistory.sd">· 최근 진료이력조회</a></li>
           		<li><a href="<%= request.getContextPath()%>/review.sd">· 내 후기</a></li>
            </ul>
            <ul style="display:inline-block; margin-top: 20px; margin-left: 50px; font-size: 14pt; color:#157bb9;">
               <li><h3 style="font-weight: bolder; color: #4e4e4b;">자주 찾는 서비스</h3></li>
                <li><a href="<%= request.getContextPath()%>/faq.sd" style="color: #157bb9; cursor: pointer;">FAQ</a>&nbsp;&nbsp;&nbsp;<a href="<%= request.getContextPath()%>/searchHospital.sd" style="cursor: pointer; color: #157bb9;">병원찾기</a></li>
                <li><a style="color: #157bb9; cursor: pointer;" href="<%= request.getContextPath()%>/myHealth.sd">내 건강</a></li>
            </ul>
        </div>
        <div id="contents">
		<h1 style="text-align: left;"><strong>내 건강</strong></h1>
		
	    
	    <!-- 기본정보 변경 form시작 -->
		<form name="healthFrm" >
			<table class="type05" style="border-top: solid 1px black; margin-top: 20px;">
				<tbody>
			    <tr>
			        <th scope="row">키</th>
			        <td>
					    <input class="form-control-tel" name="height" type="text" value="${membervo.height}" /> cm
					</td>
			    </tr>
			    <tr>
			        <th scope="row">몸무게</th>
			        <td>
					    <input class="form-control-tel" name="weight" type="text" value="${membervo.weight}"/> kg
					</td>
			    </tr>
			    <tr>
			        <th scope="row">혈액형</th>
			        <td>
						<select class="form-control-tel" id="bloodType" name="bloodType" style="height: 35px;" >
					      	<option value="O">O형</option>
					        <option value="A">A형</option>
					        <option value="AB">AB형</option>
					        <option value="B">B형</option>
					    </select>
					</td> 
			    </tr>
			    <tr>
			        <th scope="row">알레르기</th>
			        <td> 
					    <input class="textIpt" name="allergy" type="text" placeholder="내용을 입력해주세요" value="${membervo.allergy}"/>
					</td>
			    </tr>
			    <tr>
			        <th scope="row">병력</th>
			        <td>
					    <input class="textIpt" name="history" type="text" placeholder="내용을 입력해주세요" value="${membervo.history}"/>
					</td>
			    </tr>
			    <tr>
			        <th scope="row">복용약</th>
			        <td>
					    <input class="textIpt" name="medicine" type="text" placeholder="내용을 입력해주세요" value="${membervo.medicine}"/>
					</td>
			    </tr>
			    </tbody>
			</table>
		  	<input type="hidden" id="blood" value="${membervo.bloodType}"/>
	  </form>
   <!-- 기본정보 변경 form끝 -->
	    
		<div style="text-align:right; margin-top: 30px; width: 70%;">
		<button type="button" onclick="goStore();" style="background-color: #157bb9; color:white; width: 50px; height: 30px; border-radius: 4px; border: none; font-size: 10pt;">저장</button>
		<button type="button" onclick="godelHealth();" style="background-color: #157bb9; color:white; width: 50px; height: 30px; border-radius: 4px; border: none; font-size: 10pt;">초기화</button>
		</div>
        </div>
    </main>
    <footer>
    </footer>
</body>
</html>