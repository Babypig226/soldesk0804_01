<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.boardloc {
	position: absolute;
	left: 350px;
	top: 340px;
}

.imgloc {
	position: absolute;
	left: 750px;
	top: 300px;
}

.board2loc {
	position: absolute;
	left: 350px;
	top: 470px;
}

.board3loc {
	position: absolute;
	left: 510px;
	top: 680px;
}

#p1 {
	color: gray;
}

#p2 {
	color: blue;
}

#p3 {
	color: green;
}

#p4 {
	color: orange;
}
</style>
<title>Insert title here</title>
</head>
<body>


	<%@ include file="../main/fixMenu.jsp"%>

	<!-- * 카카오맵 - 지도퍼가기 -->
	<!-- 1. 지도 노드 -->
	<div class="boardloc">

		<p>Musica di Te 오시는길</p>
		<hr>

		<table>
			<tr>
				<td>주소 :</td>

				<td>서울 종로구 종로12길 15 코아빌딩1</td>
			</tr>

			<tr>
				<td>지번 :</td>
				<td>관철동 13 - 13</td>
			</tr>

		</table>
	</div>
	<div class="imgloc">
		<table>
			<tr>

				<td colspan=2><div id="daumRoughmapContainer1595915025064"
						class="root_daum_roughmap root_daum_roughmap_landing"></div></td>
			</tr>

		</table>

	</div>

	<div class="board2loc">



		<table>
			<tr>
				<td>Musica di Te 셔틀버스 운행정보</td>
			</tr>
			<tr>
				<td><p id="p1">평일 11:00 ~ 19:00 정각 운행</p></td>
			</tr>
			<tr>
				<td><p id="p2">1호선 종각역 4번출구 앞</p></td>

			</tr>

			<tr>

				<td><p id="p3">2호선 을지로입구 3번출구 앞</p></td>
			</tr>

			<tr>

				<td><p id="p4">3호선 종로3가 2-1번출구 앞</p></td>
			</tr>

			<tr>
				<td></td>
			</tr>

		</table>




	</div>

	<div class="board3loc">
		<h4>
			원활한 관람을 위하여 <b>대중교통 이용</b>을 부탁드립니다.
		</h4>

	</div>


	<script charset="UTF-8" class="daum_roughmap_loader_script"
		src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

	<!-- 3. 실행 스크립트 -->
	<script charset="UTF-8">
		new daum.roughmap.Lander({
			"timestamp" : "1595915025064",
			"key" : "2zffu",
			"mapWidth" : "540",
			"mapHeight" : "360"
		}).render();
	</script>
</body>
</html>