<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/include/include.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-1.8.1.js"></script>
<script type="text/javascript">
   $(function() {
      $("#chn")
            .click(
                  function() {
                     if ($(this).attr("value") == "변경") {
                        $("#chn").attr("value", "변경취소");
                        $("#fileDel").val("${dto.image}");
                        $("#chngFile")
                              .html(
                                    "</br><input type = 'file' name ='fileup' id = 'fileup'>");
                     } else {
                        $("#chn").attr("value", "변경");
                        $("#fileDel").val("");
                        $("#chngFile").html("");
                     }
                  });

      $('#frm')
            .submit(
                  function() {
                     if (($("#fileup").val() == null || $('#fileup')
                           .val() == "")
                           && $('#chn').val() == "변경취소") {
                        alert("이미지파일을 업로드해주세요");
                        $('#fileup').focus();
                        return false;
                     }

                     /*if($("#auditionTitle").val()== null || $('#auditionTitle').val() == ""){
                     alert("오디션명을 입력헤주세요");
                     $('#auditionTitle').focus();
                     return false;   
                     }
                     if($("#auditionContent").val()== null || $('#auditionContent').val() == ""){
                     alert("내용을 입력해주세요");
                     $('#auditionContent').focus();
                     return false;   
                     }
                     if($("#auditionApperiod").val()== null || $('#auditionApperiod').val() == ""){
                     alert("접수기간을 입력해주세요");
                     $('#auditionApperiod').focus();
                     return false;   
                     }
                     if($("#auditionDate").val()== null || $('#auditionDate').val() == ""){
                     alert("오디션 날짜를 입력해주세요");
                     $('#auditionDate').focus();
                     return false;   
                     }
                     if($("#auditionLocation").val()== null || $('#auditionLocation').val() == ""){
                     alert("오디션 장소를 입력해주세요");
                     $('#auditionLocation').focus();
                     return false;   
                     }
                     if($("#auditionCategory").val()== null || $('#auditionCategory').val() == ""){
                     alert("부문을 입력해주세요");
                     $('#auditionCategory').focus();
                     return false;   
                     }
                     if($("#auditionSelnum").val()== null || $('#auditionSelnum').val() == ""){
                     alert("선발인원을 입력해주세요");
                     $('#auditionSelnum').focus();
                     return false;   
                     }
                     if($("#applyCondition").val()== null || $('#applyCondition').val() == ""){
                     alert("참가자격을 입력해주세요");
                     $('#applyCondition').focus();
                     return false;   
                     }*/
                  });
   });
</script>

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
.logoloc {
   position: absolute;
   left: 650px;
   top: 10px;
}

.boardloc {
   position: absolute;
   left: 420px;
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

   <form action="audNoticeMPro.aud" method="post"
      enctype="multipart/form-data" id="frm">

      <div class="boardloc">
         <table class="table table-hover">
            <tr>
               <td>오디션 명</td>
               <td><input type="text" size="20" name="auditionTitle"
                  value="${dto.auditionNoticeTitle}"></td>
            </tr>
            <tr>
               <td>이미지업로드</td>
               <td>${dto.image}<input type="button" id="chn" value="변경"
                  class="btn">
               </td>
            </tr>
            <tr>
               <td>변경할 파일</td>
               <td><div id="chngFile"></div></td>
            </tr>
            <tr>
               <td>내용</td>
               <td><textarea rows="10" cols="80" name="auditionContent">${dto.auditionContent}</textarea></td>
            </tr>
            <tr>
               <td>접수기간</td>
               <td><input type="text" name="auditionApperiod"
                  value="${dto.auditionNoticeApperiod }" /></td>
            </tr>
            <tr>
               <td>오디션 일시</td>
               <td><input type="date" name="auditionDate"
                  value="${dto.auditionDate}" /></td>
            </tr>
            <tr>
               <td>오디션 장소</td>
               <td><input type="text" name="auditionLocation"
                  value="${dto.auditionNoticeLocation}" /></td>
            </tr>
            <tr>
               <td>오디션 부문</td>
               <td><select name="auditionCategory">
                     <option value="solo">독주</option>
                     <option value="ensemble">실내악</option>
                     <option value="orchestra">오케스트라</option>
                     <option value="concertoSolo">협연</option>
               </select></td>
            </tr>
            <tr>
               <td>선발인원</td>
               <td><input type="number" name="auditionSelnum"
                  value="${dto.auditionNoticeSelnum}"></td>
            </tr>
            <tr>
               <td>참가자격</td>
               <td><textarea rows="10" cols="80" name="applyCondition">${dto.applyCondition}</textarea></td>
            </tr>
            <tr>
               <td colspan="2" align="center"><input type="submit" value="등록"
                  class="btn"></td>
            </tr>
            <input type="hidden" name="fileDel" id="fileDel">
            <input type="hidden" name="auditionNoticeNum"
               value="${dto.auditionNoticeNum }">
         </table>
      </div>
   </form>
</body>
</html>