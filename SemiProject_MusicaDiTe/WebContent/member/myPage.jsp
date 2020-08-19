<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery 를 사용하기 위해 jquery 파일을 로드 -->
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script>
   $(document).ready(function(e) {
      /* a요소를 클릭 했을 시 */
      $('a').click(function() {
         /* iframe 요소의 src 속성값을 a 요소의 data-url 속성값으로 변경 */
         $('#iframe').attr('src', $(this).attr('data-url'));
      })
   });
</script>
<style>
.leftloc {
   position: absolute;
   left: 150px;
   top: 300px;
}

.boardloc {
   position: absolute;
   left: 400px;
   top: 220px;
}

iframe {
   width: 1000px;
   align: center;
}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript"
   src="http://code.jquery.com/jquery-latest.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>


   
      <%@ include file="../main/fixMenu.jsp"%>
   

   <div class="leftloc">
      <table class="table table-bordered" style="width: 100%">
         <!-- 예매내역 주소 삽입 20200729 -->
         <tr>
            <td><a data-url="../bk/purchaseList.bk" style="color: black">예매내역</a></td>
         </tr>
         <!-- 오디션 참가신청서 임시저장 목록 삽입 20200729 -->
         <tr>
            <td><a data-url="../app/appTempStoreList.app" style="color: black">오디션 신청서 [임시저장]</a></td>
         </tr>
         <tr>
            <td><a data-url="../app/appFinList.app" style="color: black">오디션 신청서 [제출완료]</a></td>
         </tr>


         <tr>
            <td><a data-url="../cen/cenBoardList.cen" style="color: black">1:1
                  질문</a></td>
         </tr>

         <tr>
            <td><a data-url="../mem/memberDetail.mem" style="color: black">개인
                  정보 수정</a></td>
         </tr>
      </table>
   </div>

   <div class="boardloc">
      <iframe id="iframe" width="900" height="500"
         src="../images/mlogo.png"></iframe>
   </div>


</body>
</html>