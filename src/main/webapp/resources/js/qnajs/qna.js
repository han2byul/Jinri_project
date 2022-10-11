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

function search() {

	var target = document.getElementById("search");

	var search = target.options[target.selectedIndex].value;

	var search_res = document.getElementById("search_res").value.trim();
	if (search == '') {
		// search에 값이 비어있으면 gogaeklist.do?search= 이렇게만 넘어가므로
		// gogaeklist.do?search=all로 넘어갈 수 있도록 해준다.
		search = 'all';
	}
	location.href = "qna_list.do?page=1&search="
			+ search + "&search_res=" + search_res;
}
