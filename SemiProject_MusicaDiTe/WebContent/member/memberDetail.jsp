<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.boardloc {
	position: absolute;
	left: 600px;
	top: 220px;
}

.leftloc {
	position: absolute;
	left: 150px;
	top: 300px;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#modify").click(function() {
			location.href = "memberPw.mem"
		});
		$("#memDel").click(function() {
			location.href = "memberUserDel.mem"
		});
		$("#pwModify").click(function() {
			location.href = "memberPwForm.mem"
		});
	});
</script>

<script langauge="javascript">
	function showPopup() {

		window.open("../mem/memberPw.mem", "a",
				"width=600, height=600, left=600, top=50");
	}

	function showPopup2() {
		window.open("../mem/memberPwForm.mem", "a",
				"width=600, height=600, left=600, top=50");
	}

	function showPopup3() {
		window.open("../mem/memberUserDel.mem", "a",
				"width=600, height=600, left=600, top=50");
	}
</script>
<style>
div {
	align: center;
}

.boardloc2 {
	position: absolute;
	left: 250px;
	top: 400px;
}

.boardloc3 {
	position: absolute;
	left: 590px;
	top: 410px;
}

a {
	color: black;
}

.boardloc {
	position: absolute;
	left: 550px;
	top: 300px;
}
</style>
</head>
<body>


	<%@ include file="../main/fixMenu.jsp"%>


	<div class="boardloc">

		<table class="table1">
			<tr>
				<td><a onclick="showPopup();">개인정보 수정하기 |&nbsp;</a></td>
				<td><a onclick="showPopup2();">비밀번호 변경하기 |&nbsp;</a></td>
				<td><a onclick="showPopup3();">탈퇴하기&nbsp;</a></td>

			</tr>
		</table>
	</div>

	<div class="boardloc2">
		<table>

			<tr>
				<td>
					<p>
						<img alt="프로필 사진" src="../images/ff.PNG" width="110px"
							height="120px" />
					</p>
				</td>
			</tr>

			<tr>
				<td>
					<p>${dto.userName}님의개인정보</p>
				</td>
			</tr>
		</table>


	</div>

	<div class="boardloc3">

		<div class="center-block" style='width: 760px'>
			<table class="table table-bordered" style="width: 50%">
				<tr>
					<td>이름</td>
					<td>${dto.userName }</td>
				</tr>

				<tr>
					<td>아이디</td>
					<td>${dto.userId }</td>
				</tr>

				<tr>
					<td>생년월일</td>
					<td>${dto.userBirth }</td>
				</tr>

				<tr>
					<td>연락처 1</td>
					<td>${dto.userPh1}</td>
				</tr>

				<tr>
					<td>연락처 2</td>
					<td>${dto.userPh2}</td>
				</tr>

				<tr>
					<td>등록일</td>
					<td>${dto.userRegist  }</td>
				</tr>


				<tr>
					<td>주소</td>
					<td>${dto.userAddr }</td>
				</tr>


			</table>
		</div>
	</div>





</body>
</html>