<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행사안내</title>
<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/event/event_list.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>


<script>


/* 삭제버튼 클릭 */
function del( f ) {
	
	//Ajax를 통해 idx를 서버로 전송
	var url = "eventdelete.do";
	var param = "idx="+f.idx.value + "&filename="+f.filename.values;
	
	sendRequest( url, param, resultFunc, "post" );
	
}//del()

/* 삭제결과를 확인할 콜백메서드 */
function resultFunc(){
	
	if( xhr.readyState == 4 && xhr.status == 200 ){
		
		//컨트롤러에서 삭제 후 return해준 데이터를 받는다
		var data = xhr.responseText;
		
		if( data == 'no' ){
			alert("삭제실패");
			return;
		}else{
			alert("삭제성공");
			location.href="eventlist.do";
		}
		
	}
	
}

/* 수정버튼 클릭 */
function modify( f ) {

	
	f.method="post";
	f.submit();
	
}
// 상세보기 클릭
function view( f ) {

	
	f.method="post";
	f.submit();
	
}
function send(){
	//두개 세트로 적어야 select 안에 담긴다
	var target = document.getElementById("search");
	var search = target.options[target.selectedIndex].value;

	var search_res = document.getElementById("search_res").value.trim();
	if (search == '') {
		// search에 값이 비어있으면 gogaeklist.do?search= 이렇게만 넘어가므로
		// gogaeklist.do?search=all로 넘어갈 수 있도록 해준다.
		search = 'all';
	}

	//submit 이나 post로 강제로 보내면 누락될수가 있기 때문에 강제로 search 와 select 를 보내준다.
	location.href = "eventlist.do?page=1&search="
			+ search + "&search_res=" + search_res;
	
}




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
					<li id="strong">열린공간</li>
					<li><a href="notice_list.do">공지사항</a></li>
					<li><a href="often.do">자주하는질문</a></li>
					<li><a href="qna_list.do">Q&A 게시판</a></li>
					<li><a href="eventlist.do">행사안내</a></li>
				</ul>



			</aside>

			<div class="main">
				<h1>행사안내</h1>
				<div class="loc_history">
					홈 &nbsp;>&nbsp; 열린공간 &nbsp;> &nbsp; <b> 행사안내 </b>
				</div>


				<div id="main_box">

					<!-- board seach area -->
					<div id="board-search">

						<div class="search-window">
							<form>

								<input type="hidden" name="idx" value="${vo.idx}">
								<div class="search-wrap">
									<select id="search">
										<option value="all" selected>전체</option>
										<option value="title">제목</option>
										<option value="content">내용</option>
									</select> <input id="search_res" type="text" placeholder="검색어를 입력해주세요."
										value=""> <input type="button" class="btn btn-dark"
										value="검색" onclick="send(this.form);" />
								</div>
							</form>
						</div>


					</div>


					<c:forEach var="vo" items="${ list }">
						<div class="visit_box">
							<div class="type_image">
								<c:if test="${ vo.filename ne 'no_file' }">
									<img
										src="${pageContext.request.contextPath}/resources/upload/${vo.filename}"
										width="298" height="310" />
								</c:if>
								<br>

							</div>



							<div class="type_title">${ vo.title }</div>
							<div class="type_content">
								<pre>${vo.content}</pre>
							</div>
							<div>
								<form style="text-align: center;">
									<input type="hidden" name="filename" value="${vo.filename}">
									<input type="hidden" name="idx" value="${vo.idx}">
									<c:if test="${user.id eq 'admin'}">

										<input type="button" class="input_btn" value="수정"
											onclick="location.href='event_modify_form.do?idx=${vo.idx}&page=${empty param.page ? 1 : param.page}'">
										<input type="button" class="input_btn" value="삭제"
											onclick="del(this.form);">
									</c:if>

									<input type="button" class="input_btn" value="상세보기"
										onclick="location.href='eventview.do?idx=${vo.idx}&page=${empty param.page ? 1 : param.page}'">
								</form>
							</div>

						</div>
					</c:forEach>
				</div>


				<br> <br> <br>
				<div class="main">
					<c:if test="${user.id eq 'admin'}">
						<div style="text-align: center;">
							<input type="button" value="행사 추가하기" id="btn"
								onclick="location.href='event_insert_form.do'">
						</div>
					</c:if>

				</div>
				<div class="pagemenu">
					<div>${pageMenu }</div>

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
						<li>Copyright© 2000. JINRI DISTRICT LIBRARY. All Rights
							Reserved.</li>
					</ul>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>

