<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 확인</title>
<%@ include file="template/head.jsp" %>
<script type="text/javascript">
function myCheckPw(f){
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
	
	
	f.action = "myModifyPage";
	f.submit();
	
}

</script>
<style type="text/css">
.Detail-title{
	font-size: 1.3em;
	text-align:center;
	}</style>
</head>
<body>

	<div id="wrapper">
<%@ include file="template/mainHeader.jsp" %>
<%@ include file="template/mainLeftNavPurchase.jsp" %>
	<%@ include file="template/mainBodyTopCheckPw.jsp" %>
	<div class="col-md-12">
		<form method="post">
			<div class="main">
				<table class="information-detail-table">
					<tr>
					<td class="Detail-title">보안을 위해 비밀번호를 한번더 입력해 주세요.</td>
					</tr>
				</table>
					<br />
				<div class="btn-box">
				<input type="password" class="pass" name="uPw" placeholder="비밀번호" /><br /><br />
				<input type="hidden" name = "pw" value="${loginDto.uPassword }" />
				</div>
			<br />
				<div class="btn-box">
					<input type="button" value="확인" class="submit" onclick="myCheckPw(this.form)">
					<input type="button" value="메인페이지" class="submit" onclick="location.href='main'" />
				</div>
			</div>
		</form>
	</div>
			<%@ include file="template/mainBodyBottom.jsp" %>
</div>
<%@ include file="template/mainFooter.jsp" %>
</body>
</html>