<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.boardloc {
	position: absolute;
	left: 600px;
	top: 220px;
}

.leftloc {
	position: absolute;
	left: 150px;
	top: 300px;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#modify").click(function() {
			location.href = "memberPw.mem"
		});
		$("#memDel").click(function() {
			location.href = "memberUserDel.mem"
		});
		$("#pwModify").click(function() {
			location.href = "memberPwForm.mem"
		});
	});
</script>
<style>
div {
	align: center;
}
</style>
</head>
<body>

	<div class="leftloc">
		<table class="table table-bordered" style="width: 100%">
			<tr>
				<td><a href="#">예매내역</a></td>
			</tr>
			<tr>
				<td><a href="#">${dto.userName}님이 남긴 리뷰</a></td>
			</tr>
			<tr>
				<td><a href="#">1:1 질문</a></td>
			</tr>
			<tr>
				<td><a href="#">개인 정보 수정</a></td>
			</tr>
		</table>
	</div>


	<div class="mSideloc">
		<%@ include file="../main/fixMenu.jsp"%>
	</div>










</body>
</html>