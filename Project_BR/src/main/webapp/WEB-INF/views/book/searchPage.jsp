<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
   <%@include file="header/tophead.jsp" %>
   
    <title>도서검색</title>
    <style>
     
      .box{
        margin-left: 400px;
        margin-top: 150px;
       
     }
      .btn{
       background-color: #ec523f;
       }
       
      .books{
      margin-top: 100px;
      margin-left:450px;
      }
     #adImg1{
     position: fixed;
     top: 290px;
     left:1150px;
     } 
    </style>

</head>
<body>
<%@include file="header/header.jsp" %>
<%@include file="header/mainheader.jsp" %>
    <input class = "box" id="bookName" type="text">
    <img id = "adImg1" src="resources/images/ad.png" width = "70px;"/>
    <button class = "btn" id="search">제목 검색</button>
    
    <div>
    <ul class = "books">
    <li id = "img1" ></li>
    <li id = "title1"></li>
    <li id = "author1"></li>
    <li id = "publisher1"></li>
    </ul><br><br>
    </div>
    <div>
    <ul class = "books">
    <li id = "img2"></li>
    <li id = "title2"></li>
    <li id = "author2"></li>
    <li id = "publisher2"></li>
    </ul><br><br>
    </div>
    <div>
    <ul class = "books">
    <li id = "img3"></li>
    <li id = "title3"></li>
    <li id = "author3"></li>
    <li id = "publisher3"></li>
    </ul><br><br>
    </div>
    
    <div>
     <ul class = "books">
    <li id = "img4"></li>
    <li id = "title4"></li>
    <li id = "author4"></li>
    <li id = "publisher4"></li>
    </ul><br><br>
   </div>
    <div>
    <ul class = "books">
    <li id = "img5"></li>
    <li id = "title5"></li>
    <li id = "author5"></li>
    <li id = "publisher5"></li>
    </ul><br><br>
    </div>
    <div>
    <ul class = "books">
    <li id = "img6"></li>
    <li id = "title6"></li>
    <li id = "author6"></li>
    <li id = "publisher6"></li>
    </ul><br><br>
    </div>
    <div>
    <ul class = "books">
    <li id = "img7"></li>
    <li id = "title7"></li>
    <li id = "author7"></li>
    <li id = "publisher7"></li>
    </ul><br><br>
    </div>
    <div>
    <ul class = "books">
    <li id = "img8"></li>
    <li id = "title8"></li>
    <li id = "author8"></li>
    <li id = "publisher8"></li>
    </ul><br><br>
    </div>
    <div>
    <ul class = "books">
    <li id = "img9"></li>
    <li id = "title9"></li>
    <li id = "author9"></li>
    <li id = "publisher9"></li>
    </ul><br><br>
    </div>
    <div>
    <ul class = "books">
    <li id = "img10"></li>
    <li id = "title10"></li>
    <li id = "author10"></li>
    <li id = "publisher10"></li>
    </ul><br><br>
    </div>
    
   
    <script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
    </script>

    <script>
        $(function () {
            $("#search").click(function () { 
                $.ajax({
                    method: "GET",
                    url: "https://dapi.kakao.com/v3/search/book?target=title", // 전송 주소
                    data: { query: $("#bookName").val() }, 
                    headers: { Authorization: "KakaoAK 6b9a374380958fdd321ffdf370b9e7d9" }
                })
                    .done(function (msg) {  
   
                    	var isbn0 = msg.documents[0].isbn.substring(11,25);
                    	var title0 = msg.documents[0].title;
                    	var writer0 = msg.documents[0].authors;
                    	var publisher0 = msg.documents[0].publisher;
                    	var pubdate0 = msg.documents[0].datetime.substring(0,10);
                    	var img0 = msg.documents[0].thumbnail;
           
                    	$("#img1").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><img src='" + msg.documents[0].thumbnail + "'></a><br />");
                        $("#title1").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><strong>제목:" + msg.documents[0].title + "</strong></a><br />");
                        $("#author1").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><strong>저자:" + msg.documents[0].authors + "</strong></a><br />");
                        $("#publisher1").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><strong>출판사:" + msg.documents[0].publisher + "</strong></a><br />");
                       
                        
                        var isbn1 = msg.documents[1].isbn.substring(11,25);
                      	var title1 = msg.documents[1].title;
                      	var writer1 = msg.documents[1].authors;
                    	var publisher1 = msg.documents[1].publisher;
                    	var pubdate1 = msg.documents[1].datetime.substring(0,10);
                    	var img1 = msg.documents[1].thumbnail;
                    	$("#img2").html("<a href = 'viewBook?bTitle="+ title1+"&bISBN="+isbn1+"&bWriter="+writer1+"&bPublisher="+publisher1+"&bImage="+img1+"&bPubdate="+pubdate1+"'><img src='" + msg.documents[1].thumbnail + "'></a><br />");
                        $("#title2").html("<a href = 'viewBook?bTitle="+ title1+"&bISBN="+isbn1+"&bWriter="+writer1+"&bPublisher="+publisher1+"&bImage="+img1+"&bPubdate="+pubdate1+"'><strong>제목:" + msg.documents[1].title + "</strong></a><br />");
                        $("#author2").html("<a href = 'viewBook?bTitle="+ title1+"&bISBN="+isbn1+"&bWriter="+writer1+"&bPublisher="+publisher1+"&bImage="+img1+"&bPubdate="+pubdate1+"'><strong>저자:" + msg.documents[1].authors + "</strong></a><br />");
                        $("#publisher2").html("<a href = 'viewBook?bTitle="+ title1+"&bISBN="+isbn1+"&bWriter="+writer1+"&bPublisher="+publisher1+"&bImage="+img1+"&bPubdate="+pubdate1+"'><strong>출판사:" + msg.documents[1].publisher + "</strong></a><br />");
                       
                        var isbn2 = msg.documents[2].isbn.substring(11,25);
                        var title2 = msg.documents[2].title;
                        var writer2 = msg.documents[2].authors;
                    	var publisher2 = msg.documents[2].publisher;
                    	var pubdate2 = msg.documents[2].datetime.substring(0,10);
                    	var img2 = msg.documents[2].thumbnail;
                    	$("#img3").html("<a href = 'viewBook?bTitle="+ title2+"&bISBN="+isbn2+"&bWriter="+writer2+"&bPublisher="+publisher2+"&bImage="+img2+"&bPubdate="+pubdate2+"'><img src='" + msg.documents[2].thumbnail + "'></a><br />");
                        $("#title3").html("<a href = 'viewBook?bTitle="+ title2+"&bISBN="+isbn2+"&bWriter="+writer2+"&bPublisher="+publisher2+"&bImage="+img2+"&bPubdate="+pubdate2+"'><strong>제목:" + msg.documents[2].title + "</strong></a><br />");
                        $("#author3").html("<a href = 'viewBook?bTitle="+ title2+"&bISBN="+isbn2+"&bWriter="+writer2+"&bPublisher="+publisher2+"&bImage="+img2+"&bPubdate="+pubdate2+"'><strong>저자:" + msg.documents[2].authors + "</strong></a><br />");
                        $("#publisher3").html("<a href = 'viewBook?bTitle="+ title2+"&bISBN="+isbn2+"&bWriter="+writer2+"&bPublisher="+publisher2+"&bImage="+img2+"&bPubdate="+pubdate2+"'><strong>출판사:" + msg.documents[2].publisher + "</strong></a><br />");
                        var isbn3 = msg.documents[3].isbn.substring(11,25);
                        var title3 = msg.documents[3].title;
                        var writer3 = msg.documents[3].authors;
                    	var publisher3 = msg.documents[3].publisher;
                    	var pubdate3 = msg.documents[3].datetime.substring(0,10);
                    	var img3 = msg.documents[3].thumbnail;
                    	$("#img4").html("<a href = 'viewBook?bTitle="+ title3+"&bISBN="+isbn3+"&bWriter="+writer3+"&bPublisher="+publisher3+"&bImage="+img3+"&bPubdate="+pubdate3+"'><img src='" + msg.documents[3].thumbnail + "'></a><br />");
                        $("#title4").html("<a href = 'viewBook?bTitle="+ title3+"&bISBN="+isbn3+"&bWriter="+writer3+"&bPublisher="+publisher3+"&bImage="+img3+"&bPubdate="+pubdate3+"'><strong>제목:" + msg.documents[3].title + "</strong></a><br />");
                        $("#author4").html("<a href = 'viewBook?bTitle="+ title3+"&bISBN="+isbn3+"&bWriter="+writer3+"&bPublisher="+publisher3+"&bImage="+img3+"&bPubdate="+pubdate3+"'><strong>저자:" + msg.documents[3].authors + "</strong></a><br />");
                        $("#publisher4").html("<a href = 'viewBook?bTitle="+ title3+"&bISBN="+isbn3+"&bWriter="+writer3+"&bPublisher="+publisher3+"&bImage="+img3+"&bPubdate="+pubdate3+"'><strong>출판사:" + msg.documents[3].publisher + "</strong></a><br />");
                       
                        var isbn4 = msg.documents[4].isbn.substring(11,25);
                        var title4 = msg.documents[4].title;
                        var writer4 = msg.documents[4].authors;
                    	var publisher4 = msg.documents[4].publisher;
                    	var pubdate4 = msg.documents[4].datetime.substring(0,10);
                    	var img4 = msg.documents[4].thumbnail;
                    	$("#img5").html("<a href = 'viewBook?bTitle="+ title4+"&bISBN="+isbn4+"&bWriter="+writer4+"&bPublisher="+publisher4+"&bImage="+img4+"&bPubdate="+pubdate4+"'><img src='" + msg.documents[4].thumbnail + "'></a><br />");
                        $("#title5").html("<a href = 'viewBook?bTitle="+ title4+"&bISBN="+isbn4+"&bWriter="+writer4+"&bPublisher="+publisher4+"&bImage="+img4+"&bPubdate="+pubdate4+"'><strong>제목:" + msg.documents[4].title + "</strong></a><br />");
                        $("#author5").html("<a href = 'viewBook?bTitle="+ title4+"&bISBN="+isbn4+"&bWriter="+writer4+"&bPublisher="+publisher4+"&bImage="+img4+"&bPubdate="+pubdate4+"'><strong>저자:" + msg.documents[4].authors + "</strong></a><br />");
                        $("#publisher5").html("<a href = 'viewBook?bTitle="+ title4+"&bISBN="+isbn4+"&bWriter="+writer4+"&bPublisher="+publisher4+"&bImage="+img4+"&bPubdate="+pubdate4+"'><strong>출판사:" + msg.documents[4].publisher + "</strong></a><br />");
                       
                        var isbn5 = msg.documents[5].isbn.substring(11,25);
                        var title5 = msg.documents[5].title;
                        var writer5 = msg.documents[5].authors;
                    	var publisher5 = msg.documents[5].publisher;
                    	var pubdate5 = msg.documents[5].datetime.substring(0,10);
                    	var img5 = msg.documents[5].thumbnail;
                    	$("#img6").html("<a href = 'viewBook?bTitle="+ title5+"&bISBN="+isbn5+"&bWriter="+writer5+"&bPublisher="+publisher5+"&bImage="+img5+"&bPubdate="+pubdate5+"'><img src='" + msg.documents[5].thumbnail + "'></a><br />");
                        $("#title6").html("<a href = 'viewBook?bTitle="+ title5+"&bISBN="+isbn5+"&bWriter="+writer5+"&bPublisher="+publisher5+"&bImage="+img5+"&bPubdate="+pubdate5+"'><strong>제목:" + msg.documents[5].title + "</strong></a><br />");
                        $("#author6").html("<a href = 'viewBook?bTitle="+ title5+"&bISBN="+isbn5+"&bWriter="+writer5+"&bPublisher="+publisher5+"&bImage="+img5+"&bPubdate="+pubdate5+"'><strong>저자:" + msg.documents[5].authors + "</strong></a><br />");
                        $("#publisher6").html("<a href = 'viewBook?bTitle="+ title5+"&bISBN="+isbn5+"&bWriter="+writer5+"&bPublisher="+publisher5+"&bImage="+img5+"&bPubdate="+pubdate5+"'><strong>출판사:" + msg.documents[5].publisher + "</strong></a><br />");
                       
                        var isbn6 = msg.documents[6].isbn.substring(11,25);
                        var title6 = msg.documents[6].title;
                        var writer6 = msg.documents[6].authors;
                    	var publisher6 = msg.documents[6].publisher;
                    	var pubdate6 = msg.documents[6].datetime.substring(0,10);
                    	var img6 = msg.documents[6].thumbnail;
                    	$("#img7").html("<a href = 'viewBook?bTitle="+ title6+"&bISBN="+isbn6+"&bWriter="+writer6+"&bPublisher="+publisher6+"&bImage="+img6+"&bPubdate="+pubdate6+"'><img src='" + msg.documents[6].thumbnail + "'></a><br />");
                        $("#title7").html("<a href = 'viewBook?bTitle="+ title6+"&bISBN="+isbn6+"&bWriter="+writer6+"&bPublisher="+publisher6+"&bImage="+img6+"&bPubdate="+pubdate6+"'><strong>제목:" + msg.documents[6].title + "</strong></a><br />");
                        $("#author7").html("<a href = 'viewBook?bTitle="+ title6+"&bISBN="+isbn6+"&bWriter="+writer6+"&bPublisher="+publisher6+"&bImage="+img6+"&bPubdate="+pubdate6+"'><strong>저자:" + msg.documents[6].authors + "</strong></a><br />");
                        $("#publisher7").html("<a href = 'viewBook?bTitle="+ title6+"&bISBN="+isbn6+"&bWriter="+writer6+"&bPublisher="+publisher6+"&bImage="+img6+"&bPubdate="+pubdate6+"'><strong>출판사:" + msg.documents[6].publisher + "</strong></a><br />");
                        
                        var isbn7 = msg.documents[7].isbn.substring(11,25);
                        var title7 = msg.documents[7].title;
                        var writer7 = msg.documents[7].authors;
                    	var publisher7 = msg.documents[7].publisher;
                    	var pubdate7 = msg.documents[7].datetime.substring(0,10);
                    	var img7 = msg.documents[7].thumbnail;
                    	$("#img8").html("<a href = 'viewBook?bTitle="+ title7+"&bISBN="+isbn7+"&bWriter="+writer7+"&bPublisher="+publisher7+"&bImage="+img7+"&bPubdate="+pubdate7+"'><img src='" + msg.documents[7].thumbnail + "'></a><br />");
                        $("#title8").html("<a href = 'viewBook?bTitle="+ title7+"&bISBN="+isbn7+"&bWriter="+writer7+"&bPublisher="+publisher7+"&bImage="+img7+"&bPubdate="+pubdate7+"'><strong>제목:" + msg.documents[7].title + "</strong></a><br />");
                        $("#author8").html("<a href = 'viewBook?bTitle="+ title7+"&bISBN="+isbn7+"&bWriter="+writer7+"&bPublisher="+publisher7+"&bImage="+img7+"&bPubdate="+pubdate7+"'><strong>저자:" + msg.documents[7].authors + "</strong></a><br />");
                        $("#publisher8").html("<a href = 'viewBook?bTitle="+ title7+"&bISBN="+isbn7+"&bWriter="+writer7+"&bPublisher="+publisher7+"&bImage="+img7+"&bPubdate="+pubdate7+"'><strong>출판사:" + msg.documents[7].publisher + "</strong></a><br />");
                       
                        var isbn8 = msg.documents[8].isbn.substring(11,25);
                        var title8 = msg.documents[8].title;
                        var writer8 = msg.documents[8].authors;
                    	var publisher8 = msg.documents[8].publisher;
                    	var pubdate8 = msg.documents[8].datetime.substring(0,10);
                    	var img8 = msg.documents[8].thumbnail;
                    	$("#img9").html("<a href = 'viewBook?bTitle="+ title8+"&bISBN="+isbn8+"&bWriter="+writer8+"&bPublisher="+publisher8+"&img="+img8+"&bPubdate="+pubdate8+"'><img src='" + msg.documents[8].thumbnail + "'></a><br />");
                        $("#title9").html("<a href = 'viewBook?bTitle="+ title8+"&bISBN="+isbn8+"&bWriter="+writer8+"&bPublisher="+publisher8+"&img="+img8+"&bPubdate="+pubdate8+"'><strong>제목:" + msg.documents[8].title + "</strong></a><br />");
                        $("#author9").html("<a href = 'viewBook?bTitle="+ title8+"&bISBN="+isbn8+"&bWriter="+writer8+"&bPublisher="+publisher8+"&img="+img8+"&bPubdate="+pubdate8+"'><strong>저자:" + msg.documents[8].authors + "</strong></a><br />");
                        $("#publisher9").html("<a href = 'viewBook?bTitle="+ title8+"&bISBN="+isbn8+"&bWriter="+writer8+"&bPublisher="+publisher8+"&img="+img8+"&bPubdate="+pubdate8+"'><strong>출판사:" + msg.documents[8].publisher + "</strong></a><br />");
                       
                        var isbn9 = msg.documents[9].isbn.substring(11,25);
                        var title9 = msg.documents[9].title;
                        var writer9 = msg.documents[9].authors;
                    	var publisher9 = msg.documents[9].publisher;
                    	var pubdate9 = msg.documents[9].datetime.substring(0,10);
                    	var img9 = msg.documents[9].thumbnail;
                    	$("#img10").html("<a href = 'viewBook?bTitle="+ title9+"&bISBN="+isbn9+"&bWriter="+writer9+"&bPublisher="+publisher9+"&bImage="+img9+"&bPubdate="+pubdate9+"'><img src='" + msg.documents[9].thumbnail + "'></a><br />");
                        $("#title10").html("<a href = 'viewBook?bTitle="+ title9+"&bISBN="+isbn9+"&bWriter="+writer9+"&bPublisher="+publisher9+"&bImage="+img9+"&bPubdate="+pubdate9+"'><strong>제목:" + msg.documents[9].title + "</strong></a><br />");
                        $("#author10").html("<a href = 'viewBook?bTitle="+ title9+"&bISBN="+isbn9+"&bWriter="+writer9+"&bPublisher="+publisher9+"&bImage="+img9+"&bPubdate="+pubdate9+"'><strong>저자:" + msg.documents[9].authors + "</strong></a><br />");
                        $("#publisher10").html("<a href = 'viewBook?bTitle="+ title9+"&bISBN="+isbn9+"&bWriter="+writer9+"&bPublisher="+publisher9+"&bImage="+img9+"&bPubdate="+pubdate9+"'><strong>출판사:" + msg.documents[9].publisher + "</strong></a><br />");
                       
                      
                  });
            })
           
   
        });
        
    
        
    </script>
</body>

</html>