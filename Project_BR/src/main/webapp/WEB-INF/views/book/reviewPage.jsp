<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="header/tophead.jsp" %>
<title>리뷰게시판</title>
<style>
 .searchBox{
  margin-top: 150px;
    margin-left: 90px;
 }
 .reviewMsg{
    margin-top: 10px;
    margin-left: 90px;
  }
 .reviewTable{
   margin-left:80px;
   top: 200px;
 }
td{
 padding:10px;
 width: 200px;
 height: 50px;
}
 #adImg1{
     position: fixed;
     top: 290px;
     left:1150px;
  } 

</style>
 <script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
 </script>
</head>
<body>
<%@include file="header/header.jsp" %>
<%@include file="header/mainheader.jsp" %>

     <img id = "adImg1" src="resources/images/ad.png" width = "70px;"/>
    <c:choose>
        <c:when test="${empty list}">
     		<table class  = "reviewMsg">
     		 <tr>
     	 	 <td >아직 작성된 리뷰가 없습니다.</td>
     		 </tr>
     		 </table>
     	</c:when>
     	<c:otherwise>
     	<div class = "searchBox">
		<form action = "dynamicQuery" method = "get">
		검색 
		<select name = "query">
		<option value = "uId_">작성자 </option><!-- 옵션값을db컬럼명과 맞춰서 작업한다.mybatis대비 대문자로 -->
		<option value = "bTitle">도서제목 </option>
		<option value = "rGrade">평점 </option>
		</select>
		<input type = "text" name = "content"/>
		<input type = "submit" value = "검색"/>
		</form>
	    </div>
	    <br/><br/>  
     		<table class = "reviewMsg">
     		<thead>
     		<tr>
     	 	<td>
     	 	${result}개의 리뷰가 있습니다.
     		</td>
     	    </tr>
     		<tr>
     	 	<td><strong>도서제목</strong></td>
     	 	<td><strong>작성자</strong></td>
     	 	<td><strong>작성일</strong></td>
     	 	<td><strong>내용</strong></td>
     	 	<td><strong>평점</strong></td>
     	 	</tr>
     	 	<thead>
     	 	</table>
     		<br/>	 
     	   <c:forEach var = "rDto" items="${list}" varStatus = "status" >
     	    <table class = "reviewTable">
     	 	<tr>
     	 	<td><a href = 'searchViewBook?bTitle=${rDto.bTitle}&bISBN=${rDto.bISBN}'>${rDto.bTitle}</a></td>
     	 	<td>${rDto.uId_}</td>
     	 	<td>${rDto.rDate}</td>
     	 	<td>${rDto.rContent}</td>
     	 	<td>
     	 	<c:if test="${rDto.rGrade eq 1}">
     	 	★☆☆☆☆
     	 	</c:if>
     	 	<c:if test="${rDto.rGrade eq 2}">
     	 	★★☆☆☆
     	 	</c:if>
     	 	<c:if test="${rDto.rGrade eq 3}">
     	 	★★★☆☆
     	 	</c:if>
     	 	<c:if test="${rDto.rGrade eq 4}">
     	 	★★★★☆
     	 	</c:if>
     	 	<c:if test="${rDto.rGrade eq 5}">
     	 	★★★★★
     	 	</c:if>
     	 	<c:if test="${rDto.rGrade eq 0}">
     	 	☆☆☆☆☆
     	 	</c:if>
     	    </td>
     	 	</tr>
     	 </c:forEach>
     	  	<tfoot>
		    <tr>
			<td colspan="4">${pagingView }</td>
		    </tr>
	        </tfoot>
     	 	</table>
     </c:otherwise>
   </c:choose>
 
</body>
</html>