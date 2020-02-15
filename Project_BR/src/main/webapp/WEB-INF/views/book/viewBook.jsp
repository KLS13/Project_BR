<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix = "c" %>    
<!DOCTYPE html>
<html>
<head>
<title>${param.title}</title>
<style>
  
    .btn1 {
      border: none;
      position : absolute;
      background-color: #ec523f;
      padding: 2px 4px;
      top: 300px;
      left: 800px;
      font-size: 12px;
      width:100px;
      height: 35px;
    }
     .btn2 {
       border: none;
      position : absolute;
      background-color: #ec523f;
      padding: 2px 4px;
      top: 350px;
      left: 800px;
      font-size: 12px;
      width:100px;
      height: 35px;
    }
   img{
    margin-top: 150px;
    width: 150px;
	}
	.viewList {
	margin-top: 150px;
    margin-left: 400px;
}
 .reviewTable {
    margin-left: 400px;
    margin-bottom: 30px;
    }
  tfoot{
  margin-left: 400px;
  }
</style>
<script>
function reviewWritePage(f){
	f.action = "writeReviewPage";
	f.submit();
}

function fn_reviewDelete(f) {
	var deleteConfirm = window.confirm("정말 리뷰를 삭제하시겠습니까?")? "삭제하기 ": "취소";
    if(deleteConfirm == "취소"){
    	return false;
    }
	f.action="reviewDelete";
	f.submit();
}
function fn_reviewModifyPage(f){
	f.action="reviewModifyPage";
	f.submit();
}
</script>
 <%@include file="header/tophead.jsp" %>
   
</head>
<body>
<%@include file="header/header.jsp" %>
<%@include file="header/mainheader.jsp" %>
  

 <ul class = "viewList">
    <li id = "img" ></li>
    <li id = "title"></li>
    <li id = "author"></li>
    <li id = "price" ></li>
    <li id = "publisher"></li>
    <li id = "status"></li>
    <li id = "datetime"></li>
    <li id = "isbn"></li>
    </ul>
    <br>
   
     <c:choose>
     	<c:when test="${empty list}">
     	<table class  = "reviewTable">
     	 <tr>
     	  <td >리뷰가 없습니다.</td>
     	 </tr>
     	 </c:when>
     	 <c:otherwise>
            <c:forEach var = "rDto" items="${list}">
     	 	<table class = "reviewTable">
     	 	<tr>
     	 	<td><strong>작성자</strong> </td>
     	 	<td>${rDto.uId_}</td>
     	 	<c:if test ="${rDto.uId_ eq loginDto.uId_ }">
     	 	<td>
     	 	<form>
     	 	 <input type = "hidden" name = "bTitle" value = "${param.bTitle}"/>
             <input type = "hidden" name = "bISBN" value = "${param.bISBN }"/>
             <input type = "hidden" name = "bWriter" value = "${param.bWriter}"/>
             <input type = "hidden" name = "bPublisher" value = "${param.bPublisher}"/>
             <input type = "hidden" name = "bPubdate" value = "${param.bPubdate}"/>
             <input type = "hidden" name = "bImage" value = "${param.bImage}"/>
             
             <input type = "hidden" name = "bWriter" value = "${bWriter}"/>
             <input type = "hidden" name = "bPublisher" value = "${bPublisher}"/>
             <input type = "hidden" name = "bPubdate" value = "${bPubdate}"/>
             <input type = "hidden" name = "bImage" value = "${bImage}"/>
             
     	 	 <input type = "hidden" name = "uId_" value = "${loginDto.uId_}"/>
     	 	 <input type = "hidden" name = "rContent" value = "${rDto.rContent}"/>
     	 	 <input type = "hidden" name = "rIdx" value = "${rDto.rIdx}"/>
     	 	 <input type ="button" name= "reviewDelete" value= "내 리뷰 삭제하기" onclick= "fn_reviewDelete(this.form)" />
     	 	 <input type ="button" name= "reviewModify" value= "리뷰 다시 작성하기" onclick = "fn_reviewModifyPage(this.form)"/>
     	 	</form>
     	 	</td>
     	 	</c:if>
     	 	</tr>
     	 	<td><strong>작성일</strong></td>
     	 	<td>${rDto.rDate}</td>
     	 	</tr>
     	 	<tr>
     	 	<td><strong>내용</strong></td><td>${rDto.rContent}</td>
     	 	</tr>
     	 	<tr>
     	 	<td><strong>평점</strong></td>
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
     	</c:otherwise>
     </c:choose>
     	 	<tfoot>
		    <tr>
			<td colspan="4">${pagingView }</td>
		    </tr>
	        </tfoot>
     	 	</table>
   
     <br/><br/>
    <form>
    <c:if test="${loginDto ne null}">
    <c:choose>
    <c:when test="${reviewRecord eq 1}">
    
    </c:when>
    <c:otherwise>
    <input type = "button" class = "btn1" value = "이 책 리뷰하러가기" onclick = "reviewWritePage(this.form)"/><br>
    </c:otherwise>
    </c:choose>
    </c:if>
    <c:if test="${loginDto eq null}">
    <input type = "button" class = "btn1" value = "로그인 후 리뷰 작성" onclick = "location.href='loginPage'"/>
    </c:if>
    <input type = "button" class = "btn2" value = "검색페이지로" onclick = "location.href='searchPage'"/>
    <input type = "hidden" name = "bTitle" value = "${param.bTitle}"/>
    <input type = "hidden" name = "bISBN" value = "${param.bISBN }"/>
    <input type = "hidden" name = "bWriter" value = "${param.bWriter}"/>
    <input type = "hidden" name = "bPublisher" value = "${param.bPublisher}"/>
    <input type = "hidden" name = "bPubdate" value = "${param.bPubdate}"/>
    <input type = "hidden" name = "bImage" value = "${param.bImage}"/>
    
    </form>

  <script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
   </script>

    <script>
        $(function () {
        	
        	console.log( $("input[name=bISBN]").val());
                $.ajax({
                    method: "GET",
                    url: "https://dapi.kakao.com/v3/search/book", // 전송 주소
                    data: {query: $("input[name=bISBN]").val()}, 
                    headers: { Authorization: "KakaoAK 6b9a374380958fdd321ffdf370b9e7d9" }
                })
                    .done(function (msg) {  
                        var date = msg.documents[0].datetime.substring(0,10);
                        $("#img").html("<img src='" + msg.documents[0].thumbnail + "'><br />");
                        $("#title").html("<strong>제목:" + msg.documents[0].title + "</strong><br />");
                        $("#author").html("<strong>저자:" + msg.documents[0].authors + "</strong><br />");
                        $("#price").html("<strong>가격:" + msg.documents[0].price + "</strong><br />");
                        $("#publisher").html("<strong>출판사:" + msg.documents[0].publisher + "</strong><br />");
                        $("#status").html("<strong>상태:" + msg.documents[0].status + "</strong><br />");
                        $("#datetime").html("<strong>출판일:" + date + "</strong><br />");
                        $("#isbn").html("<strong>도서고유번호:" +msg.documents[0].isbn + "</strong><br />");
                      
                  });
                 });
        
    
        
    </script>

</body>
</html>