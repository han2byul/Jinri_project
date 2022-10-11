function send(f){
    //alert("d");
    
    var title = f.title.value;
    var content = f.content.value;
    
    if(title == "") {
        alert('제목을 입력하세요');
        return;
     }
   if(content == "") {
        alert('내용을 입력하세요');
        return;
     }

	f.submit();
}