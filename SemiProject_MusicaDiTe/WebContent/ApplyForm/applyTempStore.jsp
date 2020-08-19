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
						
			var result = confirm("작성된 내용은 추후 수정이 불가능합니다. 진행하시겠습니까?");
			if(result){
				return true;}
			else{
				return false;
			}
		});
	});
	</script>
<meta charset="UTF-8">
<title>오디션 신청서</title>
</head>
<body>
<form action="applyFinOk.app" method = "post"  name = "frm" id = "frm">
<input type = "hidden" value = "${dto.appTempNum}" name = "num" id = "num"/>
<input type = "hidden" value = "${dto.auditionNoticeNum }" name = "auditionNoticeNum" />
	<table  >
		<caption> ${dto.auditionNoticeTitle}참가 신청서</caption>
		<tr>
			<td >참가번호</td>
			<td>${dto.appTempNum}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td name = "userName">${dto.userName}</td>
			<td rowspan = "4"><img src = "../ApplyForm/upload/${dto.strIdP}" width = "150px" height = "200px"></td>
		</tr>
		<tr>
			<td >생년월일</td>
			<td name = 'userBirth'><fmt:formatDate value="${dto.userBirth}" type = "Date" pattern = "yyyy-MM-dd"/> </td>
		</tr>
		<tr>
			<td >주소</td>
			<td >${dto.appAddr}</td>
		</tr>
		<tr>
			<td >부문</td>
			<td name = "auditionNoticeCategory">
				${dto.auditionNoticeCategory}
			</td>
		</tr>
		<tr>
			<td >악기</td>
			<td name = "instrument">  
				${dto.instrument }
			</td>
		</tr>
		<tr>
			<td>학력사항</td>
			<td colspan = "2" name = "appEdu">${fn:replace(dto.appEdu, cn, br)}</td>
		</tr>
		<tr>
			<td>경력사항</td>
			<td colspan = "2" name="appCareer">${fn:replace(dto.appCareer, cn, br)}</td>
		</tr>
		<tr>
			<td>신분증업로드</td>
			<td><a href = "../ApplyForm/upload/${dto.strIdCard}" name = "orgIdCard">${dto.orgIdCard}</a></td>
		</tr>
		<tr>
			<td>학력증빙자료업로드</td>
			<td><a href = "../ApplyForm/upload/${dto.strEduDoc}" name = "ordEduDoc">${dto.orgEduDoc}</a></td>
		</tr>
		<tr>	
			<td>경력증빙자료업로드</td>
			<td><a href = "../ApplyForm/upload/${dto.strCrDoc}" name = "orgCrDoc">${dto.orgCrDoc}</a></td>
		</tr>
		<tr>	
			<td>연주동영상링크</td>
			<td><a href = "${dto.prfrmVd}" name = "prfrmVd">${dto.prfrmVd}</a></td>
		</tr>
		<tr>
			<td colspan = "3" align = "right">
			<input type = "submit" value = "신청">&nbsp;
			<input type = 'button' value = "임시저장" id="save">&nbsp;
			<input type = 'button' value = "수정" id = "modify">
			<input type = 'button' value = "삭제" id = "delete">
			
			</td>
		</tr>
	</table>
	</form>

</body>
</html>