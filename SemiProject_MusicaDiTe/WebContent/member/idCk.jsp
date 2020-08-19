<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.logoloc {
	position: absolute;
	left: 150px;
	top: 0px;
}

.contentloc {
	position: absolute;
	left: 120px;
	top: 200px;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<form action="idCkPro.mem" name="frm" method="post">
		<div class="logoloc">
			<tr>
				<td colspan=3><input type="image" src="../images/mlogo.png"
					width="250" height="250" id="logoImg" /></td>
			</tr>
		</div>
		<div class="contentloc">
			<table class="table table-borderless">
				<tr>
					<td align="center" colspan=2>아이디 찾기</td>
				</tr>
				<tr>
					<td>이메일을 입력하세요</td>
					<td><input type="email" name="userEmail" id="userEmail" /></td>
				</tr>

				<tr>
					<td>전화번호를 입력하세요</td>
					<td><input type="text" name="userPh1" id="userPh1"
						placeholder="010-0000-0000" /></td>
				</tr>

			</table>
			<p align="center">
				<button type="submit" class="btn">다음으로</button>
			</p>
		</div>
	</form>
</body>
</html>