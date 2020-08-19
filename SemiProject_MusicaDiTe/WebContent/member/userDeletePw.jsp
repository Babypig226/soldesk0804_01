<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/include.jsp"%>

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
	left: 160px;
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

<script type="text/javascript">
	$(function() {
		$("#bts").click(function() {
			if ($("#pw").val() == "") {
				alert("비밀번호를 입력해 주세요...");
				$("#pw").focus();
				return false;
			}
			if (confirm("탈퇴하시겠습니까?")) {
				$("#frm").submit();
			}
		});
	});
</script>
</head>
<body>

	<div class="logoloc">
		<tr>
			<td colspan=3><input type="image" src="../images/mlogo.png"
				width="250" height="250" id="logoImg" /></td>
		</tr>
	</div>

	
		<form action="memberUserDelPro.mem" method="post" name="frm" id="frm">
	<div class="contentloc">
			비밀번호 : <input type="password" name="userPw" id="pw" /><br /> <br />
			<p align="center">
			<input type="button" class="btn" value="확인" id="bts" />
			</p>
		
	</div>
</form>




</body>
</html>