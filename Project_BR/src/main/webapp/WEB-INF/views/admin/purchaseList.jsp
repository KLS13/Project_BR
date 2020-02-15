<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/head.jsp" %>
<title>admin-purchase</title>
<script type="text/javascript">
	function searchPurchase(f){
		if(f.key.value == "pIdx" && isNaN(f.value.value)){
			alert("번호를 입력하세요");
			f.value.focus();
			return;
		}
		f.action = "searchPurchase";
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
								<td><a href="purchaseDetail?pIdx=${pDto.pIdx }&currentPage=${currentPage}">${pDto.pIdx }</a></td>
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
							<c:if test="${!empty sessionScope.search}">
								<a href="purchaseList" class="btn btn-xs btn-warning"><span class="glyphicon glyphicon-list"></span> 전체보기</a>
							</c:if>
							&nbsp;&nbsp;
							<select name="key">
								<option value="pIdx">교환번호</option>
								<option value="uId_">유저ID</option>
								<option value="gName">물품이름</option>
								<option value="pDate">교환일</option>
							</select>
							<input type="text" name="value" />
							<button type="button" class="btn btn-xs btn-warning" onclick="searchPurchase(this.form)"><img src="resources/admin/img/icon-search-75.png">검색</button>
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