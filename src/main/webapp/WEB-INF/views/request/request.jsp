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
	href="${pageContext.request.contextPath}/resources/css/request/request.css">
<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css"
	rel="stylesheet">
<title>진리도서관 :: 희망도서신청</title>
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

				$('#op').on('keyup', function() {
					$('#op_cnt').html("(" + $(this).val().length + " / 100)");

					if ($(this).val().length > 100) {
						$(this).val($(this).val().substring(0, 100));
						$('#op_cnt').html("(100 / 100)");
					}
				});
				let today = new Date();   
				document.getElementById("requestDate").innerText = today.toLocaleString();
			});
	function openWin() {
		window.open("book_search.do", "진리도서관 :: 책 검색", "width=650, height=1000");
	}
	function send(f) {
		var title = document.getElementById("bTitle").innerText;
		var authors = document.getElementById("bAuthors").innerText;
		var isbn = document.getElementById("bIsbn").innerText;
		var opinion = f.bOpinion.value;
		
		if(title=='') {
			alert("책을 선택하세요");
			return;
		}
		if(opinion=='') {
			alert("신청이유를 입력하세요");
			return;
		}
		
		var url = "request_insert.do";
		var param = "id=" + "${user.id}" + "&title=" + title + "&authors=" + authors + "&isbn=" + isbn + "&opinion=" + opinion;
		sendRequest(url, param, resultFunc, "Post"); // 넘어갈 url, 파라미터, 콜백함수, 전송방식
	}

	function resultFunc() {

		if (xhr.readyState == 4 && xhr.status == 200) {

			var data = xhr.responseText;

			if (data == 'no') {
				alert("희망도서신청에 실패했습니다.");
				return;
			} else {
				alert("신청되었습니다. ");
				location.href = "request.do";
			}

		}
	}
</script>
</head>
<body>
<jsp:include page="../review/check_login.jsp"/>
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
					<a href="main.do"><img src="${pageContext.request.contextPath}/resources/img/logo.png"></a>
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
			<div style="width: 900px; float: right;">
				<div id="content">
					<div id="location">
						<div class="loc_title">
							<h2>희망도서 신청</h2>
						</div>
						<div class="loc_history">
							홈 &nbsp;>&nbsp; 나만의 도서관 &nbsp;> &nbsp; <b> 희망도서 신청 </b>
						</div>
					</div>
					<div class="notice" style="margin-bottom: 30px;">
						<p>이용하고자 하는 도서가 도서관에 소장되어 있지 않은 경우 희망도서를 신청할 수 있습니다.</p>
					</div>
					<div class="explain">
						<div id="ex1">
							<h3>대상</h3>
							<ul>
								<li>진리도서관 회원증 소지자</li>
							</ul>
						</div>
						<div id="ex2">
							<h3>이용방법</h3>
							<ul>
								<li>홈페이지 로그인 &gt; 자료검색 &gt; 희망도서 신청 &gt; 수령희망도서관 선택 &gt;
									신청완료</li>
							</ul>
						</div>
						<div id="ex3">
							<h3>신청권수</h3>
							<ul>
								<li>1인 월 3권, 1년 15권까지 가능</li>
							</ul>
						</div>
						<div id="ex4">
							<h3>처리과정</h3>
							<ul>
								<li>신청 &gt; 선정심의 &gt; 주문 &gt; 입수 &gt; 신청자 통보 &gt; 신청자 우선대출</li>
							</ul>
						</div>
						<div id="ex5">
							<h3>도서 선정 제외기준</h3>
							<ul>
								<li>소장중인 자료, 구입 중이거나 정리 중인 자료</li>
								<li>3권을 초과하는 전집·시리즈 도서</li>
								<li>출판된 지 5년이 경과하여 최신성이 떨어지는 자료(단, 컴퓨터·과학·신학문 분야는 2년)</li>
								<li>판타지 소설, 로맨스 소설, 각종 만화류</li>
								<li>수험서 및 문제집 등 참고도서</li>
								<li>5만원 이상의 고가도서</li>
								<li>외국어 원어로 된 도서 (단, 어린이도서 제외)</li>
								<li>유사 자료가 많이 소장되어 있는 경우</li>
								<li>그 외 부적합하다고 판단되는 자료</li>
							</ul>
						</div>
						<div id="ex6">
							<h3>유의사항</h3>
							<ul>
								<li>희망도서는 각 도서관의 심의를 거쳐 반영되며, 처리주기는 도서관별로 다릅니다.</li>
								<li>전자책 희망도서 신청은 전자도서관 페이지 내에서 가능합니다.</li>
							</ul>
						</div>
						<div>
							<h3 style="margin-bottom: 10px;">희망도서 신청하기</h3>
							<table border="1" width="100%">
								<tr>
									<th>신청일시</th>
									<td id="requestDate"></td>
								</tr>
								<tr>
									<th>신청도서</th>
									<td><input type="button" value="검색하기" onclick="openWin();"></td>
								</tr>
							</table>
							<form>
							<table id="req" border="1" width="100%">
								<tr>
									<th>희망도서명</th>
									<td colspan="3" id="bTitle"></td>
								</tr>
								<tr>
									<th>저자</th>
									<td colspan="3" id="bAuthors"></td>
								</tr>
								<tr>
									<th>출판사</th>
									<td width="35%" id="bPublisher"></td>
									<th>출판년도</th>
									<td width="35%" id="bDatetime"></td>
								</tr>
								<tr>
									<th>가격</th>
									<td width="35%" id="bPrice"></td>
									<th>ISBN</th>
									<td width="35%" id="bIsbn"></td>
								</tr>
								<tr>
									<th>추천의견<br>(최대100자)
									</th>
									<td colspan="3" style="padding: 20px;">
										<textarea id="op" rows="10" name="bOpinion"></textarea>
										<div id="op_cnt">(0 / 100)</div>
									</td>
								</tr>
							</table>
							<div style="text-align : center;">
							<input type="button" value="신청" onclick="send(this.form);">
							</div>
							</form>
						</div>
					</div>
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