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

.boardloc {
	position: absolute;
	left: 190px;
	top: 220px;
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

<div class="logoloc">
			<tr>
				<td colspan=3><input type="image" src="../images/mlogo.png"
					width="250" height="250" id="logoImg" /></td>
			</tr>
		</div>
	
	<div class="boardloc">
	회원님의 아이디는 <b>${userId }</b> 입니다.<br /><br /><br />
	<p align="center">
			<input type="button" class="btn" value="확인" onClick="window.close()" />
		</p>
	</div>
</body>
</html>