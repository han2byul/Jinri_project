<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
    
<!DOCTYPE html>

<html>
	<head>
	<meta charset="UTF-8">
<title>행사안내</title>
<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css" rel="stylesheet">
	
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/event/event_insert_form.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
	
	
		<script>
			function send( f ) {
				var title = f.title.value;
			    var content = f.content.value;
			    
				//유효성체크 했다쳐
				
				f.method = "post";
				f.submit();//전송
				
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
	<c:if test = "${!user.id}">
	<jsp:include page="check_login.jsp"/>
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
                  홈  &nbsp;>&nbsp; 열린공간 &nbsp;> &nbsp; <b> 행사안내 </b>
              </div>
                   <h3 style="margin:20px 0;">글쓰기</h3>
                   
  
	    <form method="POST" enctype="multipart/form-data" action="eventinsert.do?id=${ user.id }&page=${empty param.page ? 1 : param.page}">
		  
			
				
				<table id="req" border="1" width="100%">			
					
					 <tr>
	                    <th>작성자 </th>
	                    <td colspan="3">${user.id}</td>
	                </tr>
					<tr>
	                    <th>제목</th>
	                    <td colspan="3"><input name="title"></td>
	                </tr>
					 <tr>
	                 		<th>내용<br>(최대50자)</th>
	                         <td colspan="3" style="padding:20px;">
	                         <textarea id="op" rows="10" name="content"></textarea>
	                         <div id="op_cnt">(0 / 50)</div>
	                         </td>
	                </tr>
					<tr>
						<th>사진첨부</th>
						<td><input type="file" name="photo" ></td>
					</tr>
			
				
				
				
				<tr>
					<td colspan="2" align="center">
					    <input type="hidden" name="filename" value="${vo.filename}">
						<input type="button" value="글쓰기" class="btn" onclick="send(this.form);"> 
						<input type="button" value="목록으로" class="btn" onclick="location.href='eventlist.do'">
					</td>
				</tr>
			</table>
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
     
	</div>	
	</body>

</html>













