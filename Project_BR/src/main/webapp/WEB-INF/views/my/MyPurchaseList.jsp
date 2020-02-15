<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	session.removeAttribute("search");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/head.jsp" %>
<title>교환물품</title>
<script type="text/javascript">
	function searchPurchase(f){
		if(f.value.value == ""){
			alert("검색어를 입력하세요");
			f.value.focus();
			return;
		}
		f.action = "mySearchPurchase";
		f.submit();
	}
</script>
</head>
<body>
<div id="wrapper">
<%@ include file="template/mainHeader.jsp" %>
<%@ include file="template/mainLeftNavPurchase.jsp" %>
	<%@ include file="template/mainBodyTop.jsp" %>
	<div class="col-md-12">
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>교환번호</th>
					<th>물품번호</th>
					<th>물품 수량</th>
					<th>교환 날짜</th>
					<th>수령인</th>
					<th>연락처</th>
					<th>주소</th>
					<th>상세주소</th>
					<th>배송시 요구사항</th>
					<th>운송장 번호</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="10" style="text-align:center">교환 내역이 없습니다</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="pDto" items="${list }">
							<tr>
								<td><a href="myPurchasDetail?pIdx=${pDto.pIdx }&currentPage=${currentPage}">${pDto.pIdx }</a></td>
								<td>${pDto.gIdx }</td>
								<td>${pDto.pQuantity }</td>
								<td>${pDto.pDate }</td>
								<td>${pDto.pReceiver}</td>
								<td>${pDto.pPhone }</td>
								<td>${pDto.pAddress }</td>
								<td>${pDto.pAddressDetail }</td>
								<td>${pDto.pMessage }</td>
								<td>${pDto.pInvoiceNo }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot style="text-align:center">
				<tr>
					<td colspan="10">
						<form>
							${pagingView }
							&nbsp;
							<select name="key">
								<option value="pIdx">교환번호</option>
								<option value="gName">물품이름</option>
								<option value="pDate">교환일</option>
							</select>
							<input type="text" name="value" />
							<input type="button" value="검색" onclick="searchPurchase(this.form)"/>
						</form>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<%@ include file="template/mainBodyBottom.jsp" %>
</div>
<%@ include file="template/mainFooter.jsp" %>
</body>
</html>