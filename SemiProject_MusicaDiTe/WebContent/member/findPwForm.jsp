<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
     	<h4>비밀번호 찾기 </h4>
     	<p>비밀번호를 찾고자 하는 아이디를 입력해 주세요. </p>
     </div>
     
     <table border=1>
     	<tr>
     		<td><input type="text" name="autoLogin" placeholder="냥트리오 아이디 "></td>
     	</tr>	
     </table>
     <input type="button" value="다음 " class="btn">
     <p>아이디가 기억나지 않는다면? <a href="#">아이디 찾기 바로가기 </a></p>
</body>
</html>