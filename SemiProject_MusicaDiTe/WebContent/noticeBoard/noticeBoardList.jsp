<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/include/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>공지사항 게시판</title>
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

#p2 {
	text-align: right;
}

.boardloc {
	position: absolute;
	left: 120px;
	top: 300px;
}
</style>
</head>
<body>


	<%@ include file="../main/fixMenu.jsp"%>


	<div class="boardloc">
		<h3>공지사항 게시판</h3>
		<p></p>
		<p id="p1">Musica Di Te에서 알립니다.</p>
		<a style="display: scroll; position: fixed; bottom: 5px; right: 5px;"
			href="#" title="맨위로"><img src="../images/pageUpDown.PNG"
			width="100" height="100"></a>

		<p id="p2">
			<font size=2><b>글 개수 : ${count }</b></font>
		</p>
<table class="table table-hover" style="width: 700px">



			<c:if test="${!empty list }">


				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<c:forEach items="${list }" var="dto" varStatus="cnt">
					<tbody>
						<tr>
							<td>${dto.noticeNum }</td>
							<td><a href="notBoardDetail.not?num=${dto.noticeNum}">${dto.noticeSubject }</a></td>
							<td>${dto.noticeName }</td>
							<td><fmt:formatDate value = "${dto.noticeDate }" type = "date" pattern = "yyyy-MM-dd"/></td>
							<td>${dto.readCount }</td>
						</tr>
					</tbody>
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
				<c:if test = '${logId == "admin"}'><td colspan="5"><input type="button" class="btn" value="글쓰기 "
					onclick="javascript:location.href='notBoardForm.not';" /></td></c:if>
			</tr>
		</table>
	</div>
</body>
</html>