<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/include.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type = "text/javascript" src = "http://code.jquery.com/jquery-1.8.1.js"></script>
	<script type="text/javascript">
	$(function(){
			$("#regNew").click(function(){
				location.href = 'newArtistsRegist.arts'
			
		});
	});
	  function login(){
	      alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.');
	      location.href = '../login/login.main'
	   }

	</script>
<meta charset="UTF-8">
<title>아티스트 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
	
	
	<a style="display: scroll; position: fixed; bottom: 5px; right: 5px;"
		href="#" title="맨위로"><img src="../images/pageUpDown.PNG"
		width="100" height="100"></a>
		
		<div class="boardloc">
<table class="table table-hover">
<!-- 데이터가 있는 경우 -->

	<tr align="center" valign="middle">
		<td colspan="6">아티스트</td>
	</tr>
	
<c:if test="${!empty artList}">	
	<tr align = "center" valign = "middle" boardercoller = "#333333">
		<td width = "8%" height = "26">번호</td>
		<td width = "50%">프로필사진</td>
		<td width = "12">이름</td>
		<td width = "12%">분야</td>
		<td width = "12%">SNS</td>
		
	</tr>
<c:forEach items="${artList}" var = "dto" varStatus = "cnt">
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="8%" height="26">
			<div align="center">${cnt.count}</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="50%" height="26">
			<div align="center"><img alt="${dto.artName}" src="../management_board/artists_data/${dto. strProfile}"></div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="12%">
			<div align="center">
			   <c:if test = '${logId != null}'><a href = "artistDetailViewCst.arts?num=${dto.artRegNum}">${dto.artName}</a></c:if>
         		<c:if test = '${logId == null}'><a href = "javascript:login();">${dto.artName}</a></c:if>
         	</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="12%">
			<div align="center">${dto.instrument}</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="12%">
			<div align="center"><a href = '${dto.artSns}'>SNS</a></div>
		</td>
	</tr>

</c:forEach>
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


		</td>
	</tr>
</c:if>

<c:if test="${empty artList}">
<!-- 데이터 없는 경우 -->

	<tr>
		<td colspan = '7' align=center>
			<font size=2>등록된 아티스트 정보가 없습니다.</font>
		</td>
	</tr>
</c:if>
</table>
</div>
</body>
</html>