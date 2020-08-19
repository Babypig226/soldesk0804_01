<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<%@include file = '/include/include.jsp' %>
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type = "text/javascript" src = "http://code.jquery.com/jquery-1.8.1.js"></script>
	<script type="text/javascript">
	   $(function(){
		   var line = 3;
		   var startNum = 1;
		   var endNum = 27;
		   
	   });
	</script>


</head>
<body id="body">
<!--  <form action = "/MusicaDiTe/tkt/test.tkt" method = 'post'>-->
<table align = 'center' width = "140">
<tr height="30">
	<td width='5'>&nbsp;</td>
	<c:forEach var = 'i' begin = "1" end = "20" step = '1'>
		<td width='5' align='center'>${i}</td>
	</c:forEach>
</tr>
<c:forEach var = 'j' begin = '1' end = '15' step = '1'>
	<tr height='5'>
	<td width='5' align='center'>${j}</td>	
	<c:forEach var = 'k' begin = '1' end = '20' step = '1' varStatus="cnt">
		<c:forEach items = '${list}' var = 'dto'>
					<c:choose>
						<c:when test = '${dto.grade == "VIP" && j==dto.startRow && k>= dto.startSeat && k<= dto.endSeat}'>
							<td width = '5' bgcolor = 'indigo' align = 'center'></td>
						</c:when>
						<c:when test = '${dto.grade == "R" && j==dto.startRow && k>= dto.startSeat && k<= dto.endSeat}'>
							<td width = '5' bgcolor = 'red' align = 'center'></td>
						</c:when>
						<c:when test = '${dto.grade == "S" && j==dto.startRow && k>= dto.startSeat && k<= dto.endSeat}'>
							<td width = '5' bgcolor = 'skyblue' align = 'center'></td>
						</c:when>
						<c:when test = '${dto.grade == "A" && j==dto.startRow && k>= dto.startSeat && k<= dto.endSeat}'>
							<td width = '5' bgcolor = 'green' align = 'center'></td>
						</c:when>
						<c:when test = '${dto.grade == "B" && j==dto.startRow && k>= dto.startSeat && k<= dto.endSeat}'>
							<td width = '5' bgcolor = 'blue' align = 'center'></td>
						</c:when>
						<c:when test = '${dto.grade == "C" && j==dto.startRow && k>= dto.startSeat && k<= dto.endSeat}'>
							<td width = '5' bgcolor = 'yellow' align = 'center'></td>
						</c:when>
					</c:choose>
			</c:forEach>
	</c:forEach>
						
		
	
	</tr>
	</c:forEach>
	<tr>
	</tr>
</table>
<!--  </form>-->
</body>
</html>



