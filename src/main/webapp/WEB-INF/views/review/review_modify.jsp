<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review/review_write.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- Optional JavaScript -->
<!-- Popper.js, then Bootstrap JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css"
	rel="stylesheet">
<title>진리도서관 :: 나만의한줄평</title>
<style>
	#top_menu a:link, a:visited, a:hover, a:active { color : #000; text-decoration:none; }
</style>
<script type="text/javascript">
	$(document).ready(
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
			});

	function send(f) {
		var subject = f.subject.value;
		var content = f.content.value;
		f.title.value = document.getElementById("bTitle").innerHTML;
		f.authors.value = document.getElementById("bAuthors").innerHTML; 
		
		if(subject=='') {
			alert("제목을 입력하세요");
			return;
		}
		if(content=='') {
			alert("내용을 입력하세요");
			return;
		}
		
		f.action = "review_update.do?page=${param.page}";
		f.method = "post";
		f.submit();
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
					<li id="strong">나만의 도서관</li>
					<li><a href="checkout.do">도서대출현황</a></li>
					<li><a href="wish.do">관심도서목록</a></li>
					<li><a href="review.do">나만의한줄평</a></li>
					<li><a href="mbti.do">동화 MBTI 테스트</a></li>
				</ul>
			</aside>
			<div class="board_wrap">
				<div id="location">
					<div class="loc_title">
						<h2>한줄평 작성</h2>
					</div>
					<div class="loc_history">
						홈 &nbsp;>&nbsp; 나만의 도서관 &nbsp;> &nbsp; <b> 나만의한줄평 </b>
					</div>
				</div>
				<div class="board_table">
				<form id="board_tbl">
					<table>
						<colgroup>
							<col width="15%;" />
							<col width="40%;" />
							<col width="10%;" />
							<col width="45%;" />
						</colgroup>
						<thead>
							<tr>
								<th><span>제목</span></th>
								<td colspan="2"><input type="text" name="subject" value="${vo.subject}"></td>
							</tr>
						</thead>
						<thead>
							<tr>
								<th><span>기록할 책</span></th>
								<td colspan="2" id="bTitle">${vo.title}</td>
							</tr>
							<tr>
								<th><span>작가</span></th>
								<td colspan="2" id="bAuthors">${vo.authors}</td>
							</tr>
						</thead>
						<tr>
							<td colspan="3">
								<textarea placeholder="당신의 이야기를 들려주세요" name="content">${vo.content}</textarea>
							</td>
						</tr>
						<input type="hidden" name="idx" value="${vo.idx}">
						<input type="hidden" name="title" value="">
						<input type="hidden" name="authors" value="">
						<input type="hidden" name="id" value="${user.id}">
						<input id="bThumbnail" type="hidden" name="thumbnail" value="${vo.thumbnail}">
					</table>
					</form>
				</div>
				<div class="bt_wrap">
					<a class="submit" href="javascript:send(document.getElementById('board_tbl'));">저장</a>
					<a href="review.do?page=${param.page}" class="submit" style="color:#fff;">취소</a>
					<!-- 글 작성 게시판 마다 링크 바꿔야함-->
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