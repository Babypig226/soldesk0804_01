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
     	<h4>비밀번호 찾기</h4>
     	<p>비밀번호를 변경해 주세요. </p>
     </div>
     
     <table>
     
     	<tr>
     		<td ><input type="text" placeholder="새 비밀번호 "></td>
     		
     	</tr>
     	<tr>
     		<td ><input type="text" placeholder="새 비밀번호 확인 "></td>
     	</tr>
     </table>
     
     <input type="button" value="다음 " class="btn">
</body>
</html>