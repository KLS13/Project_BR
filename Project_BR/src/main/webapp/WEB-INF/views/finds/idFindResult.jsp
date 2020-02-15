<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="resources/js/find.js"></script>
<title>아이디 찾기 확인 결과</title>

<style>
body {
    background-image:url("resources/images/library-488690_1920.jpg");
	background-color:#ff6738;
	font-family: 'Ubuntu', sans-serif;
}

.main {
	background-color:#f26033;
	width: 400px;
	height: 400px;
	margin: 7em auto;
	border-radius: 0.3em;
}
.btn{
	text-align: center;
}

.un {
	width: 76%;
	color: rgb(38, 50, 56);
	font-weight: 700;
	font-size: 14px;
	letter-spacing: 1px;
	background: white;
	padding: 20px;
	border: none;
	border-radius: 0.3em;
	outline: none;
	box-sizing: border-box;
	border: 2px solid rgba(0, 0, 0, 0.02);
	margin-top : 20px;
	margin-left: 46px;
	margin-bottom: 27px;
	text-align: center;
	font-family: 'Ubuntu', sans-serif;
}

.pass {
	width: 76%;
	color: rgb(38, 50, 56);
	font-weight: 700;
	font-size: 14px;
	letter-spacing: 1px;
	background: white;
	padding: 20px;
	border: none;
	border-radius: 0.3em;
	outline: none;
	box-sizing: border-box;
	border: 2px solid rgba(0, 0, 0, 0.02);
	margin-bottom: 50px;
	margin-left: 46px;
	text-align: center;
	margin-bottom: 27px;
	font-family: 'Ubuntu', sans-serif;
}

.un:focus, .pass:focus {
	border: 2px solid rgba(0, 0, 0, 0.18) !important;
}

.submit {
	color: #85827b;
	background: white;
	border: 0;
	border-radius: 0.3em;
	padding: 5px;
	font-family: 'Ubuntu', sans-serif;
	font-size: 13px;
	font-weight: bold;
}

.forgot {
	color: white;
	padding-top: 15px;
}
a {
	text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
	color: white;
	text-decoration: none;
}

@media ( max-width : 600px) {
	.main {
		border-radius: 0px;
	}
}

.text{
font-size: 7px;
color:#85827b;
margin-left: 40px;
}
</style>
</head>
<body>
 <div class="main">
		<form method="post">
			<input type="text" class="un" name="uName" placeholder ="이름" /><br />
			<input type="text" class="un" name="uEmail" placeholder ="이메일" /><br /><br />
		
			<div class="btn">
				<input type="button" class="submit" value="아이디 찾기" onclick="scan_id(this.form)"/>
				<input type="button" class="submit" value="메인 페이지로 이동" onclick="location.href='home'" />
			</div>
		</form>
   <div class = "text">
	<c:if test="${loginDto eq null }">
		<h1>해당되는 계정이 없습니다. 다시 확인하여주시기 바랍니다.</h1>
	</c:if>
	<c:if test="${loginDto ne null }">
		<h1>${loginDto.uName }님의 아이디는 ${loginDto.uId_ }입니다.</h1>
	</c:if>
	</div>
	</div>
</body>
</html>