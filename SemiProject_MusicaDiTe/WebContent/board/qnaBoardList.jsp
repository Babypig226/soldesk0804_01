<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>1:1 문의 게시판</title>
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
	color:gray;
}
</style>
</head>
<body>

   <div class="container">
   <input type="image" onclick="javascript:location.href='main.jsp';" src="../images/logo.png"
      width="130" height="130" id="logoImg" />
      
      
       <h3>1:1 문의 게시판 </h3>
       <p>궁금하신 사항이 있으시다면 언제든지 문의해주시기 바랍니다.</p>
       <p id="p1">고객센터 연결이 힘드신 경우 1:1문의를 이용하시면 빠르게 답변 드리겠습니다.</p>
       
       <div align="center">
       		<table>
       			<tr>
       				<td><input type="text" value="제목 " size="6"></td>
       				<td>&nbsp;</td>
       				<td><input type="text"></td>
       				<td>&nbsp;</td>
       				<td><input type="button" class="btn" value="검색 "></td>
  				</tr>
       		</table>
       </div>
       
        
      <table class="table table-condensed">
         <thead>
            <tr>
                <th>번호 </th>
                <th>제목 </th>
                <th>작성자 </th>
                <th>등록일 </th>
            </tr>
         </thead>
         <tbody>
            <tr>
               <td>32</td>
               <td>개발자 노트 </td>
               <td>이숭무 </td>
               <td>2020-03-02 07:23:08</td>
               
            </tr>
            <tr>
              <td>31</td>
               <td>헬로키티 손거울 </td>
               <td>진혜주</td>
               <td>2020-03-02 07:23:08</td>
            </tr>
           
          
         </tbody>
      </table>
   </div>
   <input type="button" id="btn" value="글쓰기">
   이전 < 1 2 3 4 5 6 7 8 9 10 > 이후 

</body>
</html>