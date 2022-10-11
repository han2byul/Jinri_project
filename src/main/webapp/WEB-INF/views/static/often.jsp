<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
 crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
crossorigin="anonymous"></script>
<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/qna_css/qnacss.css"  rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/StaticCss/static.css"  rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<!--  <script src="${pageContext.request.contextPath}/resources/js/qnajs/qna.js"></script> -->
</head>
<script>
$(document).ready(function () {
  $(".nav_container nav ul li").mouseenter(function (e) {
      $(".nav_container nav ul li a").siblings(".nav_dropdown").show();
  });
  
  $("nav").mouseleave(function () {
    $(".nav_dropdown").hide();
  });
    
  $(".nav_dropdown div").mouseenter(function () {
    $(this).parentsUntil("li").parent().css("background-color", "#ffe695");
  });
      
  $(".nav_dropdown div").mouseleave(function () {
    $(this).parentsUntil("li").parent().css("background-color", "#fff");
  });
});
//html dom 이 다 로딩된 후 실행된다.    
$(document).ready(function(){
// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때       
$(".menu>a").click(function(){
  var submenu = $(this).next("p");// submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기            
  if( submenu.is(":visible") ){
    submenu.slideUp();
  }else{submenu.slideDown();
  }
	});
});
</script>
<body>
<div id="all">
<body>
  <header>
    <div class="box"> 
      <nav id="menu">
					<ul id="top_menu">
						<c:choose>
							<c:when test="${empty user}">
								<li><a href="login_form.do">로그인</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="logout.do">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
						<li>|</li>
						<li><a href="checkout.do">마이페이지</a></li>
					</ul>
				</nav>
      <div id="logo">
          <a href="index.html"><img src="${pageContext.request.contextPath}/resources/img/logo.png"></a>
       </div> 
    </div> 
  </header>
  <div id="sticky">
  <section class="navigation box">
            <div class="nav_container">
               <nav>
                  <ul>
                     <li><a href="search.do" class="title">자료검색</a>
                        <ul class="nav_dropdown">
                           <div class="menu_bd">
                              <li><a href="search.do">통합검색</a></li>
                              <li><a href="recommend.do">추천도서</a></li>
                              <li><a href="request.do">희망도서신청</a></li>
                           </div>
                        </ul></li>
                     <li><a href="library_guide.do" class="title">도서관소개</a>
                        <ul class="nav_dropdown">
                           <div class="menu_bd">
                              <li><a href="library_guide.do">도서관 안내</a></li>
                              <li><a href="checkout_guide.do">대출반납안내</a></li>
                              <li><a href="map.do">찾아오시는길</a></li>
                              <li><a href="membership.do">회원증 발급</a></li>
                           </div>
                        </ul></li>
                     <li><a href="notice_list.do" class="title">열린공간</a>
                        <ul class="nav_dropdown">
                           <div class="menu_bd">
                              <li><a href="notice_list.do">공지사항</a></li>
                              <li><a href="often.do">자주하는질문</a></li>
                              <li><a href="qna_list.do">Q&A 게시판</a></li>
                              <li><a href="eventlist.do">행사안내</a></li>
                           </div>
                        </ul></li>
                     <li><a href="checkout.do" class="title">나만의도서관</a>
                        <ul class="nav_dropdown">
                           <div>
                              <li><a href="checkout.do">도서대출현황</a></li>
                              <li><a href="wish.do">관심도서목록</a></li>
                              <li><a href="review.do">나만의한줄평</a></li>
                              <li><a href="mbti.do">동화 MBTI 테스트</a></li>
                           </div>
                        </ul></li>
                  </ul>
               </nav>
            </div>
         </section>
      </div>
    <div class = "box">
    <aside>
        
        
        <ul>
            <li id="strong">열린공간</li>
            <li><a href="notice.do">공지사항</a></li>
            <li><a href="qna_list.do">Q&A 게시판</a></li>
            <li><a href="often.do">자주 하는 질문</a></li>
            <li><a href="eventlist.do">행사 관련 안내</a></li>
            
        </ul>
  
  
</aside>
<div class ="main">
 <div id = "background">
      <div class="page-title">
           
                <h1>자주하는 질문</h1>
            
        </div>
    
        <!-- board seach area -->
        
               
                </div>
         
      <div class = "notice">
        <ol>
          <li class="menu">
            <a><p>Q . 희망도서신청은 어떻게 하나요?</p></a>
            <p class="hide">A .<br> ① 우리 도서관 홈페이지 자료검색에서 소장 여부를 확인<br>

② 우리 도서관 홈페이지 희망도서 신청란에 신청하거나, 도서관내 비치되어 있는 신청서 작성<br>

③ 우리 도서관 홈페이지 상에서 처리과정 확인 가능<br>

④ 1인이 한 달에 2권, 연 20권까지 신청가능<br>
 

※ 수서 정책에 의해서 제외되는 도서<br>

