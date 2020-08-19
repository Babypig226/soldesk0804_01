<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pwModify.jsp</title>
<style>
.logoloc {
	position: absolute;
	left: 150px;
	top: 0px;
}

.contentloc {
	position: absolute;
	left: 150px;
	top: 200px;
}
</style>

</head>
<body>

	<form action="pwModify1.mem" method="post" name="frm">

		<div class="logoloc">
			<tr>
				<td colspan=3><input type="image" src="../images/mlogo.png"
					width="250" height="250" id="logoImg" /></td>
			</tr>
		</div>

		<div class="contentloc">
			<p align="center">
				현재 비밀번호 : <input type="password" name="userPw" id="pw" />
			</p>

			<br /> <br />
			<p align="center">
				<input type="submit" value="확인" />
			</p>
		</div>
	</form>
</body>
</html>