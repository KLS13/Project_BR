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
<title>Insert title here</title>
<script type="text/javascript">
	function searchReview(f){
		
		if(f.value.value == ""){
			alert("검색어를 입력하세요");
			f.value.focus();
			return;
		} 
		f.action="mySearchReview";
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
					<td>리뷰번호</td>
					<td>작성자</td>
					<td>책 제목</td>
					<td>ISBN</td>
					<td>작성일</td>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="5">작성된 리뷰가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="rDto" items="${list }">
							<tr>
								<td>${rDto.rIdx }</td>
								<td>${rDto.uId_ }</td>
								<td><a href="myReviewDetail?rIdx=${rDto.rIdx }&currentPage=${currentPage}">${rDto.bTitle }</a></td>
								<td>${rDto.bISBN }</td>
								<td>${rDto.rDate }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5">
						<form>
							${pagingView}
							&nbsp;
							<select name="key">
								<option value="BTITLE">책제목</option>
								<option value="RCONTENT">리뷰내용</option>
								<option value="RDATE">작성일</option>
							</select>
							<input type="text" name="value" id="value"/>
							<input type="button" value="검색" onclick="searchReview(this.form)"/>
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