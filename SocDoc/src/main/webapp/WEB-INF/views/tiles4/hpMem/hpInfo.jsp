<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
  
<%
	String ctxPath = request.getContextPath();
%>

<link rel="stylesheet" type="text/css" media="screen" href="<%=ctxPath %>/resources/css/hpInfo.css" />


	<div class="hpInfoContainer">
		<h3 align="left">병원 정보 관리</h3>
		<section id="infoContainer">
			<div class="slideshow-container">
	
				<!-- Full-width images with number and caption text -->
				<div class="mySlides fade">
					<div class="numbertext">1 / 3</div>
					<img src="../assets/bh_large.jpg" style="width: 100%; height: 100%;">
				</div>
	
				<div class="mySlides fade">
					<div class="numbertext">2 / 3</div>
					<img src="../assets/jm_large.jpg" style="width: 100%; height: 100%;">
				</div>
	
				<div class="mySlides fade">
					<div class="numbertext">3 / 3</div>
					<img src="../assets/pp_large.jpg" style="width: 100%; height: 100%;">
				</div>
	
				<!-- Next and previous buttons -->
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
					onclick="plusSlides(1)">&#10095;</a>
			</div>
			<div id="hpDetail">
				<ul id="hpDetailList">
					<li><input type="text" id="mainImg" readonly value="상세이미지1" />
						<button class="findFile" type="button" id="mainImg">찾기</button> <input
						type="file" id="mainImgFile" /></li>
					<li><input type="text" id="subImg1" readonly value="상세이미지1" />
						<button class="findFile" type="button" id="subImg1">찾기</button> <input
						type="file" id="subImg1File" /></li>
					<li><input type="text" id="subImg2" readonly value="상세이미지2" />
						<button class="findFile" type="button" id="subImg2">찾기</button> <input
						type="file" id="subImg2File" /></li>
				</ul>
				<table id="hpTextInfo">
					<tr>
						<th>주소</th>
						<td>
							${hpInfo.address }<button type="button">주소찾기</button>
						</td>
					</tr>
					<tr>
						<th>대표전화</th>
						<td><input type="text" value="${hpInfo.phone }" /></td>
					</tr>
					<tr>
						<th>진료과목</th>
						<td><span id="dept">${hpInfo.dept}</span></td>
					</tr>
					<tr>
						<th>소개</th>
						<td>
							<textarea placeholder="200자 내외로 작성해주세요!">${hpInfo.info }</textarea>
							<br>
							<span>
							<c:if test="${not empty hpInfo}">
								140
							</c:if>
							<c:if test="${empty hpInfo }">
								0
							</c:if>
							</span>/200자
						</td>
					</tr>
				</table>
			</div>
			<!-- The dots/circles -->
			<!-- <div style="text-align:center">
	            <span class="dot" onclick="currentSlide(1)"></span>
	            <span class="dot" onclick="currentSlide(2)"></span>
	            <span class="dot" onclick="currentSlide(3)"></span>
	        </div> -->
		</section>
		<table id="settingSection">
			<tr>
				<th>진료과목</th>
				<td><input type="checkbox" value="1" /> <label id="1">내과</label>
					<input type="checkbox" value="2" /> <label id="2">소아과</label> <input
					type="checkbox" value="3" /> <label id="3">가정의학</label> <input
					type="checkbox" value="4" /> <label id="4">여성의학과</label> <input
					type="checkbox" value="5" /> <label id="5">정신과</label> <input
					type="checkbox" value="6" /> <label id="6">비뇨기과</label> <input
					type="checkbox" value="7" /> <label id="7">피부과</label> <input
					type="checkbox" value="8" /> <label id="8">안과</label> <input
					type="checkbox" value="9" /> <label id="9">치과</label> <input
					type="checkbox" value="0" /> <label id="0">이비인후과</label></td>
			</tr>
			<tr>
				<th rowspan="7">진료시간</th>
				<td colspan="6"><label>월요일</label> <input type="number" min="0"
					max="23" step="1"> : <input type="number" min="0" max="30"
					step="30"> <span>부터</span> <input type="number" min="0"
					max="23" step="1"> : <input type="number" min="0" max="30"
					step="30"> <span>까지</span></td>
			</tr>
			<tr>
				<td colspan="6"><label>화요일</label> <input type="number" min="0"
					max="23" step="1"> : <input type="number" min="0" max="30"
					step="30"> <span>부터</span> <input type="number" min="0"
					max="23" step="1"> : <input type="number" min="0" max="30"
					step="30"> <span>까지</span></td>
			</tr>
			<tr>
				<td colspan="6"><label>수요일</label> <input type="number" min="0"
					max="23" step="1"> : <input type="number" min="0" max="30"
					step="30"> <span>부터</span> <input type="number" min="0"
					max="23" step="1"> : <input type="number" min="0" max="30"
					step="30"> <span>까지</span></td>
			</tr>
			<tr>
				<td colspan="6"><label>목요일</label> <input type="number" min="0"
					max="23" step="1"> : <input type="number" min="0" max="30"
					step="30"> <span>부터</span> <input type="number" min="0"
					max="23" step="1"> : <input type="number" min="0" max="30"
					step="30"> <span>까지</span></td>
			</tr>
			<tr>
				<td colspan="6"><label>금요일</label> <input type="number" min="0"
					max="23" step="1"> : <input type="number" min="0" max="30"
					step="30"> <span>부터</span> <input type="number" min="0"
					max="23" step="1"> : <input type="number" min="0" max="30"
					step="30"> <span>까지</span></td>
			</tr>
			<tr>
				<td colspan="6"><label>토요일</label> <input type="number" min="0"
					max="23" step="1"> : <input type="number" min="0" max="30"
					step="30"> <span>부터</span> <input type="number" min="0"
					max="23" step="1"> : <input type="number" min="0" max="30"
					step="30"> <span>까지</span></td>
			</tr>
		</table>
		<div align="right">
			<button>승인 신청</button>
		</div>
	</div>

