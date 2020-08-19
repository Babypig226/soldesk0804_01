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
               <td>[공지사항] 멍트리오 서비스 점검 안내 </td>
               <td>2020-01-05</td>
            </tr>
            <tr>
               <td>[공지사항] 멍트리오 분실물 관련 안내 </td>
               <td>2020-01-05</td>
            </tr>
            <tr>
               <td>[공지사항] 멍트리오 휴관 안내  </td>
               <td>2020-01-05</td>
            </tr>
          
         </tbody>
      </table>
   </div>
   	<input type="button" id="btn" value="글쓰기">
   이전 < 1 2 3 4 5 6 7 8 9 10 > 이후 

</body>
</html>