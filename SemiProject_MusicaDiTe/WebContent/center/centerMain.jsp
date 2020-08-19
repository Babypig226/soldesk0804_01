<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
   function login(){
      alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.');
      location.href = '../login/login.main'
   }
   </script>
<style type="text/css">
#p1 {
	color: gray;
}

.boardloc {
	position: absolute;
	left: 120px;
	top: 300px;
}

.boardloc2 {
	position: absolute;
	left: 650px;
	top: 299px;
}
</style>
</head>
<body>


	<%@ include file="../main/fixMenu.jsp"%>



	<div class="boardloc">

		<h3>MUSICA DI TE 고객센터</h3>
		<p>궁금하신 사항이 있으시다면 언제든지 문의해주시기 바랍니다.</p>
		<p id="p1">
			고객센터 연결이 힘드신 경우 <c:if test = '${logId != null}'><a href="cenBoardList.cen">1:1문의</a></c:if> <c:if test = '${logId == null}'><a href = "javascript:login();">1:1문의</a></c:if>를 이용하시면 빠르게 답변
			드리겠습니다.
		</p>

	</div>

	<div class="boardloc2">
	
		<a style="display: scroll; position: fixed; bottom: 5px; right: 5px;"
			href="#" title="맨위로"><img src="../images/pageUpDown.PNG"
			width="100" height="100"></a>
	
		<%@ include file="oftenAnsBoardList.jsp"%>
	</div>
</body>
</html>