<script>
	$(document).ready(
			function() {
				$("input[type=file]").each(
						function() {
							$(this).hide();

							$(this).on(
									"change",
									function() {
										console.log("change 펑션!");

										var id = $(this).prop("id");
										var idToShow = "#"
												+ id.substr(0, id.length - 4);
										console.log($(this));
										$(idToShow).prop(
												"value",
												$(this).val().split('/').pop()
														.split('\\').pop());

									});
						});

				$(".findFile").click(function() {
					console.log("찾기 버튼 클릭!");
					var idToTrigger = "#" + $(this).prop("id") + "File";

					$(idToTrigger).trigger("click");
					console.log("클릭 이벤트 트리거!");

				});

				$("input[type=checkbox]").click(function() {
					// 체크박스 선택은 한 개만 가능하게 설정
					var checkedValue = $(this).prop("value");

					$("input[type=checkbox]").each(function() {
						if (checkedValue != $(this).prop("value")) {
							$(this).prop("checked", false);
						} else {
							console.log("클릭된 체크박스!")
							$(this).prop("checked", true);
						}
					});

					// 체크된 과목을 상세정보에 반영
					$("#dept").text($("label#" + checkedValue).text());
				});
			});

	var slideIndex = 1;
	showSlides(slideIndex);

	// Next/previous controls
	function plusSlides(n) {
		showSlides(slideIndex += n);
	}

	// Thumbnail image controls
	function currentSlide(n) {
		showSlides(slideIndex = n);
	}

	function showSlides(n) {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		//var dots = document.getElementsByClassName("dot");
		if (n > slides.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = slides.length
		}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		// for (i = 0; i < dots.length; i++) {
		//     dots[i].className = dots[i].className.replace(" active", "");
		// }
		slides[slideIndex - 1].style.display = "block";
		// dots[slideIndex - 1].className += " active";
	}
</script>