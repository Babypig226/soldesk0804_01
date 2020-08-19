<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>musicadite 약관동의</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="</script'>
	http: //code.jquery.com/jquery-1.10.2.js">
</script>
<script src="</script'>
	http: //code.jquery.com/ui/1.11.4/jquery-ui.js">
</script>
<link rel="stylesheet" href="/resources/demos/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
#d1 {
	width: 770px;
	margin: 0 auto;
}

.boardloc {
 		position: absolute;
        left: 120px;
        top: 220px;
} 
</style>
<!-- accordion 접히는 Script 선언 -->
<script>
	$(function() {
		$("#accordion").accordion();
		$('#accordion input[type="checkbox"]').click(function(e) {
			e.stopPropagation();
		});
	});
</script>
</head>


<body>
	<div class="mSideloc">
		<%@ include file="../main/fixMenu.jsp"%>
	</div>
	
	<form action="memberRegist.mem" method="post" id="form1">
		<div id="d1" class="boardloc">

			<h3 id="h3">
				약관동의
				</h2>
				<hr>
				<tr>
					<td align="left"><font size="2">musicadite 회원 약관</font></td>
				</tr>
				<div id="accordion">


					<td><textarea readonly="readonly" rows="5" cols="66">
제 1 조 (목적)

이 약관은 네이버 주식회사 ("회사" 또는 "네이버")가 제공하는 네이버 및 네이버 관련 제반 서비스의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.


제 2 조 (정의)

이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 네이버 및 네이버 관련 제반 서비스를 의미합니다.
②"회원"이라 함은 회사의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용하는 고객을 말합니다.
③"아이디(ID)"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 "회사"가 승인하는 문자와 숫자의 조합을 의미합니다.
④"비밀번호"라 함은 "회원"이 부여 받은 "아이디와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.
⑤"유료서비스"라 함은 "회사"가 유료로 제공하는 각종 온라인디지털콘텐츠(각종 정보콘텐츠, VOD, 아이템 기타 유료콘텐츠를 포함) 및 제반 서비스를 의미합니다.
⑥"포인트"라 함은 서비스의 효율적 이용을 위해 회사가 임의로 책정 또는 지급, 조정할 수 있는 재산적 가치가 없는 "서비스" 상의 가상 데이터를 의미합니다.
⑦"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스상"에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다. 
   </textarea>
						<h3>
							<font size="2">회원약관에 동의합니다.(필수)</font><input type="checkbox"
								name="c1" id="c1" />
						</h3>
					<tr>
						<td align="left"><font size="2">개인정보 수집 및 이용약관</font></td>
					</tr>
					<div>
						<textarea readonly="readonly" rows="5" cols="66">

정보통신망법 규정에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.


1. 수집하는 개인정보

이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
 
   </textarea>
					</div>
					<h3>
						<font size="2">개인정보 수집 및 이용에 동의합니다.(필수)</font><input
							type="checkbox" name="c2" id="c2" />
					</h3>
					<tr>
						<td align="left"><font size="2">홍보 및 마케팅에 관한 동의</font></td>
						<div>
					</tr>


					<td><textarea readonly="readonly" rows="5" cols="66">
제 1 조 (목적)

이 약관은 네이버 주식회사 ("회사" 또는 "네이버")가 제공하는 네이버 및 네이버 관련 제반 서비스의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.


제 2 조 (정의)

이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 네이버 및 네이버 관련 제반 서비스를 의미합니다.
②"회원"이라 함은 회사의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용하는 고객을 말합니다.
③"아이디(ID)"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 "회사"가 승인하는 문자와 숫자의 조합을 의미합니다.
④"비밀번호"라 함은 "회원"이 부여 받은 "아이디와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.
⑤"유료서비스"라 함은 "회사"가 유료로 제공하는 각종 온라인디지털콘텐츠(각종 정보콘텐츠, VOD, 아이템 기타 유료콘텐츠를 포함) 및 제반 서비스를 의미합니다.
⑥"포인트"라 함은 서비스의 효율적 이용을 위해 회사가 임의로 책정 또는 지급, 조정할 수 있는 재산적 가치가 없는 "서비스" 상의 가상 데이터를 의미합니다.
⑦"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스상"에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다. 
   </textarea>
				</div>
		</div>
		<h3>
			<font size="2">이벤트 등 프로모션 알림 메일 수신(선택)</font><input type="checkbox"
				name="c3" id="c3" />
		</h3>


		<br /> <br />
		<tr>
			<td align="left"><font size="2">이용약관, 개인정보 수집 및 이용, 위치정보
					이용약관(선택), 프로모션 안내 메일 수신(선택)에 모두 동의합니다.</font></td>

			<td><input type="checkbox" name="all" id="all"></td>
			<hr />
		</tr>

		<!-- 	<tr>
					<td align="left"><font size="2">이벤트 등 프로모션 알림 메일 수신(선택)</font></td>
					<td><input type="checkbox" name="c4" id="c4"></td>
					<hr />
				</tr>
				
				 -->
		<div align="center">
			<tr>
				<td colspan=3><input type="reset" class="btn" value="이전"
					width="20" height="20" id="backSubmit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" class="btn" value="다음" width="20" height="20"
					id="nextSubmit" /></td>
			</tr>
		</div>



	</form>
	<!-- check Box 이벤트처리를 위한 Script -->
	<script>
		var doc = document;
		var form1 = doc.getElementById('form1');
		var inputs = form1.getElementsByTagName('INPUT');
		var form1_data = {
			"c1" : false, //전체 선택
			"c2" : false, //필수 선택 1
			"c3" : false
		//필수 선택 2
		};

		var c1 = doc.getElementById('c1');
		var c2 = doc.getElementById('c2');
		var c3 = doc.getElementById('c3');

		function checkboxListener() {
			form1_data[this.name] = this.checked; //각각 자신의 checkBox를 Checked 상태로 바꿈 
		}

		c1.onclick = c2.onclick = c3.onclick = checkboxListener; //c1, C2, C3를 checkBoxListenner를 호출하여
		//Checked로 바꿈
		var all = doc.getElementById('all'); //전체 체크를 위한 체크박스 선언

		all.onclick = function() { //전체 체크를 누를 시
			if (this.checked) {
				setCheckbox(form1_data, true); //form1_data(c1,c2,c3)의 값을 모두 Checked로 바꿈
			} else {
				setCheckbox(form1_data, false); ////form1_data(c1,c2,c3)의 값을 모두 no checked로 바꿈
			}
		};

		function setCheckbox(obj, state) { //checkbox상태 변경하는 함수
			for ( var x in obj) {
				obj[x] = state;

				for (var i = 0; i < inputs.length; i++) {
					if (inputs[i].type == "checkbox") {
						inputs[i].checked = state;
					}
				}

			}
		}

		form1.onsubmit = function(e) {
			e.preventDefault();

			if (!form1_data['c1']) {
				alert('회원 약관을 동의하지 않았습니다.');
				return false;
			}

			if (!form1_data['c2']) {
				alert('개인정보 수집 및 이용에 대한 안내를 동의하지 않았습니다.');
				return false;
			}

			this.submit();
		};
	</script>
</body>
</html>

