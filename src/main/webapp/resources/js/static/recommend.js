$(document).ready(function() {
	$(".nav_container nav ul li").mouseenter(function(e) {
		$(".nav_container nav ul li a").siblings(".nav_dropdown").show();
	});

	$("nav").mouseleave(function() {
		$(".nav_dropdown").hide();
	});

	$(".nav_dropdown div").mouseenter(function() {
		$(this).parentsUntil("li").parent().css("background-color", "#ffe695");
	});

	$(".nav_dropdown div").mouseleave(function() {
		$(this).parentsUntil("li").parent().css("background-color", "#fff");
	});

});
$(document)
		.ready(
				function() {

					$('ul.tabs li').click(function() {
						var tab_id = $(this).attr('data-tab');

						$('ul.tabs li').removeClass('current');
						$('.tab-content').removeClass('current');

						$(this).addClass('current');
						$("#" + tab_id).addClass('current');

					});

					$
							.ajax(
									{
										method : "GET",
										url : "https://cors-anywhere.herokuapp.com/http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbzhdwhfla2238001&QueryType=BlogBest&MaxResults=12&start=1&SearchTarget=Book&output=js&Version=20131101&Cover=Big",
										data : {}
									})
							.done(
									function(msg) {
										console.log(msg);

										for (var i = 0; i < 12; i++) {
											var str = "<ul><li><a href='search.do?page=1&search=";
											str += msg.item[i].title
											str += "&select=all'><img src='";
											str += msg.item[i].cover;
											str += "' class='zoom'></a></li><li><a href='search.do?page=1&search=";
											str += msg.item[i].title;
											str += "&select=all'>";
											str += (msg.item[i].title.length <= 10 ? msg.item[i].title
													: msg.item[i].title.substr(
															0, 10)
															+ "...");
											str += "</a></li><li><a href='search.do?page=1&search=";
											str += msg.item[i].title;
											str += "&select=all'>";
											str += (msg.item[i].author.length <= 10 ? msg.item[i].author
													: msg.item[i].author
															.substr(0, 10)
															+ "...");
											str += "</a></li></ul>";
											$("#tab-1").append(str);
										}

									});

				});

$
		.ajax(
				{
					method : "GET",
					url : "https://cors-anywhere.herokuapp.com/http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbzhdwhfla2238001&QueryType=Bestseller&MaxResults=12&start=1&SearchTarget=Book&output=js&Version=20131101&Cover=Big",
					data : {
					// QueryType: "Bestseller",
					// Output: "JS"
					}
				})
		.done(
				function(msg) {
					console.log(msg);

					for (var i = 0; i < 12; i++) {
						var str = "<ul><li><a href='search.do?page=1&search=";
						str += msg.item[i].title
						str += "&select=all'><img src='";
						str += msg.item[i].cover;
						str += "' class='zoom'></a></li><li><a href='search.do?page=1&search=";
						str += msg.item[i].title;
						str += "&select=all'>";
						str += (msg.item[i].title.length <= 10 ? msg.item[i].title
								: msg.item[i].title.substr(0, 10) + "...");
						str += "</a></li><li><a href='search.do?page=1&search=";
						str += msg.item[i].title;
						str += "&select=all'>";
						str += (msg.item[i].author.length <= 10 ? msg.item[i].author
								: msg.item[i].author.substr(0, 10) + "...");
						str += "</a></li></ul>";
						$("#tab-2").append(str);
					}

				});

$
		.ajax(
				{
					method : "GET",
					url : "https://cors-anywhere.herokuapp.com/http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbzhdwhfla2238001&QueryType=ItemNewSpecial&MaxResults=12&start=1&SearchTarget=Book&output=js&Version=20131101&Cover=Big",
					data : {
					// QueryType: "Bestseller",
					// Output: "JS"
					}
				})
		.done(
				function(msg) {
					console.log(msg);

					for (var i = 0; i < 12; i++) {
						var str = "<ul><li><a href='search.do?page=1&search=";
						str += msg.item[i].title
						str += "&select=all'><img src='";
						str += msg.item[i].cover;
						str += "' class='zoom'></a></li><li><a href='search.do?page=1&search=";
						str += msg.item[i].title;
						str += "&select=all'>";
						str += (msg.item[i].title.length <= 10 ? msg.item[i].title
								: msg.item[i].title.substr(0, 10) + "...");
						str += "</a></li><li><a href='search.do?page=1&search=";
						str += msg.item[i].title;
						str += "&select=all'>";
						str += (msg.item[i].author.length <= 10 ? msg.item[i].author
								: msg.item[i].author.substr(0, 10) + "...");
						str += "</a></li></ul>";
						$("#tab-3").append(str);
					}

				});