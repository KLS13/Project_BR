<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Write something else you want</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script type="text/javascript">
function idcheck(qnaId,qIdx) {
	var loginId = '${sessionScope.loginDto.uId_}';
	var qnaId = qnaId;
	var qIdx = qIdx;
	
	if(loginId == 'admin' || loginId == qnaId){
		
		location.href="qnaViewPage?qIdx="+qIdx;
	}else if(loginId != qnaId){
		alert("자신의 문의내용만 볼 수 있습니다.");
		return false;
	}
}
</script>
<style type="text/css">
.qnaList{
	width: 1000px;
	margin: 0 auto;
	overflow: hidden;
	margin-top: 200px;
}
	.qnaListTable{
		border-collapse: collapse;
		width : 1000px;
		border : 1px solid black !important;
		
	}
	.qnatd{
		padding: 11px;
		padding-right: 20px;
		border : 1px solid black !important;
	}
	.qnatr{
		padding: 11px;
		padding-right: 20px;
		border : 1px solid black !important;
	}
	
	tr :nth-child(1) {
		
		text-align: center;
	}
	tr :nth-child(2) {
		width : 630px;
	}
	tr :nth-child(3) {
		width : 120px;
		text-align: center;
	}
	tr :nth-child(4) {
		width : 120px;
		text-align: center;
	}
	tr :nth-child(5) {
		width:100px;
		text-align: center;
	}
	
	a:link {
		text-decoration: none;	
		color : black;
	}
	a:hover {
		cursor: pointer;
	}
	
	.pull-right{
		background: white;
		border: 0px;
	}
</style>
<%@include file="../book/header/tophead.jsp" %>
</head>
<body>
<%@include file="../book/header/header.jsp" %>
<%@include file="../book/header/mainheader.jsp" %>
<form id="f">
<div class="qnaList">
<c:if test="${sessionScope.loginDto ne null }">
<a onclick="location.href='qnaMyList?uId_=${sessionScope.loginDto.uId_}'">내 문의글만 확인하기</a> &nbsp;
<a onclick="location.href='qnaListPage'">목록</a>
</c:if>
		<table border="1" class="qnaListTable">
			<thead>
				<tr class="qnatr">
					<th>번호</th>
					<th style="text-align:center">제목</th>
					<th>작성자</th>
					<th>최종작성일</th>
					<th>비 고</th>
			</thead>
			<tbody>
				<c:if test="${result eq 0 }">
					<tr class="qnatr">
						<td colspan="5" class="qnatd"> 게시물이 없습니다. </td>
					</tr>
				</c:if>
				<c:if test="${result ne 0 }">
				<c:forEach var="qDto" items="${list}">
					<tr class="qnatr">
						<td class="qnatd">${qDto.qIdx }</td>
						<td class="qnatd">
						<c:if test="${qDto.qCategory eq 1 }">
						<a href="qnaViewPage?qIdx=${qDto.qIdx}"><font style="font-weight: bold">${qDto.qTitle }</font></a>
						</c:if>
						<c:if test="${qDto.qCategory ne 1 }">
						<a onclick="idcheck('${qDto.uId_}','${qDto.qIdx}')">${qDto.qTitle}</a>
						</c:if>
						</td>
						<td class="qnatd">${qDto.uId_}</td>
						<td class="qnatd">${qDto.qDate}</td>
						<td class="qnatd">
						<c:if test="${qDto.qCategory ne 1 && qDto.qCheck eq 0 }">
						<font style="color: #969696">답변없음</font>
						</c:if>
						<c:if test="${qDto.qCheck eq 1 }">
						답변완료
						</c:if>
						<c:if test="${qDto.qCategory eq 1 && qDto.qCheck eq 0}">
						<font style="font-weight: bold">공지사항</font>
						</c:if>
						</td>
					</tr>
					
				</c:forEach>
			
				</c:if>	
				<tr class="qnatr">
					<td colspan="5" class="qnatd">${pagingView}</td>
				</tr>	
			</tbody>
			<tfoot>
			<c:if test="${sessionScope.loginDto ne null }">
				<tr class="qnatr">
				
					<td colspan="5" class="qnatd">
						<button type="button" onclick="location.href='qnaWritePage'" class="pull-right">
						<img src="images/문의등록.png"/>
						</button>
					</td>
				</tr>
			</c:if>
			</tfoot>
		</table>
	</div>
</form>
</body>
</html>