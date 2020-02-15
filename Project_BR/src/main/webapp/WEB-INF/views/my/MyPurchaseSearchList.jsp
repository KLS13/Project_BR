<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	session.setAttribute("search", "YES");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/head.jsp" %>
<title>Insert title here</title>
<script type="text/javascript">
	function searchPurchase(f){
		f.action = "mySearchPurchase";
		f.submit();
	}
</script>
</head>
<body>
<div id="wrapper">
<%@include file="template/mainHeader.jsp" %>
<%@ include file="template/mainLeftNavPurchase.jsp" %>
	<%@ include file="template/mainBodyTop.jsp" %>
	<div class="col-md-12">
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>교환번호</th>
					<th>유저ID</th>
					<th>물품번호</th>
					<th>교환일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="4">교환 내역이 없습니다</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="pDto" items="${list }">
							<tr>
								<td><a href="myPurchaseDetail?pIdx=${pDto.pIdx }&currentPage=${currentPage}">${pDto.pIdx }</a></td>								
								<td>${pDto.uId_ }</td>
								<td>${pDto.gIdx }</td>
								<td>${pDto.pDate }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot style="text-align:center">
				<tr>
					<td colspan="4">
						<form>
							${pagingView }
							&nbsp;
							<input type="button" value="전체보기" onclick="location.href='myPurchaseList'"/>
							<select name="key">
								<option value="pIdx">교환번호</option>
								<option value="uId_">유저ID</option>
								<option value="gName">물품이름</option>
								<option value="pDate">교환일</option>
							</select>
							<input type="text" name="value" id="value"/>
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