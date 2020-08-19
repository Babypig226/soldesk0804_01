<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>swiper 광고</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<style type="text/css">
.swiper-container {
   width: 620px;
   height: 420px;
}

.swiper-slide {
   text-align: center;
   display: flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
   align-items: center; /* 위아래 기준 중앙정렬 */
   justify-content: center; /* 좌우 기준 중앙정렬 */
   border-radius: 5px;
   box-shadow: 0 0 10px white inset;
   box-sizing: border-box; /* 이 설정을 하지 않으면 슬라이드드가 틀어짐 */
   /* 아래에 있는 실행가능한 소스를 가지고 실험해 보세요 */
}
</style>
</head>
<body>




   <!-- 예제 시작 -->

   <!-- 이 예제에서는 필요한 js, css 를 링크걸어 사용 -->


   <div class="swiper-container">
      <div class="swiper-wrapper">
         <div class="swiper-slide">
            <img src="./images/mi_1.PNG">
         </div>
         <div class="swiper-slide">
            <img src="./images/mi_2.PNG">
         </div>
         <div class="swiper-slide">
            <img src="./images/mi_3.PNG">
         </div>
         <div class="swiper-slide">
            <img src="./images/mi_4.PNG">
         </div>
         <div class="swiper-slide">
            <img src="./images/mi_5.PNG">
         </div>


      </div>

      <!-- 네비게이션 버튼 지정 -->
      <div class="swiper-button-next"></div>
      <!-- 다음 버튼 (오른쪽에 있는 버튼) -->
      <div class="swiper-button-prev"></div>
      <!-- 이전 버튼 -->

      <!-- 페이징 -->
      <div class="swiper-pagination"></div>
   </div>

   <div style="display:none; ">
      rotate : <select style="height: 30px;"
         onchange="coverflowSetting.rotate = this.value; init()">
         <option value="0">0</option>
         <option value="10">10</option>
         <option value="50" selected>50 (기본값)</option>
         <option value="100">100</option>
         <option value="200">200</option>
         <option value="300">300</option>
         <option value="500">500</option>
         <option value="1000">1000</option>
         <option value="2000">2000</option>
      </select> &nbsp; depth : <select style="height: 30px;"
         onchange="coverflowSetting.depth = this.value; init()">
         <option value="0">0</option>
         <option value="50">50</option>
         <option value="100" selected>100 (기본값)</option>
         <option value="200">200</option>
         <option value="500">500</option>
         <option value="1000">1000</option>
         <option value="2000">2000</option>
         <option value="3000">3000</option>
         <option value="5000">5000</option>
         <option value="10000">10000</option>
      </select> &nbsp; stretch : <select style="height: 30px;"
         onchange="coverflowSetting.stretch = this.value; init()">
         <option value="0" selected>0 (기본값)</option>
         <option value="50">50</option>
         <option value="100">100</option>
         <option value="200">200</option>
         <option value="300">300</option>
      </select>
   </div>

   <script>
      var coverflowSetting = {
         slideShadows : true, // 슬라이더 그림자 : 3D 효과를 강조하기 위한 회전시 흐릿한 효과
         rotate : 50, // 슬라이더 회전 각 : 클수록 슬라이딩시 회전이 커짐
         stretch : 0, // 슬라이더간 거리(픽셀) : 클수록 슬라이더가 서로 많이 겹침
         depth : 100, // 깊이 효과값 : 클수록 멀리있는 느낌이 강해짐
         modifier : 1, // 효과 배수 : 위 숫자값들에 이 값을 곱하기 처리하여 효과를 강하게 처리함
      }

      var myswiper = null;

      function init() {

         if (myswiper != null)
            myswiper.destroy();

         myswiper = new Swiper('.swiper-container', {
            effect : 'coverflow', // 커버플로우 효과 사용
            coverflowEffect : coverflowSetting, // 커버플로우 설정
            loop : true, // 슬라이드 반복

            autoplay : { // 자동 재생
               delay : 0, // 딜레이 0
            },
            speed : 2000, // 슬라이드 속도 2초

            navigation : {
               nextEl : '.swiper-button-next', // 다음 버튼 클래스명
               prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
            },
            pagination : { // 페이징 설정
               el : '.swiper-pagination',
               clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
            },
         });
      }

      init();
   </script>

   <!-- 예제 종료 -->


</body>
</html>