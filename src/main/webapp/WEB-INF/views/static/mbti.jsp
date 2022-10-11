<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/static/mbti.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/static/mbti.css">
<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css"
	rel="stylesheet">
    <!-- jquery and bootstrap -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <!-- webfont -->
    <link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css" rel="stylesheet">
<title>진리도서관 :: 동화 mbti 테스트</title>
<style>
	#top_menu a:link, a:visited, a:hover, a:active { color : #000; text-decoration:none; }
</style>
<script type="text/javascript">
var mbti = "";

function next() {
	if (num == 13) {
		$(".question").hide();
		$(".result").show();
		//var mbti = "";
		($("#EI").val() < 2) ? mbti += "I" : mbti += "E";
		($("#SN").val() < 2) ? mbti += "N" : mbti += "S";
		($("#TF").val() < 2) ? mbti += "F" : mbti += "T";
		($("#JP").val() < 2) ? mbti += "P" : mbti += "J";
		console.log(mbti);
		$("#img").attr(
				"src",
				"${pageContext.request.contextPath}/resources/img/mbti/" + mbti
						+ ".jpg");
		$("#character").html(result[mbti]["character"]);
		$("#explain1").html(result[mbti]["explain1"]);
		$("#explain2").html(result[mbti]["explain2"]);
		$("#explain3").html(result[mbti]["explain3"]);
	} else {
		var str = (num < 10) ? "0" + num : num;
		$(".progress-bar").attr("style", "width : calc(100/12 * " + num + "%)");
		$("#question_img").attr(
				"src",
				"${pageContext.request.contextPath}/resources/img/mbti/Q" + str
						+ ".png");
		$("#title").html(q[num]["title"]);
		$("#type").val(q[num]["type"]);
		$("#A").html(q[num]["A"]);
		$("#B").html(q[num]["B"]);
		num++;
	}
}

function res(){
	
	location.href = 'search.do?page=1&select=all&search=' + result[mbti]["book"];
}
</script>
</head>
<body>
    <div id="all">
        <header>
            <div class="box" style="height:140px;"> 
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
            <div style="width:900px; float: right;">       
                <div class="container text-center">
                    <article class="start">
                        <img src="${pageContext.request.contextPath}/resources/img/mbti/title.gif" alt="">
                        <h2 class="mt-5 mbtifont">나는 동화 속 어떤 캐릭터일까?</h2>
                        <p style="color:#888">동화 캐릭터로 알아보는 나의 MBTI</p>
                        <button type="button" class="title_btn" onclick="start()">테스트 시작하기</button>
                    </article>
                    <article class="question">
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <h3 id="title" class="question_detail">문제</h3>
                        <img id="question_img" src="" alt=""><br>
                        <input id="type" type="hidden" value="EI">
                        <button id="A" type="button" class="btns">Primary</button><br>
                        <button id="B" type="button" class="btns">Primary</button>
                    </article>
                    <article class="result">
                        <p id="result_sub1" class="mbtifont">나는 동화 속에서..</p>
                        <h2 id="character" class="mbtifont">캐릭터이름</h2>
                        <img id="img" class="" src="" alt="">
                        <p>▲ 꾹 눌러 이미지 저장하기 ▲</p>
                        <div id="result_box">
                            <h3 id="explain1" class="mbtifont">설명1</h3>
                            <p class="explains">동화 속 당신은...</p>
                            <ul id="explain2">설명2</ul>
                            <p class="explains">현실에서 당신은...</p>
                            <ul id="explain3" class="">설명3</ul>
                        </div>
                        <input type="button" class="title_btn" value="테스트 다시하기" onclick="location.href='mbti.do'">
                        <input type="button" class="title_btn" value="나와 관련된 추천도서 읽기" id="search" onclick="res();">
                    </article>
                    <input type="hidden" id="EI" value="0">
                    <input type="hidden" id="SN" value="0">
                    <input type="hidden" id="TF" value="0">
                    <input type="hidden" id="JP" value="0">
                </div>
            </div>
        </div>

        <footer>
            <div class="box">
                <nav id="bottom_menu">
                    <ul>
                        <li><a href="tos.html">이용약관</a></li>
                        <li><a href="privacy.html">개인정보처리방침</a></li>
                        <li><a href="use.html">도서관운영조례</a></li>
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