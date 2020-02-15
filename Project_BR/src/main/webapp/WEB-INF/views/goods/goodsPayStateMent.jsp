<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	alert("주문이 완료되었습니다.");
});
</script>
<style type="text/css">

table {
	border-collapse: collapse;
	margin-bottom: 100px;
	border-color: #969696;
}
tr td {
	padding: 10px;
	}
	
tr :nth-child(1) {
	font-weight: bold;
}
.imgUpload {
	width: 250px;
	height: 250px;
	margin-right: 25px;
}

.goodsTable {
	width:900px;
}
.goodsInfo {
	width:1200px;
	margin-top : 250px;
	overflow: hidden;
}
.pay-btn {
	border: 0px;
	background-color: white;
}
.pay-btn :hover{
	cursor: pointer;
}
.cancel-btn {
	border: 0px;
	background-color: white;
}
.cancel-btn :hover{
	cursor: pointer;
}
.icon_care{
	width:22px;
	height:22px;
}

.container{
	width: 1200px;
	margin: 0 auto;
	overflow: hidden;
}

.myPage{
	cursor: pointer;
}

.buy-btn{
	background : white;
	border : 0px;
}

</style>
</head>
<body>
<div class="container">
<div class="goodsInfo">
<h2>상품 주문 내역</h2>
<h5></h5>
			<img src="${pageContext.request.contextPath}/${gdto.gImage}"
			align="left" class="imgUpload" >
			
	<table border = "2" class="goodsTable">
	<tr>
		<td>상품 번호</td>
		<td>${gdto.gIdx }</td>
	</tr>
	<tr>
		<td>상품 이름</td>
		<td>${gdto.gName }
		</td>
	</tr>
	<tr>
		<td>차감된 포인트</td>
		<td>${gdto.gPrice }point</td>
	</tr>
	<tr>
		<td>남은 포인트</td>
		<td>${sessionScope.loginDto.uPoint}</td>
	</tr>
	<tr>
		<td>수령인</td>
		<td>${pdto.pReceiver}</td>
	</tr>
	<tr>
		<td>수령인</td>
		<td>${pdto.pPhone}</td>
	</tr>
	<tr>
		<td>배송지</td>
		<td>${pdto.pAddress } ${pdto.pAddressDetail }</td>
	</tr>
	<tr>
		<td>상세보기</td>
		<td><a onclick="location.href='myPage'" class="myPage">주문상세보기</a> </td>
	</tr>
	<tr>
		<td colspan="2">
		<button type="button" onclick="location.href='goodsViewPage'" class="buy-btn">
		<img src="images/더보기.png"/>
		</button> 
		</td>
	</tr>
</table>
</div>
</div>
</body>
</html>