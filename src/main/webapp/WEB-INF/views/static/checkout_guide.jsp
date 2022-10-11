<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출반납안내</title>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/static/checkout_guide.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css" rel="stylesheet">

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

$(document).ready(function(){
      var allPanels = $(".accordion > dd");
      allPanels.hide();
      $(".accordion > dt > a").click(function(){
          allPanels.slideUp();
          $(this).parent().next().slideDown();
      });
   })
</script>
</head>
<body>
	<div id="all">
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
					<a href="main.do"><img
						src="${pageContext.request.contextPath}/resources/img/logo.png"></a>
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












		<div class="box">
			 <aside>
        
          <ul>
            <li id="strong">도서관소개</li>
            <li><a href="library_guide.do">도서관안내</a></li>
            <li><a href="checkout_guide.do">대출/반납 안내</a></li>
            <li><a href="map.do">찾아오시는길</a></li>
            <li><a href="membership.do">회원증발급</a></li>
        </ul>
        </aside>
			<div class="main">
       
        <h1 style="font-size: 32px;">대출/ 반납 안내</h1><br><br>

         <p>
            <table class="type09">
                <thead>
                <tr>
                  <th scope="cols">구분 </th>
                  <th scope="cols">안내 </th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <th scope="row">대상</th>
                  <td>진리 도서관 정회원(회원증 발급자)</td>
                </tr>
                <tr>
                  <th scope="row">대출방법</th>
                  <td>각 자료열람실에서 원하는 자료를 찾아 대출반납 데스크에 회원증 또는 모바일회원증 제시 후 대출
                  </td>
                </tr>
                <tr>
                  <th scope="row">권수/기간	
                  </th>
                  <td>1인당 10권이며 대출기간은 21일간(연장불가)
                  </td>
                </tr>
                <tr>
                  <th scope="row">반납방법</th>
                  <td>도서관 운영시간 내에는 대출한 자료실 데스크에서 반납하실 수 있습니다.<br>
                    야외 도서반납함 이용 안내
                    딸림자료가 있는 도서는 자료실에 반납하시기 바랍니다.<br>
                    -도서관 휴관(매주 월요일, 법정 공휴일) 또는 자료실 운영이 끝났을 때 이용하시면 됩니다.
                    반납된 자료는 다음 업무 개시일에 처리됩니다.<br>
                    -반납 후에는 자료실(정상 근무시간)에 전화 등으로 확인바랍니다. </td>
                </tr>
                <tr>
                  <th scope="row">대출제한</th>
                  <td>대출도서를 연체하였을 경우, 연체일수 만큼 대출정지
                    반납하신 도서는 당일 재대출 불가 </td>
                </tr>
                <tr>
                  <th scope="row">도서분실</th>
                  <td>자료를 잃어버리거나 훼손하면 동일한 자료로 변상하여야 하며, 동일한 자료로 변상이 불가능할 시 자료실
                    담당자에게 문의하시길 바랍니다. </td>
                </tr>
                </tbody>
              </table>
         </p><br><br>
       
        <h1> 도서 예약 안내</h1>
        <table class="type09">
          <thead>
          <tr>
            <th scope="cols">구분 </th>
            <th scope="cols">안내 </th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <th scope="row">이용안내</th>
            <td>  필요한 자료가 대출되어 이용이 불가능할 때 도서대출 예약을 이용하시면 해당 도서가 반납되는 즉시 예약 순서에 따라 우선적으로 자료를 보실 수 있습니다</td>
          </tr>
          <tr>
            <th scope="row">예약대상도서	
            </th>
            <td>현재 대출중인 도서(대출 가능한 도서는 예약할 수 없습니다.)

            </td>
          </tr>
          <tr>
            <th scope="row">예약방법
            </th>
            <td>홈페이지 로그인 후 예약가능한 자료를 찾은 후 도서예약신청 버튼을 눌러서 예약합니다.
              예약은 1회 최대 3권까지만 가능합니다.
            </td>
          </tr>
          <tr>
            <th scope="row">유의사항</th>
            <td>반납과 동시에 예약대출 안내 SMS가 발송됩니다.
              반납된 도서는 3일간 별도로 비치하며 3일이 지나면 예약이 취소됩니다.
              예약하고자 하는 도서를 이미 세 명이상 예약했을 경우에는 예약이 불가능합니다.
              </td>
          </tr>
          
          </tbody>
        </table>
   
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
						<li>Copyright© 2000. JINRI DISTRICT LIBRARY. All Rights
							Reserved.</li>
					</ul>
				</div>

			</div>
		</footer>
	</div>

</body>
</html>