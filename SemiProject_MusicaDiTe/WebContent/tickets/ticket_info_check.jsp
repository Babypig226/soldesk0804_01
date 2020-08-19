<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ticket info check</title><meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
#p1 {
	color: gray;
}

.logoloc {
	position: absolute;
	left: 650px;
	top: 10px;
}

.boardloc {
	position: absolute;
	left: 300px;
	top: 220px;
}

.boardloc2 {
	position: absolute;
	left: 500px;
	top: 600px;
}

.boardloc3 {
	position: absolute;
	left: 940px;
	top: 400px;
}
</style>
<script type = "text/javascript" src = "http://code.jquery.com/jquery-1.8.1.js"></script>
	<script type="text/javascript">
	$(function(){
		$('#toList').click(function(){
			location.href = 'ticketsList.tkt'
		});	
	});
	</script>
</head>
<body>

	<div class="logoloc">
		<tr>
			<td colspan=3><input type="image" src="../images/mlogo.png"
				onclick="javascript:location.href='../main.main';" width="250"
				height="250" id="logoImg" /></td>
		</tr>
	</div>
	
	<div class="boardloc">
	<%@ include file = '/tickets/concertInfo.jsp' %>
	
	
	<%@ include file = '/tickets/seats_reg_check.jsp' %>
	
	
	
	
	<table class="table">
	<tr><td colspan = '2'><hr/><td></tr>
		
			<tr>
				<td>VIP석</td>
			</tr>
			<tr>	
				<td>
				<c:forEach items = '${list}' var = 'dto'>
				<c:if test = '${dto.grade eq "VIP" }'>${dto.seats }&nbsp;</c:if>
				</c:forEach>
				<br/>
				<hr/>
				</td>
			</tr>
		
			<tr>
				<td>R석</td>
			</tr>
			<tr>
				<td>
				<c:forEach items = '${list}' var = 'dto'>
				<c:if test = '${dto.grade eq "R" }'>${dto.seats }&nbsp;</c:if>
				</c:forEach>
				<br/>
				<hr/>
				</td>
			</tr>
		
			<tr>
				<td>S석</td>
			</tr>
			<tr>
				<td>
				<c:forEach items = '${list}' var = 'dto'>
				<c:if test = '${dto.grade eq "S" }'>${dto.seats }&nbsp;</c:if>
				</c:forEach>
				<br/>
				<hr/>
				</td>
			</tr>
		
			<tr>
				<td>A석</td>
			</tr>
			<tr>
				<td>
				<c:forEach items = '${list}' var = 'dto'>
				<c:if test = '${dto.grade eq "A" }'>${dto.seats }&nbsp;</c:if>
				</c:forEach>
				<br/>
				<hr/>
				</td>
			</tr>
		
			<tr>
				<td>B석</td>
			</tr>
			<tr>
				<td>
				<c:forEach items = '${list}' var = 'dto'>
				<c:if test = '${dto.grade eq "B" }'>${dto.seats }&nbsp;</c:if>
				</c:forEach>
				<br/>
				<hr/>
				</td>
			</tr>
		
			<tr>
				<td>C석</td>
			</tr>
			<tr>
				<td>
				<c:forEach items = '${list}' var = 'dto'>
				<c:if test = '${dto.grade eq "C" }'>${dto.seats }&nbsp;</c:if>
				</c:forEach>
				<br/>
				<hr/>
				</td>
			</tr>
	</table>
	
	
	<table>
	<tr><td><input type = 'button' value = '확인' id = 'toList' class="btn"/></td></tr>
	
	</table>
	
	</div>
	

</body>
</html>
