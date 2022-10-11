<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
	<script>

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
				location.href="qna_list.do";
			}
		}
	}
	</script>
</head>


<body>
	<form>
		<table border="1" align="center">
		<caption>:::로그인:::</caption>
		<tr>
			<th>아이디</th>
			<td><input name="id"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pwd"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type = "button" value="로그인"  onclick="send(this.form)"></td> 
		</tr>
		</table>
	</form>
</body>
</html>