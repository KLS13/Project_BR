<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/head.jsp" %>
<title>마이페이지</title>
<script type="text/javascript">
</script>
<style type="text/css">
h5 {
	margin: 5px;
}
</style>
</head>
<body>
<div id="wrapper">
<%@ include file="template/mainHeader.jsp" %>
<%@ include file="template/mainLeftNavPurchase.jsp" %>
	<%@ include file="template/mainBodyTop.jsp" %>
	<div class="col-md-12">
		<table class="information-detail-table">
			<tr>
				<td class="attr-title">회원번호</td>
				<td>${uDto.uIdx }</td>
			</tr>
			<tr>
				<td class="attr-title">회원이름</td>
				<td>${uDto.uName }</td>
			</tr>
			<tr>
				<td class="attr-title">유저 ID</td>
				<td>${uDto.uId_ }</td>
			</tr>
			<tr>
				<td class="attr-title">생년월일</td>
				<td>${uDto.uBirthday }</td>
			</tr>
			<tr>
				<td class="attr-title">연락처</td>
				<td>${uDto.uPhone }</td>
			</tr>
			<tr>
				<td class="attr-title">이메일</td>
				<td>${uDto.uEmail }</td>
			</tr>
			<tr>
				<td class="attr-title">주소</td>
				<td>
					${uDto.uAddress }<br />
					${uDto.uAddressDetail}
				</td>
			<tr>
				<td class="attr-title">선호 장르</td>
				<td>${uDto.uGenre}</td>
			</tr>
			<tr>
				<td class="attr-title">회원등급</td>
				<td>${uDto.uMemberShip}</td>
			</tr>
			<tr>
				<td class="attr-title">회원 포인트</td>
				<td>${uDto.uPoint}</td>
			</tr>
			<tr>
				<td class="attr-title">회원 누적 포인트</td>
				<td>${uDto.uTotalPoint}</td>
			</tr>
	</table>
	<%@ include file="template/mainBodyBottom.jsp" %>
		</div>
<%@ include file="template/mainFooter.jsp" %>
	</div>
</body>
</html>