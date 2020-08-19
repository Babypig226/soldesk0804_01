<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>메인페이지</title>
<style>
#footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 10px;
}

.logoloc {
	position: fixed;
	left: 70px;
	top: 0px;
}

.mSideloc {
	position: absolute;
	left: 500px;
	top: 90px;
}

.mSide3loc {
	position: fixed;
	left: 350px;
	top: 100px;
}

.boardloc {
	position: absolute;
	left: 120px;
	top: 320px;
}
</style>
</head>
<body>

	<div class="logoloc">
		<tr>
			<td colspan=3><input type="image" src="./images/mlogo.png"
				width="250" height="250" id="logoImg" /></td>
		</tr>
	</div>
	<div class="mSideloc">
		<%@ include file="mSide4.jsp"%>
	</div>


	<div class="boardloc">
		<%@ include file="main2.jsp"%>

		<%@ include file="mBoardClick.jsp"%>


		<a style="display: scroll; position: fixed; bottom: 5px; right: 5px;"
			href="#" title="맨위로"><img src="./images/pageUpDown.PNG"
			width="100" height="100"></a>


		<table class="table1">
			<tr>
				<td><a href="#">사이트맵&nbsp;</a></td>
				<td><a href="#">이용약관 정책&nbsp;</a></td>
				<td><a href="#">개인정보처리방침&nbsp;</a></td>
				<td><a href="#">홈페이지저작권보호&nbsp;</a></td>

			</tr>
		</table>



		<p>(주)Musica di Te</p>
		<p>
			서울 종로구 종로12길 15 코아빌딩1 | 대표자 냐옹이 | 사업자 등록번호 970-82-053263 | 통신판매업신고 종로
			제 0142호 <br /> Musica di Te 고객센터 : 02-123-4567 (AM 09:00 - PM 08:00)
			| webmusicadite@cs.kr copyrightⓒ2017 Seoul Arts Center All rights
			Reserved.
		</p>
	</div>

</body>
</html>