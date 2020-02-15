<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/head.jsp" %>
<title>member information</title>
<script type="text/javascript">
	function changeMemberInfo(f){
		if(isNaN(f.uPoint.value)){
			alert("포인트가 잘못되었습니다.");
			f.uPoint.focus();
			return;
		}
		if(isNaN(f.uTotalPoint.value)){
			alert("누적 포인트가 잘못되었습니다.");
			f.uTotalPoint.focus();
			return;
		}
		f.action="modifyMemberByAdmin";
		f.submit();
	}
	function checkSearch(){
		var isSearch = "${sessionScope.search}";
		if(isSearch =="YES"){
			location.href="searchMember?key=${key}&value=${value}&currentPage=${currentPage}";
		}else{
			location.href="memberList?currentPage=${currentPage}";
		}
	}
</script>
<style type="text/css">
.information-detail-table tr{
	border-top:1px solid lightgray;
	border-bottom:1px solid lightgray;
	margin:0;
}
.information-detail-table tr td input[type=text]{
	border-radius:5px;
	border:1px solid lightgray;
	height: 20px;
}
.information-detail-table tr td{
	padding:10px 5px 10px 5px;
}
.attr-title{
	font-size: 0.8em;
	text-align:center;
	width:30%;
}
.information-detail-table{
	margin:auto;
	width:80%;
	font-size:1.2em;
}
div.btn-box{
	width:200px;
	margin:auto;
}
</style>
</head>
<body>
	<div  id="wrapper"> 
	<%@include file="template/mainHeader.jsp" %>
	<%@ include file="template/mainLeftNavMember.jsp" %>
	<%@ include file="template/mainBodyTop.jsp" %>
	<div class="col-md-12">
		<form method="post">
			<table class="information-detail-table">
				<tr>
					<td class="attr-title">회원 번호</td>
					<td>${uDto.uIdx }</td>
				</tr>
				<tr>
					<td class="attr-title">회원 이름</td>
					<td>${uDto.uName }</td>
				</tr>
				<tr>
					<td class="attr-title">회원 ID</td>
					<td>${uDto.uId_ }<input type="hidden" name="uId_" value="${uDto.uId_ }"/></td>
				</tr>
				<tr>
					<td class="attr-title">회원 연락처</td>
					<td>${uDto.uPhone }</td>
				</tr>
				<tr>
					<td class="attr-title">회원 이메일</td>
					<td>${uDto.uEmail }</td>
				</tr>
				<tr>
					<td class="attr-title">회원 주소</td>
					<td>${uDto.uAddress }<Br/>${uDto.uAddressDetail }</td>
				</tr>
				<tr>
					<td class="attr-title">회원 생일</td>
					<td>${uDto.uBirthday }</td>
				</tr>
				<tr>
					<td class="attr-title">선호장르</td>
					<td>${uDto.uGenre }</td>
				</tr>
				<tr>
					<td class="attr-title">회원 등급</td>
					<td>
						<select name="uMemberShip">
							<option value="normal" <c:if test="${uDto.uMemberShip eq 'normal' }">selected</c:if>>normal</option>
							<option value="expert" <c:if test="${uDto.uMemberShip eq 'expert' }">selected</c:if>>expert</option>
							<option value="master" <c:if test="${uDto.uMemberShip eq 'master' }">selected</c:if>>master</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="attr-title">회원 포인트</td>
					<td><input type="text" name="uPoint" value="${uDto.uPoint }"/></td>
				</tr>
				<tr>
					<td class="attr-title">회원 누적 포인트</td>
					<td><input type="text" name="uTotalPoint" value="${uDto.uTotalPoint }"/></td>
				</tr>
			</table>
			<br/>
			<div class="btn-box">
				<a href='javascript:void(0);' onclick="checkSearch();" class="btn btn-primary btn-warning"><span class="glyphicon glyphicon-list"></span> 목록</a>
				<button type="button" class="btn btn-primary btn-warning" onclick="changeMemberInfo(this.form)"><img src="resources/admin/img/icon-check-75.png"> 반영</button>
			</div>
			<br/>
			<hr/>
		</form>
	</div>
	<%@ include file="template/mainBodyBottom.jsp" %>
	</div>
	<%@ include file="template/mainFooter.jsp" %>
</body>
</html>