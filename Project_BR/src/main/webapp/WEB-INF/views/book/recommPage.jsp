<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<!DOCTYPE html>
<html>
<head>
     <%@include file="header/tophead.jsp" %>
<title>리뷰어 추천책</title>

<style>
 .reviewMsg{
    margin-top: 100px;
    margin-left: 90px;
  }
 .reviewTable{
   margin-left:80px;
   top: 200px;
 }

.bookList{
   margin-top : 200px;
   margin-left : 180px;
   width: 200px;
   float: left;
   font-size:20px;
 } 
}



</style>
 <script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
 </script>
</head>
<body>
<%@include file="header/header.jsp" %>
<%@include file="header/mainheader.jsp" %>

    <c:choose>
        <c:when test="${empty list}">
     		<table class  = "reviewMsg">
     		 <tr>
     	 	 <td >추천 책이 없습니다.</td>
     		 </tr>
     		 </table>
     	</c:when>
     	<c:otherwise>
           <div class = "books">
           <input type = "hidden" name = "bISBN1" value = "${list[0]}"/>
           <table class = "bookList">
           <tr>${list[0]}</tr>
           <tr id = "img1"></tr>
           <tr id = "title1"> </tr>
           <tr id= "author1"> </tr>
           </table>
          
           <input type = "hidden" name = "bISBN2" value = "${list[1]}"/>
           <table class = "bookList">
           <tr>${list[1]}</tr>
           <tr id = "img2"> </tr>
           <tr id = "title2"> </tr>
           <tr id= "author2"> </tr>
           </table>
          
           <input type = "hidden" name = "bISBN3" value = "${list[2]}"/>
            <table class = "bookList">
           <tr>${list[2]}</tr>
           <tr id = "img3"> </tr>
           <tr id = "title3"> </tr>
           <tr id= "author3"> </tr>
           </table>
         </div>
     </c:otherwise>
   </c:choose>
   
    <script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
   </script>

    <script>
        $(function () {
                $.ajax({
                    method: "GET",
                    url: "https://dapi.kakao.com/v3/search/book", // 전송 주소
                    data: {query: $("input[name=bISBN1]").val()}, 
                    headers: { Authorization: "KakaoAK 6b9a374380958fdd321ffdf370b9e7d9" }
                })
                    .done(function (msg) {  
                    	var isbn0 = msg.documents[0].isbn.substring(11,25);
                    	var title0 = msg.documents[0].title;
                    	var writer0 = msg.documents[0].authors;
                    	var publisher0 = msg.documents[0].publisher;
                    	var pubdate0 = msg.documents[0].datetime.substring(0,10);
                    	var img0 = msg.documents[0].thumbnail;
           
                    	$("#img1").html("1위 <a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><img src='" + msg.documents[0].thumbnail + "'></a><br />");
                        $("#title1").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><strong>제목:" + msg.documents[0].title + "</strong></a><br />");
                        $("#author1").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><strong>저자:" + msg.documents[0].authors + "</strong></a><br />");
                      
                  });
                
                $.ajax({
                    method: "GET",
                    url: "https://dapi.kakao.com/v3/search/book", // 전송 주소
                    data: {query: $("input[name=bISBN2]").val()}, 
                    headers: { Authorization: "KakaoAK 6b9a374380958fdd321ffdf370b9e7d9" }
                })
                    .done(function (msg) {  
                    	var isbn0 = msg.documents[0].isbn.substring(11,25);
                    	var title0 = msg.documents[0].title;
                    	var writer0 = msg.documents[0].authors;
                    	var publisher0 = msg.documents[0].publisher;
                    	var pubdate0 = msg.documents[0].datetime.substring(0,10);
                    	var img0 = msg.documents[0].thumbnail;
           
                    	$("#img2").html("2위 <a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><img src='" + msg.documents[0].thumbnail + "'></a><br />");
                        $("#title2").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><strong>제목:" + msg.documents[0].title + "</strong></a><br />");
                        $("#author2").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><strong>저자:" + msg.documents[0].authors + "</strong></a><br />");
                      
                       
                  });  
                
                $.ajax({
                    method: "GET",
                    url: "https://dapi.kakao.com/v3/search/book", // 전송 주소
                    data: {query: $("input[name=bISBN3]").val()}, 
                    headers: { Authorization: "KakaoAK 6b9a374380958fdd321ffdf370b9e7d9" }
                })
                    .done(function (msg) {  
                    	var isbn0 = msg.documents[0].isbn.substring(11,25);
                    	var title0 = msg.documents[0].title;
                    	var writer0 = msg.documents[0].authors;
                    	var publisher0 = msg.documents[0].publisher;
                    	var pubdate0 = msg.documents[0].datetime.substring(0,10);
                    	var img0 = msg.documents[0].thumbnail;
           
                    	$("#img3").html("3위 <a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><img src='" + msg.documents[0].thumbnail + "'></a><br />");
                        $("#title3").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><strong>제목:" + msg.documents[0].title + "</strong></a><br />");
                        $("#author3").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><strong>저자:" + msg.documents[0].authors + "</strong></a><br />");
                  });    
                 
        
        
        });
        
    
        
    </script>
   
 
</body>
</html>