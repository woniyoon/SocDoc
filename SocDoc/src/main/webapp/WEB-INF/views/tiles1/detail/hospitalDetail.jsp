<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        
<%	String ctxPath = request.getContextPath();%>   
<title>병원상세</title>

<style>

	/* div{
		margin-bottom: 5px;
	} */

	.container{
		width:1080px;
		margin: 100px auto;
	}
	
	.content{
		width:90%;
		margin:0px auto;
	}
	
	.hospitalName{
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
	
	.hospitalRatingStar {
		background: url('/socdoc/resources/images/icoReview.png') no-repeat right 0;
		background-size: auto 100%;
		width: 20px;
		height: 20px;
		display: inline-block;
		text-indent: -9999px;
		cursor: pointer;
		margin-bottom: 10px;
	}
	
	.hospitalRatingNum{
		margin-left:10px;
		font-weight: bolder;
	}
	
	.guide{
		background-color: #f2f2f2;
		color: red;
		padding:15px 15px 8px 15px;
		width: 400px;
		font-size: 9pt;
		width:100%;		
	}
	
	.infoTable{
		width:100%;
		font-size: 10pt;
 		height:100%;
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
	
	.btnTop{
		background-color: #0080ff;
		color:#fff;
		cursor: pointer; 
		border: 1px solid #999999; 
		border-radius: .25em; 
		padding: 0.25em .75em; 	
		font-weight: 500;
		font-size: 10pt;
	}
	
	.btnRegister{
		background-color: #0080ff;
		color:#fff;
		cursor: pointer;	
		border: 1px solid #999999; 		
		padding: 0.25em .75em; 	
		border-radius: .25em; 		
		font-weight: 500;
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
			 
	
	.swiper-container{
		width:100%;
		height:70%;
	}
	
	.swiper-slide {
	    text-align: center;
	    display: flex;
	    align-items: center; 
	    justify-content: center; 
	}    
   
    .swiper-slide img { 
        max-width: 100%;
        max-height:100%;
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
		background: url('/socdoc/resources/images/noReview1.png') no-repeat center ;
		background-size: contain; 
		width:100%;
		height:150px;
	}
	
    

</style>


<script type="text/javascript">


var currentShowPageNo = 1;

$(document).ready(function(){
	
	console.log('${loginuser}')
	readReview(currentShowPageNo);
	
	if('${loginuser}'.trim() != ''){
		console.log('머야');
		readReviewMe();
		readBookMark();
	}
	
	
	$(".heart").on("click", function() {
		if($(this).hasClass("is-active")){
			modifyBookMark();
		}
		else{
			modifyBookMark();
		}
	});
	
	$("#review").keyup(function(){
		cntReview = $("#review").val().length;
		$("#bytesReview").val('');
		$("#bytesReview").text(cntReview);		
		
		if(cntReview==0){
			$("#bytesReview").text('0');		
		}
		
	});
	 
	 
	 new Swiper('.swiper-container', {

			slidesPerView : 1, // 동시에 보여줄 슬라이드 갯수
			spaceBetween : 30, // 슬라이드간 간격
			slidesPerGroup : 1, // 그룹으로 묶을 수

			loop : true, // 무한 반복

			pagination : { // 페이징
				el : '.swiper-pagination',
				clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
			},
			navigation : { // 네비게이션
				nextEl : '.swiper-button-next', // 다음 버튼 클래스명
				prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
			},
	});
	 
	 
	
	//병원별점 
	$(".hospitalRatingStar").each(function(){
		$("#hospitalRatingStar"+"${hospitalRating}").addClass("on").prevAll("span").addClass("on");
		return false;
	})
	
	 
	//후기별점 
	$(".starRating").each(function(){
		$("#starRating2").addClass("on").prevAll("span").addClass("on");
		return false;
	})
		 
	
	
	
	//별점주기
	$('.stars').click(function(){
		  $(this).parent().children("span").removeClass("on");
		  $(this).addClass("on").prevAll("span").addClass("on");
		  
		  starsNum = $(".stars.on").length;
		  $(".starsNum").text(starsNum);
		  $("input[name='rating']").val(starsNum);
		  console.log('음? : '+$("input[name='rating']").val());
		  
		  return false;
	});
	
	
	
	
})



//----------------------------------------------------------------------------------

function readBookMark(){		
	
	$.ajax({
		url:"<%= ctxPath%>/readBookMark.sd",	
		data:{"hpSeq":"${hpDetail.hpSeq}","loginuserId":"${loginuser.userid}"},
		dataType:"JSON",
		success:function(json){
			
			if(json.n==1){
				$(".heart").addClass("is-active");	
			}
			
		},error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	})
	
}


function modifyBookMark(){
	
	var isBookMark = $(".heart").hasClass("is-active");
	
	$.ajax({
		url:"<%= ctxPath%>/modifyBookMark.sd",	
		data:{"hpSeq":"${hpDetail.hpSeq}","loginuserId":"${loginuser.userid}","isBookMark":isBookMark},
		dataType:"JSON",
		success:function(json){
			
			console.log('성공');
			if(json.result==1){
				$(".heart").addClass("is-active");
			}else{
				$(".heart").removeClass("is-active");
			}
			
		},error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	})
	
} 


var reviewMe = 0;

function readReviewMe(){
	
	var htmlMe="";
	
	$.ajax({
		url:"<%= ctxPath%>/getHpReviewMe.sd",	
		data:{"hpSeq":"${hpDetail.hpSeq}"},
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
		url:"<%= ctxPath%>/getHpReview.sd",	
		data:{"hpSeq":"${hpDetail.hpSeq}","currentShowPageNo":currentShowPageNo},
		dataType:"JSON",
		success:function(json){
			
			var html="";
			
			if(json.length==0){
				html += '<tr><td style="text-align: center; padding:20px !important; font-weight: bolder;">후기가 없습니다.</td></tr>';
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
		url:"<%=request.getContextPath()%>/getReviewTotalPage.sd",
		data: {"hpSeq":"${hpDetail.hpSeq}","sizePerPage":"5","currentShowPageNo":currentShowPageNo},
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
			url:"<%=request.getContextPath()%>/reviewDelete.sd",
			data: {"userid":"${loginuser.userid}","hpSeq":"${hpDetail.hpSeq}"},
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
		alert("후기를 한 글자 이상 입력해주세요.");
		$('#review').focus();
		return;
	}else if(reviewMe==1){
		alert('후기는 한 병원당 하나만 등록할 수 있습니다. \n새 후기를 등록하고 싶거나 내용을 변경하고 싶으면 \n삭제 후 재등록 해주세요.');
		return;
	}else{
		$.ajax({
			url:"<%= request.getContextPath()%>/addReview.sd",
			data:{"userid":"${loginuser.userid}","hpSeq":"${hpDetail.hpSeq}","reviewContent":reviewContent
				,"rating":rating,"hpName":"${hpDetail.hpName}"},
			type:"POST",
			dataType:"JSON",
			success:function(json){
				if(json.n == 1) {
					alert('병원에 대한 후기가 등록되었습니다. \n내가 작성한 후기는 [마이페이지]-[내 후기]에서 확인할 수 있습니다.');
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
			<input type="hidden" name="hpSeq" value="${hpDetail.hpSeq}">
			<span class="hospitalName">${hpDetail.hpName}</span>
			<div class="heart"></div>
			<span class="btns">
				<button type="button" class="btnTop" onClick="goReservation();">예약하기</button>
			</span>
		</div>
		<div class="info">
			<div class="one">		
  				
  				<div class="swiper-container">
           
		            <div class="swiper-wrapper">		               
		                <div class="swiper-slide"><img src="<%= ctxPath%>/resources/images/${hpDetail.mainImg}"></div>
		                <c:if test="${not empty hpDetail.subImg1 }">
		                	<div class="swiper-slide"><img src="<%= ctxPath%>/resources/images/${hpDetail.subImg1}"></div>
		                </c:if>
		                <c:if test="${not empty hpDetail.subImg2 }">
		                	<div class="swiper-slide"><img src="<%= ctxPath%>/resources/images/${hpDetail.subImg2}"></div>
		                </c:if>
			        </div>
			        
		            <!-- 네비게이션 -->
		            <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
		            <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
		  			<div class="swiper-pagination"></div>
	  			</div>	  				
  				
				<div class="hospitalRating" style="padding-top:10px; height:40px;">
					<span class="hospitalRatingStar" id="hospitalRatingStar1">별1</span>
					<span class="hospitalRatingStar" id="hospitalRatingStar2">별2</span>
					<span class="hospitalRatingStar" id="hospitalRatingStar3">별3</span>
					<span class="hospitalRatingStar" id="hospitalRatingStar4">별4</span>
					<span class="hospitalRatingStar" id="hospitalRatingStar5">별5</span>
					<span class="hospitalRatingNum">${hospitalRating}.0</span>
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
						<td>${hpDetail.address}</td>
					</tr>
					<tr>
						<th>대표전화</th>
						<td>${hpDetail.phone}</td>
					</tr>
					<tr>
						<th>기관</th>
						<td>${hpDetail.dept}</td>
					</tr>
					<tr>
						<th>소개</th>
						<td>${hpDetail.info}</td>
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
		
	</div>
		
</div>