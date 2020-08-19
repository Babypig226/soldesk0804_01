<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/include.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분실물 게시글 수정</title>
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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.1.js"></script>

<script type="text/javascript">
	$(function() {
		$("#btn").click(function() {
			if ($(this).attr("value") == "삭제") {
				$(this).attr("value", "삭제취소");
				$("#fileDel").val("${list[0].storeFileName}");
				$("#chnFile").html("<input type='file' name='fileUp' />");
			} else {
				$(this).attr("value", "삭제")
				$("#fileDel").val("");
				$("#chnFile").html("");
			}
		});
	});
	function modifyboard() {
		modifyform.submit();
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

	<form action="lostBoardModifyPro.lost" method="post" name="modifyform"
		enctype="multipart/form-data">

		<div class="boardloc">
			<table class="table " style="width: 600px">
				<tr align="center" valign="middle">
					<td colspan="5">분실물 게시판</td>
				</tr>
				<tr>
					<td height="16" style="font-family: 돋음; font-size: 12">
						<div align="center">제 목</div>
					</td>
					<td><input name="boardSubject" size="50" maxlength="100"
						value="${list[0].boardSubject }"></td>
				</tr>
				<tr>
					<td style="font-family: 돋음; font-size: 12">
						<div align="center">내 용</div>
					</td>
					<td><textarea name="boardContent" cols="67" rows="15">${list[0].boardContent }</textarea>
					</td>
				</tr>
				<tr>
					<td>파일</td>
					<td>원본 파일명 : ${list[0].originalFileName }<br /> 저장된 파일 명 :
						${list[0].storeFileName} <input type="button" id="btn" value="삭제" />
					</td>
				</tr>
				<tr>
					<td>변경할 파일</td>
					<td><div id="chnFile"></div></td>
				</tr>
				<tr>
					<td height="16" style="font-family: 돋음; font-size: 12">
						<div align="center">비밀번호</div>
					</td>
					<td><input name="boardPass" type="password"></td>
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
							onclick="javascript:modifyboard();" />&nbsp;&nbsp;</td>
						<td><input type="button" class="btn" value="뒤로 "
							onclick="javascript:history.go(-1);" />&nbsp;&nbsp;</td>
					</tr>
				</table>
			</div>


		</div>
		<input type="hidden" name="fileDel" id="fileDel" /> <input
			type="text" name="boardNum" value="${list[0].boardNum }" />
	</form>
</body>
</html>