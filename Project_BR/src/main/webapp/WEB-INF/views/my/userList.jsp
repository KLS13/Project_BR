<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원목록</title>
</head>
<body>
	<div>
		<h1>회원 명단</h1>
		<table>
			<thead>
				<tr>
					<td>순번</td>	
					<td>이름</td>	
					<td>연락처</td>	
					<td>생년월일</td>	
					<td>이메일</td>	
					<td>주소</td>	
					<td>선호 장르</td>	
					<td>회원등급</td>	
					<td>포인트</td>	
				</tr>
			</thead>
			<tbody>
				<c:if test="${list eq 0 }">
					<td colspan="9">가입되어 있는 회원이 없습니다.</td>			
				</c:if>
				<c:if test="${list ne 0 }">
					<td>${UserDto.uIdx }</td>	
					<td>${UserDto.uName }</td>	
					<td>${UserDto.uTel }</td>	
					<td>${UserDto.uBirthday }</td>	
					<td>${UserDto.uEmail }</td>	
					<td>${UserDto.uGenre }</td>	
					<td>${UserDto.uMemberShip }</td>	
					<td>${UserDto.uPoint }</td>	
				</c:if>
			</tbody>
			<tfoot></tfoot>
		</table>
	</div>
</body>
</html>