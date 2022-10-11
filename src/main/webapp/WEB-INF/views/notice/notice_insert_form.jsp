<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 :: 새 글 등록</title>
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
    <link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice/write.css"/>
<script>
	function send(f) {
		let content = f.content.value;
		let title = f.title.value;
		
		if(title == "") {
	         alert('제목을 입력하세요');
	         return;
	    }
		if(content == "") {
	         alert('내용을 입력하세요');
	         return;
	    }
	      
	    
	    f.action = "notice_insert.do";
	    f.method = "post";
	    f.submit();  // 전송
	      
	}
</script>
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
                      </ul>
                  </li>
                  <li><a href="library_guide.do" class="title">도서관소개</a>
                      <ul class="nav_dropdown">
                          <div class="menu_bd">
                              <li><a href="library_guide.do">도서관 안내</a></li>
                              <li><a href="checkout_guide.do">대출반납안내</a></li>
                              <li><a href="map.do">찾아오시는길</a></li>
                              <li><a href="membership.do">회원증 발급</a></li>
                          </div>
                      </ul>
                  </li>
                  <li><a href="notice_list.do" class="title">열린공간</a>
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
                <li id="strong">열린공간</li>
                <li><a href="notice_list.do">공지사항</a></li>
                <li><a href="often.do">자주하는질문</a></li>
                <li><a href="qna_list.do">Q&A 게시판</a></li>
                <li><a href="eventlist.do">행사안내</a></li>
              </ul>
            </aside>
            <div class="board_wrap">
                <div id="location">
                    <div class="loc_title">
                        <h2>공지사항 등록</h2>
                    </div>
                    <div class="loc_history">
                        홈  &nbsp;>&nbsp; 열린공간 &nbsp;> &nbsp; <b> 공지사항 </b>
                    </div>
                </div>
                
                  <!-- 파일을 전송하는 폼 태그에는 아래의 두 가지 속성이 반드시 추가되어 있어야 한다. -->
				  <form method="POST" enctype="multipart/form-data">
                  <div class="board_write_wrap">
                      <div class="board_write">
                          <div class="title">
                              <p>
                                  <input name="title" value="${vo.title}" placeholder="제목을 입력하세요" style="width:800px; margin-left:-10px; padding-left:10px;">
                              </p>
                          </div>
              			  <div class="file">
              			  	<input type="file" name="photo">
              			  </div>
                          <div class="cont">
                            <pre><textarea rows="15" cols="150" name="content" placeholder="내용을 입력하세요" style="font-family:'NanumSquare';">${vo.content}</textarea></pre>
                          </div>
                      </div>
                      <div class="bt_wrap">
                        <input type="button" value="등록" onclick="send(this.form);">
                        <input type="button" value="목록" onclick="location.href='notice_list.do?page=${param.page}'">
                          <!-- 글 작성 게시판 마다 링크 바꿔야함-->
                      </div>
                  </div>
                </form>
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