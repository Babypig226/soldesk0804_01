<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "/include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연주자 모집 공고</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type = "text/javascript" src = "http://code.jquery.com/jquery-1.8.1.js"></script>
   <script type="text/javascript">
   function login(){
      alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.');
      location.href = '../login/login.main'
   }
   </script>

<style type="text/css">

.boardloc {
	position: absolute;
	left: 120px;
	top: 300px;
}
</style>
</head>
<body>

		<%@ include file="../main/fixMenu.jsp"%>
	
<div class="boardloc">


	<a style="display: scroll; position: fixed; bottom: 5px; right: 5px;"
		href="#" title="맨위로"><img src="../images/pageUpDown.PNG"
		width="100" height="100"></a>
		

<table class="table table-hover">
<!-- 데이터가 있는 경우 -->
	<p align="center">연주자 모집 공고</p>
	<tr>
		<td align = "right" colspan = "5">
				<font size=2>공고 총 <b>${count}</b> 개</font>
		</td>
	</tr>
	
	<tr align = "center" valign = "middle" boardercoller = "#333333">
		<td width = "10%" height = "26">번호</td>
		<td width = "50%">오디션명</td>
		<td width = "15">모집부문</td>
		<td width = "15%">접수기간</td>
		<td width = "10%">조회</td>
		
	</tr>
	<c:if test = "${!empty list}">
	<c:forEach items="${list}" var = "list" varStatus = "cnt">
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="10%" height="26">
			<div align="center">${cnt.count}</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="50%" height="26">
			<div align="center"><c:if test = '${logId != null}'><a href = "audNoticeView.aud?num=${list.auditionNoticeNum}">${list.auditionNoticeTitle}</a></c:if>
				 <c:if test = '${logId == null}'><a href = "javascript:login();">${list.auditionNoticeTitle}</a></c:if></div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="15%" height="26">
			<div align="center">${list.auditionNoticeCategory }</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="15%" height="26">
			<div align="center">${list.auditionNoticeApperiod}</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%" height="26">
			<div align="center">${list.readCount}</div>
		</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan = "5" align = "right">
		<c:if test = '${logId == "admin"}'><input type="button"
                  class="btn" value="작성 "
                  onclick="javascript:location.href='audForm.aud';" /></c:if></td>
	</tr>
	<tr align=center height=20>
		<td colspan= '5' style=font-family:Tahoma;font-size:10pt;>
		<%@ include file = "/include/includePage.jsp" %>
		</td>
	</tr>
</c:if>
<!-- 데이터 없는 경우 -->
<c:if test="${empty list}">


	<tr>
		<td colspan = '5' align=center>
			<font size=2>모집 진행중인 오디션이 없습니다.</font>
		</td>
	</tr>
	
	<tr>
		<td colspan = "5" align = "right">
		<input type="button"
                  class="btn" value="작성 "
                  onclick="javascript:location.href='audForm.aud';" /></td>
	</tr>
</c:if>

</table>
</div>
</body>
</html>