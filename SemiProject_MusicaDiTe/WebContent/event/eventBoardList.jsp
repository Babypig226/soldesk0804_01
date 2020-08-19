<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>이벤트 게시판</title>
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
<body>

	<%@ include file="../main/fixMenu.jsp"%>


	<a style="display: scroll; position: fixed; bottom: 5px; right: 5px;"
		href="#" title="맨위로"><img src="../images/pageUpDown.PNG"
		width="100" height="100"></a>
	<div class="boardloc">
		<h3>이벤트 게시판</h3>
		<p>musica di te가 준비한 작은 선물</p>
		<p id="p1">보관기간 : 등록일로부터 한달이며 그 이후 폐기처리 됩니다.</p>




		<table class="table table-hover" style="width: 700px">

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


				</tr>
				<c:forEach items="${list }" var="dto" varStatus="cnt">
						<tr align="center" valign="middle" bordercolor="#333333">
						<td>${cnt.count }</td>
						<td><a href="eveDetail.eve?eventNo=${dto.eventNo }">
								${dto.eventSubject }</a></td>
						<td>${dto.euserId }</td>
						<td><fmt:formatDate value="${dto.regDate }" type="date"
								pattern="yyyy-MM-dd" /></td>

					</tr>
				</c:forEach>
				<tr align=center height=20>
					<td colspan=7 style="font-family: Tahoma; font-size: 10pt;"><%@ include
							file="/include/includePage.jsp"%></td>
				</tr>
			</c:if>


			<c:if test="${empty list }">
				<!-- 아무것도 없을 때 -->
				<tr align="center" valign="middle">

					<td align=center><font size=2>등록된 글이 없습니다.</font></td>
				</tr>
			</c:if>
			<tr align="right">
				<c:if test = '${logId == "admin"}'><td colspan="5"><input type="button" class="btn" value="글쓰기 "
					width="20" height="20"
					onclick="javascript:location.href='eveForm.eve';" /></c:if></td>
			</tr>



		</table>

		<a style="display: scroll; position: fixed; bottom: 5px; right: 5px;"
			href="#" title="맨위로"><img src="../images/pageUpDown.PNG"
			width="100" height="100"></a>
	</div>
</body>
</html>