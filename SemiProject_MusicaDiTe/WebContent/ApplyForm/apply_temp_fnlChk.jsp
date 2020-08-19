<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/include.jsp" %>

<!DOCTYPE html>
<html>
<head>
<script type = "text/javascript" src = "http://code.jquery.com/jquery-1.8.1.js"></script>
	<script type="text/javascript">
	$(function(){
		$('#modify').click(function(){
			location.href= 'appModify.app?num='+$("#num").val()
		});
		$('#save').click(function(){
			alert("임시저장 목록으로 넘어갑니다.");
			location.href = "appTempStoreList.app"
		})
		$('#delete').click(function(){
			alert("작성중인 신청서 내용이 삭제됩니다.");
			location.href = "appDel.app?num="+$('#num').val()
		});

		$('#frm').submit(function(){
			if($("#idP").val()== null || $('#idP').val() == ""){
			alert("증명사진을 업로드해주세요");
			$('#idP').focus();
			return false;	
			}
			else if($("#idCard").val()== null || $('#idCard').val() == ""){
			alert("신분증 사본을 업로드해주세요");
			$('#idCard').focus();
			return false;	
			}
			else if($("#eduDoc").val()== null || $('#eduDoc').val() == ""){
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
<form action="applyInsert.app" method = "post"  name = "frm" id = "frm">
<input type = "hidden" value = "${dto.appTempNum}" name = "num" id = "num"/>
	<table  >
		<caption> ${dto.auditionNoticeTitle}참가 신청서</caption>
		<tr>
			<td >참가번호</td>
			<td >${dto.appTempNum}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td >${dto.userName}</td>
			<td rowspan = "4"><img src = "../ApplyForm/upload/${dto.strIdP}" width = "150px" height = "200px"></td>
		</tr>
		<tr>
			<td >생년월일</td>
			<td >${dto.userBirth}</td>
		</tr>
		<tr>
			<td >주소</td>
			<td >${dto.appAddr}</td>
		</tr>
		<tr>
			<td >부문</td>
			<td >
				
			</td>
		</tr>
		<tr>
			<td >악기</td>
			<td>  
				${dto.instrument }
			</td>
		</tr>
		<tr>
			<td>학력사항</td>
			<td colspan = "2">${fn:replace(dto.appEdu, cn, br)}</td>
		</tr>
		<tr>
			<td>경력사항</td>
			<td colspan = "2">${fn:replace(dto.appCareer, cn, br)}</td>
		</tr>
		<tr>
			<td>신분증업로드</td>
			<td><a href = "../ApplyForm/upload/${dto.strIdCard}">${dto.orgIdCard}</a></td>
		</tr>
		<tr>
			<td>학력증빙자료업로드</td>
			<td><a href = "../ApplyForm/upload/${dto.strEduDoc}">${dto.orgEduDoc}</a></td>
		</tr>
		<tr>	
			<td>경력증빙자료업로드</td>
			<td><a href = "../ApplyForm/upload/${dto.strCrDoc}">${dto.orgCrDoc}</a></td>
		</tr>
		<tr>	
			<td>연주동영상링크</td>
			<td><a href = "${dto.prfrmVd}">${dto.prfrmVd}</a></td>
		</tr>
		<tr>
			<td colspan = "3" align = "right"><input type = "submit" value = "신청">&nbsp;
			<input type = button value = "임시저장" id="save">&nbsp;
			<input type = button value = "수정" id = "modify">
			<input type = button value = "삭제" id = "delete">
			
			</td>
		</tr>
	</table>
	</form>

</body>
</html>