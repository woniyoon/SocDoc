<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
	#sideMenu {
		flex: 1;
		border: 1px solid navy;
	}
	
	#contents {
		flex: 4;
		height: auto;
		margin: auto;
	}
	
	#scheduleTbl, thead, tbody, td {
		width: 50vw;
		border: 2px solid grey;
		border-collapse: collapse;
	}
	
	#reviewBoard, thead, tfoot {
		width: 50vw;
		border: 2px solid grey;
		border-collapse: collapse;
	}
</style>

<main>
	<div id="sideMenu">
		<ul>
			<li><a>HOME</a></li>
			<li><a>예약관리</a></li>
			<li><a>병원상세정보</a></li>
			<li><a>방문고객관리</a></li>
			<li><a>후기관리</a></li>
		</ul>
	</div>
	<div id="contents" align="center">
		<!-- 스케줄 패널 -->
		${content}
		<table id="scheduleTbl">
			<thead>
				<tr>
					<th colspan="2" align="left"><a><h4>병원진료시간 ></h4></a></th>
				</tr>
				<tr>
					<td>평일</td>
					<td>주말</td>
				</tr>
			</thead>
			<tbody>
				<!-- 동적으로 생성되는 부분 ⬇️-->
				<tr>
					<td id="weekdaySchedule" rowspan="5">월요일 오전 09:00 ~ 오후 06:00<br>
						화요일 오전 09:00 ~ 오후 06:00<br> 수요일 오전 09:00 ~ 오후 06:00<br>
						목요일 오전 09:00 ~ 오후 06:00<br> 금요일 오전 09:00 ~ 오후 06:00<br>
					</td>
				</tr>
				<tr>
					<td>토요일 오전 09:00 ~ 오후 06:00<br> 일요일 오전 09:00 ~ 오후 06:00<br>
					</td>
				</tr>
				<tr>
					<td>병원식사시간</td>
				</tr>
				<tr>
					<td rowspan="2">점심 오전 11:00 ~ 오후 01:00<br> 저녁 오전 06:00 ~
						오후 07:00<br>
					</td>
				</tr>
				<!-- 동적으로 생성되는 부분 ⬆️-->
			</tbody>
		</table>

		<br> <br>
		<!-- 후기 패널 -->
		<table id="reviewBoard">
			<thead>
				<tr>
					<th colspan="4" align="left"><a><h4>후기 ></h4></a></th>
				</tr>
			</thead>
			<tbody>
				<!-- 동적으로 생성되는 부분 ⬇️-->
				<tr>
					<td>woniyoon</td>
					<td>☆☆☆☆☆</td>
					<td>좋아요~~~</td>
					<td>2020-07-24</td>
				</tr>
				<tr>
					<td>woniyoon</td>
					<td>☆☆☆☆☆</td>
					<td>좋아요~~~</td>
					<td>2020-07-24</td>
				</tr>
				<tr>
					<td>woniyoon</td>
					<td>☆☆☆☆☆</td>
					<td>좋아요~~~</td>
					<td>2020-07-24</td>
				</tr>
				<!-- 동적으로 생성되는 부분 ⬆️-->
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" align="right"><span>더보기</span></td>
				</tr>
			</tfoot>
		</table>
	</div>
</main>