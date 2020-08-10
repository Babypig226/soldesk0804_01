<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPassword.jsp</title>
</head>
<body>
<form action="findPasswordPro" method = "post" name = "frm">
	이메일 : <input type = "text" name = "userEmail"/><br/>
	아이디 : <input type = "text" name = "userId"/><br/>
	<div>${err}</div>
	<input type = "submit" value = "전송"/>
</form>
</body>
</html>