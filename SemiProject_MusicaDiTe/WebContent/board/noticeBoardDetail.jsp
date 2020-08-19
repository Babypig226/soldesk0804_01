<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>공지사항 게시판</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>

   <div class="container">
   <input type="image" onclick="javascript:location.href='main.jsp';" src="../images/logo.png"
      width="130" height="130" id="logoImg" />
      
      <table class="table table-condensed">
         <thead>
            <tr>
               <th>공지사항 </th>
            </tr>
         </thead>
         <tbody>
            <tr>
               <td><b>[공지사항] 멍트리오 신규 어플리케이션 출시 안내</b></td>
               <td>2020-01-05</td>
           </tr>
           
           <tr>
          <td colspan=2>
           안녕하세요. 멍트리오 입니다.<br />저희 멍트리오에 관심을 가져주시는 회원 분들에게 보답하기 위해 멍트리오 어플 작업이 성공적으로 완료 됨을 알려 드립니다.
			<br />1) 신규 멍트리오 다운로드는 앱스토어(App Store)와 구글 플레이(Google Play)에서 가능합니다.<br />
			① 앱스토어(App Store) : ‘멍트리오’ 검색<br />
			다운로드 링크 : https://apps.apple.com/kr/app/mm/id2393862<br />
			② 구글 플레이(Google Play) : ‘멍트리오’ 검색<br />
			다운로드 링크 : https://play.google.com/store/apps/details?id=io.mmtro.mmtro<br />
			<br /><br />궁금하신 사항은 고객센터 또는 이메일로 문의주시면 안내해 드리겠습니다.<br />
			감사합니다.<br />고객센터 : 02-123-4567 / webmeong@cs.kr
          </td>
           </tr>
          
         </tbody>
      </table>
   </div>
   	
   	
   	<input type="button" id="btn" value="목록 ">
  

</body>
</html>