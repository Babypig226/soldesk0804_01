<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>login.jsp</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		$("#logSubmit").click(function() {
			if ($("#userId").val() == "") {
				$("#idmsg").html("아이디를 입력하세요. ");
				$("#userId").focus();
				return false;
			}
			if ($("#userPw").val() == "") {
				$("#pwmsg").html("비밀번호를 입력하세요. ");
				$("userPw").focus();
				return false;
			}
			$("#frm").submit();
		});
	});
</script>
<script langauge="javascript">
	function showPopup() {

		window.open("../mem/idCk.mem", "아이디 찾기",
				"width=600, height=600, left=600, top=50");
	}

	function showPopup2() {
		window.open("", "비밀번호 찾기",
				"width=600, height=600, left=600, top=50");
	}

	
</script>
<style type="text/css">
a {
	text-decoration: none /* 텍스트 밑줄간거 없애기 */
}

#idmsg, #pwmsg {
	color: gray;
	align: right;
}

.boardloc {
	position: absolute;
	left: 720px;
	top: 100px;
}
</style>
</head>
<body>
	<form action="loginPro.main" name="frm" id="frm" method="post">
		<table border=0 align="center" class="boardloc">
			<tr align="center">
				<td colspan=3><input type="image" src="../images/logo.png"
					width="250" height="150" id="logoImg" /></td>
			</tr>

			<tr>
				<td colspan=3 align="center">안녕하세요. Musica di Te 입니다.</td>
			</tr>

			<tr>
				<td>&nbsp;</td>
			</tr>

			<tr align="center">
				<td colspan="3">자동로그인 <input type="checkbox" name="autologin"
					value="auto"> &nbsp;&nbsp;&nbsp;&nbsp; 아이디 저장 <input
					type="checkbox" name="idStore" value="store"
					<c:if test = "${!empty isId}"> checked </c:if> /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr align="center">
				<td>아이디</td>
				<td><input type="text" name="userId" id="userId"
					value="${isId }" />
					<div id="idmsg"></div></td>

				<td rowspan=3></td>
			</tr>

			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr align="center">
				<td>비밀번호</td>
				<td><input type="password" name="userPw" id="userPw" />
					<div id="pwmsg"></div></td>
			</tr>

			<tr align="center">
				<td colspan=2><a onclick="showPopup();">아이디 찾기</a>&nbsp; <a
					href="#">비밀번호 찾기 </a>&nbsp;</td>
			</tr>

			<tr align="center">
				<td colspan=3><input type="button" class="btn" value="로그인"
					width="20" height="20" id="logSubmit" /> <input type="button"
					class="btn" value="회원가입" width="20" height="20" id="regSubmit"
					onclick="javascript:location.href='../mem/memberAgree.mem';" /></td>
			</tr>

		</table>
	</form>
	<!--  로그인이 된 경우 -->
</body>
</html>