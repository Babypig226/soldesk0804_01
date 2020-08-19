<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/include.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Purchase List</title>
<meta charset="utf-8">
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

#p2 {
	text-align: right;
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
		$('#write').click(function(){
			location.href = 'concertWrite.cct'
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
      <table class="table table-hover">
<!-- 데이터가 있는 경우 -->
		
	<tr align = "center" valign = "middle" boardercoller = "#333333" >
		<td>번호</td>
		<td>포스터</td>
		<td>공연명</td>
		<td>좌석</td>
		<td>수량</td>
		<td>총액</td>
		<td>구매일</td>
	</tr>
	<c:if test = "${!empty list}">
	<c:forEach items="${list}" var = "dto" varStatus = "cnt" >
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="6%" height="26">
			<div align="center">${cnt.count}</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="20%">
			<div align="center"><img src = '../concert_board/upload/${dto.strPoster}'/></div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="20%" height="26" valign = "middle">
			<div align="center" ><a href = "cctDetail.cct?num=${dto.cctNum}">${dto.cctTitle}</a></div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="20%" valign = "middle">
			<div align="center" >${dto.seats}</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="6%" valign = "middle">
			<div align="center">${dto.qty}</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%" valign = "middle">
			<div align="center"><fmt:setLocale value = ""/><fmt:formatNumber type = "currency" value = '${dto.totalPrice}'/></div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%" valign = "middle">
			<div align="center"><fmt:formatDate value = "${dto.regDate}" type = "date" pattern = "yyyy-MM-dd"/></div>
		</td>
	</tr>
	</c:forEach>
	</c:if>
	
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">

		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="left">
			<a href="#?num=">
				
			</a>
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"></div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"></div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"></div>
		</td>
	</tr>

	<tr align=center height=20>
		<td colspan=7 style=font-family:Tahoma;font-size:10pt;>

		<%@ include file = "/include/includePage.jsp" %>

		</td>
	</tr>

<!-- 데이터 없는 경우 -->
	<c:if test = "${empty list}">
	<tr align="center" valign="middle">
		

	<td colspan="7">Purchase List</td>
	</tr>
	<tr>
		<td colspan = '7' align=center>
			<font size=2>구매내역이 없습니다.</font>
		</td>
	</tr>
	</c:if>
</table>
</div>
</body>
</html>