<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/find.css">
<title>비밀번호 재확인</title>
<script type="text/javascript" src="resources/js/check.js"></script>
</head>
<body>
	<div>
		<h3>비밀번호 재확인</h3>
		<p>본인 확인을 위해 비밀번호를 다시 한번 입력해주세요</p>
		<input type="text" id="uId_" class="input" placeholer="${#uId_ }" readonly="readonly" />
		<input type="password" id="uPw" class="input" placeholder="비밀번호" />
		
		<div class="btn">
			<input type="button" class="sub" value="확인" onclick="check_pw(this.form)"/>		
		</div>
	</div>
</body>
</html>