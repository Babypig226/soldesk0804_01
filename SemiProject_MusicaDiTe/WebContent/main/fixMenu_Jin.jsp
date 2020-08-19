<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>메인페이지</title>
<style>
#footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 10px;
}

.logoloc { 
        position: fixed;
        left: 50px;
        top: 0px;
      }
      
.mSideloc {
 		position: fixed;
        left: 350px;
        top: 90px;
}
a {
	text-decoration: none /* 텍스트 밑줄간거 없애기 */
}

#topMenu {
	height: 50px; /* 메인 메뉴의 높이 */
	width: 1000px; /* 메인 메뉴의 넓이 */
}

#topMenu ul { /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
	list-style-type: none; /* 메인 메뉴 안의 ul 내부의 목록 표시를 없애줌 */
	margin: 0px; /* 메인 메뉴 안의 ul의 margin을 없앰 */
	padding: 0px; /* 메인 메뉴 안의 ul의 padding을 없앰 */
}

#topMenu ul li { /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */
	color: white; /* 글씨 색을 흰색으로 설정 */
	background-color: #2d2d2d; /* 배경 색을 RGB(2D2D2D)로 설정 */
	float: left; /* 왼쪽으로 나열되도록 설정 */
	line-height: 30px; /* 텍스트 한 줄의 높이를 30px로 설정 */
	vertical-align: middle; /* 세로 정렬을 가운데로 설정 */
	text-align: center; /* 텍스트를 가운데로 정렬 */
	position: relative; /* 해당 li 태그 내부의 top/left 포지션 초기화 */
}

.menuLink, .submenuLink { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
	text-decoration: none; /* a 태그의 꾸밈 효과 제거 */
	display: block; /* a 태그의 클릭 범위를 넓힘 */
	width: 150px; /* 기본 넓이를 150px로 설정 */
	font-size: 12px; /* 폰트 사이즈를 12px로 설정 */ <!--
	font-weight: bold; --> /* 폰트를 굵게 설정 */
	font-family: "Trebuchet MS", Dotum; /* 기본 폰트를 영어/한글 순서대로 설정 */
}

.menuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */
	color: white;
}

.topMenuLi:hover .menuLink { /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
	color: gray; /* 글씨 색 회색 */
	background-color: #4d4d4d; /* 배경색을 밝은 회색으로 설정 */
}

.submenuLink { /* 하위 메뉴의 a 태그 스타일 설정 */
	color: #2d2d2d; /* 글씨 색을 RGB(2D2D2D)로 설정 */
	background-color: white; /* 배경색을 흰색으로 설정 */
	border: solid 0px black; /* 테두리를 설정 원랜 1px */
	margin-top: -1px; /* 위 칸의 하단 테두리와 아래칸의 상단 테두리가 겹쳐지도록 설덩 */
	text-align: center; /* 텍스트를 가운데로 정렬 */
}

.longLink { /* 좀 더 긴 메뉴 스타일 설정 */
	width: 190px; /* 넓이는 190px로 설정 */
}

.submenu { /* 하위 메뉴 스타일 설정 */
	position: absolute; /* html의 flow에 영향을 미치지 않게 absolute 설정 */
	height: 0px; /* 초기 높이는 0px로 설정 */
 	overflow: auto; --> /* 실 내용이 높이보다 커지면 해당 내용 감춤 */
	transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */
	-webkit-transition: height .2s;
	/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 크롬/사파라ㅣ) */
	-moz-transition: height .2s;
	/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 파폭) */
	-o-transition: height .2s;
	/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 오페라) */
	width: 250px;
}

.topMenuLi:hover .submenu { /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */
	height: 100px; /* 높이를 93px로 설정 */
}

.submenuLink:hover { /* 하위 메뉴의 a 태그의 마우스 오버 스타일 설정 */
	color: gray; /* 글씨색을 회색으로 설정 */
	background-color: gray; /* 배경을 RGB(DDDDDD)로 설정 */
}

