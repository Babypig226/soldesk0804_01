<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Step1</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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


.boardloc {
   position: absolute;
   left: 500px;
   top: 220px;
}
</style>
<script type = "text/javascript" src = "http://code.jquery.com/jquery-1.8.1.js"></script>
	<script type="text/javascript">
	function setDisplay(){
	    var values = document.getElementsByName("seatNum");
	    var seats = "";
	    var count = 0;
	    for (var i = 0; i < values.length; i++) {
			if(values[i].checked){
	       seats += values[i].value+",";
	       count++; 
			}
		}
		$("#qty").html("<input type = 'text' name = 'qty' value = '"+count+"' readonly/>");
		$("#seats").html("<input type = 'text' name = 'qty' value = '"+seats+"' readonly/>");
		return false;
	     
	}
	$(function(){
		$('#chk').click(function(){
			
			if($('#userBirth').attr("value") != $('#chkBirth').attr("value")){
					alert('생일이 다릅니다.');
					return false
				}else 
					{return true;}
				
					});
		});

	</script>
</head>
<body>
<form action = "bookingConfirm.bk" method = "get" id = "frm" >
<input type = "hidden" name = "num" value = "${dto.cctNum}"/>

   <div class="boardloc">
      <table class="table table-hover">
	<tr>
		<td align="center" colspan=30>공연명</td>
		<td name = "cctTitle" colspan=8>${dto.cctTitle}</td>
	</tr>
	<tr>
		<td colspan=30>공연일시</td>
		<td name = "cctDate"><fmt:formatDate value = "${dto.cctDate}" type = "date" pattern = "yyyy-MM-dd HH:mm"/></td>
		<td name = "cctLocation">${dto.cctLocation}</td>
	</tr>
</table>
<hr/>
   <table class="table table-hover">
	<tr><td colspan=30 align="center"><b>좌석표</b></td></tr>
	<tr height="30">
		<td width='5'>&nbsp;</td>
			<c:forEach var = 'i' begin = "1" end = "27" step = '1'>
				<td width='5' align='center'>${i}</td>
			</c:forEach>
	</tr>
		<c:forEach var = 'j' begin = '1' end = '20' step = '1'>
			<tr height='5'>
				<td width='5' align='center'>${j}</td>	
					<c:forEach var = 'k' begin = '1' end = '27' step = '1' varStatus="cnt">
								<td width='5' align='center'><input type = 'checkbox' name = 'seatNum' value = '${j}:${k}' /></td>
					</c:forEach>
			</tr>
		</c:forEach>
	<tr>
		<td colspan=30 align="center"><input type = 'button' class="btn" value = '좌석선택완료' onclick = 'javascript: setDisplay()'/></td>
	</tr>
</table>
<hr/>
   <table class="table table-hover">
	<tr>
		<td valign = "top" colspan=30>좌석등급/잔여석<br/></td>
		<td><c:forEach items = "${qty}" var = "list">${list.grade}:&nbsp;&nbsp;잔여석  ${list.qty}<br/></c:forEach>
		</td>
	</tr>
	<tr>
		<td valign = 'top'>	선택한 좌석</td>
		<td>선택한 좌석 수</td>
		<td colspan=30><div id = 'qty'></div></td>
	</tr>
	<tr>
		<td>선택좌석</td>
		<td colspan=30><div id = 'seats'></div></td>
		</tr>

	<tr>
		<td colspan = "30" align = "left">주문자 확인</td>
	</tr>
	<tr>
		<td>주문자 이름</td>
		<td colspan=30> ${user.userName}</td>
	</tr>
	
	<tr>
		<td>생년월일</td>
		<td colspan=30> <input type = "text" id = 'userBirth' name = "userBirth" placeholder = "YYMMDD EX)890120"/></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td colspan=30><input type = "text" name = "userPh1" value = "${user.userPh1}"/></td>
	</tr>
					
	<tr>
		<td>이메일</td>
		<td colspan=30><input type = "email" name = "email" value = "${user.userEmail}"/></td>
	</tr>					 
	
	<tr>
		<td colspan = '2' valign = "bottom" align = "right"><input type = "submit" value = "다음단계" id = 'chk' class="btn"/></td>
	</tr>
	
</table>
</div>
	<input type = 'text' id = 'chkBirth' value = '${chkBirth}'/> 
</form>

</body>
</html>