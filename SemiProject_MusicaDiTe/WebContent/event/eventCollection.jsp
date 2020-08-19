<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eventCollection.jsp</title>
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
<script>
	function eventDel(num) {
		if (confirm("삭제하시겠습니까?")) {
			location.href = "eveDelete.cb?eventNo=" + num
		}
	}
</script>
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
	<a style="display: scroll; position: fixed; bottom: 5px; right: 5px;"
			href="#" title="맨위로"><img src="../images/pageUpDown.PNG"
			width="100" height="100"></a>
	
	
	
		<table class="table table-hover" style="width: 600px">
			<tr align="center" valign="middle">
				<td height="16">아이디</td>
				<td >${eveReDTO.eventDTO.euserId }</td>
			</tr>
			<tr>
				<td>글번호</td>
				<td>${eveReDTO.eventDTO.eventNo }</td>
			</tr>
			<tr>
				<td>글제목</td>
				<td>${eveReDTO.eventDTO.eventSubject }</td>
			</tr>
			<tr>
				<td>글내용</td>
				<td>${fn:replace(eveReDTO.eventDTO.eventContent,cn,br) }</td>
			</tr>
			<tr >
				<td>작성일</td>
				<td><fmt:formatDate value="${eveReDTO.eventDTO.regDate }"
						type="date" pattern='yyyy-MM-dd' /></td>
			</tr>

		</table>


		<div>
			<table align="center">
				<tr>
					<td><input type="button" class="btn" value="수정 "
						onclick="javascript:location.href='eveModify.eve?eventNo=${eveReDTO.eventDTO.eventNo }';" />&nbsp;&nbsp;</td>
					<td><input type="button" class="btn" value="삭제 "
						onclick="javascript:location.href='eveDelete.eve?eventNo=${eveReDTO.eventDTO.eventNo }';" />&nbsp;&nbsp;</td>

				</tr>
			</table>
		</div>

		<p>
		<form action="replyInsert.eve" method="get" name="frm">
			▒☞댓글을 작성해주세요. <br /> <br />
			<textarea rows="3" cols="50" name="replyContent"></textarea>
			<input type="hidden" name="eventNo"
				value="${eveReDTO.eventDTO.eventNo }" /> &nbsp;<input type="submit"
				class="btn" value="전송">
		</form>&nbsp;&nbsp;
		</p>
		<p align="center">---Musica Di Te 댓글 현황---</p>
		<br />
		<c:forEach items="${eveReDTO.replies }" var="reply">
			<c:if test="${reply.replyNo != 0}">
				<table class="table table-hover" style="width: 300px">
					<tr>
						<td>&nbsp;&nbsp;</td>
						<td>&nbsp;&nbsp;</td>
					</tr>

					<tr>
						<td><b>「No.${reply.replyNo }</b></td>
					</tr>
					<tr>
						<td><b>답글작성자</b></td>
						<td>${reply.ruserId }님</td>
					</tr>
					<tr>
						<td><b>답글내용</b></td>
						<td>${reply.replyContent }</td>
					</tr>
					<tr>
						<td><b>답글작성일시</b></td>
						<td>${reply.regDate }」</td>
					</tr>

					<tr>
						<td>&nbsp;&nbsp;</td>
						<td>&nbsp;&nbsp;</td>
					</tr>

				</table>
				<!-- 
				<img src="" alt="수정하기" title="수정하기" />
				<img src="" alt="삭제하기" title="삭제하기" /> -->
			</c:if>
		</c:forEach>
	</div>
</body>
</html>