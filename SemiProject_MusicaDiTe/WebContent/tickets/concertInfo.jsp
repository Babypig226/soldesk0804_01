<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = '/include/include.jsp' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">






</style>
</head>
<body>



   



<table class="table " style="width: 600px">

		<tr><td colspan=8 align="center"><b>공연정보</b></td></tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16" width = '100'>
			공연명
		</td>
		<td>
			${dto.cctTitle}
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16" width = '100'>
			공연일시
		</td>
		<td >
			<fmt:formatDate value = "${dto.cctDate}" type = "Date" pattern = "yyyy-MM-dd HH:mm"/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16" width = '100'>
			공연장소
		</td>
		<td>
			${dto.cctLocation}
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16" width = '100'>
			연주자
		</td>
		<td>
			${dto.artName}
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16" width = '100'>
			프로그램
		</td>
		<td colspan = "3">
			${fn:replace(dto.cctProgram, cn, br)} 
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16" width = '100'>
			내용
		</td>
		<td colspan = "3">
			${fn:replace(dto.cctContent, cn, br)} 
		</td>
	</tr>
</table>

</body>
</html>