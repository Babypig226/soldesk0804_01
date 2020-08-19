<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/include.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연주자 상세페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
#p1 {
	color: gray;
}

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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.1.js"></script>
<script type="text/javascript">
	$(function() {
		/*$('#toList').click(function() {
			window.hitory.back();
			
		});*/
		$('#modify').click(function() {
			alert('수정페이지로 이동합니다.');
			location.href = 'artsModify.arts?num=' + ${artInfo.artRegNum}
		});
		$('#delete').click(function() {
			var result = confirm('삭제된 내용은 복구되지 않습니다. 계속하시겠습니까?');
			if (result) {
				location.href = 'artsDelete.arts?num=' + ${artInfo.artRegNum}
			} else {
				return false;
			}
		});

	});
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

	<form action="libBoardWrite.lib" method="post" name="boardform"
		enctype="multipart/form-data">


		<div class="boardloc">
			<table class="table table-hover"> 
				<tr align="center" valign="middle">
					<td colspan="8">연주자 상세보기</td>
				</tr>
				<tr>
					<td style="font-family: 돋음; font-size: 12" height="16">번호</td>
					<td>${artInfo.artRegNum}</td>
					<td>이름</td>
					<td>${artInfo.artName}</td>
					<td>분야</td>
					<td>${artInfo.instrument}</td>
					<c:if test='${logId eq "admin"}'>
						<td>담당매니저</td>
						<td>${artInfo.mngName}</td>
					</c:if>
				</tr>

				<tr>
					<td rowspan='4' colspan="2"><img
						src="../management_board/artists_data/${artInfo.strProfile}"></td>
					<c:if test='${logId eq "admin"}'>
						<td style="font-family: 돋음; font-size: 12" height="16" >연락처</td>
						<td style="font-family: 돋음; font-size: 12" height="16" colspan=3>
							${artInfo.artContct}</td>
						<td>매니저연락처</td>
						<td>${artInfo.mngContct}</td>
				</tr>
				<tr>
					<td style="font-family: 돋음; font-size: 12" height="16">이메일</td>
					<td style="font-family: 돋음; font-size: 12" height="16"  colspan=2>
						${artInfo.artEmail}</td>
					</c:if>
					<td>SNS</td>
					<td colspan=2><a href='${artInfo.artSns}'>SNS</a></td>
				</tr>
				<tr>
					<td style="font-family: 돋음; font-size: 12" height="16" >학력</td>
					<td style="font-family: 돋음; font-size: 12" height="16" colspan=5>${fn:replace (artInfo.artEd, cn, br)}</td>
				</tr>
				<tr>
					<td >수상경력</td>
					<td colspan=5>${fn:replace (artInfo.artAwards, cn, br)}</td>
				</tr>
				<tr>
					<td style="font-family: 돋음; font-size: 12" height="16">연주경력</td>
					<td colspan="7">${fn:replace (artInfo.artCr, cn, br)}</td>
				</tr>
				<c:if test='${logId eq "admin"}'>
					<tr>
						<td style="font-family: 돋음; font-size: 12" height="16">구분</td>
						<td>${artInfo.contrctType }</td>
						<td style="font-family: 돋음; font-size: 12" height="16" colspan=2>계약일</td>
						<td><fmt:formatDate value="${artInfo.contrctDate}"
								type="Date" pattern="yyyy-MM-dd" /></td>
						<td style="font-family: 돋음; font-size: 12" height="16" colspan=2>계약만료일</td>
						<td><fmt:formatDate value="${artInfo.expireDate}" type="Date"
								pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<td colspan="4">계약서</td>
						<td><a
							href="../management_board/artists_data/${artInfo.strDoc}">${artInfo.orgDoc}</a></td>
						<td  colspan="2">음반정보</td>
						<td colspan="2"><a
							href="../management_board/artists_data/${artInfo.strAlbumInfo}">${artInfo.orgAlbumInfo}</a></td>
					</tr>
				</c:if>
				<tr align="center">
					<td colspan=5>동영상</td>
					<td colspan=3><a href='${artInfo.video}'>연주영상</a></td>
				</tr>

			</table>
			<div>
			<table align="center">
					<tr>
						<td colspan="7" align="right"><c:if
								test="${logId eq 'admin' }">
								<input type='button' class="btn" value='수정' id="modify">&nbsp;
					<input type='button' value="삭제" class="btn" id="delete">&nbsp;</c:if>
							<input type='button' value='목록으로' class="btn" id="toList" onclick="javascript:history.go(-1);"></td>
					</tr>
				</table>
			</div>

		</div>
	</form>
</body>
</html>