.table1 {
	color: gray;
	padding-left: 450px;
}

.miniMsideloc {
		position: absolute;
        right: 350px;
        top: 15px;
}     
</style>
</head>
<body>
<tr>
	<td colspan=3><input type="image"
		onclick="javascript:location.href='../main.main';" src="../images/mlogo.png"
		width="250" height="250" id="logoImg" class="logoloc" /></td>
</tr>

	<div class="mSideloc">
		<c:if test="${empty logId }">
		<!-- 로그인 안 된 경우 -->
		<table class="table1">
			<tr class="miniMsideloc">
				<td><a href="../login/login.main">로그인&nbsp;</a></td>
				<td><a href="../mem/memberAgree.mem">회원가입&nbsp;</a></td>
				<td><a href="../login/login.main">마이페이지&nbsp;</a></td>
				<td><a href="#">고객센터&nbsp;</a></td>
				<td><a href="#">오시는길&nbsp;</a></td>
				<td><a href="#">사이트맵&nbsp;</a></td>
			</tr>
		</table>
	</c:if>

	<c:if test="${!empty logId }">
		<!-- 로그인 된 경우 -->
		<table class="table1">
			<tr style="right: 200px;">
				<!-- <td><a href="#">진팡쭈님&nbsp;</a></td> -->
				<td><a href="#"> ${logId } 님&nbsp;&nbsp;</a></td>
				<td><a href="../mem/memberDetail.mem">내정보&nbsp;&nbsp;</a></td>
				<td><a href="../login/logOutPro.main">로그아웃&nbsp;</a></td>
				<td><a href="#">마이페이지&nbsp;</a></td>
				<td><a href="../cen/cenmain.cen">고객센터&nbsp;</a></td>
				<td><a href="#">오시는길&nbsp;</a></td>
				<td><a href="#">사이트맵&nbsp;</a></td>
			</tr>
		</table>
	</c:if>

	<br />
	<br />
	<nav id="topMenu">
		<ul>
			<li class="topMenuLi"><a class="menuLink" href="#">MUSICA DI TE</a>
				<ul class="submenu">
					<li><a class="submenuLink">회사 소개</a></li>
					<li><a class="submenuLink">비전</a></li>
					<li><a class="submenuLink">연혁</a></li>
				</ul></li>

			<li class="topMenuLi"><a class="menuLink" href="#">ARTIST</a>
				<ul class="submenu">
					<li><a class="submenuLink">사람1</a></li>
					<li><a class="submenuLink">사람2</a></li>
					<li><a class="submenuLink">사람3</a></li>
				</ul></li>
				
			<li class="topMenuLi"><a class="menuLink" href="#">하기싫어씨발 </a>
				<ul class="submenu">
					<li><a class="submenuLink">앙 기모딱</a></li>
					<li><a class="submenuLink">기모뛰</a></li>
					<li><a class="submenuLink">곱창먹고파</a></li>
				</ul></li>


			<li class="topMenuLi"><a class="menuLink" href="#">COMING SOON</a>
				<ul class="submenu">
					<li><a class="submenuLink">앙 기모딱</a></li>
					<li><a class="submenuLink">기모뛰</a></li>
					<li><a class="submenuLink">곱창먹고파</a></li>
				</ul></li>

			<li class="topMenuLi"><a class="menuLink" href="#">BOARD</a>
				<ul class="submenu">
					<li><a class="submenuLink" href="../rev/revBoardList.rev">리뷰</a></li>
					<li><a class="submenuLink" href="../lost/lostBoardList.lost">분실물</a></li>
					<li><a class="submenuLink" href="../eve/eveBoardList.eve">이벤트</a></li>
					<li><a class="submenuLink" href="../not/notBoardList.not">공지사항</a></li>
				</ul></li>
		</ul>
	</nav>
	</form>

	</div>


</body>
</html>