<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        
<%	String ctxPath = request.getContextPath();%>   
<title>약국 상세</title>

<style>

	.container{
		width:1080px;
		margin: 10px auto;
	}
	
	.content{
		width:90%;
		margin:0px auto;
	}
	
	.pharmacyName{
		font-size : 15pt;
		font-weight: 900;
	}	
	
	
	.heart {
		display:inline-block;
		width: 100px;
		height: 100px;
		background: url("https://cssanimation.rocks/images/posts/steps/heart.png") no-repeat;
		background-position: 0 0;
		cursor: pointer;
		transition: background-position 1s steps(28);
		transition-duration: 0s;
		margin-left:-30px;
		margin-bottom: -40px;
	}
		
	.is-active {
		  transition-duration: 1s;
		  background-position: -2800px 0;
	}	
	
	.btns{
		float:right;
		margin-top:35px;
	}
	
	/* 
	
	.pharmacyRating{
		margin-left: 10px;
	} */
	
	.info{
		margin-top:10px;
		margin-bottom:20px;
	}
	
	
	.one {
		display:inline-block;
		width:55%;
		height:450px;
		padding-right:10px;		
	}
	
	.two{
		float:right;
		width:45%;
		height:450px;
	}
	
	
	.slide{
		width:100%;
		height:70%;
	}
	
	.pharmacyRatingStar {
		background: url('/socdoc/resources/images/icoReview.png') no-repeat right 0;
		background-size: auto 100%;
		width: 20px;
		height: 20px;
		display: inline-block;
		text-indent: -9999px;
		cursor: pointer;
		margin-bottom: 10px;
	}
	
	.pharmacyRatingNum{
		margin-left:10px;
		font-weight: bolder;
	}
	
	.guide{
		background-color: #f2f2f2;
		color: red;
		padding:15px 15px 8px 15px;
		width: 400px;
		height:50px;
		font-size: 9pt;
		width:100%;		
	}
	
	
	.infoTable{
		width:100%;
		font-size: 10pt;
 		height:100%;
  		border-collapse: collapse;		
	}
	
	.infoTable th, td{
		padding:10px !important;
		border-top: 1px solid #ddd;
		border-bottom: 1px solid #ddd;
	}
	
	.infoTable th{
		background-color: #f2f2f2;
		width:80px;
		height:25px;
	}
	
	.btnRegister{
		background-color: #3a68ec;
		color:#fff;
		cursor: pointer;	
		border: 1px solid #999999; 		
		padding: 0.25em .75em; 	
		border-radius: .25em; 		
		font-weight: bolder;
		font-size: 10pt;	
		float:right;
	}
	
	.reviewName{
		font-size: 13pt;
		font-weight: bolder;
	}
	
	.review{
		width:100%;
		height:70px;
		margin-bottom: 5px;
		border: 1px solid #999999; 	
		border-radius: .25em; 		
		font-size: 10pt;
		padding:5px;	
		resize: none;
	}
	
	.reviewContents{
		margin: 10px 0;
	}
	
	textarea:focus{
		outline: none; 
	}
	
	.reviewTableMe{
		width:100%;
		margin: 20px 0;
		font-size: 10pt;
	}
	
	.reviewTable{
		width:100%;
		margin: 20px 0;
		font-size: 10pt;
		border-collapse: collapse;
	}
	
	.reviewTable td{
		padding:15px;
	}
	
	
	.starRating{
		background: url('/socdoc/resources/images/starsYellow.png') no-repeat right 0;
		background-size: auto 100%;
		width: 10px;
		height: 10px;
		display: inline-block;
		text-indent: -9999px;
	}
	
	
	.name{
		margin-right: 10px;
		font-weight: bolder;
	}
	
	.registerDate{
		font-weight: bolder;
	}
	
	.reviewBtn{
		padding: 0.4em .75em; 
		background-color: #bfbfbf; 
		cursor: pointer; 
		border: 1px solid #999999; 
		border-radius: .25em; 
		font-size: 9pt;
		margin:2px 0;
	}
	
	
	.stars{
		background: url('/socdoc/resources/images/icoReview.png') no-repeat right 0;
		background-size: auto 100%;
		width: 15px;
		height: 15px;
		display: inline-block;
		text-indent: -9999px;
		cursor: pointer;
		margin-bottom: 10px;
	}
	
	.on{
		background-position:0 0;
	}	 
	
	
	 .page_wrap {
		text-align:center;
		font-size:0;
	}
	
	.page_nation {
		display:inline-block;
	}
	.page_nation .none {
		display:none;
	}
	.page_nation a {
		display:block;
		margin:0 3px;
		float:left;
		border:1px solid #e6e6e6;
		width:28px;
		height:28px;
		line-height:28px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}
	
	.page_nation .arrow {
		border:1px solid #ccc;
	}
	
	.page_nation .pprev {
		background:#f8f8f8 url('/socdoc/resources/images/page_pprev.png') no-repeat center center;
		margin-left:0;
	}
	
	.page_nation .prev {
		background:#f8f8f8 url('/socdoc/resources/images/page_prev.png') no-repeat center center;
		margin-right:7px;
	}
	
	.page_nation .next {
		background:#f8f8f8 url('/socdoc/resources/images/page_next.png') no-repeat center center;
		margin-left:7px;
	}
	
	.page_nation .nnext {
		background:#f8f8f8 url('/socdoc/resources/images/page_nnext.png') no-repeat center center;
		margin-left:7px;
	}
	
	.page_nation a.active {
		background-color:#42454c;
		color:#fff;
		border:1px solid #42454c;
	}
	
    .noReview {
		background: url('/socdoc/resources/images/noReview.png') no-repeat center ;
		background-size: auto; 
		width:100%;
		height:150px;
	}
	
	
	
	
			 
	
		

