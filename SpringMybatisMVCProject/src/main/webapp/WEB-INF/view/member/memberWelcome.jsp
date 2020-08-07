<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code = "member.register"/></title>
</head>
<body>
<spring:message code = "register.done" arguments="${memberCommand.userName},${memberCommand.userEmail}"/>
<p><a href='<c:url value="/" />'><spring:message code = "go.mail"/></a></p>
</body>
</html>