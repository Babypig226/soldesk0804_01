<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<style>
section {
  max-width: 400px;
}
details {
  background: #`f0f0f0;
  padding: 20px;
  margin-bottom: 5px;
}
summary {
  cursor: pointer;
  /* font-weight: bold; */
  /* font-size: 1.1em; */
}
</style>
</head>
<body>

<div class="container">
   <input type="image" onclick="javascript:location.href='main.jsp';" src="../images/logo.png"
      width="130" height="130" id="logoImg" />
      
      
       <h3>자주 묻는 질문 </h3>
      
       <table class="table1">
         <tr style=" right: 100px;">
            <td><a href="#">가입 및 탈퇴 &nbsp;</a></td>
            <td><a href="#">정보 변경 &nbsp;</a></td>
            <td><a href="#">예매 &nbsp;</a></td>
            <td><a href="#">일반 &nbsp;</a></td>
         </tr>
      </table>
 </div>
       


<details>
  <summary>회원가입은 어떻게 하나요?
  </summary>
  <p>
   홈페이지 상단, 회원가입 버튼을 클릭 하면 회원가입 페이지로 이동하며 간단한 본인 확인 절차를 거치면
회원가입이 완료됩니다. 
본인 이외의 개인정보를 사용하여 회원가입이 불가능하며, 적발 시 모든 이용이 중지되고 탈퇴처리 됩니다.
  </p>
</details>


</body>
</html>