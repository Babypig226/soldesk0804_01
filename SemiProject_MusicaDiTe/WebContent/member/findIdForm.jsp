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
     	<p>본인확인 이메일로 인증 </p>
     	<p>본인확인 이메일 주소와 입력한 주소가 같아야, 인증번호를 받을 수 있습니다. </p>
     </div>
     
     <table>
     	<tr>
     		<td>이름 </td>
     		<td colspan=2><input type="text" autofocus="autofocus"></td>
     	</tr>
     	<tr>
     		<td>이메일 주소 </td>
     		<td ><input type="text"></td>
     		<td ><input type="button" value="인증번호 받기 " class="btn"></td>
     	</tr>
     	<tr>
     		<td></td>
     		<td ><input type="text" 
                     placeholder='인증번호 6자리 숫자 입력 '></td>
     	</tr>
     </table>
     
     <input type="button" value="다음 " class="btn">
</body>
</html>