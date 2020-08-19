<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = '/include/include.jsp' %>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" >
	</script>
<script type="text/javascript">
function sendVal(){

		$(opener.document).find("#artName").val($("#artFoundName").val());
		$(opener.document).find("#instrument").val($("#instrument").val());
		window.close();
	};	

</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연주자 찾기</title>
</head>
<body>
<form action="concertWriteIntensive.cct" method = "post" name = "frm">
<table>
	<tr>
		<td>
			<select name = 'instrument' id = "instrument">
				<option value = "pf" <c:if test = "${artists.instrument eq 'pf'}">selected</c:if>>피아노</option>
				<option value = 'vn' <c:if test = "${artists.instrument eq 'vn'}">selected</c:if>>바이올린</option>
				<option value = 'vl' <c:if test = "${artists.instrument eq 'vl'}">selected</c:if>>비올라</option>
				<option value = 'vc' <c:if test = "${artists.instrument eq 'vc'}">selected</c:if>>첼로</option>
				<option value = 'emsbl'<c:if test = "${artists.instrument eq 'emsbl'}">selected</c:if>>앙상블</option>
			</select>
			<input type = 'submit' value = "선택" id = "instrumentSel">
		<c:if test="${empty artists}">
			<select>
			<option>악기를 선택하세요</option>
			</select>
		</c:if>
		<c:if test="${!empty artists}">
			<select name = "artFoundName" id = "artFoundName">
				<option>선택하세요</option>
			<c:forEach items = "${artists.artName}" var = "name">
				<option value = "${name}">${name}</option>
			</c:forEach>
			</select>
		</c:if>
		</td>
		<td>
			<input type = 'submit' value = '적용' onclick = 'javascript: sendVal();'/>
		</td>
	</tr>
</table>
</form>
</body>
</html>