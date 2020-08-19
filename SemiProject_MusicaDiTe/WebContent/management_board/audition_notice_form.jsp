<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/include/include.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연주자 모집 공고</title>
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
   left: 500px;
   top: 220px;
}
</style>
</head>
<body>

   <div class="logoloc">
      <tr>
         <td colspan=3><input type="image" src="../images/mlogo.png"
            onclick="javascript:location.href='../main.main';" width="250"
            height="250" id="logoImg" /></td>
      </tr>
   </div>



   <div class="boardloc">
      <table class="table table-hover" style="width: 700px">
         <tr align="center">
            <td colspan=4>공고번호&nbsp;&nbsp; ${dto.auditionNoticeNum}</td>

         </tr>
         <tr>
            <td>오디션명</td>
            <td>${fn:replace(dto.auditionContent, cn, br)}</td>
            <td><img src="../management_board/upload/${dto.image}"
              width="250"
				height="250" /></td>
         </tr>


         <tr>
            <td>접수기간</td>
            <td colspan=3>${dto.auditionNoticeApperiod}</td>
         </tr>

         <tr>
            <td>오디션 일시</td>
            <td colspan=3>${dto.auditionDate }</td>
         </tr>

         <tr>
            <td>오디션 장소</td>
            <td colspan=3>${dto.auditionNoticeLocation }</td>
         </tr>

         <tr>
            <td>오디션 부문</td>
            <td colspan=3>${dto.auditionNoticeCategory }</td>
         </tr>
         <tr>
            <td>선발인원</td>
            <td colspan=3>${dto.auditionNoticeSelnum }</td>
         </tr>
         <tr>
            <td>참가자격</td>
            <td colspan=3>${fn:replace(dto.applyCondition, cn, br)}</td>
         </tr>

         <tr>
            <td colspan=3>문의 : Musica di Te 고객센터 : 02-123-4567 (AM 09:00 -
               PM 08:00)</td>
         </tr>

      </table>




      <div>
         <table align="center">
            <tr>

               <td colspan="5" align="center"><input type="button"
                  class="btn" value="참가신청"
                  onclick="javascript:location.href='../app/appRegist.app?num=${dto.auditionNoticeNum}';" />&nbsp;</td>
               <td colspan="5" align="center"><input type="button"
                  class="btn" value="수정"
                  onclick="javascript:location.href='audNoticeModify.aud?num=${dto.auditionNoticeNum}';" />&nbsp;</td>

               <td colspan="5" align="center"><input type="button"
                  class="btn" value="삭제하기"
                  onclick="javascript:location.href='audNoticeDel.aud?num=${dto.auditionNoticeNum}';" />&nbsp;</td>
               <td colspan="5" align="center"><input type="button"
                  class="btn" value="목록으로"
                  onclick="javascript:location.href='auditionList.aud';" />&nbsp;</td>
            </tr>
         </table>

      </div>
   </div>

</body>
</html>