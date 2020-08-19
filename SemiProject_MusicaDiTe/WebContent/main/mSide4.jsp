<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Roboto');

/*body 초기화*/
body {
   margin: 0;
   padding: 0;
   font-family: "Trebuchet MS", Dotum;
   display: flex;
   flex-flow: column nowrap;
   justify-content: center;
   align-items: center;
   overflow-x: hidden;
}

h1 {
   margin: 2em 0 1.5em 0;
}

nav {
   width: 100%;
   display: flex;
   justify-content: center;
   position: relative;
   background: black;
}

ul, li {
   margin: 0;
   padding: 0;
   list-style: none;
}

#main-menu>li {
   float: left;
   position: relative;
}

#main-menu>li>a {
   font-size: 0.85rem;
   color: black;
   text-align: center;
   text-decoration: none;
   letter-spacing: 0.05em;
   display: block;
   padding: 14px 36px;
   border-right: 1px solid rgba(0, 0, 0, 0.15);

   /* text-shadow: 1px 1px 1px rgba(0,0,0,0.2);b */
}

#main-menu>li:nth-child(1)>a {
   border-left: 1px solid rgba(0, 0, 0, 0.15);
}

#sub-menu {
   position: absolute;
   /* background: #182952; 서브메뉴 남색 */
   opacity: 0;
   visibility: hidden;
   transition: all 0.15s ease-in;
   text-align: center;
}

#sub-menu>li {
   padding: 10px 20px;
   border-bottom: 1px solid rgba(0, 0, 0, 0.15);
   text-align: center;
}

#sub-menu>li>a {
   color: black;
   text-decoration: none;
}

#main-menu>li:hover #sub-menu {
   opacity: 1;
   visibility: visible;
}

#sub-menu>li>a:hover {
   text-decoration: underline;
}

section {
   column-width: 15em;
   background: #dadadf;
   padding: 2em 12em;
}

.submenu {
   text-align: center;
   color: red;
}
</style>
</head>
<body>

   <c:if test="${empty logId }">
      <!-- 로그인 안 된 경우 -->
      <table class="table1">
         <tr class="miniMsideloc">
            <td><a href="login/login.main">로그인&nbsp;</a></td>
            <td><a href="mem/memberAgree.mem">회원가입&nbsp;</a></td>
            <td><a href="login/login.main">마이페이지&nbsp;</a></td>
            <td><a href="cen/cenmain.cen">고객센터&nbsp;</a></td>
            <td><a href="mem/comeHere.mem">오시는길&nbsp;</a></td>
            <!-- <td><a href="#">사이트맵&nbsp;</a></td> -->
         </tr>
      </table>
   </c:if>

   <c:if test="${!empty logId }">
      <!-- 로그인 된 경우 -->
      <table class="table1">
         <tr class="miniMsideloc">
            <!-- <td><a href="#">진팡쭈님&nbsp;</a></td> -->
            <td><a href="#"> ${logId } 님&nbsp;&nbsp;</a></td>
            <td><a href="mem/memberDetail.mem">내정보&nbsp;&nbsp;</a></td>
            <td><a href="login/logOutPro.main">로그아웃&nbsp;</a></td>
            <td><a href="mem/myPage.mem">마이페이지&nbsp;</a></td>
            <td><a href="cen/cenmain.cen">고객센터&nbsp;</a></td>
            <td><a href="mem/comeHere.mem">오시는길&nbsp;</a></td>
              <!-- <td><a href="#">사이트맵&nbsp;</a></td> -->
         </tr>
      </table>
   </c:if>

   <nav role="navigation">
      <ul id="main-menu">

         <li><a href="#">MUSICA DI TE</a>
            <ul id="sub-menu">
               <li><a href="guideBook/introduce.jsp" aria-label="subemnu">회사 소개</a></li>
              <!-- <li><a href="#" aria-label="subemnu">비전</a></li> --> 
               <li><a href="guideBook/etiquette.jsp" aria-label="subemnu">관람 예절</a></li>
            </ul></li>
         <li><a href="#">ARTIST</a>
            <ul id="sub-menu">
               <c:if test = '${logId eq "admin" }'><li><a href="arts/artsList.arts" aria-label="subemnu">ARTISTS</a></li></c:if>
               <li><a href="arts/artsListByinstrument.arts?instrument=pf" aria-label="subemnu">PIANO</a></li>
               <li><a href="arts/artsListByinstrument.arts?instrument=vn" aria-label="subemnu">VIOLIN</a></li>
               <li><a href="arts/artsListByinstrument.arts?instrument=vl" aria-label="subemnu">VIOLA</a></li>
               <li><a href="arts/artsListByinstrument.arts?instrument=vc" aria-label="subemnu">CELLO</a></li>
               <li><a href="arts/artsListByinstrument.arts?instrument=emsbl" aria-label="subemnu">ENSEMBLE</a></li>
            </ul></li>
         <li><a href="#">PAST</a>
            <ul id="sub-menu">
               <li><a href="cct/pastConcertList.cct?year=2021" aria-label="subemnu" class="submenu">2020</a></li>
               <li><a href="cct/pastConcertList.cct?year=2020" aria-label="subemnu">2019</a></li>
               <li><a href="cct/pastConcertList.cct?year=2019" aria-label="subemnu">2018</a></li>
               <li><a href="cct/pastConcertList.cct?year=2018" aria-label="subemnu">2017</a></li>
            </ul></li>
         <li><a href="#">COMING SOON</a>
            <ul id="sub-menu">
               <c:if test = '${logId eq "admin" }'><li><a href="cct/concertList.cct" aria-label="subemnu" class="submenu">CONCERTS 관리</a></li></c:if>
               <c:if test = '${logId eq "admin" }'><li><a class="submenuLink" href = "tkt/ticketsList.tkt">티켓관리</a></li></c:if>
               <li><a href="cct/upcomingConcertList.cct" aria-label="subemnu">CONCERTS</a></li>
            </ul></li>
         <li><a href="#">BOARD</a>
            <ul id="sub-menu">
               <li><a href="not/notBoardList.not" aria-label="subemnu">공지사항</a></li>
               <li><a class="submenuLink" href = "aud/auditionList.aud">오디션공고</a></li>
               <li><a href="eve/eveBoardList.eve" aria-label="subemnu">이벤트</a></li>
               <li><a href="lost/lostBoardList.lost" aria-label="subemnu">분실물</a></li>
             <!--   <li><a href="rev/revBoardList.rev" aria-label="subemnu">리뷰</a></li> -->

            </ul></li>


      </ul>
   </nav>


</body>
</html>