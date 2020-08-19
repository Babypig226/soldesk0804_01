<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>관람 예절</title>
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
</style>
</head>
<body>

	<%@ include file="../main/fixMenu.jsp"%>

	<div class="boardloc">
		<h4>Musica di Te 관람예절&nbsp;</h4>

		<h5>관람예절, 공연/전시 관람시 지켜야할 기본 예절을 안내해 드립니다.<br /><br /></h5>


		<table class="table-striped" style="width: 50%">

			<tr>
				<td><img src="../images/et1.PNG" alt="01 공연관련정보체크" /></td>
				<td><b>01 공연관련정보체크</b></td>

			</tr>

			<tr>
				<td colspan=2><p class="rightTxt">공연내용과 관람등급, 공연장 위치, 주차시설
						등에 대한 정보를 사전에 체크 하시어 보다 즐거운 관람이 될 수 있도록 합니다.</p></td>
			</tr>

			<tr>
				<td><img src="../images/et2.PNG" alt="02 입장시간준수!" /></td>
				<td><b>02 입장시간준수!</b></td>

			</tr>

			<tr>
				<td colspan=2><p class="rightTxt">공연장 도착은 최소한 20분 전까지는 완료해야
						하며, 10분 전에는 자신의 좌석에 앉아 공연관람의 준비를 해야합니다. 공연시작 이후에는 출입이 불가능하며 상황에 따라
						입장이 가능한 경우 안내원의 지시에 따릅니다.</p></td>
			</tr>

			<tr>
				<td><img src="../images/et3.PNG" alt="03 휴대전화의 전원은 OFF" /></td>
				<td><b>03 휴대전화의 전원은 OFF</b></td>

			</tr>

			<tr>
				<td colspan=2><p class="rightTxt">공연관람시 휴대전화의 벨소리는 물론 진동소리와
						액정화면의 불빛도 주변 관객들에게 큰 방해가 되므로 입장 전에 반드시 꺼주셔야 합니다.</p></td>
			</tr>



			<tr>
				<td><img src="../images/et4.PNG" alt="04 음식물은 안돼요!" /></td>
				<td><b>04 음식물은 안돼요!</b></td>

			</tr>

			<tr>
				<td colspan=2><p class="rightTxt">음료를 비롯한 음식물 섭취, 껌씹기 등은 본인
						뿐만 아니라 주변 관객들의 공연관람에 큰 방해요소 이므로 주의하셔야 합니다.</p></td>
			</tr>

			<tr>
				<td><img src="../images/et5.PNG" alt="05 사진 촬영 및 녹화 금지" /></td>
				<td><b>05 사진 촬영 및 녹화 금지</b></td>

			</tr>

			<tr>
				<td colspan=2><p class="rightTxt">객석 내에서의 촬영은 원칙적으로 금지하고
						있습니다. 사전 협의 되지 않은 내용을 촬영 할 경우 삭제를 요청할 수 있습니다. 사진 촬영을 원하시는 경우 공연전
						관계자에게 물어봐 사진촬영 허가를 받으셔야 합니다.</p></td>
			</tr>

			<tr>
				<td><img src="../images/et6.PNG" alt="06 공연 중 빈자리 찾아 이동 금지" /></td>
				<td><b>06 공연 중 빈자리 찾아 이동 금지/b></td>

			</tr>

			<tr>
				<td colspan=2><p class="rightTxt">공연이 시작되고 자신의 자리가 아닌 비어있는
						좌석으로 이동하시면 안됩니다. 공연중 객석 밖으로 나왔다가 들어오실 경우 본인 좌석이 아닌 출입구와 가까운 빈자리에
						앉으셔서 나머지 공연을 관람하시는 것이 예의 입니다.</p></td>
			</tr>
			<tr>
				<td><img src="../images/et1.PNG" alt="07 공연중에는 조용히!" /></td>
				<td><b>07 공연중에는 조용히!</b></td>

			</tr>

			<tr>
				<td colspan=2><p class="rightTxt">공연 중 옆 사람과의 잡담은 다른 관객들의
						공연 관람에 큰 방해가 됩니다. 그 밖에 소리가 많이 나는 꽃다발이나 비닐 등은 물품 보관소에 맡기고 입장하시면
						됩니다.</p></td>
			</tr>

			<tr>
				<td><img src="../images/et1.PNG" alt="08 박수는 때에 맞춰서!" /></td>
				<td><b>08 박수는 때에 맞춰서!</b></td>

			</tr>

			<tr>
				<td colspan=2><p class="rightTxt">관객의 박수는 공연자에게 큰 힘이 됩니다.
						하지만 불필요한 시기에 휘파람을 불거나 박수를 치는 행위는 예의가 아니므로 자제해 주시기 바랍니다.</p></td>
			</tr>
		</table>
	</div>


</body>
</html>