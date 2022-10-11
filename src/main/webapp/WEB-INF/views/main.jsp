<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진리도서관</title>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<style>
.background1::after {
	width: 100%;
	height: 600px;
	content: "";
	background:
		url("${pageContext.request.contextPath}/resources/img/background1.png");
	background-position: center;
	background-repeat: no-repeat;
	position: absolute;
	top: 220px;
	left: 0;
	z-index: -999;
	opacity: 0.5;
}

#top_menu a:link, a:visited, a:hover, a:active { color : #000; text-decoration:none; }
</style>
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
		<div class="background1">
			<div class="box">
				<div id="search">
					<div>
						<form>
							<span>통합검색</span> <input name="search"
								placeholder="도서명 또는 저자명을 입력해주세요"
								style="width: 410px; height: 50px; border: none;"> <input
								name="page" value="1" type="hidden"> <input
								name="select" value="all" type="hidden"> <input
								type="button" value="검색" id="btn"
								onclick="search_send(this.form);">
						</form>
					</div>
				</div>
			</div>
			<div class="box">
				<div class="box1">

					<c:choose>
						<c:when test="${empty user}">
							<div class="login">
								<h4>로그인</h4>
								<form>
									<input type="text" name="id" placeholder="아이디"><br>
									<input type="password" name="pwd" placeholder="비밀번호"><br>
									<input type="button" value="로그인" onclick="send(this.form);">
									<p>
										<a href="regi_form.do">회원가입</a>
									</p>
								</form>
							</div>
							<div class="mypage">
								<h5>나의 도서관</h5>
								<ul>
									<li><a href="checkout.do">대출조회/반납연기</a></li>
									<li><a href="request.do">희망도서 신청</a></li>
									<li><a href="recommend.do">맞춤도서 추천</a></li>
								</ul>
							</div>
						</c:when>
						<c:otherwise>
							<div class="login">
								<h4>
									<span>${user.name}</span>님 환영합니다
								</h4>
								<hr>
								<ul>
									<li><a href="checkout.do">대출조회/반납연기</a></li>
									<li><a href="request.do">희망도서 신청</a></li>
									<li><a href="recommend.do">맞춤도서 추천</a></li>
								</ul>
								<hr>
								<form>
									<input type="button" value="로그아웃"
										onclick="location.href='logout.do'">
								</form>
							</div>
							<div class="mypage">
								<a href="review.do"><img align="center"
									src="${pageContext.request.contextPath}/resources/img/review_icon.png"></a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="box2">
					<div id="carouselExampleSlidesOnly" class="carousel slide slider1"
						data-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img class="d-block w-100"
									src="${pageContext.request.contextPath}/resources/img/text1.png"
									alt="First slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100"
									src="${pageContext.request.contextPath}/resources/img/text2.png"
									alt="Second slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100"
									src="${pageContext.request.contextPath}/resources/img/text3.png"
									alt="Third slide">
							</div>
						</div>
					</div>
				</div>
				<div class="box3">
					<table border="1" bordercolor="#ccc">
						<tr>
							<td><a href="checkout.do"><img
									src="${pageContext.request.contextPath}/resources/img/icon1.png"></a></td>
							<td><a href="membership.do"><img
									src="${pageContext.request.contextPath}/resources/img/icon2.png"></a></td>
						</tr>
						<tr>
							<td><a href="library_guide.do"><img
									src="${pageContext.request.contextPath}/resources/img/icon3.png"></a></td>
							<td><a href="notice_list.do"><img
									src="${pageContext.request.contextPath}/resources/img/icon4.png"></a></td>
						</tr>
					</table>
					<a href="mbti.do"><img
						src="${pageContext.request.contextPath}/resources/img/mbti_logo.png"
						style="float: right;"></a>
				</div>
			</div>
		</div>

		<section class="box">
			<div id="carouselExampleIndicators" class="carousel slide slider2"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100"
							src="${pageContext.request.contextPath}/resources/img/poster1.png"
							alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="${pageContext.request.contextPath}/resources/img/poster2.png"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="${pageContext.request.contextPath}/resources/img/poster3.png"
							alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
			<div class="notice">
				<ul class="n_menu">
					<li class="tab-link current" data-tab="tab-1">공지사항</li>
					<li class="tab-link" data-tab="tab-2">Q&A게시판</li>
					<li class="tab-link" data-tab="tab-3">행사안내</li>
				</ul>
				<div id="tab-1" class="tab-content current">
					<c:forEach begin="1" end="7" var="n" items="${n_list}">
						<p><a href="notice_view.do?idx=${n.idx}&page=1">${fn:substring(n.title, 0, 30)}</a><span>${n.regidate}</span></p>
					</c:forEach>
					<!-- <a href="#">&lt;<b>책벌레 클럽 주최</b>&gt; 월간 독서 모임
					</a><br> <a href="#">&lt;<b>2022 여름 북토크</b>&gt; 이만큼 가까이 - 정세랑
					</a><br> <a href="#">&lt;<b>2022 서울 북스타트</b>&gt; 영유아 책 꾸러미 선물
						증정
					</a><br> <a href="#">&lt;<b>책벌레 클럽 주최</b>&gt; 월간 독서 모임
					</a><br> <a href="#">&lt;<b>2022 여름 북토크</b>&gt; 이만큼 가까이 - 정세랑
					</a><br> <a href="#">&lt;<b>2022 서울 북스타트</b>&gt; 영유아 책 꾸러미 선물
						증정
					</a><br> <a href="#">&lt;<b>2022 서울 북스타트</b>&gt; 영유아 책 꾸러미 선물
						증정
					</a> -->
				</div>
				<div id="tab-2" class="tab-content">
					<c:forEach begin="1" end="7" var="q" items="${q_list}">
						<p><a href="qna_view.do?idx=${q.idx}&page=1">${fn:substring(q.title, 0, 30)}</a><span>${fn:split(q.regidate, ' ')[0]}</span></p>
					</c:forEach>
					<!-- <a href="#"><b>[문화강좌]</b> 2022년 4기(10~12월) 문화강좌 회원 모집</a><br>
					<a href="#"><b>[문화강좌]</b> 2022년 3기(7~9월) 문화강좌 회원 모집</a><br> <a
						href="#"><b>[문화강좌]</b> 2022년 2기(4~6월) 문화강좌 회원 모집</a><br> <a
						href="#"><b>[문화강좌]</b> 2022년 1기(2-3월) 문화강좌 회원 모집</a><br> <a
						href="#"><b>[문화강좌]</b> 2022년 4기(10~12월) 문화강좌 회원 모집</a><br> <a
						href="#"><b>[문화강좌]</b> 2022년 3기(7~9월) 문화강좌 회원 모집</a><br> <a
						href="#"><b>[문화강좌]</b> 2022년 2기(4~6월) 문화강좌 회원 모집</a><br> -->
				</div>
				<div id="tab-3" class="tab-content">
					<c:forEach begin="1" end="7" var="e" items="${e_list}">
						<p><a href="eventview.do?idx=${e.idx}&page=1">${fn:substring(e.title, 0, 30)}</a><span>${fn:split(e.regdate, ' ')[0]}</span></p>
					</c:forEach>
					<!-- <a href="#"><b>[독서문화프로그램]</b> 직장인을 위한 레벨업 프로젝트</a><br> <a
						href="#"><b>[2022책축제]</b> 창작 인형극</a><br> <a href="#"><b>[2022책축제]</b>
						그림책극장 체험키트 신청</a><br> <a href="#"><b>[독서문화프로그램]</b> 직장인을 위한
						레벨업 프로젝트</a><br> <a href="#"><b>[2022책축제]</b> 창작 인형극</a><br>
					<a href="#"><b>[2022책축제]</b> 그림책극장 체험키트 신청</a><br> <a href="#"><b>[2022책축제]</b>
						그림책극장 체험키트 신청</a><br> -->
				</div>
			</div>
		</section>
		<div class="box">
			<div class="container" style="margin-left: -15px;">
				<ul class="tabs">
					<li class="tab_link current" data-tab="tab1">사서추천도서</li>
					<li class="tab_link" data-tab="tab2">베스트셀러</li>
					<li class="tab_link" data-tab="tab3">신간도서</li>
				</ul>
				<div id="tab1" class="tab_content current"></div>
				<div id="tab2" class="tab_content"></div>
				<div id="tab3" class="tab_content"></div>
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
						<li>Copyright© 2000. JINRI DISTRICT LIBRARY. All Rights
							Reserved.</li>
					</ul>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>