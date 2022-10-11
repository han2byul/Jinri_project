

function qna_reply(f) {
	f.method = "post";
	submit();
		
}
  		
  
  function qna_del(f){
	  
		if(confirm("삭제하시겠습니까?")){
			
			alert('${param.page}');
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
		//var json = eval(data);
		//json[0].res ---> yes
		//json[1].param ---> 1
		
		if (data == "yes"){
			alert("삭제 성공");
			location.href = "qna_list.do";
		}
		else{
			alert("삭제 실패");
			}
		}
	}