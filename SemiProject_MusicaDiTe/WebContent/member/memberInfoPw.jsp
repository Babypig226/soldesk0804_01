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
<script type="text/javascript">
	/*$(function() {
	 if ($('#chk').val() == 0){
	
	 alert('비번 틀림');
	 return false;
	 }
	 }); */
</script>
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
</head>
<body>

	<form action="memberInfoCng.mem" method="post" name="frm">
		<!-- <input type="hidden" id="chk" value="${chk}"> -->
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
				<input type="submit" class="btn" value="확인" />
			</p>

		</div>
	</form>
</body>
</html>