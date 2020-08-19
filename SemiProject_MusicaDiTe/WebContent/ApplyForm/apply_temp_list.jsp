<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오디션 참가신청서 임시저장 리스트</title>
</head>
<body>
<table width=50% border="0" cellpadding="0" cellspacing="0" align = "center">
<!-- 데이터가 있는 경우 -->
	<caption>참가신청서 임시저장</caption>
	<tr>
		<td align = "right" colspan = "5">
				<font size=2>글 개수 : ${count}</font>
		</td>
	</tr>
	
	<tr align = "center" valign = "middle" bordercolor = "#333333">
		<td width = "10%" height = "26">저장번호</td>
		<td width = "50%">오디션명</td>
		<td width = "15%">모집부문</td>
		<td width = "25%">최종수정일</td>
		
	</tr>
	<c:if test = "${!empty lists}">
	<c:forEach items="${lists}" var = "val" varStatus = "cnt">
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="10%" height="26">
			<div align="center">${cnt.count}</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="50%" height="26">
			<div align="center"><a href = "appTempStore.app?num=${val.appTempNum}">${val.auditionNoticeTitle}</a></div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="15%" height="26">
			<div align="center">${val.auditionNoticeCategory}</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="25%" height="26">
			<div align="center"><fmt:formatDate value = "${val.appDate}" type = "date" pattern = "yyyy-MM-dd"/></div>
		</td>
	</tr>
	</c:forEach>
	<tr align=center height=20>
		<td colspan= '5' style=font-family:Tahoma;font-size:10pt;>
		<%@ include file = "/include/includePage.jsp" %>
		</td>
	</tr>
	</c:if>
<!-- 데이터 없는 경우 -->
<c:if test = "${empty lists}">
	<tr>
		<td colspan = '5' align=center>
			<font size=2>작성중인 참가신청서가 없습니다.</font>
		</td>
	</tr>
</c:if>
</table>
</body>
</html>