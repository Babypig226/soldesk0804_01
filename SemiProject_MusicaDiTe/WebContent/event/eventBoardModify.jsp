<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/include.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<form action="eveModifyPro.eve" name="frm" method="post">
		<input type="hidden" name="eventNo"
			value="${eveReDTO.eventDTO.eventNo }" />
		<div class="boardloc">
				<table class="table table-hover" style="width: 600px">
			<tr align="center" valign="middle">
		
					<td>아이디</td>
					<td>${eveReDTO.eventDTO.euserId }</td>


				</tr>
				<tr>
					<td>글번호</td>
					<td>${eveReDTO.eventDTO.eventNo }</td>

				</tr>
				<tr>
					<td>글제목</td>
					<td><input type="text" name="eventSubject"
						value="${eveReDTO.eventDTO.eventSubject }"></td>
				</tr>
				<tr>
					<td>글내용</td>
					<td><textarea rows="5" cols="50" name="eventContent">${fn:replace(eveReDTO.eventDTO.eventContent,cn,br) }</textarea><br /></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><fmt:formatDate value="${eveReDTO.eventDTO.regDate }"
							type="date" pattern='yyyy-MM-dd' /></td>
				</tr>

			</table>


			<div>
				<table align="center">
					<tr>
						<td><input type="button" class="btn" value="수정 "
							onclick="javascript:submit();" />&nbsp;&nbsp;</td>
						<td><input type="button" class="btn" value="뒤로 "
							onclick="javascript:history.go(-1);" />&nbsp;&nbsp;</td>
					</tr>
				</table>
			</div>


		</div>
	</form>
</body>
</html>