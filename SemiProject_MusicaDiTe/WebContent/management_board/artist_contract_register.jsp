<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계약서등록</title>
	<script language="javascript">
	function addboard(){
		boardform.submit();
	}
	</script>
</head>
<body>
<form action="libBoardWrite.lib" method="post" name="boardform" enctype = "multipart/form-data">
<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="4">계약서등록</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			계약자
		</td>
		<td >
			갑 <input type = "text">
		</td>
		<td>
			계약자
		</td>
		<td>
			을<input type = "text">
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			갑 주소
		</td>
		<td >
			<input type = "text">
		</td>
		<td>
			을 주소
		</td>
		<td>
			<input type = "text">
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			갑 연락처
		</td>
		<td >
			<input type = "text">
		</td>
		<td>
			을 연락처
		</td>
		<td>
			<input type = "text">
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			갑 고유번호
		</td>
		<td >
			<input type = "text">
		</td>
		<td>
			을 고유번호
		</td>
		<td>
			<input type = "text">
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			계약기간
		</td>
		<td >
			<input type = "date">
		</td>
		<td>
			효력상실일
		</td>
		<td>
			<input type = "date">
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			게런티
		</td>
		<td >
			<input type = "text">
		</td>
		<td>
			게런티지급일
		</td>
		<td>
			<input type = "date">
		</td>
	</tr>
		
	<tr>
		<td colspan = "4">
			<textarea rows="100" cols="100"></textarea>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			갑 인감
		</td>
		<td style="font-family:돋음; font-size:12" height="16">
			<input type = "file" name = 'fileup'>
		</td>
		<td>
			을 인감
		</td>
		<td>
			<input type = "file" name = 'fileup'>
			
		</td>
	</tr>
	<tr>
		<td colspan = "4">
			<button>등록하기</button>
		</td>
	</tr>
	
</table>
</form>
</body>
</html>