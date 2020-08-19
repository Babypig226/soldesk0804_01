<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = '/include/include.jsp' %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓 정보 등록</title><meta name="viewport" content="width=device-width, initial-scale=1">
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
	left: 500px;
	top: 220px;
}

.boardloc2 {
	position: absolute;
	left: 500px;
	top: 220px;
}
</style>
<script type = "text/javascript" src = "http://code.jquery.com/jquery-1.8.1.js"></script>
	<script type="text/javascript">
	$(function(){
		function addTicket(){
			  const str = '<select name = "grade"><option>등급선택</option><option>VIP</option><option>R</option><option>S</option>'
			  +'<option>A</option><option>B</option><option>C</option></select>가격<input type = "number" name = "price">	열선택'
			  +'<input type = "number" min = "1" max = "20" name = "beginRow"/>시작 좌석번호<input type = "number" min = "1" max = "27" name = "beginNum">'
			  +'끝 좌석번호	<input type = "number" min = "1" max = "27" name = "endNum"><br/>';
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

	<div class="logoloc">
		<tr>
			<td colspan=3><input type="image" src="../images/mlogo.png"
				onclick="javascript:location.href='../main.main';" width="250"
				height="250" id="logoImg" /></td>
		</tr>
	</div>


<div class="boardloc">
			<table class="table " style="width: 600px">

		<tr><td colspan=5 align="center"><b>공연정보</b></td></tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			공연명
		</td>
		<td>
			${dto.cctTitle}
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			공연일시
		</td>
		<td >
			<fmt:formatDate value = "${dto.cctDate}" type = "Date" pattern = "yyyy-MM-dd HH:mm"/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			공연장소
		</td>
		<td>
			${dto.cctLocation}
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			연주자
		</td>
		<td>
			${dto.artName}
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			프로그램
		</td>
		<td colspan = "3">
			${fn:replace(dto.cctProgram, cn, br)} 
		</td>
	</tr>
</table>
<table align = 'center'  border = 'solid'>
	<caption>좌석표</caption>
<tr height="30">
	<td width='5'>&nbsp;</td>
	<c:forEach var = 'i' begin = "1" end = "20" step = '1'>
		<td width='5' align='center' bgcolor = "lightgray">${i}</td>
	</c:forEach>
</tr>
<c:forEach var = 'j' begin = '1' end = '15' step = '1'>
	<tr height='5'>
	<td width='5' align='center' bgcolor = "lightgray">${j}</td>	
	<c:forEach var = 'k' begin = '1' end = '20' step = '1' varStatus="cnt">
		<td style="font-family:Tahoma;font-size:8pt;" width="5">
			<div align="center">${j}:${k}</div></td>
	</c:forEach>
	
	</tr>
	</c:forEach>
</table>


<form action="ticketSs.tkt" method="get" name="cctContentform">


			<table class="table " style="width: 600px">
	<input type = hidden name = "num" value = "${dto.cctNum}"/>
		<tr><td colspan=5 align="center"><b>티켓정보등록</b></td></tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			좌석 등급 및 가격 설정
		</td>
	</tr>
		<tr>			
			<td colspan = '3'>
			<select name = "grade">
					<option>등급선택</option>
					<option>VIP</option>
					<option>R</option>
					<option>S</option>
					<option>A</option>
					<option>B</option>
					<option>C</option>
				</select>
			가격
			<input type = "number" name = "price">
			열선택
			<input type = "number" min = "1" max = "20" name = "beginRow"/>
			시작 좌석번호
			<input type = "number" min = "1" max = "27" name = "beginNum">
			끝 좌석번호	
			<input type = "number" min = "1" max = "27" name = "endNum">
		</td>
			<td><input type = 'button' value = '추가' id = 'plus' class="btn"/></td> 
		</tr>
		
		<tr>
			<td colspan = "3"><div id = 'add'></div></td>
		</tr>
		<tr>
		<td colspan = "3" align = "center">
		<input type = 'button' value = "목록으로" id = "toList" class="btn">
		<input type = "submit" value = '다음' class="btn" >
		</td>
	</tr>
	
</table>
</div>
</form>
</body>

</html>