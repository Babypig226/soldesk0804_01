<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome message</title>
</head>
<body>
${MemberCommand.userName}님 가입을 축하합니다.<br/>
<p><a href = "<c:url value = '/'/>">메인으로</a></p>
</body>
</html>