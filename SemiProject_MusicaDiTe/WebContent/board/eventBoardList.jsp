<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>이벤트 게시판</title>
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
      
      
       <h3>이벤트 게시판 </h3>
       
       
   
       
        
      <table class="table table-condensed">
         <thead>
            <tr align="center">
                <td><b><a href="#">진행중인 이벤트</a></b></td>
                <td><b><a href="#">종료된 이벤트</a></b></td>
               
            </tr>
         </thead>
         <tbody>
            <tr>
               <td><input type="image" onclick="javascript:location.href='main.jsp';" src="../images/m1.PNG"
      width="130" height="130" id="e1Img" /></td>
                <td><input type="image" onclick="javascript:location.href='main.jsp';" src="../images/m1.PNG"
      width="130" height="130" id="e1Img" /></td>
            </tr>
            <tr>
               <td><input type="image" onclick="javascript:location.href='main.jsp';" src="../images/m1.PNG"
      width="130" height="130" id="e1Img" /></td>
                <td><input type="image" onclick="javascript:location.href='main.jsp';" src="../images/m1.PNG"
      width="130" height="130" id="e1Img" /></td>
            </tr>
         <tr>
               <td><input type="image" onclick="javascript:location.href='main.jsp';" src="../images/m1.PNG"
      width="130" height="130" id="e1Img" /></td>
                <td><input type="image" onclick="javascript:location.href='main.jsp';" src="../images/m1.PNG"
      width="130" height="130" id="e1Img" /></td>
            </tr>
         </tbody>
      </table>
   </div>
 
   
   

</body>
</html>