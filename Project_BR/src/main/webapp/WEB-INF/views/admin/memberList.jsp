<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/head.jsp" %>
<title>admin-member</title>
<script type="text/javascript">
	function searchMember(f){
		f.action="searchMember";
		f.submit();
	}
</script>
</head>
<body>
	<div  id="wrapper"> 
	<%@include file="template/mainHeader.jsp" %>
	<%@ include file="template/mainLeftNavMember.jsp" %>
	<%@ include file="template/mainBodyTop.jsp" %>
	<div class="col-md-12">
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<td>회원번호</td>
					<td>회원명</td>
					<td>ID</td>
					<td>등급</td>
					<td>회원상태</td>
					<td>활동중지</td>
				</tr>
			</thead>
			<tbody>
				<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="6">회원이 없습니다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="uDto" items="${list }">
						<tr>
							<td>${uDto.uIdx }</td>
							<td>${uDto.uName }</td>
							<td><a href="memberDetail?uId_=${uDto.uId_ }&currentPage=${currentPage}">${uDto.uId_ }</a></td>
							<td>${uDto.uMemberShip }</td>
							<td>
								<c:choose>
									<c:when test="${uDto.uState eq 1}">
									활동중
									</c:when>
									<c:when test="${uDto.uState eq 0}">
									회원탈퇴(대기중)
									</c:when>
									<c:when test="${uDto.uState eq -1}">
									강제활동정지(대기중)
									</c:when>
									<c:otherwise>
									error
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${uDto.uState eq 1}">
										<a href="modifyMemberState?uId_=${uDto.uId_ }&currentPage=${currentPage}&state=Stop" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-minus-sign"></span> </a>
									</c:when>
									<c:when test="${uDto.uState eq 0}">
										<a href="modifyMemberState?uId_=${uDto.uId_ }&currentPage=${currentPage}&state=Remove" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-remove-sign"></span> </a>
									</c:when>
									<c:when test="${uDto.uState eq -1}">
										<a href="modifyMemberState?uId_=${uDto.uId_ }&currentPage=${currentPage}&state=Release" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-ok-sign"></span> </a>
									</c:when>
									<c:otherwise>
									error
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>						
				</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot style="text-align:center">
				<tr>
					<td colspan="6">
					<form>
					${pagingView}
					<c:if test="${!empty sessionScope.search}">
						<a href="memberList" class="btn btn-xs btn-warning"><span class="glyphicon glyphicon-list"></span> 전체보기</a>
					</c:if>
					&nbsp;&nbsp;
					<span>
						<select name="key">
							<option value="UNAME">회원명</option>
							<option value="UID_">회원ID</option>
							<option value="USTATE">회원상태</option>
 							<option value="UMEMBERSHIP">회원등급</option>
						</select>&nbsp;
						<input type="text" name="value"/>
 						<button type="button" class="btn btn-xs btn-warning" onclick="searchMember(this.form)"><img src="resources/admin/img/icon-search-75.png">검색</button>
					</span>
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