① 서지사항불분명, 절판 및 품절, 이용자에게 유해하다고 판단되는 도서(폭력성, 선정성 등)<br>

② 수험서 및 참고서, 만화, 교과서 등</p>
            </li>
            <li class="menu">
              <a><p>Q.문화가 있는 날은 대출권 수가 어떻게 되나요?</p></a>
              <p class="hide">A.<br>문화가 있는 날은 매월 마지막주 수요일로 대출권수가 2배로 확대됩니다.<br>
				따라서 기존 10권에서 20권까지 대출이 가능합니다.<br>
				단, 2배 대출은 열람실 대출/반납데스크에서만 가능합니다.</p>
            </li>
              <li class="menu">
              <a><p>상호대차 서비스는 어떻게 하는건가요?</p></a>
              <p class="hide">책이음 회원으로 가입되신 경우에만 가능합니다.<br>
책이음 회원으로 전환은 1층 통합대출대를 방문하시면 됩니다. (약 5~10분 소요)<br>
단, 책이음 회원 전환시 이용자분의 정보가 서울도서관 및 국립중앙도서관과 추후 이용하는 책이음가입 도서관에 제공됩니다. <br>
더불어 책이음 전환시 책이음의 문제로 전환이 원활하지 않은 경우가 많으니 양해바랍니다.<br><br>
찾는 도서가 이용중이 도서관 외의 영등포구립도서관에 소장되어 있을 경우 검색창에 있는 상호대차 서비스 버튼을 통하여
문래도서관·선유도서관·여의샛강마을도서관의 도서를 진리도서관에서 받아보실 수 있습니다.<br>
대출기간은 기존 도서와 같은 3주이며, 통합 5권이내에서 신청가능합니다.<br>
단, 미수령시 상호대차 신청이 1주일간 제한됩니다.<br>
반납은 영등포구립도서관 어디서나 가능합니다.</p>
            </li>
              <li class="menu">
              <a><p>Q. 도서관 과월호 정기 간행물 운영 안내</p></a>
              <p class="hide">A.<br>진리도서관은 2016년부터 작은 도서관 지원 사업의 일환으로 과월호 잡지를 작은 도서관에 재배포를 하고 있습니다. 지원이 많지 않은 작은 도서관을 위한 방안임을 양해 부탁드립니다.<br>
							    향후 영등포구 도서관 내 행사 중 정기간행물 배포 행사가 진행 될 시 각 도서관 홈페이지에 공지가 할 예정이오니 참고하여 주시기 바랍니다.<br>
							    앞으로도 이용하시면서 기타 문의사항이 있으시면 대림도서관(02-828-3700)으로 연락주시면 정성껏 안내해드리겠습니다. 귀하의 가정에 항상 건강과 행복이 가득하시길 기원 합니다.</p>
            </li>
              <li class="menu">
              <a><p>Q. 회원가입 신청 및 회원증 발급 어떻게 해야하나요?</p></a>
              <p class="hide">A.<br>① 회원가입 : 웹 회원(준회원) 가입(휴대전화 또는 아이핀 본인인증 필수)<br>

② 도서관 방문(1층 통합대출대) 후 회원카드 발급(회원카드 즉시 발급 가능)<br>

※웹 회원 가입시 준회원 신분이며, 회원카드 발급으로 정회원 및 도서대출, 자료실 이용이 가능합니다.</p>
            </li>
              <li class="menu">
              <a><p>Q. 회원증 분실시 어떻게 해야 하나요?</p></a>
              <p class="hide">A.<br>회원증의 분실 또는 훼손으로 사용이 불가능한 경우 우리 도서관 1층 통합대출대에 방문하시어 재발급 신청서를 작성하시면 재발급이 가능합니다. (회원증은 타인에게 양도 또는 대리 사용하게 할 수 없습니다.)</p>
            </li>
             <li class="menu">
              <a><p>Q.도서 대출 권수 및 기간 어떻게 되나요? 또 연체를 하면?</p></a>
              <p class="hide">A.<br>① 대출도서 : 전도서 대출(단, 참고도서, 연속간행물 제외)<br>
② 대출기간 : 1회 10권 21일간(연장없음)<br>
③ 도서반납 : 대출도서를 연체하였을 경우 연체 일 수 만큼 대출이 정지됩니다.</p>
            </li>
          </ol>
      

      	</div>
       </div>
      </div>
       <footer>
      <div class="box">
         <nav id="bottom_menu">
            <ul>
                <li><a href="footer1.do">이용약관</a></li>
                <li><a href="footer2.do">개인정보처리방침</a></li>
                <li><a href="footer3.do">도서관운영조례</a></li>
            </ul>
         </nav>
         <div class="items">
            <ul>
                <li>Copyright© 2000. JINRI DISTRICT LIBRARY. All Rights Reserved.</li>
            </ul>
         </div> 
      </div> 
    </footer>

</body>
</html>