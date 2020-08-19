<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/include.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연주자 신규등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
#p1 {
	color: gray;
}

#p2 {
	text-align: right;
}

.logoloc {
	position: absolute;
	left: 650px;
	top: 10px;
}

.boardloc {
	position: absolute;
	left: 450px;
	top: 220px;
}


</style>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("#toList").click(function() {
			location.href = 'artsList.arts'

		});
		$('#frm')
				.submit(
						function() {
							if ($("#artName").val() == ""
									|| $("#artName").val() == null) {
								alert("연주자 이름을 입력해주세요");
								$("#artName").focus();
								return false;
							}
							if ($("#mngName").val() == null
									|| $('#mngName').val() == "") {
								alert("매니저 이름을 입력해주세요");
								$('#mngName').focus();
								return false;
							}
							if ($("#profileP").val() == null
									|| $('#profileP').val() == "") {
								alert("프로필 사진을 업로드해주세요");
								$('#profileP').focus();
								return false;
							}
							if ($("#artContct").val() == null
									|| $('#artContct').val() == "") {
								alert("연주자 연락처를 입력해주세요");
								$('#artContct').focus();
								return false;
							}
							if ($("#mngContct").val() == ""
									|| $("#mngContct").val() == null) {
								alert("매니저 연락처를 입력해주세요");
								$("#mngContct").focus();
								return false;
							}
							if ($("#artEmail").val() == ""
									|| $("#artEmail").val() == null) {
								alert("이메일을 입력해주세요");
								$("#artEmail").focus();
								return false;
							}
							if ($("#artEd").val() == null
									|| $('#artEd').val() == "") {
								alert("학력사항을 입력해주세요");
								$('#artEd').focus();
								return false;
							}
							/*if($("#instrument").val()== null || $('#instrument').val() == ""){
							alert("분야를 선택해주세요");
							$('#instrument').focus();
							return false;	
							}*/
							if ($("#contrctType").val() == null
									|| $('#contrctType').val() == "") {
								alert("계약구분을 선택해주세요");
								$('#contrctType').focus();
								return false;
							}
							if ($("#cctrctDate").val() == null
									|| $('#cctrctDate').val() == "") {
								alert("계약일을 입력해주세요");
								$('#cctrctDate').focus();
								return false;
							}
							if ($("#expireDate").val() == null
									|| $('#expireDate').val() == "") {
								alert("계약만료일을 입력해주세요");
								$('#expireDate').focus();
								return false;
							}
							if ($("#fileUp").val() == null
									|| $('#fileUp').val() == "") {
								alert("계약서를 업로드해주세요");
								$('#fileUp').focus();
								return false;
							}

						});
	});
</script>
</head>
<body>


	<div class="logoloc">
		<tr>
			<td colspan=3><input type="image" src="../images/mlogo.png"
				onclick="javascript:location.href='../main.main';" width="250"
				height="250" id="logoImg" /></td>
		</tr>
	</div>



	<div class="boardloc">

		<a style="display: scroll; position: fixed; bottom: 5px; right: 5px;"
			href="#" title="맨위로"><img src="../images/pageUpDown.PNG"
			width="100" height="100"></a>


		<form action="artsRegisterPro.arts" method="post" id="frm"
			name="artsform" enctype="multipart/form-data">
			<table class="table table-hover table-condensed">
				<tr align="center" valign="middle">
					<td colspan="7">연주자 신규등록</td>
				</tr>
				<tr>
					<td style="font-family: 돋음; font-size: 12" height="16">번호</td>
					<td></td>
					<td>이름</td>
					<td><input type="text" name="artName" id="artName"></td>
					<td>담당매니저</td>
					<td><input type="text" name="mngName" id="mngName"></td>
				</tr>

				<tr>
					<td rowspan='3' colspan="2"><input type="file" name="profileP"
						id="profileP"></td>
					<td style="font-family: 돋음; font-size: 12" height="16">연락처</td>
					<td style="font-family: 돋음; font-size: 12" height="16"><input
						type="text" name="artContct" id="artContct"></td>
					<td>매니저연락처</td>
					<td><input type="text" name="mngContct" id="mngContct">
					</td>
				</tr>
				<tr>
					<td style="font-family: 돋음; font-size: 12" height="16">이메일</td>
					<td style="font-family: 돋음; font-size: 12" height="16"><input
						type="email" name="artEmail" id="artEmail"></td>
					<td>SNS</td>
					<td><input type="text" name="artSns" id="artSns"></td>
				</tr>
				<tr>
					<td style="font-family: 돋음; font-size: 12" height="16">학력</td>
					<td style="font-family: 돋음; font-size: 12" height="16"><textarea
							rows="10" cols="20" name="artEd" id="artEd"></textarea></td>
					<td>수상내역</td>
					<td><textarea rows="10" cols="20" name="artAwards"
							id="artAwards"></textarea></td>
				</tr>
				<tr>
					<td>분야</td>
					<td><select name='instrument'>
							<option value="null">분야를 선택하세요</option>
							<option value="pf">피아노</option>
							<option value='vn'>바이올린</option>
							<option value='vl'>비올라</option>
							<option value='vc'>첼로</option>
							<option value='emsbl'>앙상블</option>
					</select></td>
					<td style="font-family: 돋음; font-size: 12" height="16">연주이력</td>
					<td colspan="3"><textarea rows="10" cols="50" name="artCr"
							id="artCr"></textarea></td>
				</tr>
				<tr>
					<td style="font-family: 돋음; font-size: 12" height="16">계약구분</td>
					<td><select name="contrctType" id="contrctType">
							<option value="null">구분</option>
							<option value="excl">전속</option>
							<option value="temp">출연계약</option>
					</select></td>
					<td style="font-family: 돋음; font-size: 12" height="16">계약일</td>
					<td><input type="date" name="contrctDate" id="cctrctDate">
					</td>
					<td style="font-family: 돋음; font-size: 12" height="16">계약만료일</td>
					<td><input type="date" name="expireDate" id="expireDate">
					</td>
				</tr>
				<tr>
					<td>계약서</td>
					<td><input type="file" name="fileup" id="fileUp"></td>

				</tr>
				<tr>
					<td>음반</td>
					<td><input type="file" name="albumUp"></td>
					<td>동영상</td>
					<td><input type="text" name="video"></td>
				</tr>



			</table>
			<table align="center">
				<tr>
					<td colspan="7" align="right">&nbsp;<input type="submit"
						class="btn" value="등록">&nbsp;&nbsp;</td>
					<td><input type="button" class="btn" id="toList" value="목록"></td>
				</tr>
			</table>

		</form>
	</div>
</body>
</html>