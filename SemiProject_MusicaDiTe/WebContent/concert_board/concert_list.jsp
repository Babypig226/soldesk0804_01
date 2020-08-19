<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/include.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Concert List</title>
<meta charset="utf-8">
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

#p2 {
	text-align: right;
}

.boardloc {
	position: absolute;
	left: 120px;
	top: 300px;
}
</style>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('#write').click(function() {
			location.href = 'concertWrite.cct'
		});
	});
	  function login(){
	         alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.');
	         location.href = '../login/login.main'
	      }

</script>
</head>
<body>

	<%@ include file="../main/fixMenu.jsp"%>


	

	<div class="boardloc">

		<a style="display: scroll; position: fixed; bottom: 5px; right: 5px;"
			href="#" title="맨위로"><img src="../images/pageUpDown.PNG"
			width="100" height="100"></a>

		<p id="p2">
			<font size=2>공연 총 <b> ${count }</b> 회
			</font>
		</p>
		<table class="table table-hover">
			<!-- 데이터가 있는 경우 -->

			<tr align="center" valign="middle">
				<td colspan="7">Concert List</td>

			</tr>

			<tr align="center" valign="middle" boardercoller="#333333">
				<td width="6%" height="26">번호</td>
				<td width="20%">포스터</td>
				<td width="20%">공연명</td>
				<td width="20%">공연장소</td>
				<td width="20%">공연일시</td>
				<td width="6%">담당자</td>
				<td width="6%">등록일</td>

			</tr>
			<c:if test="${!empty dto}">
				<c:forEach items="${dto}" var="info" varStatus="cnt">
					<tr align="center" valign="middle" bordercolor="#333333">
						<td style="font-family: Tahoma; font-size: 8pt;" width="6%"
							height="26">
							<div align="center">${cnt.count}</div>
						</td>
						<td style="font-family: Tahoma; font-size: 8pt;" width="20%">
							<div align="center">
								<img src='../concert_board/upload/${info.strPoster}' />
							</div>
						</td>
						<td style="font-family: Tahoma; font-size: 8pt;" width="20%"
							height="26">
							<div align="center">
								 <c:if test = '${logId eq "admin"}'><a href="cctDetail.cct?num=${info.cctNum}"> ${info.cctTitle}</a></c:if>
								 <c:if test = '${logId ne "admin"}'><a href="cctDetailCst.cct?num=${info.cctNum}"> ${info.cctTitle}</a></c:if>
             					 <c:if test = '${logId == null}'><a href = "javascript:login();">${info.cctTitle}</a></c:if>

							</div>
						</td>
						<td style="font-family: Tahoma; font-size: 8pt;" width="20%">
							<div align="center">${info.cctLocation}</div>
						</td>
						<td style="font-family: Tahoma; font-size: 8pt;" width="20%">
							<div align="center">
								<fmt:formatDate value="${info.cctDate}" type="date"
									pattern="yyyy-MM-dd HH:mm" />
							</div>
						</td>
						<td style="font-family: Tahoma; font-size: 8pt;" width="6%">
							<div align="center">${info.employeeId}</div>
						</td>
						<td style="font-family: Tahoma; font-size: 8pt;" width="6%">
							<div align="center">
								<fmt:formatDate value="${info.regDate}" type="date"
									pattern="yyyy-MM-dd" />
							</div>
						</td>
					</tr>
				</c:forEach>
			</c:if>

			<tr align="center" valign="middle" bordercolor="#333333"
				onmouseover="this.style.backgroundColor='F8F8F8'"
				onmouseout="this.style.backgroundColor=''">
				<td height="23" style="font-family: Tahoma; font-size: 10pt;">

				</td>

				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="left">
						<a href="#?num="> </a>
					</div>
				</td>

				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center"></div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center"></div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center"></div>
				</td>
			</tr>

			<tr align=center height=20>
				<td colspan=8 style="font-family: Tahoma; font-size: 10pt;">
				<c:if test = "${logId == 'admin'}"><%@ include	file="/include/includePage.jsp"%></c:if>
				</td>
			</tr>

			<tr>
				<c:if test = "${logId == 'admin'}"><td colspan='8' align=right><input type='button' value='글작성' id='write'
					name='write' class="btn" /></c:if></td>

			</tr>


			<!-- 데이터 없는 경우 -->
			<c:if test="${empty dto}">
				<tr align="center" valign="middle">


					<td colspan="7">Concert List</td>
				</tr>
				<tr>
					<td colspan='7' align=center><font size=2>등록된 글이 없습니다.</font>
					</td>
				</tr>
			</c:if>
		</table>
	</div>
</body>
</html>