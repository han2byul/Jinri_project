<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보처리방침</title>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/static/footer2.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
	<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css" rel="stylesheet">
	
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
        


      <div class="main">
                <h1>개인정보처리방침</h1><br><br>
            <ul>
                <h3 class="line_title">진리도서관 개인정보처리방침</h3>
                    <li>진리도서관은 개인정보보호법 등 관련법령에 따라 개인정보 보호 및 권익보호를 위해 개인정보 보호규정을 준수하며, 개인정보처리방침은 아래와 같습니다.</li>
                
                <h3>제 1조 - 개인정보의 처리 목적</h3>
                    <li>진리도서관은 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 목적이외의 용도로는 사용되지 않으며, 이용 목적이 변경되는 경우에는
                    「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.</li>
                </li>
            </ul>


            <div class="border_box">
            <ul class="circle">
                <li class="list_style">회원가입 및 관리
                    <li>회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정이용 방지와 비인가 사용방지, 가입의사 확인, 연령확인, 독서프로그램에 따른 온라인
                        접수/신청 등을 목적으로 개인정보를 처리합니다.</li>
                </li>
                <li class="list_style">온라인 예약프로그램 접수 및 신청
                    <li>도서관 프로그램, 행사, 교육 등의 온라인 접수를 목적으로 개인정보를 처리합니다.</li>
                </li>
                <li class="list_style">결과회신 문자/메일 발송
                    <li>민원처리 답변, 패스워드 찾기 등의 서비스를 제공할 목적으로 개인정보를 처리합니다.
                    </li>
                </li>
                <li class="list_style">홈페이지
                    <li>민원처리 답변, 패스워드 찾기 등의 서비스를 제공할 목적으로 개인정보를 처리합니다.
                    </li>
                </li>

            </ul>
            </div>
            
            <ul>
                <h3>제2조 - 개인정보의 처리·보유기간 및 개인정보의 항목 </h3>
                    <li>진리도서관에서 취급하는 개인정보는 개인정보보호 종합지원포털(www.privacy.go.kr) → 개인정보민원 → 개인정보의 열람 등 요구 → 개인정보파일 목록 검색 후 조회하여 도서관 도서대출 회원관리 확인 할 수 있습니다.

                    </li>
                
                <h3>제3조 - 개인정보의 제3자 제공</h3>
                    <li>진리도서관은 원칙적으로 정보주체의 개인정보를 수집·이용 목적으로 명시한 범위 내에서 처리하며, 다음의 경우를 제외하고는 정보주체의 사전 동의 없이는
                        본래의 목적 범위를 초과하여 처리하거나 제3자에게 제공하지 않습니다.</li>
                </li>
            </ul>
            <div class="border_box">
                <ul class="circle">
                    
                        <li>- 정보주체로부터 별도의 동의를 받는 경우</li>
                        <li>- 법률에 특별한 규정이 있는 경우</li>
                        <li>- 정보주체 또는 법정대리인이 의사표시를 할 수 없는 상태에 있거나 주소불명 등으로 사전 동의를 받을 수 없는 경우로서 명백히 정보주체 또는 제3자의   급박한 생명, 신체, 재산의 이익을 위하여 필요하다고 인정되는 경우</li>
                        <li>- 통계작성 및 학술연구 등의 목적을 위하여 필요한 경우로서 특정 개인을 알아 볼 수 없는 형태로 개인정보를 제공하는 경우</li>
                        <li>- 범죄의 수사와 공소의 제기 및 유지를 위하여 필요한 경우</li>
                        <li>- 법원의 재판업무 수행을 위하여 필요한 경우</li>
                </ul>
            </div>
 
            
            <ul>
                <h3>제4조 - 개인정보처리 위탁  </h3>
                    <li>개인정보 처리를 위탁하는 경우, 위탁계약 시 개인정보보호 관련 법규의 준수, 개인정보에 관한 제3자 제공 금지 및 책임부담 등을 명확히 규정하고, 당해 계약내용을 서면 및 전자 보관하고 있습니다. 또한 업체변경 시는 개인정보 처리방침을 통해 고지하겠습니다.
                    </li>
                
                <h3>제5조 - 정보주체 권리·의무 및 그 행사방법</h3>
                    <li>개인정보주체는 다음과 같은 권리를 행사 할 수 있으며, 만14세 미만 아동의 법정대리인은 그 아동의 개인정보에 대한 열람, 정정·삭제, 처리정지를 요구할 수
                        있습니다. 또한, 개인정보주체가 개인정보 열람, 정정·삭제, 처리정지를 요구한 경우 처리요구를 받은 날로부터 10일 이내에 그 결과를 알려야 하며, 처리요구가
                        완료되기 전까지는 개인정보의 이용 및 제공을 제한하고 있습니다.</li>
                </li>
            </ul>

            <div class="border_box">
                <ul class="circle">
                    <li class="list_style">개인정보 열람 요구
                        <li>「개인정보보호법」제35조(개인정보의 열람)에 따라 열람을 요구할 수 있습니다. 다만, 아래에 해당 하는 경우에는 법 제35조 5항에 의하여 열람을 제한할 수
                            있습니다.
                            
                                <li>  - 조세의 부과·징수 또는 환급에 관한 업무</li>
                                <li>- 「초·중등교육법」및「고등교육법」에 따른 각급 학교,「평생교육법」에 따른 평생교육시설, 그 밖의 다른 법률에 따라 설치 된 고등교육기관에서의 성적 평가
                                    또는 입학자 선발에 관한 업무</li>
                                <li>- 학력·기능 및 채용에 관한 시험, 자격 심사에 관한 업무</li>
                                <li>- 보상금·급부금 산정 등에 대하여 진행 중인 평가 또는 판단에 관한 업무</li>
                                <li>- 다른 법률에 따라 진행 중인 감사 및 조사에 관한 업무</li>
                            
                           
                        </li>
                    </li>
                    <li class="list_style">개인정보 정정·삭제 요구
                        <li>「개인정보보호법」제36조(개인정보의 정정·삭제)에 따라 정정·삭제를 요구할 수 있습니다. 다만, 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는
                            경우에는 그 삭제를 요구할 수 없습니다.</li>
                    </li>
                    <li class="list_style">개인정보 처리정지 요구
                        <li>「개인정보보호법」 제37조(개인정보의 처리정지 등)에 따라 처리정지를 요구할 수 있습니다. 다만, 아래에 해당하는 경우에는 법 제37조 2항에 의하여
                            처리정지 요구가 거절 될 수 있습니다.
                            - 법률에 특별한 규정이 있거나 법령상 의무를 준수하기 위하여 불가피한 경우
                            - 다른 사람의 생명·신체를 해할 우려가 있거나 다른 사람의 재산과 그 밖의 이익을 부당하게 침해 할 우려가 있는 경우
                            - 공공기관이 개인정보를 처리하지 아니하면 다른 법률에서 정하는 소관 업무를 수행할 수 없는 경우
                            - 개인정보를 처리하지 아니하면 정보주체와 약정한 서비스를 제공하지 못하는 등 계약의 이행이 곤란한 경우로서 정보주체가 그 계약의 해지 의사를 명확하게    밝히지 아니한 경우
                        </li>
                    </li>
                    <li class="list_style">개인정보 열람, 정정·삭제, 처리정지 처리절차
                        <li>※ 개인정보 열람, 정정·삭제, 처리정지 청구는 개인정보파일을 보관하고 있는 기관을 통해 직접 신청(오프라인)하시거나 개인정보보호종합지원 포털(www.privacy.go.kr)을 통해 신청하실 수 있습니다.
                        </li>
                    </li>
    
                </ul>
                </div>
 
                <ul>
                    <h3>제6조 - 개인정보 파기절차 및 방법</h3>
                        <li>진리도서관은 원칙적으로 개인정보의 이용 목적이 만료되면 지체 없이 파기합니다. </li>
                    
                    <h3>제7조 - 개인정보의 안전성 확보 조치

                    </h3>
                        <li>「개인정보 보호법」 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적·관리적 및 물리적 조치를 하고 있습니다.</li>
                    </li>
                </ul>
                <div class="border_box">
                    <ul class="circle">
                        
                         <li class="list_style">개인정보의 암호화
                            <li>이용자의 개인정보 중 비밀번호는 암호화된 상태로 저장 및 관리되고 있습니다.
                            </li>
                         </li>
                         <li class="list_style">개인정보처리시스템 접근 제한
                            <li>침입차단시스템을 이용하여 외부로부터의 무단접근을 통제하고 있으며, 개인정보를 처리하는 데이터베이스시스템에 대한 접근 로그를 보유하고 있습니다.</li>
                         </li>
                         <li class="list_style">개인정보 취급 직원의 최소화 및 교육
                            <li>개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하고 있으며, 관련규정 및 법규 등 을 준수하도록 주기적인 교육 등을 통해 개인정보의
                                	안전성을 확보하고 있습니다.</li>
                         </li>
                    </ul>
                </div>
                <ul>
                    <h3>제8조 - 권익침해 구제방법 </h3>
                        <li>정보주체는 아래의 기관에 대해 개인정보 침해에 대한 피해구제, 상담 등을 문의하실 수 있습니다. </li>
                    
                    <h3>제9조 - 개인정보보호 책임자 및 담당자 연락처</h3>
                </ul>
                <div class="border_box">
                    <ul class="circle">
                        
                         <li class="list_style">개인정보보호 책임자
                            <li>- 성명 : 김세연 <br>
                                - 직책 : 문화관광국장<br>
                                - 연락처 : 02-1234 -1003<br>
                                - 이메일 : kim9999@jinri.go.kr<br>
                            </li>
                         </li>
                         
                    </ul>
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