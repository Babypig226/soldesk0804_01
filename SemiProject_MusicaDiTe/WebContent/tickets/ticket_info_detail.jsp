<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ticket info check</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">


.logoloc {
	position: absolute;
	left: 650px;
	top: 10px;
}

.boardloc {
	position: absolute;
	left: 450px;
	top: 220px;
}
</style>
<script type = "text/javascript" src = "http://code.jquery.com/jquery-1.8.1.js"></script>
	<script type="text/javascript">
	$(function(){
		$('#toList').click(function(){
			location.href = 'ticketsList.tkt'
		});	
		$('#modify').click(function(){
			location.href = 'ticketsModify.tkt?num='+${dto.cctNum}
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
	<table class="table " style="width: 600px">
		<c:forEach items = '${qty}' var = 'dto'>
			<tr>
			<td>${dto.grade}:${dto.price}원&nbsp;${dto.qty}석
			</td>
			</tr>
			
		<hr />
			<tr>
				<td>
					<c:forEach items = '${list}' var = 'tktInfo'>
					<c:if test = "${tktInfo.grade == dto.grade }">
						${tktInfo.seat}&nbsp;
					</c:if>
					</c:forEach>
				</td>
			</tr>
		</c:forEach>
		<tr>
	<td  align = "center">
		<input type = 'button' value = '확인' id = 'toList' class="btn"/></td></tr>
	</table>

	
	</div>
</body>
</html>