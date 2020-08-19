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
<script type="text/javascript">
	$(function() {
		$("#sbm").click(function() {
			if ($("#pw").val() == "") {
				alert("현재 비밀번호를 입력하세요.");
				$("#pw").focus();
				return false;
			}
			if ($("#newPw").val() == "") {
				alert("새 비밀번호를 입력하세요.");
				$("#newPw").focus();
				return false;
			}
			if ($("#newPw").val() != $("#reNewPw").val()) {
				alert("비밀번호확인이 일치하지 않습니다.");
				$("#reNewPw").focus();
				return false;
			}
			$("#frm").submit();
		});
	});
</script>

<!-- 현재비밀번호 : <input type="password" name = "pw" 
	             id ="pw" /><br />
	새 비밀번호 : <input type="password" name = "newPw" 
	             id ="newPw" /><br />
	새 비밀번호 확인 : <input type="password" name = "reNewPw" 
	             id ="reNewPw" /><br />
	<input type="button" value = "비밀번호변경" id ="sbm"/> -->
</head>
<body>
	<div align="center">
		<form action="pwModifyPro.mem" method="post" name="frm" id="frm">

			<div class="logoloc">
				<tr>
					<td colspan=3><input type="image" src="../images/mlogo.png"
						width="250" height="250" id="logoImg" /></td>
				</tr>
			</div>
			
			<div class="contentloc" >

				<table class="table table-bordered" >

					<tr>
						<td>현재비밀번호</td>
						<td><input type="password" name="pw" id="pw" /></td>
					</tr>

					<tr>
						<td>새 비밀번호</td>
						<td><input type="password" name="newPw" id="newPw" /></td>
					</tr>

					<tr>
						<td>새 비밀번호 확인</td>
						<td><input type="password" name="reNewPw" id="reNewPw" /></td>
					</tr>
				</table>

				<input type="button" class="btn" value="비밀번호변경" id="sbm" />
			</div>
		</form>
	</div>
</body>
</html>