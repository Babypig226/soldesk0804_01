<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
#p1 {
	color: gray;
}

#p2 {
	text-align: right;
}

.boardloc {
	position: absolute;
	left: 120px;
	top: 300px;
}
</style>
<body>

	<%@ include file="../main/fixMenu.jsp"%>


	<div class="boardloc">
		<h3>1:1 문의 게시판</h3>
		<p id="p1">1:1 게시판에 글을 남겨주시면 빠른 시일 내에 답변하도록 하겠습니다.</p>

		<table>

		</table>

		<table class="table table-hover" style="width: 500px">
			<c:if test="${!empty list }">
				<p id="p2">
					<font size=2><b>글 개수 : ${count }</b></font>
				</p>
				<tr align="center" valign="middle" bordercolor="#333333">
					<td>
						<div align="center">번호</div>

					</td>
					<td>
						<div align="center">제목</div>
					</td>
					<td>이름</td>
					<td>
						<div align="center">날짜</div>
					</td>

					<td>
						<div align="center">조회수</div>
					</td>
				</tr>
				<c:forEach items="${list }" var="dto" varStatus="cnt">
					<tr align="center" valign="middle" bordercolor="#333333">
						<td height="23">${dto.boardNum}</td>
						<td><c:forEach begin="1" end="${dto.boardReLev }" step="1">
								▶
							</c:forEach> <a href="cenBoardDetail.cen?boardNum=${dto.boardNum }">
								${dto.centerSubject }</a></td>
						<td><div align="center">${dto.centerName }</div></td>
						<td><div align="center"><fmt:formatDate value = "${dto.centerDate }" type = "date" pattern = "yyyy-MM-dd"/></div></td>
						<td><div align="center">${dto.readCount }</div></td>
					</tr>
				</c:forEach>
				<tr align=center height=20>
					<td colspan=7 style="font-family: Tahoma; font-size: 10pt;"><%@ include
							file="/include/includePage.jsp"%></td>
				</tr>
			</c:if>
			<c:if test="${empty list }">
				<tr align="center" valign="middle">
					
					<td align=center><font size=2>등록된 글이 없습니다.</font></td>
				</tr>
			</c:if>
			<tr align="right">
				<td colspan="5"><input type="button" class="btn" value="글쓰기 "
					onclick="javascript:location.href='cenWrite.cen';" /></td>

			</tr>
		</table>


		<a style="display: scroll; position: fixed; bottom: 5px; right: 5px;"
			href="#" title="맨위로"><img src="../images/pageUpDown.PNG"
			width="100" height="100"></a>
	</div>
</body>
</html>