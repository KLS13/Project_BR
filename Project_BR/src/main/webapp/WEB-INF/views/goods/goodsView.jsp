<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<style type="text/css">

* {
	box-sizing: border-box;
	color: black;
	text-decoration: none;
}
.container-wrap{
	width:1200px;
	margin: 0 auto;
}

.container-info {
	float: left;
	width: 290px;
	padding: 15px;
	position : relative;
	border: 3px solid #bad8e9;
	margin : 0px 6px 10px 4px;
	font-family: 'Jua', sans-serif;
}

.container-info:hover{
	font-weight: bold;
	box-shadow: 2px 2px 20px #dddddd;
	cursor: pointer;
}

.container-info ul{
	list-style: none;
	padding-left:5px; 
	padding : 20px;
}

.container-info li{
	text-align: center;
}

.containerlist {
	width: 1300px;
	margin: 0 auto;
	overflow: hidden;
	margin-top : 200px;
}

.imgUpload {
	float: left;
	width: 100%;
	height: 230px;
	margin-bottom: 25px;
}

.gQuantity {
	color: #969696;
	font-size: 0.88rem;
}

</style>
<%@include file="../book/header/tophead.jsp" %>
</head>
<body>
<%@include file="../book/header/header.jsp" %>
<%@include file="../book/header/mainheader.jsp" %>
	<div class="containerlist">
		<c:if test="${empty list}">
			상품이 존재하지 않습니다.
		</c:if>

<div class="container-wrap" >
		<c:if test="${not empty list}">
			<c:forEach var="gdto" items="${list}">
				<c:if test="${gdto.gState ne 0}">
					<div class="container-info" onclick="location.href='goodsBuyPage?gIdx=${gdto.gIdx}'">
						<img src="${pageContext.request.contextPath}/${gdto.gImage}"
							class="imgUpload">
						<ul>
							<li><h3>${gdto.gName }</h3></li>
							<li>${gdto.gPrice }point</li>
							<li><span class="gQuantity">${gdto.gQuantity }개 남음</span></li>
						</ul>
					</div>
				</c:if>
			</c:forEach>
		</c:if>
		</div>
	</div>

</body>
</html>