<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script type = "text/javascript" src = "http://code.jquery.com/jquery-1.8.1.js"></script>
	<script type="text/javascript">
	$(function(){

		$('#frm').submit(function(){
			if ($("#userName").val() == "" || $("#userName").val() == null) {
				alert("이름을 입력해 주세요");
				$("#userName").focus();
				return false;
			}
			if($("#idP").val()== null || $('#idP').val() == ""){
			alert("증명사진을 업로드해주세요");
			$('#idP').focus();
			return false;	
			}
			if($("#userBirth").val()== null || $('#userBirth').val() == ""){
			alert("생일을 입력해주세요");
			$('#userBirth').focus();
			return false;	
			}
			if($("#appAddr").val()== null || $('#appAddr').val() == ""){
			alert("주소를 입력해주세요");
			$('#appAddr').focus();
			return false;	
			}
			if ($("#instrument").val() == "" || $("#instrument").val() == null) {
				alert("악기를 선택하세요");
				$("#instrument").focus();
				return false;
			}
			//if ($("#appEdu").val() == "" || $("#appEdu").val() == null) {
				//alert("학력사항을 입력해주세요");
				//$("#appEdu").focus();
				//return false;
			//}
			if($("#idCard").val()== null || $('#idCard').val() == ""){
			alert("신분증 사본을 업로드해주세요");
			$('#idCard').focus();
			return false;	
			}
			if($("#eduDoc").val()== null || $('#eduDoc').val() == ""){
			alert("학력 증빙자료를 업로드해주세요");
			$('#eduDoc').focus();
			return false;	
			}
			
			
		});
	});
	</script>
<meta charset="UTF-8">
<title>오디션 신청서</title>
</head>
<body>
<form action="applyRegisterPro.app" method = "post"  name = "frm" id = "frm" enctype = "multipart/form-data">
<input type = "hidden" name = "auditionNoticeNum" value = "${dto.auditionNoticeNum}"/>
	<table  >
		<caption>${dto.auditionNoticeTitle } 참가 신청서</caption>
		<tr>
			<td >참가번호</td>
			<td >자동생성</td>
		</tr>
		<tr>
			<td>이름</td>
			<td ><input type = "text" name = "userName" id = "userName"></td>
			<td rowspan = "4">증명사진업로드<br/><input type = "file" name = "idP" id = "idP"></td>
		</tr>
		<tr>
			<td   >생년월일</td>
			<td ><input type = "date" name = "userBirth" id = "userBirth"></td>
		</tr>
		<tr>
			<td >주소</td>
			<td ><input type = "text" name = "appAddr" id = 'appAddr' size = "60"></td>
		</tr>
		<tr>
			<td >부문</td>
			<td >${dto.auditionNoticeCategory}
			</td>
		</tr>
		<tr>
			<td >악기</td>
			<td>  
				<select name = "instrument" id = "instrument">
					<option value = 'null'>악기를 선택하세요</option>
					<option value = "pf">피아노</option>
					<option value = "vn">바이올린</option>
					<option value = "vl">비올라</option>
					<option value = "vc">첼로</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>학력사항</td>
			<td colspan = "2"><textarea cols = "80" rows = "10" name = "appEdu" name = 'appEdu' placeholder = '2007~2011 호서대학교 음악학과 피아노전공 학부과정 수료'></textarea></td>
		</tr>
		<tr>
			<td>경력사항</td>
			<td colspan = "2"><textarea cols = "80" rows = "30" name = "appCareer" placeholder = '2008 Master Class in Norcia'> </textarea></td>
		</tr>
		<tr>
			<td>신분증업로드</td>
			<td><input type = "file" name = "idCard" id = "idCard"></td>
		</tr>
		<tr>
			<td>학력증빙자료업로드</td>
			<td><input type = "file" name = "eduDoc"  id = "eduDoc"></td>
		</tr>
		<tr>	
			<td>경력증빙자료업로드</td>
			<td><input type = "file" name = "crDoc" id = "crDoc"></td>
		</tr>
		<tr>	
			<td>연주동영상링크</td>
			<td><input type = "text" name = "prfrmVd" size = "80"></td>
		</tr>
		<tr>
			<td colspan = "3" align = "right"><input type = "submit" value = "다음"></td>
		</tr>
	</table>
	</form>

</body>
</html>