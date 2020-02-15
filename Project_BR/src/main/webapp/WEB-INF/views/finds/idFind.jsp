<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/loginform.css">
<script type="text/javascript" src="resources/js/find.js"></script>
<style>
body{
  background-image:url("resources/images/library-488690_1920.jpg");
 }
</style>
<title>계정 찾기</title>
</head>
<body>
	<div class="main">
		<form method="post">
			<input type="text" class="un" name="uName" placeholder ="이름" /><br />
			<input type="text" class="un" name="uEmail" placeholder ="이메일" /><br /><br />
		
			<div class="btn">
				<input type="button" class="submit" value="아이디 찾기" onclick="scan_id(this.form)"/>
				<input type="button" class="submit" value="로그인페이지로 이동" onclick="location.href='loginPage'" />
				<input type="button" class="submit" value="메인 페이지로 이동" onclick="location.href='home'" />
			</div>
		</form>
	</div>
</body>
</html>