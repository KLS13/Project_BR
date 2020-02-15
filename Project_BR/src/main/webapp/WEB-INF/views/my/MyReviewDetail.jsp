<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/head.jsp" %>
<title>Insert title here</title>

<script type="text/javascript">
	function removeReview(){
		if(!confirm("정말로 삭제하시겠습니까?")){
			return false;
		}else{
			return true;
		}
	}
	function checkSearch(){
		var isSearch = "${sessionScope.search}";
		if(isSearch =="YES"){
			location.href="mySearchReview?key=${key}&value=${value}&currentPage=${currentPage}";
		}else{
			location.href="myReviewList?currentPage=${currentPage}";
		}
	}
</script>
</head>
<body>
	<div id="wrapper">
<%@ include file="template/mainHeader.jsp" %>
<%@ include file="template/mainLeftNavPurchase.jsp" %>
	<%@ include file="template/mainBodyTop.jsp" %>
		<form action="myRemoveReview" onsubmit="return removeReview()" method="post">
			<table class="information-detail-table">
				<tr>
					<td class="attr-title">리뷰번호</td>
					<td>${rDto.rIdx }<input type="hidden" name="rIdx" value="${rDto.rIdx }"/></td>
				</tr>
				<tr>
					<td class="attr-title">작성자</td>
					<td>${rDto.uId_ }<input type="hidden" name="uId_" value="${rDto.uId_ }"></td>
				</tr>
				<tr>
					<td class="attr-title">ISBN</td>
					<td>${rDto.bISBN }</td>
				</tr>
				<tr>
					<td class="attr-title">책제목</td>
					<td>${bDto.bTitle }</td>
				</tr>
				<tr>
					<td class="attr-title">저자</td>
					<td>${bDto.bWriter }</td>
				</tr>
				<tr>
					<td class="attr-title">출판사</td>
					<td>${bDto.bPublisher }</td>
				</tr>
				<tr>
					<td class="attr-title">내용</td>
					<td>${rDto.rContent }</td>
				</tr>
				<tr>
					<td class="attr-title">리뷰 평점</td>
					<td>${rDto.rGrade }</td>
				</tr>
				<tr>
					<td class="attr-title">작성일</td>
					<td>${rDto.rDate }</td>
				</tr>
			</table>
			<br />
			<div class="btn-box">
			<input type="button" value="목록으로 이동" onclick="checkSearch()"/> <input type="submit" value="리뷰 삭제"/>
			</div>
		</form>
			<%@ include file="template/mainBodyBottom.jsp" %>
	</div>
	<%@ include file="template/mainFooter.jsp" %>
</body>
</html>