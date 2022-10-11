<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관안내</title>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/static/library_guide.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css"
	rel="stylesheet">

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
			<section class="main">
				<div id="center">
					<h1 style="font-size: 32px; background-color: rgb(255, 207, 118)">진리도서관
						통합 홈페이지 방문을 환영합니다.</h1>
					<br> <br> <br> <img
						src="${pageContext.request.contextPath}/resources/img/info.png"
						width="600" height="300"> <br> <br> <br> <br>
				</div>
				<div id="main_padding">
					<div style="width: 600px; margin-left: 67px;">

						<p style="line-height: 160%;">

							진리 도서관은 개개인의 가능성 발견과 지역의 공동체 역량 축적,<br> 적극적인 정보복지를 실현하고자 하며,
							미래를 여는 도서관을 만들어가고자 합니다.<br> <br> 도서를 비롯한 정보자원의 연계 및 공유
							확대, 최신기술을 활용한 스마트도서관과 모바일 서비스 확대 등<br> 이용자의 정보접근 편의성을 제공하고,
							마을도서관 조성과 공공도서관의 공간혁신을 통하여<br> 지역주민 복합문화공간으로 역할을 확대합니다.<br>
							<br> 또한, 독서프로그램 확대와 함께 문화, 예술 등 문화서비스를 다양하게 제공하여 사람과 삶이 있는
							도서관,<br> 우리 삶을 변화시키는 도서관을 만들어가겠습니다.<br> <br>
							감사합니다.
						</p>
						<br> <br> <br>
					</div>


					<h2 style="border-top: 5px solid #ccc; padding-top: 30px;">이용대상</h2>
					<br>

					<ul>
						<li>진리 도서관은 도서관 자료 열람을 원하는 누구나 이용이 가능합니다.</li>
						<br>
						<li>단, 대출/예약/보존 서고 이용 등 일부 서비스는 대출증을 발급받은 회원만 이용이 가능합니다.</li>
						<br>
					</ul>


					<br>
					<h2 style="border-top: 1px solid #ccc; padding-top: 30px;">이용시간</h2>
					<br>

					<p>
					<table class="type09">
						<thead>
							<tr>
								<th scope="cols">요일</th>
								<th scope="cols">시간</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">월~금</th>
								<td>AM 9:00 - PM 6:00</td>
							</tr>
							<tr>
								<th scope="row">토~일</th>
								<td>AM 9:00 - PM 2:00</td>
							</tr>
							<tr>
								<th scope="row">공휴일</th>
								<td>AM 9:00 - PM 12:00</td>
							</tr>
						</tbody>
					</table>
					</p>
					<br> <br> <br> <br>
					<h2 style="border-top: 1px solid #ccc; padding-top: 30px;">휴관일
						안내</h2>
					<br>
					<p>
						<br>
					<ul>
						<li>매주 월요일</li>
						<br>
						<li>일요일을 제외한 법정공휴일 및 국가가 정한 임시 휴일</li>
						<br>
						<li>기타 관장이 필요하다고 인정하는 날 미리 공지 후 휴관</li>
						<br>
					</ul>
					</p>

				</div>

			</section>

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