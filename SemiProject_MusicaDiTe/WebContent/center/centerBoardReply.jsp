<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#</title>
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

	<form action="cenBoardReplyPro.cen" method="post" name="frm">
		<input type="hidden" name="boardNum" value="${dto.boardNum }" /> <input
			type="hidden" name="boardReRef" value="${dto.boardReRef }" /> <input
			type="hidden" name="boardReLev" value="${dto.boardReLev }" /> <input
			type="hidden" name="boardReSeq" value="${dto.boardReSeq }" />

		<div class="boardloc">
			<table class="table table-hover" style="width: 600px">
				<tr align="center" valign="middle">
					<td colspan="2">MVC 게시판</td>
				</tr>
				<tr>
					<td style="font-family: 돋음; font-size: 12" height="16">
						<div align="center">글쓴이</div>
					</td>
					<td><input type="text" name="centerName" /></td>
				</tr>
				<tr>
					<td style="font-family: 돋음; font-size: 12" height="16">
						<div align="center">제 목</div>
					</td>
					<td><input type="text" name="centerSubject" size="50"
						maxlength="100" value="RE: ${dto.centerSubject }" /></td>
				</tr>
				<tr>
					<td style="font-family: 돋음; font-size: 12">
						<div align="center">내 용</div>
					</td>
					<td><textarea name="centerContent" cols="67" rows="15" />&#10;&#10;=============================================================&#10;${dto.centerContent }</textarea>
					</td>
				</tr>
				<tr>
					<td style="font-family: 돋음; font-size: 12">
						<div align="center">비밀번호</div>
					</td>
					<td><input type="password" name="centerPass" /></td>
				</tr>

				<tr bgcolor="cccccc">
					<td colspan="2" style="height: 1px;"></td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>


			</table>


			<div>
				<table align="center">
					<tr>
						<td><input type="button" class="btn" value="등록 "
							onclick="javascript:frm.submit();" />&nbsp;&nbsp;&nbsp;</td>
						<td><input type="button" class="btn" value="취소 "
							onclick="javascript:history.go(-1);" /></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</body>
</html>