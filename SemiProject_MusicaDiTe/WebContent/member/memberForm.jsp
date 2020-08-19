<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>musicadite 회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.8.1.min.js"></script>
<script>
	$(function() {
		$("#frm").submit(function() {
			if ($("#userId").val() == "" || $("#userId").val() == null) {
				alert("아이디를 입력해 주세요");
				$("#userId").focus();
				return false;
			}
			if ($("#userPw").val() == "" || $("#userPw").val() == null) {
				alert("비밀번호를 입력해 주세요");
				$("#userPw").focus();
				return false;
			}
			if ($("#userPw").val() != $("#userPwCon").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#userPw").val("");
				$("#userPwCon").val("");
				$("#userPw").focus();
				return false;
			}
			if ($("#userName").val() == "" || $("#userName").val() == null) {
				alert("이름을 입력해 주세요");
				$("#userName").focus();
				return false;
			}
			if ($("#userBirth").val() == "" || $("#userBirth").val() == null) {
				alert("생년월일을 입력해 주세요");
				$("#userBirth").focus();
				return false;
			}
			/* if (!$("input:radio[name='userGender']").is(
					":checked")) {
				alert("사용자 성별을 선택하세요");
				$(
						"input:radio[name='userGender']:radio[value='M']")
						.attr("checked", true);
				return false;
			} */

			if ($("#userPh1").val() == "" || $("#userPh1").val() == null) {
				alert("연락처를 입력해 주세요");
				$("#userPh1").focus();
				return false;
			}
			if ($("#userEmail").val() == "" || $("#userEmail").val() == null) {
				alert("이메일을 입력해 주세요");
				$("#userEmail").focus();
				return false;
			}
			/* if ($("#userAddr").val() == "" || $("#userAddr").val() == null) {
				alert("주소를 입력해 주세요");
				$("#userAddr").focus();
				return false;
			}
			 */

			if ($("#userIdChk").val() == 1) {
				alert("중복체크를 해주세요.");
				return false;
			}
		});
		
		$("#idChk").click(
				function() {
					if ($("#userId").val() == "") {
						alert("아이디를 입력해주세요.");
						$("#userId").focus();
						return false;
					}
					open("userConfirm.mem?userId=" + $("#userId").val(),
							"아이디 확인", "width=300,height=200,lef=200,top=300");
				});
	});
	// 1. 숫자만 입력받게 하는 방법
	function onlyNumber() {
		if ((event.keyCode < 48) || (event.keyCode > 57))
			event.returnValue = false;
	}

	function CheckForm() {
		if (document.getElementById("txtMobile1").value == "") {
			window.alert("휴대폰 번호를 선택하시오.");
			return false;
		}
		if (document.getElementById("txtMobile2").value.length != 4) {
			window.alert("가운데 번호는 4자리로 입력하세요");
		}
	}
</script>
<style>
caption {
	display: table-caption;
	text-align: center;
}

table {
	display: table;
	align: center;
}

.boardloc {
 		position: absolute;
        left: 500px;
        top: 220px;
} 
</style>
</head>
<body>
	<form action='memberOk.mem' method='post' name='frm' id="frm">

		<div id='memberTab'>

	<div class="mSideloc">
		<%@ include file="../main/fixMenu.jsp"%>
	</div>
	
	
	
			<table width='700' height='500' align="center" class="boardloc">
				<caption>
					<strong>musicadite 회원 회원가입</strong>
				</caption>

				<colgroup>
					<col width="25%" />
					<col width="75%" />
				</colgroup>
				<tfoot>
					<tr>

						<td align="center" colspan="3"><input type='submit'
							value='가입하기' class="btn" />&nbsp;&nbsp; <input type='reset'
							value='다시입력' class="btn" />&nbsp;&nbsp; <input type='button'
							value='가입취소' class="btn" /></td>

					</tr>
				</tfoot>
				<tbody>

					<tr>
						<th><label for='userId'>아이디</label></th>
						<!-- id:#userId1, .userId2 -->
						<td><input type='text' name='userId' id='userId'
							class='userId' size='20' maxlength='10' autofocus="autofocus"
							placeholder='아이디를 입력해주세요.' />
							<button id="idChk">중복 확인</button></td>

					</tr>
					<tr>
						<th><label for='userPw'>비밀번호</label></th>
						<td><input type='password' name='userPw' id='userPw'
							size='20' maxlength='12' /></td>
					</tr>
					<tr>
						<th><label for='userPwCon'>비밀번호 확인</label></th>
						<td><input type='password' name='userPwCon' id='userPwCon'
							size='20' maxlength='12' /></td>
					</tr>

					<tr>
						<th><label for='userName'>이름</label></th>
						<td><input type='text' name='userName' id='userName'
							size='20' maxlength='12'></td>
					</tr>

					<tr>
						<th><label for='userBirth'>생년월일</label></th>
						<td><input type='datetime-local' size='20' name='userBirth'
							id='userBirth' placeholder='1999-12-12'></td>
					</tr>

					<tr>
						<th><label for='userAddr'>주소</label></th>
						<td><input type='text' name='userAddr' id='userAddr'
							size='20' maxlength='12'>&nbsp;
							<button id="postNum" class="btn">우편번호</button></td>
					</tr>
					<tr>
						<td></td>
						<td><input type='text' name='userAddr2' id='userAddr2'
							placeholder='상세주소를 적어주세요.' size='20' /></td>
					</tr>

					<tr>
						<th><label for='userPh1'>연락처 1</label></th>
						<td><input type='text' name='userPh1' id='userPh1'
							placeholder='010-000-0000' size='20' maxlength='13' /></td>
					</tr>
					<tr>
						<th><label for='userPh2'>연락처 2</label></th>
						<td><input type='text' name='userPh2' id='userPh2'
							placeholder='010-000-0000' size='20' maxlength='13' /></td>
					</tr>


					<tr>
						<th><label for='userEmail'>이메일</label></th>
						<td><input type='email' name='userEmail' id='userEmail'
							placeholder='이메일을 입력해주세요.' size='20' /></td>
					</tr>


				</tbody>
			</table>

		</div>
	</form>
</body>
</html>