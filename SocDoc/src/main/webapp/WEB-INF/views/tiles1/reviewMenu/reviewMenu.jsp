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
		width: 250px;
		height: 30px;
		border: 1px solid #999999;
		border-radius: .25em; 
		margin-right: 10px;
		margin-bottom: 5px;
	}
	
	.btnSearch{
  		padding: 0 .75em; 
 		height:30px;
		background-color: #efefef; 
		cursor: pointer; 
		border: 1px solid #999999; 
		border-radius: .25em; 
		margin-left: -10px;	
	}
	
	img{
		width:280px;
		height:140px;
	}
	
	.name{
		font-size: 11pt;
		font-weight: bolder;
		margin: 10px 0 5px 0;
	}
	
	.reviewList{
		background-color: #efefef;
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

</style>


<script type="text/javascript">

	$(document).ready(function(){
		
		var length=20;
		
		// 후기 말줄임표
		$("li").each(function(){
			if($(this).text().length>length){
				$(this).text($(this).text().substr(0,length-1)+'...');
			}		
		})
		
	
	})

</script>    



<div class="container">

	<div class="one">		
		<input type="text" id ="searchWord" name="searchWord" class="select"/>	
		<button type="button" class="btnSearch" onclick="goSearch();">검색</button>
	</div>	
	
	<div class="two" align="center">
		<div class="reviewList">
			<div class="img"><img src="<%= ctxPath%>/resources/images/slide1.jpg"></div>
			<div class="name">어쩌고 병원</div>
			<div class="hospitalRating">★★★★★</div>
			<div class="reviews">
				<ul>
					<li>- 너무나 좋은 병원입니다. 또 아프고 싶어요. 굿굿.</li>
					<li>- 에엥 에에엥 이게 병원이란 말임</li>
					<li>- 좋아요.</li>
				</ul>
			</div>
			<div class="more" style="text-align: right;">>더보기</div>
		</div>
		
		<div class="reviewList">
			<div class="img"><img src="<%= ctxPath%>/resources/images/츄.jpg"></div>		
			<div class="name">저쩌고 병원</div>
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
			<div class="img"><img src=""></div>		
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
			<div class="img"><img src=""></div>		
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
			<div class="img"><img src=""></div>		
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