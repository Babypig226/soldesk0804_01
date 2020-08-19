<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>리뷰 게시판</title>
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
      
      
       <h3>리뷰 게시판 </h3>
       <p>집사 님 들의 정성스럽게 남겨주신 후기들 중 추첨을 통하여 소정의 적립금을 드립니다. </p>
       <p id="p1">추첨기간 : 매 1일 18시마다 </p>
       
       <div align="center">
       		<table>
       			<tr>
       				<td><input type="text" value="작성자 " size="6"></td>
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
                <th>리뷰내용 </th>
                <th>작성자 </th>
                <th>등록일 </th>
            </tr>
         </thead>
         <tbody>
            <tr>
               <td>66</td>
               <td>배우님들의 완벽한 연기 </td>
               <td>이숭무 </td>
               <td>2020-03-02 07:23:08</td>
               
            </tr>
            <tr>
              <td>65</td>
               <td>배우님들의 완벽한 연기 </td>
               <td>진혜주</td>
               <td>2020-03-02 07:23:08</td>
            </tr>
            <tr>
               <td>64</td>
               <td>배우님들의 완벽한 연기 </td>
               <td>오환희</td>
               <td>2020-03-02 07:23:08</td>
            </tr>
            <tr>
              <td>63</td>
               <td>배우님들의 완벽한 연기 </td>
               <td>함성애 </td>
               <td>2020-03-02 07:23:08</td>
            </tr>
          
         </tbody>
      </table>
   </div>
   <input type="button" id="btn" value="글쓰기">
   
   이전 < 1 2 3 4 5 6 7 8 9 10 > 이후 

</body>
</html>