<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = '/include/include.jsp' %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연정보상세보기</title>
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
<script type = "text/javascript" src = "http://code.jquery.com/jquery-1.8.1.js"></script>
	<script type="text/javascript">
	$(function(){

		$("#book").click(function(){
			location.href = '../bk/book.bk?num='+${dto.cctNum}
		});
		$('#mody').click(function(){
			location.href ='cctModify.cct?num='+${dto.cctNum}
		});
		$('#del').click(function(){
			var result = confirm('삭제 후 복구할 수 없습니다. 진행하시겠습니까?');
			if(result){
				location.href = 'cctDel.cct?num='+${dto.cctNum}
				}else{
					return false;
				}
		});
	});

	</script>
</head>
<body>

   <div class="logoloc">
      <tr>
         <td colspan=3><input type="image" src="../images/mlogo.png"
            onclick="javascript:location.href='../main.main';" width="250"
            height="250" id="logoImg" /></td>
      </tr>
   </div>
<form action="concertWriteIntensive.cct" method="post" name="cctContentform" enctype = 'multipart/form-data'>
 <div class="boardloc">
      <table class="table table-hover">

		<tr><td colspan=8 align="center"><b>공연정보상세보기</b></td></tr>
	<tr>
		<td rowspan = "5"><img src = "../concert_board/upload/${dto.strPoster}"></td>

		<td style="font-family:돋음; font-size:12" height="16" >
			공연명
		</td>
		<td colspan=3>
			${dto.cctTitle}
		</td>
	</tr>
	<tr>
		<td  style="font-family:돋음; font-size:12" height="16">
			공연일시
		</td>
		<td colspan=4>
			<fmt:formatDate value = "${dto.cctDate}" type = "Date" pattern = "yyyy-MM-dd HH:mm"/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			공연장소
		</td>
		<td colspan=3>
			${dto.cctLocation}
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			연주자
		</td>
		<td colspan=3>
			${dto.artName}
		</td>
	</tr>
	<tr>
		<td colspan = "3"style="font-family:돋음; font-size:12" height="16">
			<c:if test = "${dto.tktVal == 1}"><input type = "button" value = "예매하기" id = 'book'></c:if>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			프로그램
		</td>
		<td colspan = "3">
			${fn:replace(dto.cctProgram, cn, br)} 
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			내용
		</td>
		<td colspan = "3">
			${fn:replace(dto.cctContent, cn, br)} 
		</td>
	</tr>
	<tr>
		<td colspan = 5>상세이미지</td>
		<td><img src = "../concert_board/upload/${dto.strDetail}"></td>
	</tr>
	<tr>
		<td colspan = 5 align = "center">
		<input type = 'button' value = "목록으로" id = "toList" class="btn" onclick="javascript:history.go(-1);">
		<c:if test = "${logId eq 'admin'}"><input type = "button" value = '수정' id = "mody" class="btn">
		<input type = "button" value = '삭제' id = "del" class="btn"></c:if>
		</td>
	</tr>
	
</table>
</div>
</form>
</body>

</html>