<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review/book_search.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css"
	rel="stylesheet">
<title>진리도서관 :: 책 검색</title>
<style>
	#top_menu a:link, a:visited, a:hover, a:active { color : #000; text-decoration:none; }
</style>
<script type="text/javascript">
	$(function () {
	    $("#search_btn").click(function () {
	        $.ajax({
	            method: "GET",
	            url: "https://dapi.kakao.com/v3/search/book?target=title",
	            data: { query: $("#search").val() },
	            headers: { Authorization: "KakaoAK 8e4c9f81d06f13ce398748177abb8d35" }
	        })
	            .done(function (msg) {
	                for (var i = 0; i < 5; i++) {
	
	                    var data = "<form><table border='1'><tr><th>제목</th><td>";
	                    data += msg.documents[i].title;
	                    data += "</td></tr><tr><th>작가</th><td>";
	                    data += msg.documents[i].authors;
	                    data += "</td></tr><tr><td colspan='2' align='center'><img src='";
	                    data += msg.documents[i].thumbnail;
	                    data += "'><br><input type='button' onclick=\"send('";
	                    data += msg.documents[i].title + "', '";
	                    data += msg.documents[i].authors + "', '";
	                    data += msg.documents[i].isbn + "', '";
	                    data += msg.documents[i].price + "', '";
	                    data += msg.documents[i].publisher + "', '";
	                    data += msg.documents[i].datetime + "', '";
	                    data += msg.documents[i].thumbnail;
	                    data += "')\"; value='선택' class='btn-dark'></td></tr></table></form>";
	                    
	                    $("#book_tbl").prepend(data);
	                }
	            });
	    });
	});

	function send(title, authors, isbn, price, publisher, datetime, thumbnail){
		if(opener.document.getElementById("bTitle")) {
			opener.document.getElementById("bTitle").innerText = title;
		}
		if(opener.document.getElementById("bAuthors")) {
			opener.document.getElementById("bAuthors").innerText = authors;
		}
		if(opener.document.getElementById("bIsbn")) {
			opener.document.getElementById("bIsbn").innerText = isbn;
		}
		if(opener.document.getElementById("bPrice")) {
			opener.document.getElementById("bPrice").innerText = price + "원";
		}
		if(opener.document.getElementById("bPublisher")) {
			opener.document.getElementById("bPublisher").innerText = publisher;
		}
		if(opener.document.getElementById("bDatetime")) {
			opener.document.getElementById("bDatetime").innerText = datetime.substr(0,4);
		}
		if(opener.document.getElementById("bThumbnail")) {
			opener.document.getElementById("bThumbnail").value = thumbnail;
		}
		close();
    }
</script>
</head>
<body>
	<div id="search_body">
		<h1>책 검색</h1>
		<p>
			<input type="text" id="search" placeholder="검색어를 입력하세요">
			<button id="search_btn" class="btn-dark">검색</button>
		</p>
		<div id="book_tbl"></div>
	</div>
</body>
</html>