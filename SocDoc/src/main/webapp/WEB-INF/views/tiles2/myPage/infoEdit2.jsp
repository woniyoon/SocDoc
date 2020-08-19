<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String ctxPath = request.getContextPath();
	// 	   /board
%>

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
        /* padding-left: 50px; */
    }

    #contents {
        flex: 4;
       /*  height: auto; */
       	margin: 0 30px;
		flex-direction: row;
        justify-content: space-around;
    }
    

    /*  main 끝  */
    footer {
        position: absolute;
        height: 5rem;
        width: 100vw;
        background-color: rgb(241, 241, 241);
    }
    
   /*  @media (max-width:1000px) {
		CSS 스타일 !
	
	} */
      
    /* 첫번째줄 셋팅- 예약확인 */
	div#box1 {
		width: 72%;
		/* margin: 0 auto; */
		height: 55px;
		margin-top: 20px;
		/* border: 1px solid gray; */
		text-align: center;
		margin-bottom: 30px;
	}
	
	/* 두번째줄 셋팅 */
	div#box2 {
		width: 70%;
		/* margin: 0 auto; */
		height: 150px;
		/* border: 2px solid gray;  */
		text-align: center;
	}
	
	/* 세번째줄 셋팅 */
	div#box3 {
		width: 70%;
		/* margin: 0 auto; */
		height: 170px;
		border: 2px solid gray; 
		text-align: center;
	}
	
	label {
		margin-bottom: 0;
	}
	
	/* 탭메뉴  */
	.tabmenu{ 
	  width: 100%; 
	  margin: 0 auto; 
	  position:relative; 
	  height: 55px;
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
	  color : white;
	}
	.tabmenu input:checked ~ .tabCon{
	  display:block;
	}
	
	/* 기본정보 변경 form */
	table.type05 {
		width: 100%;
	    border-collapse: separate;
	    border-spacing: 1px;
	    text-align: left;
	    line-height: 1.5;
	    border-top: 1px solid #ccc;
	}
	
	table.type05 th {
	    width: 20%;
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: middle;
	    border-bottom: 1px solid #ccc;
	    background: #f2f2f2;
	}
	
	table.type05 td {
	    width: 80%;
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	}
	
	.form-control-tel {
		width: 70px;
	}
	
	#infoChange {
		width: 69%;
	}
	
	
</style>


<script type="text/javascript">


<%-- var loginuser = "${sessionScope.loginuser}";
var gobackURL = "${requestScope.gobackURL}";

