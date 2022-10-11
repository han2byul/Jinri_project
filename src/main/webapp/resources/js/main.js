$(document)
			.ready(
					function() {
						$(".nav_container nav ul li").mouseenter(
								function(e) {
									$(".nav_container nav ul li a").siblings(
											".nav_dropdown").show();
								});

						$("nav").mouseleave(function() {
							$(".nav_dropdown").hide();
						});

						$(".nav_dropdown div").mouseenter(
								function() {
									$(this).parentsUntil("li").parent().css(
											"background-color", "#ffe695");
								});

						$(".nav_dropdown div").mouseleave(
								function() {
									$(this).parentsUntil("li").parent().css(
											"background-color", "#fff");
								});

						$('ul.n_menu li').click(function() {
							var tab_id = $(this).attr('data-tab');

							$('ul.n_menu li').removeClass('current');
							$('.tab-content').removeClass('current');

							$(this).addClass('current');
							$("#" + tab_id).addClass('current');
						})

						$('ul.tabs li').click(function() {
							var tab_id = $(this).attr('data-tab');

							$('ul.tabs li').removeClass('current');
							$('.tab_content').removeClass('current');

							$(this).addClass('current');
							$("#" + tab_id).addClass('current');
						})
						$.ajax({
					        method: "GET",
					        url: "https://cors-anywhere.herokuapp.com/http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbzhdwhfla2238001&QueryType=BlogBest&MaxResults=12&start=1&SearchTarget=Book&output=js&Version=20131101&Cover=Big",
					        data: {
					            // QueryType: "Bestseller",
					            // Output: "JS"
					        }
					    })
					        .done(function (msg) {
					            console.log(msg);

					            for (var i = 0; i < 4; i++) {
					                var str = "<ul><li><a href='search.do?";
					                str += msg.item[i].title
					                str += "'><img src='";
					                str += msg.item[i].cover;
					                str += "' class='zoom'></a></li><li><a href='search.do?";
					                str += msg.item[i].title;
					                str += "'>";
					                str += (msg.item[i].title.length <= 10 ? msg.item[i].title : msg.item[i].title.substr(0, 10) + "...");
					                str += "</a></li><li><a href='search.do?";
					                str += msg.item[i].title;
					                str += "'>";
					                str += (msg.item[i].author.length <= 10 ? msg.item[i].author : msg.item[i].author.substr(0, 10) + "...");
					                str += "</a></li></ul>";
					                $("#tab1").append(str);
					            }

					        });
					});
	
	$.ajax({
	    method: "GET",
	    url: "https://cors-anywhere.herokuapp.com/http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbzhdwhfla2238001&QueryType=Bestseller&MaxResults=12&start=1&SearchTarget=Book&output=js&Version=20131101&Cover=Big",
	    data: {
	        // QueryType: "Bestseller",
	        // Output: "JS"
	    }
	})
	    .done(function (msg) {
	        console.log(msg);

	        for (var i = 0; i < 4; i++) {
	        	var str = "<ul><li><a href='search.do?";
                str += msg.item[i].title
                str += "'><img src='";
                str += msg.item[i].cover;
                str += "' class='zoom'></a></li><li><a href='search.do?";
                str += msg.item[i].title;
                str += "'>";
                str += (msg.item[i].title.length <= 10 ? msg.item[i].title : msg.item[i].title.substr(0, 10) + "...");
                str += "</a></li><li><a href='search.do?";
                str += msg.item[i].title;
                str += "'>";
                str += (msg.item[i].author.length <= 10 ? msg.item[i].author : msg.item[i].author.substr(0, 10) + "...");
                str += "</a></li></ul>";
	            $("#tab2").append(str);
	        }

	    });


	$.ajax({
	    method: "GET",
	    url: "https://cors-anywhere.herokuapp.com/http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbzhdwhfla2238001&QueryType=ItemNewSpecial&MaxResults=12&start=1&SearchTarget=Book&output=js&Version=20131101&Cover=Big",
	    data: {
	        // QueryType: "Bestseller",
	        // Output: "JS"
	    }
	})
	    .done(function (msg) {
	        console.log(msg);

	        for (var i = 0; i < 4; i++) {
	        	var str = "<ul><li><a href='search.do?";
                str += msg.item[i].title
                str += "'><img src='";
                str += msg.item[i].cover;
                str += "' class='zoom'></a></li><li><a href='search.do?";
                str += msg.item[i].title;
                str += "'>";
                str += (msg.item[i].title.length <= 10 ? msg.item[i].title : msg.item[i].title.substr(0, 10) + "...");
                str += "</a></li><li><a href='search.do?";
                str += msg.item[i].title;
                str += "'>";
                str += (msg.item[i].author.length <= 10 ? msg.item[i].author : msg.item[i].author.substr(0, 10) + "...");
                str += "</a></li></ul>";
	            $("#tab3").append(str);
	        }

	    });
	
	function send(f) {
		let url = "login.do";
		let param = "id=" + f.id.value + "&pwd=" + f.pwd.value;

		sendRequest(url, param, resultFn, "POST");
	}
	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			// no_id, no_pwd, clear 중 하나를 받는다.
			let data = xhr.responseText;

			if (data == 'no_id') {
				alert("아이디가 없습니다.");
			} else if (data == 'no_pwd') {
				alert("비밀번호가 틀렸습니다.");
			} else {
				location.href = "main.do";
			}
		}
	}
	
	function search_send(f) {
		
		if(f.search.value == '') {
			alert("검색어를 입력하세요.");
			return;
		}
		
		f.action = "search.do";
		f.submit();
	}