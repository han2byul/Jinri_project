<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진리도서관 :: 도서대출현황</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/checkout/checkout.css"/>
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
	function renew(f) {
		var id = f.id.value;
		var reginum = f.reginum.value;
		
		
		if (confirm("반납일자를 연장하시겠습니까?")) {
			var url = "modify.do";
		    var param = "id=" + id + "&reginum=" + reginum;
		    sendRequest(url, param, resultFunc, "Post"); 
		}
		
	}
	
	function resultFunc() {
		 if (xhr.readyState == 4 & xhr.status == 200) {
			   
			   // 컨트롤러에서 삭제 후 return 해준 데이터를 받는다
			   var data = xhr.responseText;
			   
			   if (data == 'no') {
				   alert("연장 실패");
				   return;
			   } else { 
				   location.href = "checkout.do"; 
				   alert("반납일자가 연장되었습니다.");
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
                            <h1> 대출현황 </h1>
                        </div>
                        <div class="loc_history">
                            홈  &nbsp;>&nbsp; 나만의 도서관 &nbsp;> &nbsp; <b> 도서대출현황 </b>
                        </div>
                    </div>
                    <div class="notice" style="margin-bottom:30px;">
                        <p>· 도서 대출연장은 1회에 한하여 7일간 가능합니다.</p>
                        <p>· 연체도서 및 예약도서는 대출연장을 할 수 없습니다.</p>
                        <p>· 기타 문의사항은 도서관으로 연락주시면 자세히 안내해드리겠습니다.</p>
                    </div>
                    
                    <div id="list_total">총 : <span>${fn:length(blist)}</span>건</div>
                    <div class="book_list">
                        <table>
                            <thead>
                                <tr>
                                    <th style="width:10%">번호</th>
                                    <th style="width:20%">도서명</th>
                                    <th style="width:15%">저자</th>
                                    <th style="width:15%">대출일</th>
                                    <th style="width:15%">반납예정일<br>/반납일</th>
                                    <th colspan="2" style="width:25%">상태</th>
                                </tr>
                            </thead>
                            <c:if test="${!empty requestScope.blist}" >
		                		<c:forEach var="vo" items="${blist}">
	                            <tbody>
	                            <form>
	                                <tr>
	                                <input type="hidden" name="id" value="${vo.id}">
	                            	<input type="hidden" name="reginum" value="${vo.reginum}">
	                                    <td>${vo.idx}</td>
	                                    <td>${vo.bname}</td>
	                                    <td>${vo.author}</td>
	                                    <td>${vo.borrow_date}</td>
	                                    <c:if test="${empty vo.due_date}">
	                                    	<td>${vo.return_date}</td>
	                                    </c:if>
	                                    <c:if test="${! empty vo.due_date}">
	                                    	<td>${vo.due_date}</td>
	                                    </c:if>
	                                    <c:if test="${vo.state eq 'loan'}">
	                                    	<td id="loan">대여중</td>
	                                    </c:if>
	                                    <c:if test="${vo.state eq 'comp'}">
	                                    	<td id="comp">반납완료</td>
	                                    </c:if>
	                                    <c:if test="${vo.state eq 'loan'}">
	                                    	<td><input id="btn1" value="반납연장" onclick="renew(this.form);"></td>
	                                    </c:if>
	                                    <c:if test="${vo.state eq 'comp'}">
	                                    	<td><input id="btn2" value="한줄평작성" onclick="location.href='review.do'"></td>
	                                    </c:if>
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