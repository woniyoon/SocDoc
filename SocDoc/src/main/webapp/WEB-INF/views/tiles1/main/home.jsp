<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

	<style>
        
        .con1:after {
            content: '';
            clear: both;
            display: block;
        }

        .con1 {
            width: 1000px;
            margin-top: 30px;
            margin-bottom: 30px;
            margin-right: auto;
            margin-left: auto;
        }

        .searchHospital, .searchPharmacy, .reservationHp, .searchAmbulance {
            width: 200px;
            height: 165px;
            margin-right: 30px;
            float: left;
            border-radius: 50px;
            color: navy;
            background-color: #D6F0FF;
        }
        
        .icon1, .icon2, .icon3 {
            width: 60px;
            height: 60px; 
        }
        
        .a {
            margin-top: 20px;
            font-weight: bold;
            font-size: 20px;
        }

        .searchLocal {
            width: 260px;
            height: 190px;
            margin-right: 35px;
            float: left;
        }
        
        select {
            margin-top: 5px;
            margin-left: 5px;
            height: 30px;
        }
        
        input:-ms-input-placeholder {color:#a8a8a8; } 
        input::-webkit-input-placeholder {color:#a8a8a8;} 
        input::-moz-placeholder {color:#a8a8a8;} 
            
        .searchWord {
            font-size: 12px;
            width: 150px;
            height: 30px;
            padding: 10px;
            border: solid 1.3px #1b5ac2;
            float: left;
            margin-top: 15px;
            margin-left: 5px;
        }
        
        .searchBtn {
            width: 50px;
            height: 30px;
            border: 0px;
            margin-top: 15px;
            color: #ffffff;
            background-color: #1b5ac2;
        }
        
       .con2:after {
            content: '';
            clear: both;
            display: block;
        }

        .con2 {
            width: 1000px;
            margin-top: 30px;
            margin-bottom: 30px;
            margin-right: auto;
            margin-left: auto;
        }

        .notice {
            width: 720px;
            height: 190px;
            /*border: solid 1px black;*/
            margin-right: 35px;
            float: left;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            font-size: 12px;
            font-weight: bold;
            color: #222222;
            text-align: center;
            padding: 10px 3px;
            /*border-top: 1px solid #333333;*/
            border-bottom: 1px solid #333333;
        }

        td {
            font-size: 12px;
            color: #666666;
            text-align: center;
            padding: 13px 0;
            border-bottom: 1px solid #dddddd;
            line-height: 1.8;
        }

        .swiper-container {
            width: 960px;
            height: 200px;
            margin-top: 100px;
            margin-bottom: 30px;
            margin-right: auto;
            margin-left: auto;
        } 
  
        .swiper-slide {
            text-align: center;
            display: flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
            align-items: center; /* 위아래 기준 중앙정렬 */
            justify-content: center; /* 좌우 기준 중앙정렬 */
        }
        
        .swiper-slide img {
            max-width: 100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
        }
            
        @import url(https://fonts.googleapis.com/css?family=Raleway:300,700);
        @import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
        figure.snip1384 {
          font-family: 'Raleway', Arial, sans-serif;
          position: relative;
          overflow: hidden;
          margin: 10px;
          min-width: 230px;
          max-width: 315px;
          width: 100%;
          color: #ffffff;
          text-align: left;
          font-size: 16px;
          background-color: #000000;
        }
        figure.snip1384 * {
          -webkit-box-sizing: border-box;
          box-sizing: border-box;
          -webkit-transition: all 0.35s ease;
          transition: all 0.35s ease;
        }
        figure.snip1384 img {
          max-width: 100%;
          backface-visibility: hidden;
          vertical-align: top;
        }
        figure.snip1384:after,
        figure.snip1384 figcaption {
          position: absolute;
          top: 0;
          bottom: 0;
          left: 0;
          right: 0;
        }
        figure.snip1384:after {
          content: '';
          background-color: rgba(0, 0, 0, 0.65);
          -webkit-transition: all 0.35s ease;
          transition: all 0.35s ease;
          opacity: 0;
        }
        figure.snip1384 figcaption {
          z-index: 1;
          padding: 40px;
        }
        figure.snip1384 h3,
        figure.snip1384 .links {
          width: 100%;
          margin: 5px 0;
          padding: 0;
        }
        figure.snip1384 h3 {
          line-height: 1.1em;
          font-weight: 700;
          font-size: 1.4em;
          text-transform: uppercase;
          opacity: 0;
        }
        figure.snip1384 p {
          font-size: 0.8em;
          font-weight: 300;
          letter-spacing: 1px;
          opacity: 0;
          top: 50%;
          -webkit-transform: translateY(40px);
          transform: translateY(40px);
        }
        figure.snip1384 i {
          position: absolute;
          bottom: 10px;
          right: 10px;
          padding: 20px 25px;
          font-size: 34px;
          opacity: 0;
          -webkit-transform: translateX(-10px);
          transform: translateX(-10px);
        }
        figure.snip1384 a {
          position: absolute;
          top: 0;
          bottom: 0;
          left: 0;
          right: 0;
          z-index: 1;
        }
        figure.snip1384:hover img,
        figure.snip1384.hover img {
          zoom: 1;
          filter: alpha(opacity=50);
          -webkit-opacity: 0.5;
          opacity: 0.5;
        }
        figure.snip1384:hover:after,
        figure.snip1384.hover:after {
          opacity: 1;
          position: absolute;
          top: 10px;
          bottom: 10px;
          left: 10px;
          right: 10px;
        }
        figure.snip1384:hover h3,
        figure.snip1384.hover h3,
        figure.snip1384:hover p,
        figure.snip1384.hover p,
        figure.snip1384:hover i,
        figure.snip1384.hover i {
          -webkit-transform: translate(0px, 0px);
          transform: translate(0px, 0px);
          opacity: 1;
        }
        
        #chart {
            width: 960px;
            height: 300px;
            margin-top: 30px;
            margin-bottom: 30px;
            margin-right: auto;
            margin-left: auto;
            border: solid 1px #ddd;
        }
        
		.highcharts-figure, .highcharts-data-table table {
		    min-width: 310px; 
		    max-width: 800px;
		    margin: 1em auto;
		}
		
		.highcharts-data-table table {
		    font-family: Verdana, sans-serif;
		    border-collapse: collapse;
		    border: 1px solid #EBEBEB;
		    margin: 10px auto;
		    text-align: center;
		    width: 100%;
		    max-width: 500px;
		}
		.highcharts-data-table caption {
		    padding: 1em 0;
		    font-size: 1.2em;
		    color: #555;
		}
		.highcharts-data-table th {
			font-weight: 600;
		    padding: 0.5em;
		}
		.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
		    padding: 0.5em;
		}
		.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
		    background: #f8f8f8;
		}
		.highcharts-data-table tr:hover {
		    background: #f1f7ff;
		}
        
    </style>


        <div class="con1">     
            <div class="searchHospital" class="icon2"><p class="miniTitle">병원찾기<br/><br/><img src="<%= ctxPath%>/resources/images/hospital2.png" class="icon1" /></p></div>
            <div class="searchPharmacy"><p class="miniTitle">약국찾기<br/><br/><img src="<%= ctxPath%>/resources/images/pharmacy2.png" class="icon2" /></p></div>
            <div class="reservationHp"><p class="miniTitle">병원예약<br/><br/><img src="<%= ctxPath%>/resources/images/reservation2.png" class="icon3" /></p></div>
            
            <div class="searchLocal">
                <select style="width: 120px;"><option>시</option></select><br/>
                <select style="width: 80px;"><option>군</option></select>
                <select style="width: 80px;"><option>구</option></select><br/>
                <select style="width: 80px;"><option>진료과목</option></select>
                <br/>
                <input type="text" class="searchWord" placeholder="검색어를 입력하세요">
                <button class="searchBtn">검색</button>
                
            </div>
        </div>

        <div class="con2">
            <div class="searchAmbulance"><p class="miniTitle">민간구급차검색<br/><br/><img src="<%= ctxPath%>/resources/images/ambulance2.png" class="icon3" /></p></div>
            
            <div class="notice">            
                <table>
                    <thead>
                         <tr>
                            <th>No</th>
                            <th>제목</th>
                            <th>글쓴이</th>
                            <th>날짜</th>
                         </tr>
                    </thead>
                    
                    <tbody>
                        <tr>
                            <td name="rno">3</td>
                            <td class="notice_seq">안보면 후회하는 공지글</td>
                            <td class="noticeTitle">관리자</td>
                            <td>2020-07-29</td>
                        </tr>
                        
                        <tr>
                            <td name="rno">2</td>
                            <td class="notice_seq">이것은 예시입니다</td>
                            <td class="noticeTitle">관리자</td>
                            <td>2020-07-20</td>
                        </tr>
                        
                        <tr>
                            <td name="rno">1</td>
                            <td class="notice_seq">세상에서 제일 예쁜 메인페이지</td>
                            <td class="noticeTitle">관리자</td>
                            <td>2020-06-30</td>
                        </tr>
				    </tbody>
                </table>
            </div>
        </div>
    
        <div class="swiper-container">
           
            <div class="swiper-wrapper">
                
                <div class="swiper-slide">
                    <figure class="snip1384">
                      <img src="<%= ctxPath%>/resources/images/slide1.jpg">
                      <figcaption>
                        <h3>종로병원</h3>
                        <p>더 자세한 정보를 보려면<br/>클릭하세요</p>
                      </figcaption>
                      <a href="#"></a>
                    </figure>
                </div>
                   
                <div class="swiper-slide">
                    <figure class="snip1384">
                      <img src="<%= ctxPath%>/resources/images/slide2.jpg">
                      <figcaption>
                        <h3>강남병원</h3>
                        <p>더 자세한 정보를 보려면<br/>클릭하세요</p>
                      </figcaption>
                      <a href="#"></a>
                    </figure>
                </div>
                   
                <div class="swiper-slide">
                    <figure class="snip1384">
                      <img src="<%= ctxPath%>/resources/images/slide3.jpg">
                      <figcaption>
                        <h3>홍대병원</h3>
                        <p>더 자세한 정보를 보려면<br/>클릭하세요</p>
                      </figcaption>
                      <a href="#"></a>
                    </figure>
                </div>
                
                <div class="swiper-slide"><img src="<%= ctxPath%>/resources/images/slide1.jpg"></div>
                <div class="swiper-slide"><img src="<%= ctxPath%>/resources/images/slide2.jpg"></div>
                <div class="swiper-slide"><img src="<%= ctxPath%>/resources/images/slide3.jpg"></div>
	        </div>
	        
            <!-- 네비게이션 -->
            <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
            <div class="swiper-button-prev"></div><!-- 이전 버튼 -->

            <!-- 페이징 -->
            <div class="swiper-pagination"></div>
       
        </div>
    
        <br>
       
        <div id="chart"></div>


<script>
$(document).ready(function(){
	
	coronaList();	

});

new Swiper('.swiper-container', {

	slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 30, // 슬라이드간 간격
	slidesPerGroup : 3, // 그룹으로 묶을 수

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	loopFillGroupWithBlank : true,

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
    
/* Demo purposes only */
$(".hover").mouseleave(
  function () {
    $(this).removeClass("hover");
  }
); 


/* corona19 chart */
function coronaList() {
	
	$.ajax({
		
		url:"<%= ctxPath%>/api/covidStats.sd",
		dataType: "JSON",
		success:function(json) {
			
		/* 			
			var resultArr = [];
			
			console.log(json);
			
			var realResult = test.response.body.items.item;
			console.log(realResult);
			for(var i=0;i<result.length;i++){
			    
				console.log(result[i].deathCnt);

			}
		 */
		 
			Highcharts.chart('chart', {
			    chart: {
			        type: 'areaspline'
			    },
			    title: {
			        text: '일자별 전국 신규 확진자'
			    },
			    legend: {
			        layout: 'vertical',
			        align: 'left',
			        verticalAlign: 'top',
			        x: 150,
			        y: 100,
			        floating: true,
			        borderWidth: 1,
			        backgroundColor:
			            Highcharts.defaultOptions.legend.backgroundColor || '#FFFFFF'
			    },
			    xAxis: {
			        categories: [
			            'Monday',
			            'Tuesday',
			            'Wednesday',
			            'Thursday',
			            'Friday',
			            'Saturday',
			            'Sunday'
			        ],
			        plotBands: [{ // visualize the weekend
			            from: 4.5,
			            to: 6.5,
			            color: 'rgba(68, 170, 213, .2)'
			        }]
			    },
			    yAxis: {
			        title: {
			            text: ''
			        }
			    },
			    tooltip: {
			        shared: true,
			        valueSuffix: ' people'
			    },
			    credits: {
			        enabled: false
			    },
			    plotOptions: {
			        areaspline: {
			            fillOpacity: 0.5
			        }
			    },
			    series: [{
			        name: 'COVID 19',
			        data: [21, 11, 23, 2, 1, 0, 1]
			    }]
			    
				});
		   
			},
		 	error: function(request, status, error) {
	    	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	    }
	});
}



</script>
