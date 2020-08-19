<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = '/include/include.jsp' %>

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

.logoloc {
   position: absolute;
   left: 650px;
   top: 10px;
}

.boardloc {
   position: absolute;
   left: 450px;
   top: 220px;
}
</style>

<script type = "text/javascript" src = "http://code.jquery.com/jquery-1.8.1.js"></script>
	<script type="text/javascript">
	$(function(){
		$('#toList').click(function(){
			var result = confirm('변경된 내용이 모두 삭제됩니다.');
			if(result){
				location.href = 'concertList.cct'
			}else{
				return false;
			}
		});
		$("#chngP").click(function(){
			if($(this).attr("value") == "변경"){
			$("#chngP").attr("value","변경취소");
			$("#posterDel").val("${dto.strPoster}");
			$("#poster").html("<input type = 'file' name ='fileup' id = 'fileup'>");
			$("#orgPoster").html("");
		}else{
			$("#chngP").attr("value","변경");
			$("#posterDel").val("");
			$("#poster").html("");
			$("#orgPoster").html("${dto.orgPoster}");
			}
		});
		
		$("#chngD").click(function(){
			if($(this).attr("value") == "변경"){
			$("#chngD").attr("value","변경취소");
			$("#detailDel").val("${dto.strDetail}");
			$("#detail").html("<input type = 'file' name ='detailUp' id = 'detailUp'>");
			$("#orgDetail").html("");
		}else{
			$("#chngD").attr("value","변경");
			$("#detailDel").val("");
			$("#detail").html("");
			$("#orgDetail").html("${dto.orgDetail}");
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
			if (($("#fileup").val() == "" || $("#fileup").val() == null)&& $('#chngP').val()=='변경취소') {
				alert("포스터를 업로드해주세요");
				$("#poster").focus();
				return false;
			}
			if(($("#detailUp").val()== null || $('#detailUp').val() == "")&& $('#chngD').val()=='변경취소'){
			alert("상세이미지를 업로드해주세요");
			$('#detail').focus();
			return false;	
			}
			
		});
		
	});

	function searchArtists(){
		window.open('/MusicaDiTe/cct/artistsSearch.cct', '연주자찾기', 'width = 300px, height = 20px');
	}
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


<form action="concertModPro.cct" method="post" id = "frm" name="cctContentform" enctype = 'multipart/form-data'>

<div class="boardloc">
      <table class="table table-hover"  style="width:800px">
   
<input type = 'hidden' name = "num" value = '${dto.cctNum}'/>
		<tr><td colspan=8 align="center"><b>공연정보수정</b></td></tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			공연명
		</td>
		<td>
			<input type = "text" name = "cctTitle" id = "cctTitle" value = "${dto.cctTitle}">
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			공연일시
		</td>
		<td >
			<input type = 'datetime-local' name = "cctDate" id = "cctDate" value = '${cctDate}' />
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			공연장소
		</td>
		<td>
			<input type = 'text' name = "cctLocation" id = "cctLocation" value = "${dto.cctLocation}"/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			연주자
		</td>
		<td>
			<input type = "hidden" name = "instrument" id = "instrument" value = "${dto.instrument}">
			<input type = "text" name = "artName" id = "artName" value = '${dto.artName}'>
			<input type = "button" value = "검색" class="btn" onclick = 'javascript: searchArtists();' />
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			프로그램
		</td>
		<td colspan = "3">
			<textarea rows="20" cols="100" name = "cctProgram" id = "cctProgram">${dto.cctProgram}</textarea> 
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			내용
		</td>
		<td colspan = "3">
			<textarea rows="20" cols="100" name = "cctContent" id = "cctContent">${dto.cctContent}</textarea> 
		</td>
	</tr>
	<tr>
		<td >포스터</td>
		<td><a href = "../concert_board/upload/${dto.strPoster}" id = 'orgPoster'>${dto.orgPoster}</a>
			<input type = 'button' id = 'chngP' value = '변경' class="btn"/>
		<div id = "poster"></div></td>
	</tr>
	<tr>
		<td>상세이미지</td>
		<td><a href = "../concert_board/upload/${dto.strDetail}" id = 'orgDetail'>${dto.orgDetail}</a>
			<input type = 'button' id = 'chngD' value = '변경' class="btn"/>
			<div id = 'detail'></div></td>
	</tr>
	<tr>
		<td colspan = "2" align = "center">
		<input type = 'button' value = "목록으로" id = "toList" class="btn">
		<input type = "submit" value = '수정완료' class="btn">
		</td>
	</tr>
	<tr>
		<td colspan = '2'>
			<input type = 'hidden' name = 'posterDel' id = 'posterDel'/>
			<input type = 'hidden' name = 'detailDel' id = 'detailDel'/>
		</td>
	</tr>
	
</table>
</div>
</form>
</body>

</html>