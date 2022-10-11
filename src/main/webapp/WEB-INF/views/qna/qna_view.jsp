<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진리도서관 :: Q&A게시판 :: ${vo.title}</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/qna_css/qnaview.css"/>
<link href="${pageContext.request.contextPath}/resources/css/qna_css/qnacss.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/qnajs/qna.js"></script>
<!--  <script src="${pageContext.request.contextPath}/resources/js/qnajs/qna_view.js"></script>--> 
<script>
function qna_reply(f) {
	f.method = "post";
	submit();
		
}
  		
  
  function qna_del(f){
	  
		if(confirm("삭제하시겠습니까?")){
		
			var url = "qna_del.do?idx="+f.idx.value + "&page=${param.page}";
			sendRequest(url, null, resultFun, "post");
		}
		else{
			alert("실패하였습니다.");
		}
	}
  
	function resultFun(){
		if(xhr.readyState == 4&& xhr.status == 200){
		var data = xhr.responseText;
		
		//data = [{'res':'yes'}, {'page':'1'}];
		var json = eval(data);
		//json[0].res ---> yes
		//json[1].param ---> 1
		
		if (json[0].res == "yes"){
			alert("삭제 성공");
			location.href = "qna_list.do?page="+json[1].page;
		}
		else{
			alert("삭제 실패");
			}
		}
	}

</script>


<div id="all">
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
            <li id="strong">열린공간</li>
            <li><a href="notice_list.do">공지사항</a></li>
            <li><a href="qna_list.do">Q&A 게시판</a></li>
            <li><a href="often.do">자주 하는 질문</a></li>
            <li><a href="eventlist.do">행사 관련 안내</a></li>
            
        </ul>
            </aside>

  <form method ="post">
  <div class = "main">
		          <div id="location">
		            <div>
		              <h1>Q&A 게시판</h1>
		            </div>
		            <div class="loc_history">
		              	홈 &nbsp;>&nbsp; 열린공간 &nbsp;> &nbsp; <b>Q&A 게시판</b>
		            </div>
		          </div>
                
                    <div class="board_write">
                        <div class="title">
                <input type="hidden" name="idx" value="${vo.idx}">
                            <br>
                            <h5>제목 | &nbsp;&nbsp;${vo.title}</h5>
                            <hr>
                            <span>작성자 &nbsp;|&nbsp; <b>${vo.id}</b></span>
                            <span>작성일 &nbsp;|&nbsp; <b>${vo.regidate}</b></span>
                            <span>조회수 &nbsp;|&nbsp; <b>${vo.readhit}</b></span>
                            <hr>
                            <div class="cont">
                                	<pre style="font-family:'NanumSquare'; font-size:16px;">${vo.content}</pre>
                            </div>
                            <hr>
                            <div class="bt_wrap" style = "float: right;">
                <input type ="button" value="목록으로" onclick="location.href='qna_list.do?page=${param.page}'">
				<c:if test = "${user.id eq 'admin'}">
				<input type ="button" value="답글달기" onclick="location.href='qna_reply_form.do?idx=${vo.idx}&ref=${vo.ref}&page=${empty param.page ? 1 : param.page}'">
				</c:if>
				<c:if test = "${user.id eq vo.id}">
				<input type ="button" value="삭제하기" onclick= "qna_del(this.form);">
				<input type ="button" value="수정하기" onclick="location.href='qna_modify_form.do?idx=${vo.idx}&page=${empty param.page ? 1 : param.page}'">
				</c:if>
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
                        <li>Copyright© 2000. JINRI DISTRICT LIBRARY. All Rights Reserved.</li>
                    </ul>
                </div>
            </div>
        </footer>
    </div>
</body>
</html>