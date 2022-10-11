<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<title>진리도서관 :: Q&A게시판</title>
<link href="${pageContext.request.contextPath}/resources/css/qna_css/qna_modify.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/qna_css/qnacss.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/qnajs/qna.js"></script>
<!--  <script src="${pageContext.request.contextPath}/resources/js/qnajs/qna_modify.js"></script>--> 
</head>
<script>
function send_check(f){
    //alert("d");
    
    var title = f.title.value;
    var content = f.content.value;
    
    if(title == "") {
        alert('제목을 입력하세요');
        return;
     }
   if(content == "") {
        alert('내용을 입력하세요');
        return;
     }

   f.submit();
}
</script>
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
               <li><a href="notice_list.do">공지사항</a></li>
               <li><a href="often.do">자주하는질문</a></li>
               <li><a href="qna_list.do">Q&A 게시판</a></li>
               <li><a href="eventlist.do">행사안내</a></li>
            </ul>
         </aside>
         <div class = "main">
                <div class="board_wrap">
                <div id="location">
                    <div class="loc_title">
                        <h2>Q&A 게시판</h2>
                    </div>
                    <div class="loc_history">
                        홈  &nbsp;>&nbsp; 열린공간 &nbsp;> &nbsp; <b> Q&A 게시판</b>
                    </div>
                </div>
               <form method="post" action="qna_modify.do?idx=${vo.idx}&page=${empty param.page ? 1 : param.page}">
                  <input type="hidden" name ="idx" value="${vo.idx}">
                  <div class="board_write_wrap">
                      <div class="board_write">
                          <div class="title">
                              <h4>작성자 : ${vo.id}</h4>
                           </div>
                           <div class="title">
                                 제목   : &nbsp;&nbsp;<input type="text" name="title" placeholder="제목을 입력하세요" value = "${vo.title}">
                               <br>
                          </div>
                          <div class="cont">
                            <pre><textarea rows="15" cols="120" name="content" placeholder="내용을 입력하세요" style="font-family:'NanumSquare';">${vo.content}</textarea></pre>
                          </div>
                      </div>
                      <div class="bt_wrap">
                        <input type="button" value="등록" onclick="send_check(this.form);">
                        <input type="button" value="목록" onclick="location.href='qna_list.do'">
                          <!-- 글 작성 게시판 마다 링크 바꿔야함-->
                      </div>
                  </div>
              
            </div>
        </div>

      </form>
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