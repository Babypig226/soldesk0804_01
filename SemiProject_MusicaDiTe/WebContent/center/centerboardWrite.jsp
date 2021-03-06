<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/include.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
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


	<form action="cenBoardWritePro.cen" method="POST" name="frm"
		enctype="multipart/form-data">

		<div class="boardloc">
			<table class="table table-hover" style="width: 600px">
				<tr align="center" valign="middle">
					<td colspan="5">1:1문의 게시판</td>
				</tr>
				<tr>
					<td style="font-family: 돋음; font-size: 12" height="16">
						<div align="center">글쓴이</div>
					</td>
					<td><input type="text" name="centerName" size="10"
						maxlength="10" value="" /></td>
				</tr>
				<tr>
					<td style="font-family: 돋음; font-size: 12" height="16">
						<div align="center">비밀번호</div>
					</td>
					<td><input type="password" name="centerPass" size="10"
						maxlength="10" value="" /></td>
				</tr>
				<tr>
					<td style="font-family: 돋음; font-size: 12" height="16">
						<div align="center">제 목</div>
					</td>
					<td><input type="text" name="centerSubject" size="50"
						maxlength="100" value="" /></td>
				</tr>
				<tr>
					<td style="font-family: 돋음; font-size: 12">
						<div align="center">내 용</div>
					</td>
					<td><textarea name="centerContent" cols="67" rows="15"></textarea>
					</td>
				</tr>
				<tr>
					<td>파일</td>
					<td><input type="file" name="fileUp"></td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>

			</table>
		
			<table align="center">
				<tr>

					<td><input type="button" class="btn" value="등록 "
						onclick="javascript:frm.submit();" />&nbsp;&nbsp;</td>

					<td><input type="button" class="btn" value="목록 "
						onclick="javascript:location.href='cenBoardList.cen';" /></td>
				</tr>
			</table>


		</div>
	</form>
</body>
</html>