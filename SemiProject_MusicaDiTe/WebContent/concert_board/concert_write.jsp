<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = '/include/include.jsp' %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연정보등록</title>
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
	top: 220px;
}
</style>

<script type = "text/javascript" src = "http://code.jquery.com/jquery-1.8.1.js"></script>
	<script type="text/javascript">
	$(function(){
		$('#toList').click(function(){
			var result = confirm('작성중인 내용이 모두 삭제됩니다.');
			if(result){
				location.href = 'concertList.cct'
			}else{
				return false;
			}
		});
		$('#frm').submit(function(){
			if ($("#cctTitle").val() == "" || $("#cctTitle").val() == null) {
				alert("공연명을 입력해 주세요");
				$("#cctTitle").focus();
				return false;
			}
			if($("#cctDate").val()== null || $('#cctDate').val() == ""){
			alert("공연일시를 선택해주세요");
			$('#cctDate').focus();
			return false;	
			}
			if($("#cctLocation").val()== null || $('#cctLocation').val() == ""){
			alert("공연장소를 입력해주세요");
			$('#cctLocation').focus();
			return false;	
			}
			if($("#artName").val()== null || $('#artName').val() == ""){
			alert("연주자를 선택해주세요");
			$('#artName').focus();
			return false;	
			}
			if ($("#cctProgram").val() == "" || $("#cctProgram").val() == null) {
				alert("프로그램을 입력해주세요");
				$("#cctProgram").focus();
				return false;
			}
			if ($("#poster").val() == "" || $("#poster").val() == null) {
				alert("포스터를 업로드해주세요");
				$("#poster").focus();
				return false;
			}
			if($("#detail").val()== null || $('#detail').val() == ""){
			alert("상세이미지를 업로드해주세요");
			$('#detail').focus();
			return false;	
			}
			
		});
		
	});

	function searchArtists(){
		window.open('/SemiProject_MusicaDiTe/cct/artistsSearch.cct', '연주자찾기', 'width = 300, height = 20px');
	}
	</script>
</head>
<body>


		<%@ include file="../main/fixMenu.jsp"%>
	
	<a style="display: scroll; position: fixed; bottom: 5px; right: 5px;"
		href="#" title="맨위로"><img src="../images/pageUpDown.PNG"
		width="100" height="100"></a>


<form action="concertWriteIntensive.cct" method="post" id = "frm" name="cctContentform" enctype = 'multipart/form-data'>

	<div class="boardloc">
<table class="table table-hover">
		<tr><td colspan=8 align="center"><b>공연정보등록</b></td></tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			공연명
		</td>
		<td>
			<input type = "text" name = "cctTitle" id = "cctTitle" value = "${infoPass.cctTitle}">
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			공연일시
		</td>
		<td >
			<input type = 'datetime-local' id = "cctDate" name = "cctDate" value = '${cctDateT}'/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			공연장소
		</td>
		<td>
			<input type = 'text' id = "cctLocation" name = "cctLocation" value = "${infoPass.cctLocation}"/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			연주자
		</td>
		<td>
			<input type = "hidden" name = "instrument" id = "instrument">
			<input type = "text" name = "artName" id = "artName">
			<input type = "button" class="btn" value = "검색" onclick = 'javascript: searchArtists();' />
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			프로그램
		</td>
		<td colspan = "3">
			<textarea rows="20" cols="100" id = "cctProgram" name = "cctProgram">${infoPass.cctProgram}</textarea> 
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			내용
		</td>
		<td colspan = "3">
			<textarea rows="20" cols="100" name = "cctContent">${infoPass.cctContent}</textarea> 
		</td>
	</tr>
	<tr>
		<td >포스터</td>
		<td><input type = "file" id = "poster" name = "fileUp"></td>
	</tr>
	<tr>
		<td>상세이미지</td>
		<td><input type = "file" id = "detail" name ="detailup"/></td>
	</tr>
	<tr>
		<td colspan = "2" align = "center">
		<input type = 'button' class="btn" value = "목록으로" id = "toList">
		<input type = "submit" class="btn" value = '등록' onclick="javascript: form.action='cctWritePro.cct'">
		</td>
	</tr>
	
</table>
</div>
</form>
</body>

</html>