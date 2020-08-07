<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/include.jsp" %>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title><spring:message code="member.register"/></title>
 </head>
 <body>
 <h2>약관내용</h2>
	 <p>
	 	<spring:message code = "term"/>
	 </p>
<form action='regist'  method='post'>
	<label>
		<input type='checkbox' name="agree" value = "true" required/>
			<spring:message code = "term.agree"/> 
		<input type='submit' value='<spring:message code = "next.btn"/>' />		
	</label>
</form>
 </body>
</html>
