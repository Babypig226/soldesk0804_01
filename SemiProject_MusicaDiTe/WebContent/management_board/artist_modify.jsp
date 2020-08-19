<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연주자 정보수정</title>
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
		$("#toList").click(function() {
			location.href = 'artsList.arts'
		});
		$("#profile").click(function() {
							if ($(this).attr("value") == "변경") {
								$("#profile").attr("value", "변경취소");
								$('#image').attr("src", "");
								$("#profileDel").val("${artInfo.strProfile}");
								$("#chngProfile").html("<input type = 'file' name ='profileP' id = 'profileP'>");
							} else {
								$("#profile").attr("value", "변경");
								$('#image').attr("src","../management_board/artists_data/${artInfo.strProfile}");
								$("#profileDel").val("");
								$("#chngProfile").html("");
							}
						});

		$("#contract").click(function() {
							if ($(this).attr("value") == "변경") {
								$("#contract").attr("value", "변경취소");
								$("#contrctInfo").html("");
								$("#contractDel").val("${artInfo.strDoc}");
								$("#chngContrct").html("<input type = 'file' name ='fileup' id = 'fileup'>");
							} else {
								$("#contract").attr("value", "변경");
								$("#contrctInfo").html("${artInfo.orgDoc}");
								$("#contractDel").val("");
								$("#chngContrct").html("");
							}
						});
		$("#album").click(function() {
							if ($(this).attr("value") == "변경") {
								$("#album").attr("value", "변경취소");
								$("#albumInfo").html("");
								$("#albumDel").val("${artInfo.strAlbumInfo}");
								$("#chngAlbum").html("<input type = 'file' name ='albumUp' id = 'albumUp'>");
							} else {
								$("#album").attr("value", "변경");
								$("#albumInfo").html("${artInfo.orgAlbumInfo}");
								$("#albumDel").val("");
								$("#chngAlbum").html("");
							}
						});
		$('#artsform').submit(function() {
							if (($("#profileP").val() == null || $('#profileP')
									.val() == "")
									&& $('#profile').val() == "변경취소") {
								alert("프로필사진을 업로드해주세요");
								$('#chngProfile').focus();
								return false;
							}
							if (($("#fileup").val() == null || $('#fileup')
									.val() == "")
									&& $('#contract').val() == '변경취소') {
								alert("계약서 자료를 업로드해주세요");
								$('#chngContrct').focus();
								return false;
							}
							if ($("#artName").val() == ""
									|| $("#artName").val() == null) {
								alert("연주자 이름을 입력해주세요");
								$("#artName").focus();
								return false;
							}
							if ($("#mngName").val() == null
									|| $('#mngName').val() == "") {
								alert("매니저 이름을 입력해주세요");
								$('#mngName').focus();
								return false;
							}
							if ($("#artContct").val() == null
									|| $('#artContct').val() == "") {
								alert("연주자 연락처를 입력해주세요");
								$('#artContct').focus();
								return false;
							}
							if ($("#mngContct").val() == ""
									|| $("#mngContct").val() == null) {
								alert("매니저 연락처를 입력해주세요");
								$("#mngContct").focus();
								return false;
							}
							if ($("#artEmail").val() == ""
									|| $("#artEmail").val() == null) {
								alert("이메일을 입력해주세요");
								$("#artEmail").focus();
								return false;
							}
							if ($("#artEd").val() == null
									|| $('#artEd').val() == "") {
								alert("학력사항을 입력해주세요");
								$('#artEd').focus();
								return false;
							}
							if ($("#contrctType").val() == null
									|| $('#contrctType').val() == "") {
								alert("계약구분을 선택해주세요");
								$('#contrctType').focus();
								return false;
							}
							if ($("#cctrctDate").val() == null
									|| $('#cctrctDate').val() == "") {
								alert("계약일을 입력해주세요");
								$('#cctrctDate').focus();
								return false;
							}
							if ($("#expireDate").val() == null
									|| $('#expireDate').val() == "") {
								alert("계약만료일을 입력해주세요");
								$('#expireDate').focus();
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

	<form action="artsModPro.arts" method="post" id="artsform"
		name="artsform" enctype="multipart/form-data">
		<input type="hidden" name="artRegNum" value="${artInfo.artRegNum}" />
		<input type="hidden" id="profileDel" name="profileDel"> <input
			type="hidden" id="contractDel" name="contractDel"> <input
			type="hidden" id="albumDel" name="albumDel">

		<div class="boardloc">
			<table class="table table-hover">

				<tr align="center" valign="middle">
					<td colspan="8">연주자정보 수정</td>
				</tr>
				<tr>
					<td style="font-family: 돋음; font-size: 12" height="16">번호</td>
					<td>${artInfo.artRegNum}</td>
					<td>이름</td>
					<td><input type="text" name="artName" id="artName"
						value="${artInfo.artName}"></td>
					<td>담당매니저</td>
					<td><input type="text" name="mngName" id="mngName"
						value="${artInfo.mngName}"></td>
				</tr>

				<tr>
					<td rowspan='3' colspan="2"><img id="image"
						src="../management_board/artists_data/${artInfo.strProfile}" /> <input
						type='button' id="profile" value='변경' />
						<div id="chngProfile"></div></td>
					<td style="font-family: 돋음; font-size: 12" height="16">연락처</td>
					<td style="font-family: 돋음; font-size: 12" height="16"><input
						type="text" name="artContct" id="artContct"
						value="${artInfo.artContct}"></td>
					<td>매니저연락처</td>
					<td><input type="text" name="mngContct" id="mngContct"
						value="${artInfo.mngContct}"></td>
				</tr>
				<tr>
					<td style="font-family: 돋음; font-size: 12" height="16">이메일</td>
					<td style="font-family: 돋음; font-size: 12" height="16"><input
						type="email" name="artEmail" id="artEmail"
						value="${artInfo.artEmail}"></td>
					<td>SNS</td>
					<td><input type="text" name="artSns" id="artSns"
						value="${artInfo.artSns}"></td>
				</tr>
				<tr>
					<td style="font-family: 돋음; font-size: 12" height="16">학력</td>
					<td style="font-family: 돋음; font-size: 12" height="16"><textarea
							rows="10" cols="20" name="artEd" id="artEd">${artInfo.artEd}</textarea>
					</td>
					<td>수상내역</td>
					<td><textarea rows="10" cols="20" name="artAwards">${artInfo.artAwards}</textarea>

					</td>
				</tr>
				<tr>
					<td>분야</td>
					<td>${artInfo.instrument}</td>
					<td style="font-family: 돋음; font-size: 12" height="16">연주이력</td>
					<td colspan="3"><textarea rows="10" cols="50" name="artCr">${artInfo.artCr}</textarea>
					</td>
				</tr>
				<tr>
					<td style="font-family: 돋음; font-size: 12" height="16">계약구분</td>
					<td>${artInfo.contrctType}</td>
					<td style="font-family: 돋음; font-size: 12" height="16">계약일</td>
					<td><input type="date" name="contrctDate" id="contrctDate"
						value="<fmt:formatDate value="${artInfo.contrctDate}" type = 'date' pattern = "yyyy-MM-dd"/>">
					</td>
					<td style="font-family: 돋음; font-size: 12" height="16">계약만료일</td>
					<td><input type="date" name="expireDate" id="expireDate"
						value="<fmt:formatDate value="${artInfo.expireDate}" type = 'date' pattern = "yyyy-MM-dd"/>">
					</td>
				</tr>
				<tr>
					<td>계약서</td>
					<td align="center" colspan=7><a id='contrctInfo'
						href="../management_board/artists_data/${artInfo.strDoc}">${artInfo.orgDoc}</a>
						<input type='button' id="contract" value='변경' class="btn">
						<div id="chngContrct"></div></td>

				</tr>
				<tr>
					<td>음반</td>
					<td colspan=2><a id='albumInfo'
						href="../management_board/artists_data/${artInfo.strAlbumInfo}">${artInfo.orgAlbumInfo}</a>
						<input type='button' id="album" value='변경' class="btn" />
						<div id="chngAlbum"></div></td>
					<td>동영상</td>
					<td ><input type="text" name="video" value="${artInfo.video}">
					</td>
				</tr>
				<tr>
					<td colspan="7" align="center"><input type="button" class="btn" onclick="javascript:submit();"
						value="수정완료">&nbsp;<input type="button" class="btn"
						id="toList" value="목록"></td>
				</tr>

			</table>
		</div>
	</form>
</body>
</html>