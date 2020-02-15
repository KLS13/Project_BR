<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function pointCheck(f) {
	var gPrice = ${gdto.gPrice};
	var gIdx = ${gdto.gIdx};
	var uPoint = ${sessionScope.loginDto.uPoint};
	
	if(gPrice > uPoint) {
		alert("포인트가 부족합니다.");
		return false;
	}else{
	location.href='goodsPayPage?gIdx='+gIdx;
	}
}
</script>
<style type="text/css">

h4{
color: #969696;
}
.txt{
	font-style: normal;
	font-size: 21px;
}
.txt-info{
	font-style: normal;
	font-size: 21px;
	color : #2677de;
}
.userpoint {
	background-color: #DDDDDD;
	background-size: 200px;
}

.container{
	width: 1200px;
	margin: 0 auto;
	overflow: hidden;
}
.imgUpload{
	width:550px;
	height : 550px;
}
.goodsPic{
	width: 550px;
	height : 550px;
	float : left;
	position: relative;
	margin-right: 35px;
}
.goodsDes{
	width : 610px;
	heifht : 550px;
	float : right;
	position: relative;
}

.gdetail li:nth-child(odd) {
	float : left;
	font-weight:bold;
}

.gdetail ul {
	list-style: none;
}
.gdetail ul{
	width: 1200px;
	margin-left: 20px;
}

.gdetail ul li{
    padding: 10px 0 10px 10px;
    margin-bottom: 5px;
    border-bottom: 1px solid #efefef;
    font-size: 18px;
}
.gdetail{
	width: 1200px;
	margin: 0 auto;
	overflow: hidden;
}

.goodsDes ul li{
	 
	 list-style: none;
}

.goodsDes li:nth-child(1) {
	margin-bottom: -20px;
}
.goodsDes li:nth-child(3) {
	margin-bottom: 70px;
}
.goodsDes li:nth-child(4) {
	margin-bottom: 20px;
}
.goodsDes li:nth-child(5) {
	margin-bottom: 33px;
}
.goodsDes li:nth-child(6) {
	margin-bottom: 33px;
}
.goodsDes li:nth-child(7) {
	margin-bottom: 33px;
}

.buy-btn {
	border: 0px;
	background-color: white;
}
.buy-btn :hover {
	cursor: pointer;
}

.point_icon{
	width : 50px;
}
</style>

</head>
<body>

<br>
<div class="container">
	<div class="goodsPic">
	<img src="${pageContext.request.contextPath}/${gdto.gImage}"
	class="imgUpload" >
	</div>
	
	<div class="goodsDes">
	<ul>
		<li><h1>${gdto.gName}</h1></li>
		<li><h4>
		상품 번호(${gdto.gIdx }) <br />
		상품 재고(${gdto.gQuantity }개)
		</h4></li>
		<li><img src="images/포인트.png" align="left" class="point_icon"/><h1>${gdto.gPrice }point</h1></li>
		
		<li><em class="txt">택배 - </em>
			<em class="txt-info">무료배송</em>
		</li>
		<li><em class="txt">상태 - </em>
			<c:if test="${gdto.gState eq 1}">
			<em class="txt-info">구매가능</em>
			</c:if>
			<c:if test="${gdto.gState ne 1}">
			<em class="txt-info">품절상품</em>
			</c:if>
		</li>
		<li><em class="txt">※ 각 상품별 원산지는 상세설명 참조 </em></li>
		
		<li class="userpoint">
		<em class="txt">구매 후 회원님의 남는 포인트</em><br />
		<c:if test="${gdto.gState eq 1 && sessionScope.loginDto ne null}">
		<em class="txt-info">보유포인트(${sessionScope.loginDto.uPoint}) - ${gdto.gPrice} = ${sessionScope.loginDto.uPoint - gdto.gPrice }</em>
		</c:if>
		</li>
		<li>
		<c:if test="${gdto.gState eq 1 && sessionScope.loginDto ne null}">
		<button type="button" onclick="pointCheck()" class="buy-btn">
		<img src="images/바로구매.png">
		</button>
		</c:if>
		<c:if test="${gdto.gState eq 1 && sessionScope.loginDto eq null}">
		<button type="button" onclick="location.href='login'" class="buy-btn">
		<img src="images/로그인.png">
		</button>
		</c:if>
		<button type="button" onclick="location.href='goodsViewPage'" class="buy-btn">
		<img src="images/더보기.png"/>
		</button> 
		</li>
	</ul>
	</div>
	</div>
	<br />
	<br />
	<br />
	
	<div class="gdetail">
	<ul>
	<c:forTokens items="${gdto.gDetail}" delims="," var="gdes1">
	<c:forTokens items="${gdes1}" delims=":" var="gdes2">
	<li>
	<span>${gdes2} &nbsp;&nbsp;&nbsp;</span>
	</li>
	</c:forTokens>
	</c:forTokens>
	</ul>
	</div>
</body>
</html>