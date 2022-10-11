<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/search/book_info.css">
<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css"
	rel="stylesheet">
<title>진리도서관 :: 책 정보</title>
<style>
	#top_menu a:link, a:visited, a:hover, a:active { color : #000; text-decoration:none; }
</style>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$(".nav_container nav ul li").mouseenter(
								function(e) {
									$(".nav_container nav ul li a").siblings(
											".nav_dropdown").show();
								});

						$("nav").mouseleave(function() {
							$(".nav_dropdown").hide();
						});

						$(".nav_dropdown div").mouseenter(
								function() {
									$(this).parentsUntil("li").parent().css(
											"background-color", "#ffe695");
								});

						$(".nav_dropdown div").mouseleave(
								function() {
									$(this).parentsUntil("li").parent().css(
											"background-color", "#fff");
								});

						<c:forEach var="vo" items="${list}">
						$.ajax(
										{
											method : "GET",
											url : "https://dapi.kakao.com/v3/search/book",
											data : {
												query : "${vo.bname}"
											},
											headers : {
												Authorization : "KakaoAK 8e4c9f81d06f13ce398748177abb8d35"
											}
										})
								.done(
										function(msg) {

											var thumbnail = msg.documents[0].thumbnail;
											var publisher = msg.documents[0].publisher;
											var isbn = msg.documents[0].isbn;
											var contents = msg.documents[0].contents
													.substr(0, 97);

											document
													.getElementById("thumbnail").src = msg.documents[0].thumbnail;
											document
													.getElementById("thumbnail2").src = msg.documents[0].thumbnail;
											document
													.getElementById("publisher").innerHTML = msg.documents[0].publisher;
											document.getElementById("isbn").innerHTML = msg.documents[0].isbn;
											document.getElementById("contents").innerHTML = msg.documents[0].contents;
										});
						</c:forEach>

					});
	function wish(f) {

		<c:if test="${empty user}">
		alert("로그인 후 이용할 수 있습니다.");
		return;
		</c:if>

		var url = "wish_insert.do";
		console.log(f.id.value);
		var param = "id=" + f.id.value + "&reginum=" + f.reginum.value;
		sendRequest(url, param, resultFunc, "Post"); // 넘어갈 url, 파라미터, 콜백함수, 전송방식
	}

	function resultFunc() {

		if (xhr.readyState == 4 && xhr.status == 200) {

			var data = xhr.responseText;

			if (data == 'no') {
				alert("관심도서 담기에 실패했습니다.");
				return;
			} else {
				alert("관심도서에 담았습니다. ");
			}

		}
	}
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
                      </ul>
                  </li>
                  <li><a href="location.href='library_guide.do'" class="title">도서관소개</a>
                      <ul class="nav_dropdown">
                          <div class="menu_bd">
                              <li><a href="library_guide.do">도서관 안내</a></li>
                              <li><a href="checkout_guide.do">대출반납안내</a></li>
                              <li><a href="map.do">찾아오시는길</a></li>
                              <li><a href="membership.do">회원증 발급</a></li>
                          </div>
                      </ul>
                  </li>
                  <li><a href="location.href='notice_list.do'" class="title">열린공간</a>
                      <ul class="nav_dropdown">
                          <div class="menu_bd">
                              <li><a href="notice_list.do">공지사항</a></li>
                              <li><a href="often.do">자주하는질문</a></li>
                              <li><a href="qna_list.do">Q&A 게시판</a></li>
                              <li><a href="eventlist.do">행사안내</a></li>
                          </div>
                      </ul>
                  </li>
                  <li><a href="checkout.do" class="title">나만의도서관</a>
                      <ul class="nav_dropdown">
                          <div>
                              <li><a href="checkout.do">도서대출현황</a></li>
                              <li><a href="wish.do">관심도서목록</a></li>
                              <li><a href="review.do">나만의한줄평</a></li>
                              <li><a href="mbti.do">동화 MBTI 테스트</a></li>
                          </div>
                      </ul>
                  </li>
                </ul>
              </nav>
            </div>
          </section>
		</div>

		<div class="box">
			<aside>
				<ul>
					<li id="strong">자료검색</li>
					<li><a href="search.do">통합검색</a></li>
					<li><a href="recommend.do">추천도서</a></li>
					<li><a href="request.do">희망도서신청</a></li>
				</ul>
			</aside>
			<section class="main">
				<c:forEach var="vo" items="${list}">
					<h1 style="font-size: 32px;">통합검색</h1>
					<div class="loc_history">
						홈 &nbsp;>&nbsp; 통합검색 &nbsp;> &nbsp; <b> 상세페이지 </b>
					</div>
					<div>
						<ul class="book_box">
							<li><img src="" class="book_size" id="thumbnail">
								<dl class="font_height">
									<dt>${vo.bname}</dt>
									<dd>저자 : ${vo.author}</dd>
									<dd>발행년도 : ${vo.pdate}</dd>
									<dd>
										출판사 : <span id="publisher"></span>
									</dd>
									<dd>
										ISBN : <span id="isbn"></span>
									</dd>
									<dd>등록번호 : ${vo.reginum}</dd>
								</dl></li>
						</ul>
					</div>
					<div>
						<h2>소장 위치</h2>
						<table>
							<tr>
								<th>기관명</th>
								<th>자료실명</th>
								<th>등록번호</th>
								<th>도서상태</th>
								<th>대출예약</th>
							</tr>
							<tr>
								<td>진리도서관</td>
								<td>종합자료실</td>
								<td>${vo.reginum}</td>
								<td>대출가능</td>
								<td><input type="button" value="예약불가" id="btn"></td>
							</tr>
						</table>
					</div>

					<div style="text-align: center;">
						<form>
							<input type="hidden" name="id" value="${user.id}">
							<input type="hidden" name="reginum" value="${vo.reginum}">
							<input type="button" id="heart" value="관심도서담기" onclick="wish(this.form);">
						</form>
					</div>
				</c:forEach>
				<br> <br> <br>
				<div id="red_box">
					<button id="red">예약/신청 안내</button>
					<p id="red_text">도서상태가 대출중 도서의 경우 예약 가능하며 보존서고 도서의 경우 도서상태가
						신청가능 일 경우에 신청 가능 부득이하게 취소해야 할 경우는 [홈페이지>나의공간>내서재>신청]에서 취소 가능합니다.</p>
				</div>
				<div>
					<h1 style="margin: 20px; margin-top: 60px;">책소개</h1>
					<ul class="book_box2">
						<li><img src="" class="book_size2" id="thumbnail2">
							<dl class="dl2">
								<dd id="contents"></dd>
							</dl></li>
					</ul>
					<div style="text-align: center;">
						<input type="button" id="heart" value="돌아가기"
							onclick="location.href='search.do'">
					</div>
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
                        <li>Copyright© 2000. JINRI DISTRICT LIBRARY. All Rights Reserved.</li>
                    </ul>
                </div>
            </div>
        </footer>
	</div>
</body>
</html>