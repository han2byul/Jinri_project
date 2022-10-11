<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진리도서관 :: 관심도서목록</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/wish/wish.css"/>
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
	function del(f) {
		var id = f.id.value; 
	    var reginum = f.reginum.value; 
	    
	    if (confirm("관심 도서를 목록에서 삭제하시겠습니까?")) {
	    	// ajax를 통해 idx를 서버로 전송
		    var url = "wish_delete.do";
		    var param = "id=" + id + "&reginum=" + reginum;
		    sendRequest(url, param, resultFunc, "Post"); 
	    } 

	 }  // del()
	
	function resultFunc() {
	 if (xhr.readyState == 4 & xhr.status == 200) {
		   
		   // 컨트롤러에서 삭제 후 return 해준 데이터를 받는다
		   var data = xhr.responseText;
		   
		   if (data == 'no') {
			   alert("취소 실패");
			   return;
		   } else {
			   location.href = "wish.do";
			   alert("삭제가 완료되었습니다");
		   } 
	 	}
	} 
</script>
</head>
<body>
<c:if test="${empty user}">
	<script>
		alert("로그인 후 이용할 수 있습니다.");
		location.href="login_form.do";
	</script>
</c:if>
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
                    <li id="strong">나만의 도서관</li>
                    <li><a href="checkout.do">도서대출현황</a></li>
                    <li><a href="wish.do">관심도서목록</a></li>
                    <li><a href="review.do">나만의한줄평</a></li>
                    <li><a href="mbti.do">동화 MBTI 테스트</a></li>
                </ul>
            </aside>
            <div style="width:900px; float: right;">             
                <div id="content">
                    <div id="location">
                        <div class="loc_title">
                            <h2> 관심도서목록 </h2>
                        </div>
                        <div class="loc_history">
                            홈  &nbsp;>&nbsp; 나만의 도서관 &nbsp;> &nbsp; <b> 관심도서목록 </b>
                        </div>
                    </div>

                    <div class="book_list">
                        <div id="list_total">총 : <span>${fn:length(wlist)}</span>건</div>
                        <table>
                            <thead>
                                <tr>
                                    <th style="width:10%">번호</th>
                                    <th style="width:50%">도서명</th>
                                    <th style="width:25%">저자</th>
                                    <th style="width:15%">취소</th>
                                </tr>
                            </thead>
                            <c:if test="${!empty requestScope.wlist}" >
	                     		<c:forEach var="wlist" items="${wlist}">
		                            <tbody>
		                            	<form>
		                                <tr>
		                                <input type="hidden" name="id" value="${wlist.id}">
		                                <input type="hidden" name="reginum" value="${wlist.reginum}">
		                                    <td>${wlist.rank}</td>
		                                    <td>${wlist.bname}</td>
		                                    <td>${wlist.author}</td>
		                                    <td><input type="button" value="취소" onclick="del(this.form);"></td>
		                                </tr>
		                                </form> 
		                            </tbody>
	                            </c:forEach>
                        	</c:if>
                        </table>		
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
    </div>
</body>
</html>