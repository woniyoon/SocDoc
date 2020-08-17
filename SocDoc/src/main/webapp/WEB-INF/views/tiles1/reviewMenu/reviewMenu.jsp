<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        
<%	String ctxPath = request.getContextPath();%>   
    
    
<style>

	.container{
		width:1080px;
		margin: 100px auto;
	}
	
	.one{
		width:100%;
		text-align: right;
		margin-bottom: 15px;
	}
	
	.two{
		width:100%;
		display: grid;
        grid-template-columns: 32% 32% 32%;
        padding:10px;
        border: solid 1px red;
        justify-content: space-between;
        
	}
	
	.select{
		width: 100px;
		height: 30px;
		border: 1px solid #999999;
		border-radius: .25em; 
		margin-right: 3px;
		margin-bottom: 5px;
	}
	
	.btnSearch{
  		padding: 0 .75em; 
 		height:30px;
		background-color: #efefef; 
		cursor: pointer; 
		border: 1px solid #999999; 
		border-radius: .25em; 
	}
	
	.repImage{
		width:280px;
		height:200px;
		
	}
	
	.name{
		font-size: 11pt;
		font-weight: bolder;
		margin: 10px 0 5px 0;
	}
	
	.reviewList{
		/* background-color: background: -webkit-linear-gradient(#f4f4f4, #ffffff);
		background: -o-linear-gradient(#f4f4f4, #ffffff);
		background: -moz-linear-gradient(#f4f4f4, #ffffff); 
		background: linear-gradient(#ececec, #ffffff);  */
		font-size: 10pt;
		width:95%;
		height: 40%;
		padding:15px;
		margin:15px 0;
 		box-shadow: 0 0 10px skyblue;
	}
	
	.reviews{
		border-top: 1px solid #999999;
		border-bottom: 1px solid #999999;
		margin : 10px 0;
		padding: 15px;
		text-align: left;
		height: 115px;
	}
	
	ul{
		margin:0;
	}
	
	.more{
		text-align: right;
		color:#0080ff;
	}
	
	li{
		font-size: 10pt;
	}
	
	.reviewImg{
		width: 20px !important;
		height: 20px !important;
		margin: -5px 10px 0 10px;
	}
	
	
	.starRating{
		background: url('/socdoc/resources/images/starsBlue.png') no-repeat right 0;
		background-size: auto 100%;
		width: 15px;
		height: 15px;
		display: inline-block;
		text-indent: -9999px;
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
	
	

</style>


<script type="text/javascript">

var currentShowPage = 1;
var length=18;


	$(document).ready(function(){
		
		readReviewMenu(currentShowPage);
		
		
		
		
		/* //후기별점 
		$(".starRating").each(function(){
			$("#starRating3").addClass("on").prevAll("span").addClass("on");
			return false;
		}) */
			
	
	})
	
	
	
	function readReviewMenu(currentShowPage){
		
		var city = $("#city").val();
		var dept = $("#dept").val();
		
		$.ajax({
			url:"<%= request.getContextPath()%>/readReviewMenu.sd",
			data:{"city":city,"dept":dept,"currentShowPage":currentShowPage},
			dataType:"JSON",
			success:function(json){
				
				var html="";

				$.each(json, function(index,item){
					
 					html+='<div>';
					html += '<div class="reviewList" id="reviewList">'
						 +'		 <div class="img"><img class="repImage" src="/socdoc/resources/images/'+item.mainImg+'"></div>'
						 +' 	 <div class="name">'+item.hpName+'</div> '
						 +'		 <div class="hospitalRating">';
						 
				    for(var i=1; i<=5; i++) {
						if(i<=item.avg) {
							html += '				<span class="starRating on" id="starRating'+i+'">별1</span>';								
						} else {
							html += '				<span class="starRating " id="starRating'+i+'">별2</span>';
						}
					}
				    
				    html+='</div>'
				    html+='<div class="reviews" id="reviews'+item.hpSeq+'"></div>';
				    html +='<div class="more">>더보기</div>';
				    html +='</div>'
				    html +='</div>'

					
					readReviewDetail(item.hpSeq);
					
				})
				$("#two").html(html);


				makeReviewPageBar(currentShowPage);
				
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
		
	}
	
	
	function readReviewDetail(hpSeq){
		
		var html="";
		var reviewImg = "";
		$.ajax({
			url:"<%=request.getContextPath()%>/readReviewDetail.sd",
			data: {"hpSeq":hpSeq},
			dataType:"JSON" ,
			success:function(json){
								
				if(json.length>0){
					
					$.each(json, function(index,item){
												 
						 if(item.rating==1){
							 reviewImg = "one.png"
						 }else if(item.rating==2){
							 reviewImg = "two.png"
						 }else{
							 reviewImg = "five.png"
						 }
							 
						html +='<div style="margin:5px 0;">'
							 +'		<img class="reviewImg" src="/socdoc/resources/images/'+reviewImg+'"><span class="reply">'+item.content+'</span>'
							 +'	</div>';
							 
						// 후기 말줄임표
						$(".reply").each(function(){
							if($(this).text().length>length){
								$(this).text($(this).text().substr(0,length-1)+'...');
							}		
						})	 
						
					})
					
				 	 	
				}else{
					html += '<div style="text-align:center;">'
						 +'		후기가 없습니다.'
						 +'	 </div>';
				}
				
				
				
				$("#reviews"+hpSeq).html(html);

				
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		})	
		
	}
	
	
	
	
	function makeReviewPageBar(currentShowPage){
		
		var city = $("#city").val();
		var dept = $("#dept").val();
		
		$.ajax({
			url:"<%=request.getContextPath()%>/getReviewMenuTotalPage.sd",
			data: {"sizePerPage":"6","currentShowPage":currentShowPage, "city":city,"dept":dept},
			dataType:"JSON" ,
			success:function(json){
				
				if(json.totalPage>0){
					var totalPage = json.totalPage;
		            var pageBarHTML = "";
					var blockSize = 10;
					var loop = 1;
									
					if(typeof currentShowPage =="string"){
						currentShowPage = Number(currentShowPage);
					}

					var pageNo = Math.floor((currentShowPage -1)/blockSize)*blockSize+1
					
					 console.log('currentShowPage : '+currentShowPage);
					 console.log('pageNO : '+pageNo);
					 console.log('totalPage : '+totalPage)
					 
					// === [이전] 만들기 ===
	               if(pageNo != 1) {
	            	  pageBarHTML += "<a class='arrow pprev' href='javascript:readReviewMenu(1)'></a>";
	                  pageBarHTML += "<a class='arrow prev' href='javascript:readReviewMenu(\""+(pageNo-1)+"\")'></a>";
	               }
	               
	               while (!(loop > blockSize || pageNo > json.totalPage )) {
	            	   
	                  if(pageNo == currentShowPage) {
	                     pageBarHTML += "<a class='active'>" + pageNo + "</a>";
	                  }
	                  else {
	                     pageBarHTML += "<a href='javascript:readReviewMenu(\""+pageNo+"\")'>"+pageNo+"</a>";
	                  }                  
	                  loop ++;
	                  pageNo ++;                  
	               } 
	               
	               // === [다음] 만들기 ===
	               if( !(pageNo > totalPage) ) {               
	                  pageBarHTML += "<a class='arrow next' href='javascript:readReviewMenu(\""+pageNo+"\")'></a>";  
	                  pageBarHTML += "<a class='arrow nnext' href='javascript:readReviewMenu(\""+totalPage+"\")'></a>";  
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
	
	
	
	

</script>    



<div class="container">

	<div class="one">
		<select id="city" name="city" class="select">
	        <option value="">시도</option>  
			<option value='서울'>서울</option>
			<option value='부산'>부산</option>
			<option value='대구'>대구</option>
			<option value='인천'>인천</option>
			<option value='광주'>광주</option>
			<option value='대전'>대전</option>
			<option value='울산'>울산</option>
			<option value='강원'>강원</option>
			<option value='경기'>경기</option>
			<option value='경남'>경남</option>
			<option value='경북'>경북</option>
			<option value='전남'>전남</option>
			<option value='전북'>전북</option>
			<option value='제주'>제주</option>
			<option value='충남'>충남</option>
			<option value='충북'>충북</option>				                                           
        </select>
        <select id="dept" name="dept" class="select">
	        <option value="">진료과</option> 
	        <option value="내과">내과</option> 
	        <option value="이비인후과">이비인후과</option>
	        <option value="정형외과">정형외과</option>
	        <option value="안과">안과</option>
	        <option value="치과">치과</option> 
	        <option value="외과">외과</option> 
	        <option value="성형외과">성형외과</option>   
	        <option value="정신건강의학과">정신건강의학과</option>
	        <option value="피부과">피부과</option>                              
        </select>		
		<button type="button" class="btnSearch" onclick="readReviewMenu(1);">정렬</button>
	</div>	
	
	<div class="two" id="two" align="center">
<!-- 		 <div class="reviewList" id="reviewList" style="display: inline-block;">
 -->		 	<!-- <div id="reviewBlock">
		 	
		 	</div>
			<div class="reviews" id="reviews"> -->
				<%-- <div>
					<img class="reviewImg" src="<%= ctxPath%>/resources/images/five.png"><span class="reply">너무나 좋은 병원입니다. 또 아프고 싶어요. 굿굿.</span>
				</div>
				<div>
					<img class="reviewImg" src="<%= ctxPath%>/resources/images/two.png"><span>너무나 좋은 병원입니다. 또 아프고 싶어요. 굿굿.</span>
				</div>
				<div>
					<img class="reviewImg" src="<%= ctxPath%>/resources/images/one.png"><span>너무나 좋은 병원입니다. 또 아프고 싶어요. 굿굿.</span>
				</div>
				<div class="more">>더보기</div>				 --%>
			<!-- </div> -->
<!-- 		</div>
 -->		<%-- 
		<div class="">
			<div class="img"><img class="repImage" src="<%= ctxPath%>/resources/images/츄.jpg"></div>		
			<div class="name">저쩌고 병원</div>
			<div class="hospitalRating">★★★★★</div>
			<div class="reviews">
				<ul>
					<li>- 후기1</li>
					<li>- 후기2</li>
					<li>- 후기3</li>
				</ul>
			</div>
			<div class="more">>더보기</div>
		</div>
		
		<div class="">
			<div class="img"><img class="repImage" src=""></div>		
			<div class="name">무슨 약국</div>
			<div class="hospitalRating">★★★★★</div>
			<div class="reviews">
				<ul>
					<li>- 후기1</li>
					<li>- 후기2</li>
					<li>- 후기3</li>
				</ul>
			</div>
			<div class="more">더보기</div>
		</div>
		
		<div class="">
			<div class="img"><img class="repImage" src=""></div>		
			<div class="name">무슨 약국</div>
			<div class="hospitalRating">★★★★★</div>
			<div class="reviews">
				<ul>
					<li>- 후기1</li>
					<li>- 후기2</li>
					<li>- 후기3</li>
				</ul>
			</div>
			<div class="more" style="text-align: right;">>더보기</div>
		</div>
		
		<div class="">
			<div class="img"><img class="repImage" src=""></div>		
			<div class="name">무슨 약국</div>
			<div class="hospitalRating">★★★★★</div>
			<div class="reviews">
				<ul>
					<li>- 후기1</li>
					<li>- 후기2</li>
					<li>- 후기3</li>
				</ul>
			</div>
			<div class="more" style="text-align: right;">>더보기</div>
		</div>  --%>
	</div>
	<div class="page_wrap">
		<div class="page_nation" id="pageBar"></div>
	</div>



</div>