if(loginuser != null && (gobackURL != null && gobackURL != "")) {
	alert("${sessionScope.loginuser.name}님 로그인 성공했습니다.");
	location.href="<%= ctxPath%>/"+gobackURL;
}
else if(loginuser != null && (gobackURL == null || gobackURL == "")) {
	alert("${sessionScope.loginuser.name}님 로그인 성공했습니다.");
	location.href="<%= ctxPath%>/index.action";
} --%>


	//아이디 정규표현식 성공 여부	
	var hpEmailOK = false;
	// 이메일 인증 성공 여부
	var hpCertification = false;

	$(document).ready(function(){
		
		$("#box2").hide();
		$("#box3").hide();
		
		$("#Error").hide();
		$("#Success").hide();
		$("#btnAut").hide();
		
		$("#hpDivBtnFind").hide();
		$("#hpEmail2").hide();
		$("#hpBtnFind2").hide();
		$("#hpBtnFind3").hide();
		
		$("#btnChgPwd2").hide();
		
		var phoneAll = $("#phone").val();
		var phone = phoneAll.split("-");
		
		/*
		console.log(phone[0]); //결과 010
		console.log(phone[1]); //결과 2943
		console.log(phone[2]); //결과 3235
		*/

		var hp1 = phone[0];
		var hp2 = phone[1];
		var hp3 = phone[2];
		
		/* console.log(hp3); //결과 3235
		
		$("#hp1").val(hp1);
		$("#hp1 > option[@value=hp1]").attr("selected", "true");
		
		var hp2 = $("input[id='hp2']").val();
		$("#hp3").val(hp3);
		
		var frm = document.writeFrm;
		frm.hp3.value=hp3; */

		
		$("#hp1").change(function(){
			hp1 = $(this).val();
			var hp1 = $('input[name=hp1]').val();
		});
		
		///////////////////////////////////////////// phone 자동 - 붙이기
		var autoHypenPhone = function(str){
		      str = str.replace(/[^0-9]/g, '');
		      var tmp = '';
		      if( str.length < 4){
		          return str;
		      }else if(str.length < 7){
		          tmp += str.substr(0, 3);
		          tmp += '-';
		          tmp += str.substr(3);
		          return tmp;
		      }else if(str.length < 11){
		          tmp += str.substr(0, 3);
		          tmp += '-';
		          tmp += str.substr(3, 3);
		          tmp += '-';
		          tmp += str.substr(6);
		          return tmp;
		      }else{              
		          tmp += str.substr(0, 3);
		          tmp += '-';
		          tmp += str.substr(3, 4);
		          tmp += '-';
		          tmp += str.substr(7);
		          return tmp;
		      }
		  
		      return str;
		}
		
		
		var phoneNum = document.getElementById('phone');

		phoneNum.onkeyup = function(){
		  console.log(this.value);
		  this.value = autoHypenPhone( this.value ) ;  
		}
		
		/////////////////////////////////////////////////////////////
		
		getAge();
		
		///////////////////////////////////////////////////////////////
		

		$("form[name=writeFrm] #email").keyup(function(){
			
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ).trim() ); // 한글 막기
			if($("form[name=writeFrm] input#email").val().trim() == "") {	// 데이터가 없다면
				$("#Success").hide();
				$("#Error").show();
			} else {	// 데이터가 있다면
				// 정규표현식
				var email = $("form[name=writeFrm] #email").val();
				var regExp_EMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				var bool = regExp_EMAIL.test(email); // 생성된 정규표현식 객체속에 데이터를 넣어서 검사하기
				
				if(!bool) {  // 데이터가 조건에 맞지않으면
					$("#Success").hide();
					$("#Error").html("이메일 형식에 맞게 입력해주세요.").show();
					hpCondition5 = false;
					return;
				} else {	// 데이터가 조건에 맞다면
					hpCondition5 = true;
					
					$.ajax({
						url:"<%=ctxPath%>/hpEmailChk.sd",
						type:"POST",
						data:{"email":$("form[name=writeFrm] #email").val()},
						dataType:"json",
						success:function(json){
							if(json.isUse) {	// X 데이터가 중복된다면 X false
								$("#Success").html($("form[name=writeFrm] #email").val()+"은(는) 이미 사용 중이거나, 탈퇴한 이메일로 사용 불가능합니다.").show();
								$("#Success").hide();
							} else {	// O 데이터가 중복되지않는다면 O true
								if(hpCondition5 == true) {	// 정규표현식이 맞다면
									$("#Success").html("사용 가능한 이메일 입니다.").show();
									$("#Error").hide();
									hpEmailOK = true;
								}
							}
						},
						error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
						}
					});
				}
				$("#Error").hide();
				$("#btnAut").show();
				$(":input").prop("disabled",false).removeClass("wrong"); 
				return;
			}
		}); 
		 
		
		
		
		var method = "${method}";
		var email = "${email}";
		if(method=="POST") {
			$("form[name=writeFrm] #email").val(email);
			$("form[name=writeFrm] #hpDivBtnFind").hide();
		} else {
			$("form[name=writeFrm] #hpDivBtnFind").show();
		}
		
		// ------------ 비밀번호 ------------ // 
		
		$("#pwdError").hide();
		$("#pwdSuccess").hide();
		$("#pwdError2").hide();
		$("#pwdSuccess2").hide();
		

		$("#pwd").blur(function(){
			
			var data = $("#pwd").val().trim();
			
			if(data == "") {
				// 입력하지 않거나 공백만 입력했을 경우
				$("#pwdSuccess").hide();
				$("#pwdError").show();
			}

			else{
				// 공백이 아닌 글자를 입력했을 경우
				
				// 비밀번호 정규식 : 숫자,영문자,특수문자가 포함된 형태의 8~15글자 이내로 입력하세요.
				var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;	//  8~15자리 이하의 숫자,문자,특수문자 조합 
				var bool = regExp.test($(this).val()); 

				if(!bool) { 
					// 조건에 맞지않으면
					$("#pwdSuccess").hide();
					$("#pwdError").html("숫자,문자,특수문자 조합으로 8~15자리만 입력 가능합니다.").show();
					return;
				} 
				
				$("#pwdError").hide();
		
				
				
				$("#pwd2").blur(function(){
					var passwd = $("#pwd").val();
					var passwdCheck = $(this).val();
					
					if(passwd != passwdCheck) { // 암호와 암호확인값이 틀린 경우 
						$("#pwdError2").show();
					}
					else { // 암호와 암호확인값이 같은 경우 
						$("#pwdError2").hide();
					}
			
		});// end of $("#pwdcheck").blur()--------------
	}
			
}); // end of $("#password").blur(function()------------------------	 
		
		
		
		
		
	});////////////////////////////////////////////////////////////////////////
	
	function changePWD() {
		
		$("#infoChange").hide();
		$("#box2").show();
		$("#box3").show();
		$("#btnChgPwd").show();
		$("#btnChgPwd2").show();
		
		$("#btnChgPwd2").click(function(){
			
			goUpdatePwd();
	
		});
		
	}
	
	function changeInfo() {
		
		$("#infoChange").show();
		$("#box2").hide();
		$("#box3").hide();
		$("#btnChgPwd").hide();
	}
	
	
	function getAge() {
	       // 입력값 얻어오기
	       var birthDate = document.getElementById('birthDate').value.split("-");
	      
	       // 날짜 오브젝트 작성
	       var d1 = new Date(birthDate[0],birthDate[1]-1,birthDate[2]);
	       //월은 0부터 시작하므로
	       // 1970년 1월 1일부터 birthday로 지정한 시간까지의 경과 시간을 ms단위로 계산
	       var d2 = new Date();
	       // 1970년 1월 1일부터 지금까지의 시간을 ms 단위로 계산
	      
	       // 일수, 연령 계산
	       var diff = d2.getTime() - d1.getTime();
	       var daysPast = Math.floor(diff / (1000 * 60 * 60 * 24));
	       var age = Math.floor(daysPast / 365.25)+1;
	      
	       
	       //결과 표시
	      document.getElementById( "age").innerHTML = age;
	}
	
	function goAuthentication() {
		
		// $("#btnAut").hide();
		
		if(hpEmailOK == true){
			$("#hpDivBtnFind").show();
			$("#hpEmail2").show();
			$("#hpBtnFind2").show();
			$("#hpEmailCkError").hide();
			$("#hpEmailCkSuccess").hide();
			$("#hpBtnFind3").hide();
			disabled = false;
			$("#hpEmail2").val(''); // 입력칸 비우기
				
			$.ajax({	
				url:"<%= ctxPath%>/hpEmailCode2.sd",
				type:"POST",
				data:{"email":$("form[name=writeFrm] #email").val().trim()},
				dataType:"json",
				success:function(json){
					//console.log(json.isSent);
					console.log("!!!!!!!!!!!!!!!!!!!!발송성공!!!!!!!!!!!!!!!!!!!!");
					alert("입력하신 이메일("+$("form[name=writeFrm] #email").val()+")로 인증번호가 발송되었습니다.\n전달받은 인증번호를 입력해주세요");					
					var btnChange = true;
					if(btnChange == true){
						$("#hpBtnFind").hide();
						$("#hpBtnFindNext").show();
					} 
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					$("input#email").addClass("wrong");
					$("#Error").html("메일발송이 실패했습니다. 다시 시도해주세요.").show();
				}
			}); 
		} else {
			alert('잘못된 이메일 주소입니다. 이메일 주소를 정확하게 입력해주세요.');
			$("form[name=writeFrm] #email").focus();
		}	
		
	} 
	
	function goFinal(userCertificationCode) {
		
		disabled=false; // 버튼 비활성화
			
		$.ajax({	
			url:"<%= ctxPath%>/verifyCertificationFrm2.sd",
			type:"POST",
			data:{"userCertificationCode" : $("#hpEmail2").val().trim()},
			dataType:"json",
			success:function(json){
				//console.log(json.isbool)
				if(json.isbool){
					console.log("!!!메일인증성공!!!");
					hpCertification = true;
					$("#Success2").html("인증 성공. 회원가입을 진행하세요.").show();
					$("#Success2").hide();
					$("#Error2").hide();
					$("#hpBtnFind2").hide();
					$("#hpBtnFind3").show();
					$("#hpBtnFind3").click(function(){ // 인증성공 후 '인증확인' 버튼 재클릭 시 막아버리기
						disabled = 'disabled';
						alert("인증이 이미 완료되었습니다. 다음 단계로 넘어가세요");
					});
				}else{
					console.log("!!!메일인증실패!!!");
					$("#Error2").html("인증 실패. 다시 시도해주세요.").show();
					hpCertification = false;
				}
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		}); 
	
	}

	
	function goStore() {
		
		var emailInput = $("#email").val();
		var emailOrigin = $("#emailOrigin").val();		
		
		//console.log(emailInput);
		//console.log(emailOrigin);
		
		
		if(emailInput != emailOrigin) {
			
			var userCertificationCode = $("#hpEmail2").val().trim();
			
			console.log(userCertificationCode);
			
			if(userCertificationCode == "" || userCertificationCode == null) {
				alert("이메일 인증이 필요합니다.");
			} 
			
			
		}
		
		var frm = document.writeFrm;
		frm.method = "POST";
		frm.action = "infoStore.sd";
		frm.submit(); 
	}
	
	
	function goUpdatePwd() {
		
		var form = document.updatePWDfrm;
		form.action = "<%=ctxPath%>/goUpdatePwd.sd";
		document.updatePWDfrm.submit(); 
		
	} 
	
</script>
</head>
<body>
   <%--  <header>
        <img id="logo" src="<%= ctxPath%>/resources/images/logo.jpg" width=80px height=80px />
        <ul class="headerMenu">
            <li><a>찾기</a></li>
            <li><a>예약</a></li>
            <li><a>후기</a></li>
            <li><a>알림소식</a></li>
        </ul>
    </header> --%>
    <main>
        <div id="sideMenu">
            <ul style="margin-left: 50px;">
            	<li><h3 style="font-weight: bolder; color: #4e4e4b;">관련 콘텐츠</h3></li>
                <li><a style="color: #157bb9; font-weight: bolder;" href="<%= request.getContextPath()%>/infoEdit.sd">· 회원정보수정</a></li>
                <li><a href="<%= request.getContextPath()%>/askList.sd">· 문의내역</a></li>
                <li><a href="<%= request.getContextPath()%>/myHealth.sd">· 내 건강</a></li>
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
		<h1 style="text-align: left;"><strong>회원정보수정</strong></h1>
		<div id="box1">
			<div class="tabmenu">
			  	<ul>
				    <li id="tab1" class="btnCon" onclick="changeInfo()"> <input type="radio" checked name="tabmenu"  id="tabmenu1">
				      <label for="tabmenu1">기본정보 변경</label>
				      <!-- <div class="tabCon" >내용</div> -->
				    </li>
				    <li id="tab2" class="btnCon" onclick="changePWD()"><input type="radio" name="tabmenu" id="tabmenu2">
				      <label for="tabmenu2">비밀번호 변경</label>
				      <!-- <div class="tabCon" >내용</div> -->
				    </li>    
			    </ul>
		    </div>
	    </div>
	    
	    <!-- 기본정보 변경 form시작 -->
	    <div id="infoChange">
		<form name="writeFrm" >
			<table class="type05" style="border-top: solid 1px black; margin: 0 auto;">
				<tbody>
				<tr>
			        <th scope="row">아이디 </th>
			        <td>
					    ${loginuser.userid}
					</td>
			    </tr>
			    <tr>
			        <th scope="row">성명 </th>
			        <td>
					      ${loginuser.name}
					</td>
			    </tr>
			    <tr>
			        <th scope="row">성별 </th>
			        <td>
					   ${loginuser.gender}
					</td>
		        </tr>
		        <tr>
			        <th scope="row">생년월일 </th>
			        <td>
			        	${loginuser.birthDate}
					</td>
				</tr>	
				<tr>
					<th scope="row">나이</th> 
					<td>
						<span id="age" style="width: 50px;"></span>세
					</td>
				</tr>			
			    <tr>
			        <th scope="row">연락처</th>
			        <td>
						<!-- <select class="form-control-tel" id="hp1" name="hp1">
					      	<option>010</option>
					        <option>011</option>
					        <option>016</option>
					        <option>017</option>
					        <option>018</option>
					        <option>019</option>
					    </select> - <input class="form-control-tel" id="hp2" name="hp2" type="text" maxlength="4" /> - <input class="form-control-tel" id="hp3" name="hp3" type="text" maxlength="4" value=""/> -->
						<input style="width: 120px; height: 28px; padding-left: 5px;" class="form-control-tel" id="phone" name="phone" type="text" value="${loginuser.phone}" /> 
					</td>
			    </tr>
			    <tr>
			        <th scope="row">이메일</th>
			        <td>
						<!-- <input type="text" style="width: 100px; height: 20px;"/> @
						<select style="width: 180px; height: 25px;">
							<option>이메일 선택</option>
					      	<option>hanmail.net</option>
					        <option>naver.com</option>
					        <option>gmail.com</option>
					        <option>nate.com</option>
					        <option value="">직접입력</option>
					    </select><button type="button" style="margin-left:10px; background-color: skyblue; color:white; width: 40px; height: 25px; border-radius: 4px; border: none; font-size: 10pt;">인증</button>
					 -->
					 <input style="width: 260px; height: 28px; padding-left: 5px; margin-bottom:10px; margin-top:10px;" class="form-control-tel" id="email" name="email" type="text" value="${loginuser.email}" /> 
					 <span id="Error" style="color: red; margin-left:10px;">이메일 형식에 맞지 않습니다.</span>
					 <span id="Success" style="color: blue; margin-left:10px;">사용 가능한 이메일 입니다.</span>
					 <button type="button" id="btnAut" style="margin-left:10px; margin-bottom:10px; background-color: #157bb9; color:white; width: 40px; height: 25px; border-radius: 4px; border: none; font-size: 10pt;" onclick="goAuthentication()">인증</button>
			    	 <div id="hpDivBtnFind" style="width:100%;">
			    	 		 <input style="width: 260px; height: 28px; padding-left: 5px; margin-bottom:10px;" class="hpRequiredInfo" name="hpEmail2" id="hpEmail2" type="text" maxlength="7" placeholder="E-mail로 발송된 인증번호를 입력하세요"/>
							<button type="button" id="hpBtnFind2" disabled="disabled" style="margin-left:10px; background-color: #157bb9; color:white; width: 90px; height: 25px; border-radius: 4px; border: none; font-size: 10pt;" onclick="goFinal()">인증확인하기</button>
							<button type="button" id="hpBtnFind3" class="finish"  style="margin-left:10px; background-color: #157bb9; color:white; width: 90px; height: 25px; border-radius: 4px; border: none; font-size: 10pt;">인증완료</button>
							
					</div>
					<span id="Error2" ></span> 
					<span id="Success2"></span>
			    </tr>
			    </tbody>
			</table>
		  <input type="hidden" id="birthDate" name="birthDate" value="${loginuser.birthDate}">
		  <input type="hidden" id="emailOrigin" name="emailOrigin" value="${loginuser.email}">
		  <input type="hidden" name="userCertificationCode" />
		  <input type="hidden" id="pwdHidden" name="pwd" value="${loginuser.pwd}">
	  </form>
	  		<div style="text-align:right; margin-top: 30px; width: 100%;"><button type="button" style="background-color: #157bb9; color:white; width: 50px; height: 30px; border-radius: 4px; border: none; font-size: 10pt;" onclick="goStore()">저장</button></div>
        </div>
	  
   <!-- 기본정보 변경 form끝 -->
   
    <!-- 비밀번호 변경탭 시작-->
		<div id="box2" style="margin-top:15px;  border-left: none; border-right: none;">
			<img id="findPW" src="<%= ctxPath%>/resources/images/findPW.png" style="margin-top:10px;" width=50px height=60px/>
			<h2 style="margin: 0;">비밀번호 변경</h2>
			<p style="margin-top: 10px;">회원님의 소중한 개인정보의 보호를 위하여 비밀번호를 한번 더 입력하여 주시기 바랍니다.</p>
			<span style="margin-top: 10px; color: red;"  class="error" id="pwdError" >비밀번호를 입력하세요.</span>
			<span style="margin-top: 10px; color: blue;"  class="success" id="pwdSuccess">사용 가능한 비밀번호 입니다.</span> 
			<span style="margin-top: 10px; color: red;" class="error" id="pwdError2">동일한 비밀번호를 입력하세요.</span>
		    <span style="margin-top: 10px; color: blue;" class="success" id="pwdSuccess2">비밀번호가 일치합니다.</span> 
		</div> 
		<form name="updatePWDfrm">
		<div id="box3" style="margin-top:35px;  border-left: none; border-right: none;">
			<span style="font-size: 15pt;">새 비밀번호<input type="password" name="pwd" id="pwd" style="margin-left: 72px; margin-top: 30px; width: 320px; height: 40px;" placeholder="대소문자, 특수문자 조합하여 8자 이상"/></span><br/>
		
			<br/>
			<span style="font-size: 15pt;">새 비밀번호 확인<input type="password" name="pwd2" id="pwd2" style="margin-left: 30px; margin-top: 10px; width: 320px; height: 40px;" placeholder="대소문자, 특수문자 조합하여 8자 이상"/></span><br/>
			
		</div>
		
		<div id="btnChgPwd" style="text-align:right; margin-top: 30px; width: 70%;"><button type="button" id="btnChgPwd2" style="background-color: #157bb9; color:white; width: 50px; height: 30px; border-radius: 4px; border: none; font-size: 10pt;" >저장</button></div>
		</form>
	<!-- 비밀번호 변경탭 끝-->
	    
		
        </div>
        
        
     <form name="verifyCertificationFrm2">
			<input type="hidden" name="userid" />
			<input type="hidden" id="userCertificationCode"  name="userCertificationCode" />
	</form>
	<form name="hpVerifyCertificationFrm">
		<input type="hidden" name="hpUserid" />
		<input type="hidden" name="hpUserCertificationCode" />
	</form>   
    </body>
 </html>