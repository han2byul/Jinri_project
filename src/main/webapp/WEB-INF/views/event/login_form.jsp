<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
 <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/event/login_form.css">
<title>로그인</title>

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
	
	
	function send(f) {
		
		let url = "login.do";
		let param = "id=" + f.id.value+"&pwd="+f.pwd.value;
		sendRequest(url, param, resultFn, "POST");
	}
	function resultFn(){
		if(xhr.readyState == 4&& xhr.status == 200){
			//no_id, no_pwd, clear중 하나를 받는다
			let data = xhr.responseText;
			if(data == 'no_id'){
				alert("아이디가 없습니다.");
			}
			else if(data == 'no_pwd'){
				alert("비밀번호 불일치");
			}
			else{
				location.href="eventlist.do";
			}
		}
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
		 <div class="regi">
                <div class="wrap wd668">
                    <div class="container">
                        <div class="form_txtInput">
                            <h2 class="sub_tit_txt">로그인</h2>
                            <p class="exTxt">로그인을 하시면 더 많은 도서관 서비스를 이용할 수 있습니다.</p>
                           
                           
                <form>
                            <div class="join_form">
                           <table>
                                    <colgroup>
                                        <col width="30%" />
                                        <col width="auto" />
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><span>아이디</span></th>
                                            <td><input type="text" name="id" placeholder="ID 를 입력하세요."></td>
                                        </tr>
                                        <tr>
                                            <th><span>비밀번호</span></th>
                                            <td><input type="password" name="pwd" placeholder="비밀번호를 입력해주세요."></td>
                                        </tr>
                                    </tbody>
                                </table>
                                
                          
                                
                                
                                <div class="btn_wrap">
                                    <button onclick="send(this.form)">로그인</button>
                                </div>
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
	  </div>
	 </body>
	</html>









