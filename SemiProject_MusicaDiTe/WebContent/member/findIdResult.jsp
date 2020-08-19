<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.8.1.min.js"></script>
</head>
<body>
	
	<div>
   <input type="image" onclick="javascript:location.href='main.jsp';" src="../images/logo.png"
      width="130" height="130" id="logoImg" />
     </div>
     
     <div>
     	<h4>아이디 찾기</h4>
     	<p>고객님의 정보와 일치하는 아이디 목록 입니다. </p>
     </div>
     
     <table border=1>
     	<tr>
     		<td><input type="checkbox" name="autoLogin"> pangzo0</td>
     	</tr>
     	
     </table>
     
     <input type="button" value="로그인 하기 " class="btn">
     <input type="button" value="비밀번호 찾기 " class="btn">
</body>
</html>