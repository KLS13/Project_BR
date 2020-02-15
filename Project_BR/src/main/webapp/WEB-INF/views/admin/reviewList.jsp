<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/head.jsp" %>
<title>admin-review</title>
<script type="text/javascript">
	function searchReview(f){
		f.action="searchReview";
		f.submit();
	}
</script>
</head>
<body>
<div id="wrapper">
<%@ include file="template/mainHeader.jsp" %>
<%@ include file="template/mainLeftNavReview.jsp" %>
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
							<td colspan="4">작성된 리뷰가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="rDto" items="${list }">
							<tr>
								<td>${rDto.rIdx }</td>
								<td>${rDto.uId_ }</td>
								<td><a href="reviewDetail?rIdx=${rDto.rIdx }&currentPage=${currentPage}">${rDto.bTitle }</a></td>
								<td>${rDto.bISBN }</td>
								<td>${rDto.rDate }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot style="text-align:center">
				<tr>
					<td colspan="5">
						<form>
							${pagingView}
							<c:if test="${!empty sessionScope.search }">
								<a href="reviewList" class="btn btn-xs btn-warning"><span class="glyphicon glyphicon-list"></span> 전체보기</a>
							</c:if>
							&nbsp;&nbsp;
							<select name="key">
								<option value="UID_">회원ID</option>
								<option value="BTITLE">책제목</option>
								<option value="RCONTENT">리뷰내용</option>
								<option value="RDATE">작성일</option>
							</select>
							<input type="text" name="value"/>
							<button type="button" class="btn btn-xs btn-warning" onclick="searchReview(this.form)"><img src="resources/admin/img/icon-search-75.png">검색</button>
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