<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원증발급</title>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/static/membership.css">
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
			<section class="main">
				<h1 style="font-size: 32px;">회원증 발급방법</h1>
				<div>
					<img src="${pageContext.request.contextPath}/resources/img/join.png"">
				</div>
				<br>


				<dl class="accordion">
					<dt>
						<a href="#">온라인 발급</a>
					</dt>
					<dd>
						<h2>회원가입 방법(온라인)</h2>
						<br>
						<br>
						<ul>
							<li>홈페이지 회원가입은 진리도서관 홈페이지에서 신청이 가능합니다.</li>
							<br>
							<li>홈페이지 회원으로 가입하시면 온라인상의 다양한 서비스를 이용하실 수 있습니다.</li>
							<br>
							<li>기존에 회원증만 발급받으신 이용자님께서는 홈페이지 아이디등록도 하셔야 온라인상의 대출 조회, 대출
								자료 연장, 도서 예약 등의 서비스를 이용하실 수 있습니다.</li>
							<br>
							<li>홈페이지 회원만 가입하신 이용자님께서는 도서관 방문 후 회원증을 발급받으셔야 도서대출 및 도서관의
								모든 서비스를 이용하실 수 있습니다.</li>
							<br>

						</ul>
					</dd>
					<dt>
						<a href="#">오프라인 발급</a>
					</dt>
					<dd>
						<h2>회원가입 방법(오프라인)</h2>
						<br>
						<br>
						<h3>도서관 방문</h3>
						<ul>

							<li>홈페이지 회원가입은 진리도서관 홈페이지에서 신청이 가능합니다.</li>
							<br>
							<li>홈페이지 회원으로 가입하시면 온라인상의 다양한 서비스를 이용하실 수 있습니다.</li>
							<br>
							<li>기존에 회원증만 발급받으신 이용자님께서는 홈페이지 아이디등록도 하셔야 온라인상의 대출 조회, 대출
								자료 연장, 도서 예약 등의 서비스를 이용하실 수 있습니다.</li>
							<br>
							<li>홈페이지 회원만 가입하신 이용자님께서는 도서관 방문 후 회원증을 발급받으셔야 도서대출 및 도서관의
								모든 서비스를 이용하실 수 있습니다.</li>
							<br>

						</ul>
					</dd>

				</dl>
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