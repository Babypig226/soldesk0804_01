<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/include.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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

	<div class="boardloc">
		<table class="table table-hover" style="width: 600px">
			<tr align="center" valign="middle">
				<td colspan="2">1:1 문의</td>
			</tr>
			<tr>
				<td height="12" style="font-family: 돋음; font-size: 12">
					<div align="center">글쓴이</div>
				<td>${dto.centerName }</td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">제 목&nbsp;&nbsp;</div>
				</td>

				<td style="font-family: 돋음; font-size: 12">${dto.centerSubject }
				</td>
			</tr>

			<tr bgcolor="cccccc">
				<td colspan="2" style="height: 1px;"></td>
			</tr>
			<tr>
				<td height="12" style="font-family: 돋음; font-size: 12">
					<div align="center">내 용</div>
				</td>
				<td style="font-family: 돋음; font-size: 12">
					<table border=0 width=490 height=250 style="table-layout: fixed">
						<tr>
							<td valign=top style="font-family: 돋음; font-size: 12">
								${fn:replace(dto.centerContent,cn,br)}</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12">
					<div align="center">첨부파일</div>
				</td>
				<td style="font-family: 돋음; font-size: 12"><a
					href="../center/upload/${dto.storeFileName }">
						${dto.originalFileName } </a><br /></td>
			</tr>
			<tr bgcolor="cccccc">
				<td colspan="2" style="height: 1px;"></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>

			<!-- <tr align="center" valign="middle">
				<td colspan="5"><font size=2> <a
						href="cenBoardReply.cen?boardNum=${dto.boardNum }"> [답변] </a>&nbsp;&nbsp;
						<a href="cenBoardModify.cen?boardNum=${dto.boardNum }"> [수정] </a>&nbsp;&nbsp;
						<a href="cenBoardDelete.cen?boardNum=${dto.boardNum }"> [삭제] </a>&nbsp;&nbsp;
						<a href="cenBoardList.cen">[목록]</a>&nbsp;&nbsp;
				</font></td>
			</tr>
 -->


		</table>

		<div>
			<table align="center">
				<tr>
					<td><input type="button" class="btn" value="답변 "
						onclick="javascript:location.href='cenBoardReply.cen?boardNum=${dto.boardNum }';" />&nbsp;&nbsp;</td>
					<td><input type="button" class="btn" value="수정 "
						onclick="javascript:location.href='cenBoardModify.cen?boardNum=${dto.boardNum }';" />&nbsp;&nbsp;</td>
					<td><input type="button" class="btn" value="삭제 "
						onclick="javascript:location.href='cenBoardDelete.cen?boardNum=${dto.boardNum }';" />&nbsp;&nbsp;</td>
					<td><input type="button" class="btn" value="목록 "
						onclick="javascript:location.href='cenBoardList.cen';" /></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>