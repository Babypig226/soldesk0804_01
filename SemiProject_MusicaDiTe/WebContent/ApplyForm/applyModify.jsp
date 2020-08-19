<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script type = "text/javascript" src = "http://code.jquery.com/jquery-1.8.1.js"></script>
	<script type="text/javascript">
	$(function(){
			$("#chngIdP").click(function(){
				if($(this).attr("value") == "변경"){
				$("#chngIdP").attr("value","변경취소");
				$("#idPDel").val("${dto.strIdP}");
				$("#idPd").html("<input type = 'file' name ='idP' id = 'idP'>");
			}else{
				$("#chngIdP").attr("value","변경");
				$("#idPDel").val("");
				$("#idPd").html("");
				}
			});
			$("#chngIdCard").click(function(){
				if($(this).attr("value") == "변경"){
				$("#chngIdCard").attr("value","변경취소");
				$("#idCardDel").val("${dto.strIdCard}");
				$("#idCardd").html("<input type = 'file' name ='idCard' id = 'idCard'>");
			}else{
				$("#chngIdCard").attr("value","변경");
				$("#idCardDel").val("");
				$("#idCardd").html("");
				}
			});
			$("#chngEduDoc").click(function(){
				if($(this).attr("value") == "변경"){
				$("#chngEduDoc").attr("value","변경취소");
				$("#eduDocDel").val("${dto.strEduDoc}");
				$("#eduDocd").html("<input type = 'file' name ='eduDoc' id = 'eduDoc'>");
			}else{
				$("#chngEduDoc").attr("value","변경");
				$("#eduDocDel").val("");
				$("#eduDocd").html("");
				}
			});
			$("#chngCrDoc").click(function(){
				if($(this).attr("value") == "변경"){
				$("#chngCrDoc").attr("value","변경취소");
				$("#crDocDel").val("${dto.strCrDoc}");
				$("#crDocd").html("<input type = 'file' name ='crDoc' id = 'crDoc'>");
			}else{
				$("#chngCrDoc").attr("value","변경");
				$("#crDocDel").val("");
				$("#crDocd").html("");
				}
			});
		$('#toList').click(function(){
			location.href = 'appTempStoreList.app'
		});
		$('#frm').submit(function(){
			if ($("#userName").val() == "" || $("#userName").val() == null) {
				alert("이름을 입력해 주세요");
				$("#userName").focus();
				return false;
			}
			if(($("#idP").val()== null || $('#idP').val() == "")&& $('#chngIdP').val()=='변경취소'){
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
			if ($("#appEdu").val() == "" || $("#appEdu").val() == null) {
				alert("학력사항을 입력해주세요");
				$("#appEdu").focus();
				return false;
			}
			if(($("#idCard").val()== null || $('#idCard').val() == "")&& $('#chngIdCard').val()=='변경취소'){
			alert("신분증 사본을 업로드해주세요");
			$('#idCard').focus();
			return false;	
			}
			if(($("#eduDoc").val()== null || $('#eduDoc').val() == "")&& $('#chngEduDoc').val()=='변경취소'){
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
<form action="appTempMod.app" method = "post"  name = "frm" id = "frm" enctype = "multipart/form-data">
<input type = "hidden" name = "num" value = "${dto.appTempNum}"/>
	<table >
		<caption> ${dto.auditionNoticeTitle} 참가 신청서</caption>
		<tr>
			<td >참가번호</td>
			<td >${dto.appTempNum}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td ><input type = "text" name = "userName" id = "userName" value = "${dto.userName}"></td>
			
			
			<td rowspan = "4"><a href = "../ApplyForm/upload/${dto.strIdP}" >${dto.orgIdP}</a><br/>
			<input type = 'button'  id = "chngIdP" value = '변경'/><br/>
			<div id = 'idPd'></div></td>
		</tr>
		<tr>
			<td >생년월일</td>
			<td ><input type = "date" name = "userBirth" id = "userBirth" value = "<fmt:formatDate value="${dto.userBirth}" type = 'date' pattern = "yyyy-MM-dd"/>"></td>
		</tr>
		<tr>
			<td >주소</td>
			<td ><input type = "text" name = "appAddr" id = "appAddr" size = "60" value = "${dto.appAddr}"></td>
		</tr>
		<tr>
			<td >부문</td>
			<td >${dto.auditionNoticeCategory}
			</td>
		</tr>
		<tr>
			<td >악기</td>
			<td>  
				<select name = "instrument">
					<option value = "null">악기를 선택하세요</option>
					<option value = "pf" <c:if test = "${dto.instrument eq 'pf'}">selected</c:if>>피아노</option>
					<option value = "vn" <c:if test = "${dto.instrument eq 'vn'}">selected</c:if>>바이올린</option>
					<option value = "vl" <c:if test = "${dto.instrument eq 'vl'}">selected</c:if>>비올라</option>
					<option value = "vc" <c:if test = "${dto.instrument eq 'vc'}">selected</c:if>>첼로</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>학력사항</td>
			<td colspan = "2"><textarea cols = "80" rows = "10" name = "appEdu" id = "appEdu">${dto.appEdu }</textarea></td>
		</tr>
		<tr>
			<td>경력사항</td>
			<td colspan = "2"><textarea cols = "80" rows = "30" name = "appCareer">${dto.appCareer}</textarea></td>
		</tr>
		<tr>
			<td>신분증업로드</td>
			<td><a href = "../ApplyForm/upload/${dto.strIdCard}">${dto.orgIdCard}</a><br/>
			<input type = 'button' id = "chngIdCard" value = '변경'/><br/>
			<div id = 'idCardd'></div></td>
		</tr>
		<tr>
			<td>학력증빙자료업로드</td>
			<td><a href = "../ApplyForm/upload/${dto.strEduDoc}">${dto.orgEduDoc}</a><br/>
			<input type = 'button' id = "chngEduDoc" value = '변경'/><br/>
			<div id = 'eduDocd'></div></td>
		</tr>
		<tr>	
			<td>경력증빙자료업로드</td>
			<td><a href = "../ApplyForm/upload/${dto.strCrDoc}">${dto.orgCrDoc}</a><br/>
			<input type = 'button' id = "chngCrDoc" value = '변경'/><br/>
			<div id = 'crDocd'></div></td>
		</tr>
		<tr>	
			<td>연주동영상링크</td>
			<td><input type = "text" name = "prfrmVd" size = "80" value = "${dto.prfrmVd}"></td>
		</tr>
		<tr>
			<td colspan = "3" align = "right">
			<input type = "button" id ="toList" value = "목록으로">&nbsp;
			<input type = "submit" value = "수정">&nbsp;
		</tr>
		<tr>
		<td colspan = '3'>
			<input type = 'hidden' name = 'idPDel' id = 'idPDel'/>
			<input type = 'hidden' name = 'idCardDel' id = 'idCardDel'/>
			<input type = 'hidden' name = 'eduDocDel' id = 'eduDocDel'/>
			<input type = 'hidden' name = 'crDocDel' id = 'crDocDel'/>
		</td>
		</tr>
	</table>
	</form>

</body>
</html>