<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = '/include/include.jsp' %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연정보등록</title>
<script type = "text/javascript" src = "http://code.jquery.com/jquery-1.8.1.js"></script>
	<script type="text/javascript">
	$(function(){
		$('#toList').click(function(){
			var result = confirm('작성된 내용이 모두 삭제됩니다.');
			if(result){
				location.href = 'concertList.cct'
			}else{
				return false;
			}
		});
	});
	function goBack(){
		window.history.back();
	}
	</script>
</head>
<body>
<form action="cctWritePro.cct" method="post" name="cctform" enctype = "multipart/form-data">
<table cellpadding="0" cellspacing="0" align = "center">
		<caption>공연정보등록</caption>
		<input type = "hidden" name = "cctNum" value = "${dto.cctNum}">
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
		<td>
			${dto.cctDate}
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
			${dto.instrument}
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
			${fn:replace (dto.cctProgram, cn, br)}
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			내용
		</td>
		<td colspan = "3">
			${fn:replace (dto.cctContent, cn, br)} 
		</td>
	</tr>
	<tr>
		<td >포스터</td>
		<td><input type = "file" name = "fileUp"></td>
	</tr>
	<tr>
		<td>상세이미지</td>
		<td><input type = "file" name ="detailup"/></td>
	</tr>
	<tr>
		<td colspan = "2" align = "right">
		<input type = 'button' value = "뒤로" onclick = "goBack();">
		<input type = 'button' value = "목록으로" id = "toList">
		<input type = "submit" value = '작성완료'>
		</td>
	</tr>
	
</table>
</form>
</body>
</html>