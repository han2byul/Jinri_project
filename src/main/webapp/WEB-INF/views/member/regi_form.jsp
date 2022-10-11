<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/regi_form.css">
<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<title>진리도서관 :: 회원가입</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script type="text/javascript">
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
	/** 우편번호 찾기 */
	function execDaumPostcode() {
	    daum.postcode.load(function(){
	        new daum.Postcode({
	            oncomplete: function(data) {
	              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	              $("#postcode").val(data.zonecode);
	              $("#address").val(data.roadAddress);
	            }
	        }).open();
	    });
	}
	// 전화번호 하이픈 자동입력
	const autoHyphen = (target) => {
	 	target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}
	
   // 아이디 중복여부 체크
   var b_idCheck = false;
   
   function send(f) {
   // 입력내용 체크
   	   var id = f.id.value.trim();
	   var pwd = f.pwd.value.trim();
	   var pwd2 = f.pwd2.value.trim();
	   var name = f.name.value.trim();
	   var email1 = f.email1.value.trim();
	   var email2 = f.email2.value.trim();
	   var email = email1 + "@" + email2;
	   var tel = f.tel.value.trim();
	   var address = f.address.value.trim();
	   var detailAddress = f.detailAddress.value.trim();
	   var addr = address + detailAddress;
     
    
     // 오류 사전 체크 
     if (id=='') {
       alert("아이디를 입력하세요");
       f.id.focus();
       return;
     }
     if (pwd=='') {
       alert("비밀번호를 입력하세요");
       f.pwd.focus();
       return;
     }
     if (name == '') {
          alert("이름을 입력하세요");
          f.name.focus();
          return;
       }
       if (email == '') {
         alert("이메일을 입력하세요");
         f.email.focus();
         return;
       }
       if (addr == '') {
         alert("주소를 입력하세요");
         f.addr.focus();
         return;
       }
       // 중복 체크
       if (!b_idCheck) {
    	   f.id.focus();
          alert("아이디 중복 체크를 하세요");
          return;
       }
       if(pwd != pwd2){
    	   f.pwd.focus();
    	   alert("비밀번호가 일치하지 않습니다\n비밀번호를 확인하세요");
    	   return;
       }
       var url = "regi_insert.do";
		var param = "name=" + name + "&id=" + id + "&pwd=" + pwd + "&email=" + email + "&tel=" + tel + "&addr=" + addr;
		sendRequest(url, param, resultIns, "POST");
  } //send()
  
  	// 업로드 결과를 보여주는 콜백메서드
	function resultIns() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			// 컨트롤러에서 삭제 후 return을 해준 데이터를 받는다.(yes/no)
			var data = xhr.responseText;
			if (data == "no") {
				alert("회원가입 실패");
			} else {
				alert("회원가입 성공");
				location.href = "main.do";
			}
		}
	}
  
  
   function check_id() {
	   var id = document.getElementById("id").value.trim();
         if (id == '') {
            alert("아이디를 입력하세요");
            return;
         }
         // id를 Ajax를 통해서 서버로 전송
           var url = "id_check.do";
         // id에 @와 같은 특수문자가 들어가 있는 경우를 대비하여 인코딩하여 보낸다.
           var param = "id=" + encodeURIComponent(id);
           sendRequest(url, param, resultFn, "GET");
      }
      
      function resultFn() {
    	  var id = document.getElementById("id").value.trim();
         if (xhr.readyState==4 && xhr.status==200) {
            var data = xhr.responseText;
            if (data == 'yes') {
               alert(id + "는 이미 사용 중입니다.");
               return;
            }
            alert(id + "는 사용 가능한 아이디입니다.");
            b_idCheck = true;
      }
}
</script>
</head>
<body>
<jsp:include page="check_login_form.jsp"/>
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
                  <li id="strong">나만의 도서관</li>
                  <li><a href="checkout.do">도서대출현황</a></li>
					<li><a href="wish.do">관심도서목록</a></li>
					<li><a href="review.do">나만의한줄평</a></li>
					<li><a href="mbti.do">동화 MBTI 테스트</a></li>
                </ul>
            </aside>
            <div class="regi">       
                <div class="wrap wd668">
                    <div class="container">
                      <div class="form_txtInput">
                        <h2 class="sub_tit_txt">회원가입</h2>
                        <p class="exTxt">회원가입시 이메일 인증을 반드시 진행하셔야 합니다.</p>
                        <div class="join_form">
                        <form id="regiform">
                          <table>
                            <colgroup>
                              <col width="30%"/>
                              <col width="auto"/>
                            </colgroup>
                            <tbody>
                              <tr>
                                <th><span>아이디</span></th>
                                <td><input type="text" placeholder="ID 를 입력하세요." id="id" name="id">
                                	<a class="btn_confirm" href= "javascript:check_id();">중복확인</a></td>
                              </tr>
                              <tr>
                                <th><span>이름</span></th>
                                <td><input type="text" placeholder="이름을 입력하세요" id="name" name="name"></td>
                              </tr>
                              <tr>
                                <th><span>비밀번호</span></th>
                                <td><input type="password" placeholder="비밀번호를 입력해주세요." id="pwd" name="pwd"></td>
                              </tr>
                              <tr>
                                <th><span>비밀번호 확인</span></th>
                                <td><input type="password" placeholder="비밀번호를 확인하세요" id="pwd2" name="pwd2"></td>
                              </tr>
                              <tr class="email">
                                <th><span>이메일</span></th>
                                <td>
                                  <input type="text" id="email1" name="email1" class="email" placeholder=""><span class="mar10">@</span>
                                  <input type="text" id="email2" name="email2" class="email email2" placeholder="">
                                </td>
                              </tr>
                              <tr>
                                <th><span>휴대폰 번호</span></th>
                                <td><input id="tel" name="tel" type="text" oninput="autoHyphen(this)" maxlength="13" placeholder="휴대폰 번호를 입력하세요."></td>
                              </tr>
                              <tr>
                                <th><span>주소</span></th>
                                <td>
                                	<a class="btn_confirm" href= "javascript:execDaumPostcode();">우편번호 찾기</a>
                                  <input type="text" name="postcode" id="postcode" placeholder="우편번호" readonly />
                                  <input
								      type="text"
								      name="address"
								      id="address"
								      placeholder="도로명 주소"
								      readonly
								    /><br>
                                  <input
								      type="text"
								      id="detailAddress"
								      name="detailAddress"
								      placeholder="상세 주소"
								      required
								    />
                                </td>
                              </tr>
                            </tbody>
                          </table>
                          </form>
                          <div class="exform_txt"><span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span></div>
                        </div><!-- join_form E  -->
                        <div class="agree_wrap">
                          <div class="checkbox_wrap">
                            <input type="checkbox" id="news_letter" name="news_letter" class="agree_chk">
                            <label for="news_letter">[선택]뉴스레터 수신동의</label>
                          </div>
                          <div class="checkbox_wrap mar27">
                            <input type="checkbox" id="marketing" name="marketing" class="agree_chk">
                            <label for="marketing">[선택]마케팅 목적 개인정보 수집 및 이용에 대한 동의</label>
                            <ul class="explan_txt">
                              <li><span class="red_txt">항목 : 성별, 생년월일</span></li>
                              <li>고객님께서는 위의 개인정보 및 회원정보 수정 등을 통해 추가로 수집하는 개인정보에<br/>
                                대해 동의하지 않거나 개인정보를 기재하지 않음으로써 거부하실 수 있습니다.<br/>
                                다만 이때 회원 대상 서비스가 제한될 수 있습니다.
                              </li>
                            </ul>
                          </div>
                        </div>
                        <div class="btn_wrap">
                          <a href="javascript:send(document.getElementById('regiform'));">회원가입</a>
                        </div>
                      </div> <!-- form_txtInput E -->
                    </div><!-- content E-->
                  </div> <!-- container E -->
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