<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진리도서관 :: 공지사항</title>
<!-- Ajax 사용을 위한 httpRequest.js를 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice/notice.css"/>
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
<script>
	function n_search() {
		var target = document.getElementById("select");
		
		var select = target.options[target.selectedIndex].value;
		
	    var search = document.getElementById("search").value.trim();
	    
	    if (search == '') {
	      search = 'all';
	    }
	    location.href="notice_list.do?search=" + search + "&select=" + select;
	};
	
   /* 수정 */
   function modify(f) {
      
      f.action = "notice_modify_form.do";
      f.method="post";
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
      <div style="width:900px; float: right;">
        <div id="content">
          <div id="location">
            <div class="loc_title">
              <h1> 공지사항 </h1>
            </div>
            <div class="loc_history">
              홈 &nbsp;>&nbsp; 열린공간 &nbsp;> &nbsp; <b> 공지사항 </b>
            </div>
          </div>
          <div id="board-search">
          	<span>[총 <b>${row_total}</b>건]</span>
            <div class="search-window">
              <form action="">
                <div class="search-wrap">
                  <select id="select">
                    <option value="title" selected="selected">제목</option>
                    <option value="content">내용</option>
                    <option value="all">제목+내용</option>
                  </select>
                  <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
                  <input type="button" style="font-size:16px; font-weight:normal; padding-bottom:10px;" class="btn btn-dark" value="검색" onclick="n_search();">
                </div>
              </form>
            </div>
          </div>
        


          <!-- board list area -->

          <table class="board-table">
            <thead>
              <tr>
                <th scope="col" class="th-num">번호</th>
                <th scope="col" class="th-title">제목</th>
                <th scope="col" class="th-file">첨부</th>
                <th scope="col" class="th-date">등록일</th>
                <th scope="col" class="th-view">조회</th>
              </tr>
            </thead>
            <tbody>
			  <c:if test="${!empty requestScope.list}" >
	              <c:forEach var="vo" items="${list}">
	                    <tr>
	                    	<td>${vo.rank}</td>
	                        <td>
	                        	<a href="${pageContext.request.contextPath}/notice_view.do?idx=${vo.idx}&page=${empty param.page ? 1 : param.page}">${vo.title}</a>
	                        </td>
	                        <td>
	                        	<c:if test="${vo.filename ne 'no_file'}"> 
			                		<img src="${pageContext.request.contextPath}/resources/img/file.png" style="height:18px;"/>
			                	</c:if>
	                        </td>
	                        <td>${vo.regidate}</td>
	                        <td>${vo.readhit}</td>
	                    </tr>
	               </c:forEach>
               </c:if>
            </tbody>
          </table>
          <div style="text-align:center; margin-top:15px;">
          	${pageMenu}
          </div>
          <div class="write">
          <c:if test="${user.id eq 'admin'}">
            <input type="button" class="btn btn-dark" value="글쓰기" style="margin-bottom: 80px;" onclick="location.href='notice_insert_form.do?page=${empty param.page ? 1 : param.page}'">
          </c:if>
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