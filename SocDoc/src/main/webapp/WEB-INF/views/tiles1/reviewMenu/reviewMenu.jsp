<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        
<%	String ctxPath = request.getContextPath();%>   
    
    
<style>

	.container{
		width:1080px;
		margin: 100px auto;
		border:1px solid red;
	}
	
	.one{
		width:100%;
		text-align: right;
		margin-bottom: 15px;
	}
	
	.two{
		width:100%;
		border: 1px solid blue;
		display:inline-flex;
		flex-shrink:0;
		flex-wrap: wrap;
		justify-content: space-around;
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
		height:140px;
	}
	
	.name{
		font-size: 11pt;
		font-weight: bolder;
		margin: 10px 0 5px 0;
	}
	
	.reviewList{
		background-color: transparent;
		font-size: 10pt;
		width:31%;
		height: 40%;
		padding:15px;
		margin:10px 0;
	}
	
	.reviews{
		border-top: 1px solid #999999;
		border-bottom: 1px solid #999999;
		margin : 10px 0;
		padding: 5px 0;
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
	}
	
	.starRating{
		background: url('/socdoc/resources/images/starsBlue.png') no-repeat right 0;
		background-size: auto 100%;
		width: 10px;
		height: 10px;
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

</style>


<script type="text/javascript">

var currentShowPage = 1;

	$(document).ready(function(){
		
		readReview(currentShowPage);
		
		var length=18;
		
		// 후기 말줄임표
		$(".reply").each(function(){
			if($(this).text().length>length){
				$(this).text($(this).text().substr(0,length-1)+'...');
			}		
		})
		
		//후기별점 
		$(".starRating").each(function(){
			$("#starRating3").addClass("on").prevAll("span").addClass("on");
			return false;
		})
			
	
	})
	
	
	
	function readReview(currentShowPage){
		
		var city = $("#city").val();
		var dept = $("#dept").val();
		
		$.ajax({
			url:"<%= request.getContextPath()%>/readReview.sd",
			data:{"city":city,"dept":dept,"currentShowPage":currentShowPage},
			dataType:"JSON",
			success:function(json){
				
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
		<button type="button" class="btnSearch" onclick="goSearch();">정렬</button>
	</div>	
	
	<div class="two" align="center">
		<div class="reviewList">
			<div class="img"><img class="repImage" src="<%= ctxPath%>/resources/images/slide1.jpg"></div>
			<div class="name">어쩌고 병원</div>
			<div class="hospitalRating">
				<span class="starRating" id="starRating1">별1</span>
				<span class="starRating" id="starRating2">별2</span>
				<span class="starRating" id="starRating3">별3</span>
				<span class="starRating" id="starRating4">별4</span>
				<span class="starRating" id="starRating5">별5</span>
			</div>
			<div class="reviews">
				<div>
					<img class="reviewImg" src="<%= ctxPath%>/resources/images/five.png"><span class="reply">너무나 좋은 병원입니다. 또 아프고 싶어요. 굿굿.</span>
				</div>
				<div>
					<img class="reviewImg" src="<%= ctxPath%>/resources/images/two.png"><span>너무나 좋은 병원입니다. 또 아프고 싶어요. 굿굿.</span>
				</div>
				<div>
					<img class="reviewImg" src="<%= ctxPath%>/resources/images/one.png"><span>너무나 좋은 병원입니다. 또 아프고 싶어요. 굿굿.</span>
				</div>
				<!-- <ul>
					<li>너무나 좋은 병원입니다. 또 아프고 싶어요. 굿굿.</li>
					<li>- 에엥 에에엥 이게 병원이란 말임</li>
					<li>- 좋아요.</li>
				</ul> -->
			</div>
			<div class="more">>더보기</div>
		</div>
		
		<div class="reviewList">
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
		
		<div class="reviewList">
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
		
		<div class="reviewList">
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
		
		<div class="reviewList">
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
	</div>



</div>