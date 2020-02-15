<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 확인</title>
<link rel="stylesheet" type="text/css" href="resources/css/loginform.css">
<script type="text/javascript">
function checkPw(f){
	var pw = "${loginDto.uPassword}"; 
	
	if(f.uPw.value == ""){
		alert("비밀번호를 입력하세요");
		f.uPw.focus();
		return;
	}
	
	if(pw != f.uPw.value){
		alert("비밀번호가 일치하지 않습니다.");
		f.uPw.focus();
		return; 
	}
	
	
	f.action = "modifyPage";
	f.submit();
	
}

</script>
</head>
<body>
	<div>
		<form method="post">
			<div class="main">
			<br />
				<input type="password" class="pass" name="uPw" placeholder="비밀번호" /><br /><br />
				<inpit type="hidden" name = "pw" value="${loginDto.uPassword }" />
			<br />
				<div class="btn">
					<input type="button" value="확인" class="submit" onclick="checkPw(this.form)">
					<input type="button" value="메인페이지" class="submit" onclick="location.href = 'home'" />
				</div>
			</div>
		</form>
	</div>
</body>
</html>