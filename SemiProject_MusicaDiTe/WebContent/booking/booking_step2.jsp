<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file = "/include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내역확인</title>
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
</style>
<script type = "text/javascript" src = "http://code.jquery.com/jquery-1.8.1.js"></script>
	<script type="text/javascript">
	   $(function(){
		  $('#frm').submit(function(){
			  alert('구매해주셔서 감사합니다. 메인페이지로 이동합니다.');
			   return true;
			  
		  });
		   $('#cancel').click(function(){
			   alert('Concerts페이지로 이동합니다.');
			   location.href = '../cct/concertList.cct'
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
   
<form action = "paycheck.bk" method = 'post' id = 'frm'>

   <div class="boardloc">
      <table class="table table-hover">
<input type = 'hidden' name = 'num' value = '${dto.cctNum}'/>
<input type = 'hidden' name = 'seats' value = '${seats}'/>
<input type = 'hidden' name = 'totalPrice' value = '${totalPrice}'/>
	<tr>
		<td colspan=2>공연명</td>
		<td>${dto.cctTitle}</td>
	</tr>
	<tr>
		<td>공연일시</td>
		<td><fmt:formatDate value = '${dto.cctDate }' type = 'date' pattern = 'yyyy-MM-dd HH:mm'/></td>
		<td>${dto.cctLocation}</td>
	</tr>
</table>
<hr/>
<table class="table table-hover">
	<tr>
		<td>좌석수</td>
		<td align = 'left'>${qty}</td>
	</tr>
	<tr>
		<td>선택좌석</td>
		<td>${seats}</td>
	</tr>
	<tr>
		<td>총액</td>
		<td>${totalPrice}</td>
	</tr>
	<tr>
		<td colspan = "2" > 주문자 이름: ${user.userName}<br/>
							생년월일: ${chkBirth}<br/>
							연락처: ${user.userPh1}<br/>
							이메일: ${user.userEmail}</td>
	</tr>
	<tr>
		<td>결제방법</td>
		<td>
			<label><input type = 'radio' name = 'payM' value = 'creaditCard' checked>신용카드</label>
			<label><input type = 'radio' name = 'payM' value = 'deposit'>무통장입금</label>
		</td>
	</tr>
	<tr>
		<td colspan = '2' valign = "bottom" align = "center"><input type = 'button' value = '취소' id = 'cancel' class="btn"/>&nbsp;&nbsp;<input type = "submit" value = "결제하기" class="btn"/></td>
	</tr>
</table>
</div>
</form>

</body>
</html>