</style>


<script type="text/javascript">


var currentShowPageNo = 1;

$(document).ready(function(){

	readReview(currentShowPageNo);
	
	if('${loginuser}'.trim() != ''){
		readReviewMe();
	}

	$("#review").keyup(function(){
		cntReview = $("#review").val().length;
		$("#bytesReview").val('');
		$("#bytesReview").text(cntReview);		
		
		if(cntReview==0){
			$("#bytesReview").text('0');		
		}
		
	});
	
	

	
	//약국별점 
	$(".pharmacyRatingStar").each(function(){
		$("#pharmacyRatingStar"+"${pharmacyRating}").addClass("on").prevAll("span").addClass("on");
		return false;
	})
	
	
	//별점주기
	$('.stars').click(function(){
		  $(this).parent().children("span").removeClass("on");
		  $(this).addClass("on").prevAll("span").addClass("on");
		  
		  starsNum = $(".stars.on").length;
		  $(".starsNum").text(starsNum);
		  $("input[name='rating']").val(starsNum);
		  
		  return false;
	});
	
	
	/* 
	
	//별점주기
	$('.stars').click(function(){
		  $(this).parent().children("span").removeClass("on");
		  $(this).addClass("on").prevAll("span").addClass("on");
		  
		  starsNum = $(".stars.on").length;
		  $(".starsNum").text(starsNum);
		  $("input[name='rating']").val(starsNum);
		  
		  return false;
	});
	

	//약국별점 
	$(".pharmacyRatingStar").each(function(){
		$("#pharmacyRatingStar"+"${pharmacyRating}").addClass("on").prevAll("span").addClass("on");
		return false;
	})
	 */
})



//------------------------------------------------------------------
var reviewMe = 0;

function readReviewMe(){
	
	var htmlMe="";
	
	$.ajax({
		url:"<%= ctxPath%>/getPhReviewMe.sd",	
		data:{"pharmSeq":"${phDetail.pharmSeq}"},
		dataType:"JSON",
		success:function(json){
						
			if(json.content !=""){
				htmlMe+= '<tr><td style="background-color: #e6f5ff;;">'
					    +'	<div style="display:inline-block; width:90%;">'
						+'		<div>';
					
					for(var i=1; i<=5; i++) {
						if(i<=json.reviewRating) {
							htmlMe += '				<span class="starRating on" id="starRating'+i+'">별1</span>';								
						} else {
							htmlMe += '				<span class="starRating " id="starRating'+i+'">별2</span>';
						}
					}
				htmlMe+='		</div>'
						+'		<div class="reviewContents" id="reviewContentsMe">'+json.content+'</div>'
						+'		<span class="name">'+json.userid+'</span><span class="registerDate">'+json.regDate+'</span>'
						+'	</div>'
						+'	<div style="display:inline-block; width:8%; float:right;">'
						+'		<button type="button" id="delete" class="reviewBtn" onClick="goDelete()">삭제</button>'
						+'	</div>'
						+'</td></tr>';
				reviewMe = 1;		
			}else{
				htmlMe+= '<tr><td style="background-color: #e6f5ff;;">'
					    +'	<div style="width:100%;">'
						+'		<div class="noReview"></div>'
						+'	</div>'
						+'</td></tr>';
				reviewMe = 0;
			}
					
			$(".reviewTableMe").html(htmlMe);
			
			
		},error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	})
	
}


