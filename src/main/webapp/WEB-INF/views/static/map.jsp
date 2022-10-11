<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아오시는길</title>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/static/map.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css"
	rel="stylesheet">

<script defer src="./index.js"></script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyADOAQd1B0vWgDmwkVmzwn-0k24H4sSZZg&callback=initMap&region=kr"></script>
<script>
   $(document).ready(function () {
            $(".nav_container nav ul li").mouseenter(function (e) {
                $(".nav_container nav ul li a").siblings(".nav_dropdown").slideDown();
                // $(".nav_dropdown").not($(this).siblings()).hide();
                //   e.stopPropagation(); 
            });
            $("nav").mouseleave(function () {
                $(".nav_dropdown").slideUp();
            });
            $(".nav_dropdown div li").mouseenter(function () {
                $(this).parentsUntil("li").parent().css("background-color", "#ffe695");
            });
            $(".nav_dropdown div li").mouseleave(function () {
            $(this).parentsUntil("li").parent().css("background-color", "#fff");
            });
  });
  
  function initMap() {

  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 14,
    center: { lat: 37.5407622, lng: 127.0706095 },
      });

    for (var i = 0; i < locations.length; i++) {
      var marker = new google.maps.Marker({
          map: map,
          label: locations[i].place,
          position: new google.maps.LatLng(locations[i].lat, locations[i].lng),
      });
      }
    }
    const locations = [
    { place:"진리도서관", lat: 37.539922, lng: 127.070609 },
    { place:"진리도서관역", lat: 37.547263, lng: 127.074181 },
    ];


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

				<h1>찾아오시는 길</h1>
				<div class="loc_history">
					홈 &nbsp;>&nbsp; 도서관소개 &nbsp;> &nbsp; <b> 찾아오시는 길 </b>
				</div>




				<p>
				<table>
					<thead>
						<tr>
							<th>정류장명</th>
							<th>정류장<br>번호
							</th>
							<th>방면</th>
							<th>소요시간</th>
							<th>버스 번호</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<td>진리도서관</td>
							<td>58372</td>
							<td>진리고등학교</td>
							<td>도보 1분</td>
							<td><button id="btn">마을</button> 062,
								<button id="btn">간선</button> 202</td>
						</tr>
						<tr>
							<td>진리도서관</td>
							<td>58373</td>
							<td>진리고등학교</td>
							<td>도보 1분</td>
							<td>
								<button id="btn">저상</button> 059, 063, 071, N007
							</td>
						</tr>
						<tr>
							<td>진리도서관</td>
							<td>20036</td>
							<td>진리아파트</td>
							<td>도보 5분</td>
							<td>
								<button id="btn">저상</button> 059, 063, N007
							</td>
						</tr>
						<tr>
							<td>진리도서관</td>
							<td>20035</td>
							<td>진리아파트</td>
							<td>도보 5분</td>
							<td><button id="btn">마을</button> 079</td>
						</tr>
					</tbody>
				</table>

				<br>
				<br>

				<div id="map"></div>

			</div>
		</div>
		<br>
		<br>







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