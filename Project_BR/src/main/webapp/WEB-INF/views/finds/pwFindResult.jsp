<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 수정</title>
<style type="text/css">
body {
	background-image: url(./resources/images/library-488690_1920.jpg);
	background-size : cover;
	font-family: 'Ubuntu', sans-serif;
}

.main {
	background-color: #f26033;
	color: #85827b;
	width: 400px;
	padding : 10px;
	height: 1000px;
	margin: 1em auto;
	border-radius: 0.3em;
}
.btn{
	margin-top : 80px;
	text-align: center;
}
.sign {
	padding-top: 20px;
	color: #8C55AA;
	font-family: 'Ubuntu', sans-serif;
	font-weight: bold;
	font-size: 23px;
}

.un {
	width: 80px;
	border-radius: 0.3em;
}

.df{
	border-radius: 0.3em;
}
.dff{
	width: 300px;
	border-radius: 0.3em;
}


h5 {
	padding-top: 5px;
}

.un:focus, .pass:focus {
	border: 2px solid rgba(0, 0, 0, 0.18) !important;
}

.submit {
	color: #85827b;
	background:white;
	border: 0;
	border-radius: 0.3em;
	padding: 5px;
	font-family: 'Ubuntu', sans-serif;
	font-size: 13px;
	font-weight: bold;
}

.forgot {
	text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
	color: #E1BEE7;
	padding-top: 15px;
}

@media ( max-width : 600px) {
	.main {
		border-radius: 0px;
	}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	var regPw = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
	
	function change_password(f) {
		
		// 정규식 폼 체크
	
		if (regPw.test(f.uPassword.value) == false) {
			alert("비밀번호 형식이 맞지 않습니다.");
			f.uPassword.focus();
			return;
		}
		if (f.uPassword.value != f.pw_check.value) {
			alert("비밀번호 확인이 안 되었습니다.");
			return;
		}
		
		// 알림
		var select = confirm("비밀번호를 변경하시겠습니까?");
		if(select){
			f.action = "ChangePw";
			f.submit();
		}else{
			alert("비밀번호가 변경되지 않았습니다.");
			return;
		}
	
	}
	
	function check_pw_f() {
		if (regPw.test(uPassword.value) == false) {
			document.getElementById("uPw_span").innerHTML = "비밀번호 형식이 올바르지 않습니다.(6~20 사이 대문자, 소문자, 숫자, 특수문자 조합만 가능합니다.)";
		} else {
			document.getElementById("uPw_span").innerHTML = "비밀번호 형식이 맞습니다.";
		}
	}

</script>
</head>
<body>
	<div>
		<form method="post">
			<div class = "main">
				
				<input type="hidden" name="uId_" id="uId_" value="${uId_ }" />
				
 				<h5>비밀번호</h5>
				<input type="password" class="df" name="uPassword" id="uPassword"
					onkeyup="check_pw_f()" placeholder="비밀번호" />
				<p>
					<span id="uPw_span"></span>
				</p>
				
				<h5>비밀번호 확인</h5>
				<input type="password" class="df" name="pw_check" id="pw_check" placeholder="비밀번호 확인" />
				
				<div class="btn">
					<input type="button" class="submit" value="회원수정" onclick="change_password(this.form)" />
					<input type="reset"  class="submit" value="다시 작성" />
				</div>
			</div>
		</form>
	</div>
</body>
</html>