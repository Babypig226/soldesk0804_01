<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

	<div class="boardloc">
		<table class="table table-hover" style="width: 600px">
			<tr align="center" valign="middle">
				<td colspan="5">공지사항 게시판</td>
			</tr>

			<tr>
				<td height="16">제 목&nbsp;&nbsp;</td>
				<td>${list[0].noticeSubject }</td>
			</tr>
			<tr bgcolor="cccccc">
				<td colspan="2" style="height: 1px;"></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td>
					<table border=0 width=490 height=250>
						<tr>
							<td valign=top>${fn:replace(list[0].noticeContent,cn,br)}</td>
						</tr>
					</table>
				</td>
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

					<td><input type="button" class="btn" value="수정 "
						onclick="javascript:location.href='notBoardModify.not?num=${list[0].noticeNum }';" />&nbsp;&nbsp;</td>
					<td><input type="button" class="btn" value="삭제 "
						onclick="javascript:location.href='notBoardDel.not?num=${list[0].noticeNum }';" />&nbsp;&nbsp;</td>
					<td><input type="button" class="btn" value="목록 "
						onclick="javascript:location.href='notBoardList.not';" /></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>