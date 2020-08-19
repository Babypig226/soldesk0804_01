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
               <th>리뷰게시판 </th>
            </tr>
         </thead>
         <tbody>
            <tr>
               <td><b>작성자 : 진혜주 </b></td>
               <td>2020-01-05</td>
           </tr>
           
           <tr>
          <td colspan=2>
          	죽여주는 이야기는 정말 죽여주는 이야기 입니다.<br />배우들의 명연기를 보다보니 금방 끝났네요ㅠ<br />
			원래 연극을 그닥 즐겨보는 편은 아닌데 앞으로 자주 볼 것 같습니다 ㅎㅎ<br />
			냥트리오 화이팅!!
          </td>
           </tr>
         </tbody>
      </table>
      
       <p>댓글(1)</p>
       <table border=1>
       		<tr>
       			<td><input type="text" style="width:490pt;height:60pt;" placeholder="로그인이 필요합니다."></td>
       			<td><input type="button" style="width:100pt;height:60pt;" value="등록 "></td>
       		</tr>
       </table>
       
       <hr>
       
       <table>
         <tbody>
            <tr>
               <td><b>highland0&nbsp;&nbsp;&nbsp;</b></td>
               <td>2020-01-25 19:22:35</td>
           </tr>
            <tr>
               <td colspan=2>저와 같은 생각 이시군요~~~</td>
           </tr>
           </tbody>
           </table>
       <br /><br />
       <input type="button" id="btn" value="목록 ">
   </div>
   
  
   	
   	
   	
  

</body>
</html>