<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="resources/css/loginform.css">
<script type="text/javascript" src="resources/js/login.js"></script>
</head>
<body>
	<div>
		<form method="post">
			<div class="main">
			<br />
				
				<input type="text" class="un" id="uId_" name="uId_" placeholder="아이디" /><br /><br />
				<input type="password" class="pass" id="uPw" name="uPw" placeholder="비밀번호" />
			<br />
				<div class="btn">
					<input type="button" value="로그인" class="submit" onclick="login_Start(this.form)">
					<input type="button" value="회원가입" class="submit" onclick="location.href='join_member'" />
					<br /><br />
					<a class="forgot" href="idFind">아이디 찾기</a> | <a class="forgot" href="pwFind">비밀번호 찾기</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>