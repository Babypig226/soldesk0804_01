<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/include.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분실물 게시판</title>
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

.logoloc {
	position: absolute;
	left: 650px;
	top: 10px;
}

.boardloc {
	position: absolute;
	left: 500px;
	top: 220px;
}
</style>
</head>
<body>

	<div class="logoloc">
		<tr>
			<td colspan=3><input type="image" src="../images/mlogo.png"
				onclick="javascript:location.href='../main.main';" width="250"
				height="250" id="logoImg" /></td>
		</tr>
	</div>
	<form name="deleteForm" action="lostBoardDelPro.lost" method="post">
		<input type="hidden" name="boardNum" value="${boardNum }">

		<div class="boardloc">
			<table class="table table-hover" style="width: 600px">
				<tr>
					<td><font size=2>글 비밀번호 : </font></td>
					<td><input name="boardPass" type="password"></td>
				</tr>
				
				<tr>
					<td colspan=2></td>
				</tr>
			</table>

			<div>
				<table align="center">
					<tr>
						<td><input type="button" class="btn" value="삭제 "
							onclick="javascript:deleteForm.submit();" />&nbsp;&nbsp;&nbsp;</td>
						<td><input type="button" class="btn" value="취소"
							onclick="javascript:history.go(-1);" /></td>
					</tr>


				</table>
			</div>
		</div>
	</form>
</body>
</html>