<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
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

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		$("#modify").click(function() {
			$("#frm").submit();
		});
		$("#memDel").click(function() {

			location.href = "memPw.nhn";
		})
	});
</script>
</head>
<body>
	<form name="frm" id="frm" method="post"
		action="memberInfoModifyPro.mem">
		<input type="hidden" name="memChk" value="${memChk }" /> <input
			type="hidden" name="id" value="${dto.userId }" />

		<div class="logoloc">
			<tr>
				<td colspan=3><input type="image" src="../images/mlogo.png"
					width="250" height="250" id="logoImg" /></td>
			</tr>
		</div>

		<div class="contentloc">

			<p align="center">회원정보 수정</p>
			<table class="table table-bordered">

				<tr>
					<td>아이디</td>
					<td>${dto.userId }</td>
				</tr>
				<tr>
					<td>사용자 이름</td>
					<td>${dto.userName }</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><fmt:formatDate value="${dto.userBirth }" type="date"
							pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<td>사용자 비밀번호</td>
					<td><input type="password" id="userPw" name="userPw" value="" /></td>
				</tr>
				<tr>
					<td>사용자 이메일</td>
					<td><input type="text" id="email" name="userEmail"
						value="${dto.userEmail }" /></td>
				</tr>
				<tr>
					<td>사용자 주소</td>
					<td><input type="text" id="addr" name="userAddr"
						value="${dto.userAddr }" /></td>
				</tr>
				<tr>
					<td>연락처 1</td>
					<td><input type="text" id="memberPh1" name="userPh1"
						value="${dto.userPh1 }" /></td>
				</tr>
				<tr>
					<td>연락처 2</td>
					<td><input type="text" id="memberPh2" name="userPh2"
						value="${dto.userPh2 }" /></td>
				</tr>

			</table>

			<table align="center">
				<tr >
					<td colspan=1>&nbsp;&nbsp;<input type="button" class="btn"
						name="modify" id="modify" value="수   정"></td>
					<td><input type="button" class="btn" value="취  소"
						onclick="javascript:history.back();" /></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>