function readReview(currentShowPageNo){
	
	
	$.ajax({
		url:"<%= ctxPath%>/getPhReview.sd",	
		data:{"pharmSeq":"${phDetail.pharmSeq}","currentShowPageNo":currentShowPageNo},
		dataType:"JSON",
		success:function(json){
			
			var html="";
			
			if(json.length==0){
				html += '<tr><td style="text-align: center; padding:20px !important; font-weight: bolder;">등록된 후기가 없습니다.</td></tr>';
			}
			else if(json.length>0){
				$.each(json,function(index,item){
				
					html+='<tr><td>';
					html+='		<div style="display:inline-block; width:90%;">';
					html+='			<div>';
						
						for(var i=1; i<=5; i++) {
							if(i<=item.reviewRating) {
								html += '				<span class="starRating on" id="starRating'+i+'">별1</span>';								
							} else {
								html += '				<span class="starRating " id="starRating'+i+'">별2</span>';
							}
						}						
						
				 	html+='			</div>';
				 	html+='			<div class="reviewContents">'+item.content+'</div>';
				 	html+='				<span class="name">'+item.userid+'</span><span class="registerDate">'+item.regDate+'</span>';
				 	html+='			</div>';
				 	html+='</td></tr>';
					
				})
				
			}
			
			$(".reviewTable").html(html);
			// 페이지바
			makeReviewPageBar(currentShowPageNo);
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	
	
	})
	
}


function makeReviewPageBar(currentShowPageNo){
	$.ajax({
		url:"<%=request.getContextPath()%>/getReviewTotalPagePh.sd",
		data: {"pharmSeq":"${phDetail.pharmSeq}","sizePerPage":"5","currentShowPageNo":currentShowPageNo},
		dataType:"JSON" ,
		success:function(json){
			
			if(json.totalPage>0){
				var totalPage = json.totalPage;
	            var pageBarHTML = "";
				var blockSize = 2;
				var loop = 1;
								
				if(typeof currentShowPageNo =="string"){
					currentShowPageNo = Number(currentShowPageNo);
				}
				
				var pageNo = Math.floor((currentShowPageNo -1)/blockSize)*blockSize+1
				
			
				// === [이전] 만들기 ===
               if(pageNo != 1) {
            	  pageBarHTML += "<a class='arrow pprev' href='javascript:readReview(1)'></a>";
                  pageBarHTML += "<a class='arrow prev' href='javascript:readReview(\""+(pageNo-1)+"\")'></a>";
               }
               
               while (!(loop > blockSize || pageNo > json.totalPage )) {
            	   
                  if(pageNo == currentShowPageNo) {
                     pageBarHTML += "<a class='active'>" + pageNo + "</a>";
                  }
                  else {
                     pageBarHTML += "<a href='javascript:readReview(\""+pageNo+"\")'>"+pageNo+"</a>";
                  }                  
                  loop ++;
                  pageNo ++;                  
               } 
               
               // === [다음] 만들기 ===
               if( !(pageNo > totalPage) ) {               
                  pageBarHTML += "<a class='arrow next' href='javascript:readReview(\""+pageNo+"\")'></a>";  
                  pageBarHTML += "<a class='arrow nnext' href='javascript:readReview(\""+totalPage+"\")'></a>";  
               }
               
               $("#pageBar").html(pageBarHTML);
               pageBarHTML = "";
	                     
            } else{
				$("#pageBar").empty();
			}
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});
}


function goDelete(){
	
	if(confirm("후기를 삭제하시겠습니까?") == true){
		
		$.ajax({
			url:"<%=request.getContextPath()%>/reviewDeletePh.sd",
			data: {"userid":"${loginuser.userid}","pharmSeq":"${phDetail.pharmSeq}"},
			dataType:"JSON" ,
			success:function(json){
				alert('후기가 삭제되었습니다.');
				reviewMe=0;
				history.go(0);
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		})
		
    }
    else{
        return ;
    }

}


function goRegister(){
	
	var reviewContent = $('#review').val().trim();
	var rating = $("input[name='rating']").val();
	console.log('rating : '+rating);
	if(reviewContent=="") {
		alert("한 글자 이상 입력해주세요.");
		$('#review').focus();
		return;
	}else if(reviewMe==1){
		alert('후기는 한 약국당 하나만 등록할 수 있습니다. \n새 후기를 등록하고 싶거나 내용을 변경하고 싶으면 \n삭제 후 재등록 해주세요.');
		return;
	}else{
		$.ajax({
			url:"<%= request.getContextPath()%>/addReviewPh.sd",
			data:{"userid":"${loginuser.userid}","pharmSeq":"${phDetail.pharmSeq}","reviewContent":reviewContent
				,"rating":rating,"name":"${phDetail.name}"},
			type:"POST",
			dataType:"JSON",
			success:function(json){
				if(json.n == 1) {
					alert('약국에 대한 후기가 등록되었습니다. \n내가 작성한 후기는 [마이페이지]-[내 후기]에서 확인할 수 있습니다.');
					history.go(0);		
				}
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
	}
	
}








</script>


<div class="container">
	
	<div class="content">		
	
		<div>
			<input type="hidden" name="pharmSeq" value="${phDetail.pharmSeq}">
			<span class="pharmacyName">${phDetail.name}</span>
		</div>
		<div class="info">
			<div class="one">		
  				<div class="swiper-slide">
  					<img src="<%= ctxPath%>/resources/images/${hpDetail.mainImg}">
  				</div>
		               
				<div class="pharmacyRating" style="padding-top:10px; height:40px;">
					<span class="pharmacyRatingStar" id="pharmacyRatingStar1">별1</span>
					<span class="pharmacyRatingStar" id="pharmacyRatingStar2">별2</span>
					<span class="pharmacyRatingStar" id="pharmacyRatingStar3">별3</span>
					<span class="pharmacyRatingStar" id="pharmacyRatingStar4">별4</span>
					<span class="pharmacyRatingStar" id="pharmacyRatingStar5">별5</span>
					<span class="pharmacyRatingNum">${pharmacyRating}.0</span>
				</div>			
				<div class="guide">
					<p><strong>법정공휴일</strong> : 신정, 설, 삼일절, 어린이날, 석가탄신일, 현충일, 광복절, 추석, 개천절, 한글날, 크리스마스</p>
					<p><strong>진료시간은 달라질 수 있으므로 전화를 통해 확인하시길 바랍니다.</strong></p>
				</div>
			</div>
			<div class="two">
				<table class="infoTable">
					<tr>
						<th>주소</th>
						<td>${phDetail.address}</td>
					</tr>
					<tr>
						<th>대표전화</th>
						<td>${phDetail.phone}</td>
					</tr>
					<tr>
						<th>진료시간</th>
						<td>
							<c:forEach var="hours" items="${openingHours}" varStatus="status">
								<c:choose>
						         <c:when test = "${status.index == 0}">
									월요일
						         </c:when>
						         <c:when test = "${status.index == 1}">
									화요일
						         </c:when>
						         <c:when test = "${status.index == 2}">
									수요일
						         </c:when>
						         <c:when test = "${status.index == 3}">
									목요일
						         </c:when>
						         <c:when test = "${status.index == 4}">
									금요일
						         </c:when>
						         <c:when test = "${status.index == 5}">
									토요일
						         </c:when>
						      </c:choose>
							&emsp;<span>${hours.open}</span> ~ <span>${hours.close}</span><br/>
							</c:forEach>
						</td>
					</tr>
				</table>				
			</div>
		</div>
		
		<div><span class="reviewName">후기</span></div>
		
		<table class="reviewTableMe">
		</table>
		
		<table class="reviewTable">
		</table>
		
		<div class="page_wrap">
			<div class="page_nation" id="pageBar"></div>
		</div>
		
		<c:if test="${sessionScope.loginuser!=null }">
			<div>
				<div> 
					<span class="stars on">별1</span>
					<span class="stars">별2</span>
					<span class="stars">별3</span>
					<span class="stars">별4</span>
					<span class="stars">별5</span>
					<span class="starsNum" style="margin-left: 5px;">1</span><span>.0</span>
					<input type="hidden" class="rating" id="rating" name="rating" value="1">
				</div>
				<textarea id="review" name="review" class="review" maxlength="199" placeholder="관련없는 내용이나 악의적인 후기는 삭제될 수 있습니다."></textarea>
				<div>
					<span id="bytesReview">0</span>자 / 200자
					<button type="button" class="btnRegister" onclick="goRegister();">등록</button>
				</div>
			</div>
		</c:if>
		<c:if test="${sessionScope.loginuser==null }">
			<div class="noLogin">
			</div>
		</c:if>
		
	
	
	
	
	
	
	
	
		<!-- <span class="pharmacyName">어쩌고 저쩌고 약국</span>
		<span class="pharmacyRating">★★★★★</span>	
		<span class="pharmacyRatingNum">0</span><span>.0</span>
		<div class="info">			
			<div class="">
				<table class="infoTable">
					<tr>
						<th>주소</th>
						<td>서울특별시 중구 을지로 255, 기승빌딩 4층</td>
					</tr>
					<tr>
						<th>대표전화</th>
						<td>02-1234-5678</td>
					</tr>					
					<tr>
						<th>진료시간</th>
						<td>월요일<br/>
							화요일<br/>
							수요일<br/>
							목요일<br/>
							금요일<br/>
							토요일<br/></td>
					</tr>
				</table>				
			</div>
		</div>
		
		<div><span class="reviewName">후기</span></div>
		<table class="reviewTable">
			<tr>
				<td style="text-align: center; padding:20px !important; font-weight: bolder;">후기가 없습니다.</td>
			</tr>
			<tr>
				<td style="background-color: #e6f5ff;">
					<div style="display:inline-block; width:90%;">
						<div>
							<span class="starRating" id="starRating1">별1</span>
							<span class="starRating" id="starRating2">별2</span>
							<span class="starRating" id="starRating3">별3</span>
							<span class="starRating" id="starRating4">별4</span>
							<span class="starRating" id="starRating5">별5</span>
						</div>
						<div class="reviewContents">최고의 병원 추천합니다.</div>
						<span class="name">nana</span><span class="registerDate">2020.07.19</span>
					</div>
					<div style="display:inline-block; width:8%; float:right;">
						<button type="button" id="modify" class="reviewBtn">수정</button>
						<button type="button" id="delete" class="reviewBtn">삭제</button>
					</div>
				</td>
			</tr>
			<tr>	
				<td>
					<div>
						<span class="starRating" id="starRating1">별1</span>
						<span class="starRating" id="starRating2">별2</span>
						<span class="starRating" id="starRating3">별3</span>
						<span class="starRating" id="starRating4">별4</span>
						<span class="starRating" id="starRating5">별5</span>
					</div>
					<div class="reviewContents">예약하고 갔는데도 너무 오래 기다렸어요... 피부과가 원래 그렇다고 하지만 너어어어어무 오래 기다려서 좀 힘들었습니다. 악의적인 내용은 아니고 그냥 후기인데 ㄱㅊ하죠? 저는 사실 200자를 채우고 싶어서 이렇게 구구절절 하고 있습니다. 오늘 너무 졸립고 피곤하네요 하하하 50자 남았는데 그냥 끝낸다. </div>
					<span class="name">mimi</span><span class="registerDate">2020.07.19</span>	
				</td>
			</tr>
		</table>
		
		
		<div>
			<div> 
				<span class="stars on">별1</span>
				<span class="stars">별2</span>
				<span class="stars">별3</span>
				<span class="stars">별4</span>
				<span class="stars">별5</span>
				<span class="starsNum" style="margin-left: 5px;">0</span><span>.0</span>
			</div>
			<textarea id="review" name="review" class="review" maxlength="199" placeholder="관련없는 내용이나 악의적인 후기는 삭제될 수 있습니다."></textarea>
			<div>
				<span id="bytesReview">0</span>자 / 200자
				<button type="button" class="btnRegister" onclick="goRegister();">등록</button>
			</div>
		</div>
	 -->
	
	</div>
		
</div>