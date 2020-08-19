<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = '/include/include.jsp' %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓 정보 등록</title>
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
	left: 120px;
	top: 220px;
}


.boardloc2 {
	position: absolute;
	left: 120px;
	top: 520px;
}
</style>
<script type = "text/javascript" src = "http://code.jquery.com/jquery-1.8.1.js"></script>
	<script type="text/javascript">
	$(function(){
		function addTicket(){
			  const str = ``;
			  $("#add").append(str); 
			};
		
		$('#plus').click(function(){
			addTicket();
			return false;
		});

	});
	</script>
</head>
<body>
<%@include file = "/tickets/concertInfo.jsp" %>
<form action="ticketModifyPro.tkt" method="post">


   <div class="boardloc2">
      <table class="table table-hover">
	<input type = hidden name = "num" value = "${dto.cctNum}"/>
		<caption>티켓정보등록</caption>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			좌석 등급 및 가격 설정
		</td>
	</tr>
	<c:forEach items = '${list}' var = 'dto'>
		<tr>			
			<td colspan = '3'>
			<select name = "grade">
					<option>등급선택</option>
					<option <c:if test = '${dto.grade eq "VIP" }'> selected </c:if>>VIP</option>
					<option <c:if test = '${dto.grade eq "R" }'> selected </c:if>>R</option>
					<option <c:if test = '${dto.grade eq "S" }'> selected </c:if>>S</option>
					<option <c:if test = '${dto.grade eq "A" }'> selected </c:if>>A</option>
					<option <c:if test = '${dto.grade eq "B" }'> selected </c:if>>B</option>
					<option <c:if test = '${dto.grade eq "C" }'> selected </c:if>>C</option>
				</select>
			가격
			<input type = "number" name = "price" value = '${dto.price}'>
			<select name = 'beginRow'>
				<option >열 선택</option>
				<c:forEach var = 'i' begin = '1' end = '20' step = '1'>
					<option <c:if test = '${dto.startRow eq "i"}'> selected </c:if>>${i}</option>
				</c:forEach>
			</select>
			<select name = 'beginNum'>
				<option >시작 좌석번호</option>
				<c:forEach var = 'i' begin = '1' end = '27' step = '1'>
					<option <c:if test = '${dto.startSeat eq "i"}'> selected </c:if>>${i}</option>
				</c:forEach>
			</select>
			<select name = 'endNum'>
				<option>끝 좌석번호</option>
				<c:forEach var = 'i' begin = '1' end = '27' step = '1'>
					<option <c:if test = '${dto.endSeat eq "i"}'> selected </c:if>>${i}</option>
				</c:forEach>
			</select>
		</td>
		</tr>
	</c:forEach>
			<!-- <td><input type = 'button' value = '추가' id = 'plus'/></td> 
			
			
		</tr>
		<tr>
			<td><div id = 'add'></div></td></tr>
		<tr>-->
		<td colspan = "2" align = "center">
		<input type = 'button' value = "목록으로" id = "toList" class="btn">
		<input type = "submit" value = '수정완료' class="btn" >
		</td>
	</tr>
	
</table>
</form>
</body>

</html>