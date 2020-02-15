<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title>Flex - Responsive HTML Template</title>
    	<meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 
Flex Template 
http://www.templatemo.com/tm-406-flex
-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/templatemo_misc.css">
        <link rel="stylesheet" href="css/templatemo_style.css">

    
   <style>
   #img1{
    width : 200px;
   }
   #img2{
    width : 200px;
   }
   #img3{
    width : 200px;
   }
   #img4{
    width : 200px;
   }
   #img5{
    width : 200px;
   }
   #img6{
    width : 200px;
   }
   #img7{
    width : 200px;
   }
   #img8{
    width : 200px;
   }
  
  .reviewTable{
   margin-left: 500px;
  }
   </style>
   </style>
   <script type="text/javascript">
   	function logout(){
   		var log = confirm("로그아웃 하시겠습니까?");
   	if(log){
   		location.href="logout";
   		alert("로그아웃이 되었습니다. 감사합니다.");
   	}else{
   		return;
   	}
   }	
   
   </script>
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an outdated browser. <a href="http://browsehappy.com/">Upgrade your browser today</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to better experience this site.</p>
        <![endif]-->


        <div class="site-main" id="sTop">
            <div class="site-header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <ul class="social-icons">
          
        <c:if test="${loginResult eq 0 }">
        <script>
            alert("아이디와 비밀번호가 일치하지 않습니다.다시시도하세요");
            history.back();
        </script>
        </c:if>                 
        <c:if test="${loginDto ne null }">
			<h1>${loginDto.uName }님 안녕하세요</h1>
			<input type="button" value="로그아웃" onclick="logout()" />
			<c:choose >
				  <c:when test = "${loginDto.uMemberShip eq 'admin'}">
				 <input type="button" value="관리자 페이지" onclick="location.href='adminHome'" />
				 </c:when>
				 <c:otherwise>
					<input type="button" value="마이페이지" onclick="location.href='myPage'" />
				 </c:otherwise>
			</c:choose>
		</c:if>
	<c:if test="${loginDto eq null }">
		<h1>로그인을 해주세요</h1>
		<input type="button" value="로그인" onclick="location.href='loginPage'"/>
		<input type="button" value="회원가입" onclick="location.href='join_memberPage'"/>
	</c:if>
	<c:if test="${loginDto.uState eq 0 }"> <!-- 회원 탈퇴 대기중이다 알림 -->
          <script>
             alert("해당 계정은 탈퇴가 진행중입니다. 정지를 해제하려면 관리자에게 문의하여주십시오.");
             location.href = "home";
            </script>
           <% session.removeAttribute("loginDto"); %>
      </c:if>
      <c:if test="${loginDto.uState eq -1 }"> <!-- 계정이 정지 되었다 알림 -->
          <script>
             alert("해당 계정은 활동이 정지되었습니다. 관리자에게 문의하여주십시오.");
             location.href = "home";
            </script>
           <% session.removeAttribute("loginDto"); %>
      </c:if>	
                            <!-- 
                                <li><a href="loginPage" class="fa fa-dribbble"></a></li>
                                <li><a href="joinPage" class="fa fa-linkedin"></a></li>
                                          -->
                            </ul>
                        </div> <!-- /.col-md-12 -->
                    </div> <!-- /.row -->
                </div> <!-- /.container -->
                <div class="main-header">
                    <div class="container"><!--  style="background:url(../images/logo.png) no-repeat"> -->
                        <div id="menu-wrapper">
                            <div class="row">
                                <div class="logo-wrapper col-md-2 col-sm-2">
                                    <h1>
                                        <a href="home">북리뷰</a>
                                    </h1>
                           
                                </div> <!-- /.logo-wrapper -->
                                <div class="col-md-10 col-sm-10 main-menu text-right">
                                    <div class="toggle-menu visible-sm visible-xs">><i class="fa fa-bars"></i></div>
                                    <ul class="menu-first">
                                        <li><a href="home">홈</a></li>
                                       
                                        <li><a href="reviewPage">리뷰게시판</a></li>
                                        <li><a href="searchPage">도서검색</a></li>                                 
                                        <li><a href="goodsViewPage">교환소</a></li>                                 
                                        <li><a href="qnaListPage">고객지원</a></li> 
                                    </ul>                                    
                                </div> <!-- /.main-menu -->
                            </div> <!-- /.row -->
                        </div> <!-- /#menu-wrapper -->                        
                    </div> <!-- /.container -->
                </div> <!-- /.main-header -->
            </div> <!-- /.site-header -->
            <div class="site-slider">
                <div class="slider">
                    <div class="flexslider">
                        <ul class="slides">
                        <li>
                                <div class="overlay"></div>
                                <img src="images/slide3.jpg" alt="">
                                <div class="slider-caption visible-md visible-lg">
                                    <h2>북리뷰 iBook</h2>
                                    <p>책을 리뷰하다 iBook</p>
                                
                                </div>
                            </li>
                            <li>
                                <div class="overlay"></div>
                                <img src="images/slide1.jpg" alt="">
                                <div class="slider-caption visible-md visible-lg">
                                    <h2>리뷰 이벤트</h2>
                                    <p>리뷰 작성 시 포인트 지급</p>
                                    <a href="" class="slider-btn">이벤트 내용 바로가기</a>
                                </div>
                            </li>
                            <li>
                                <div class="overlay"></div>
                                <img src="images/slide2.jpg" alt="">
                                <div class="slider-caption visible-md visible-lg">
                                    <h2>포인트 활용하기</h2>
                                    <p>모은 포인트로 구매하기 !</p>
                                    <a href="pointPage" class="slider-btn">포인트 교환소 바로가기</a>
                                </div>
                            </li>
                            
                        </ul>
                    </div> <!-- /.flexslider -->
                </div> <!-- /.slider -->
            </div> <!-- /.site-slider -->
        </div> <!-- /.site-main -->


        <div class="content-section" id="services">
            <div class="container">
                <div class="row">
                    <div class="heading-section col-md-12 text-center">
                        <h2>핫한 도서 </h2>
                        <p>리뷰가 많이 달린 책</p>
                        
        <c:choose>
        <c:when test="${not empty bookList }">
      
        </c:when>
        <c:otherwise>
        <c:out value="list가 없습니다 "/>
        </c:otherwise>
        </c:choose>        
               </div> <!-- /.heading-section -->
                 </div> <!-- /.row -->
                 <div class="row">
                       <div class="service-item" id="service-1">         
                           <table>
                            <tr>
                            <td><img src = "${bookList[0].bImage}"></td>
                            </tr>
                            </table>
                             <div class="service-content" >
                                <div class="inner-service">
                                   <h3><a href = "viewBook?bTitle=${bookList[0].bTitle}&bWriter=${bookList[0].bWriter}
                                   &bISBN=${bookList[0].bISBN}&bPublisher=${bookList[0].bPublisher}&bImage=${bookList[0].bImage}
                                   &bPubdate=${bookList[0].bPubdate}">
                                   ${bookList[0].bTitle}</a></h3>
                                   <table class = "reviewTable">
                                   <tr>
                                   <td>
                                   <a href = "viewBook?bTitle=${bookList[0].bTitle}&bWriter=${bookList[0].bWriter}
                                   &bISBN=${bookList[0].bISBN}&bPublisher=${bookList[0].bPublisher}&bImage=${bookList[0].bImage}
                                   &bPubdate=${bookList[0].bPubdate}">${bookList[0].bWriter}</a>
                                   </td>
                                   </tr>
                                    <tr>
                                   <td>
                                  <a href = "viewBook?bTitle=${bookList[0].bTitle}&bWriter=${bookList[0].bWriter}
                                   &bISBN=${bookList[0].bISBN}&bPublisher=${bookList[0].bPublisher}&bImage=${bookList[0].bImage}
                                   &bPubdate=${bookList[0].bPubdate}">${bookList[0].bPublisher}</a>
                                   </td>
                                   </tr>
                                    <tr>
                                   <td>
                                  <a href = "viewBook?bTitle=${bookList[0].bTitle}&bWriter=${bookList[0].bWriter}
                                   &bISBN=${bookList[0].bISBN}&bPublisher=${bookList[0].bPublisher}&bImage=${bookList[0].bImage}
                                   &bPubdate=${bookList[0].bPubdate}">${bookList[0].bPubdate}</a>
                                   </td>
                                   </tr>
                                   </table>
                                </div>
                                
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                        <div class="service-item" id="service-2">
                        <table>
                            <tr>
                            <td><img src = "${bookList[1].bImage}" ></td>
                            </tr>
                            </table>
                           
                            <div class="service-content">
                                <div class="inner-service">
                                <h3> <a href = "viewBook?bTitle=${bookList[1].bTitle}&bWriter=${bookList[1].bWriter}
                                   &bISBN=${bookList[1].bISBN}&bPublisher=${bookList[1].bPublisher}&bImage=${bookList[1].bImage}
                                   &bPubdate=${bookList[1].bPubdate}">${bookList[1].bTitle}</a></h3>
                                   <table class = "reviewTable">
                                   <tr>
                                   <td>
                               <a href = "viewBook?bTitle=${bookList[1].bTitle}&bWriter=${bookList[1].bWriter}
                                   &bISBN=${bookList[1].bISBN}&bPublisher=${bookList[1].bPublisher}&bImage=${bookList[1].bImage}
                                   &bPubdate=${bookList[1].bPubdate}"> ${bookList[1].bWriter} </a>
                                   </td>
                                   </tr>
                                    <tr>
                                   <td>
                                 <a href = "viewBook?bTitle=${bookList[1].bTitle}&bWriter=${bookList[1].bWriter}
                                   &bISBN=${bookList[1].bISBN}&bPublisher=${bookList[1].bPublisher}&bImage=${bookList[1].bImage}
                                   &bPubdate=${bookList[1].bPubdate}"> ${bookList[1].bPublisher}</a>
                                   </td>
                                   </tr>
                                    <tr>
                                   <td>
                                 <a href = "viewBook?bTitle=${bookList[1].bTitle}&bWriter=${bookList[1].bWriter}
                                   &bISBN=${bookList[1].bISBN}&bPublisher=${bookList[1].bPublisher}&bImage=${bookList[1].bImage}
                                   &bPubdate=${bookList[1].bPubdate}">${bookList[1].bPubdate}</a>
                                   </td>
                                   </tr>
                                   </table>
                              </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                   
                 
                        <div class="service-item" id="service-3">
                        <table>
                            <tr>
                            <td><img src = "${bookList[2].bImage}"></td>
                            </tr>
                            </table>
                           
                            <div class="service-content">
                                <div class="inner-service">
                                <h3><a href = "viewBook?bTitle=${bookList[2].bTitle}&bWriter=${bookList[2].bWriter}
                                   &bISBN=${bookList[2].bISBN}&bPublisher=${bookList[2].bPublisher}&bImage=${bookList[2].bImage}
                                   &bPubdate=${bookList[2].bPubdate}">${bookList[2].bTitle}</a></h3>
                                   <table class = "reviewTable">
                                   <tr>
                                   <td>
                                  <a href = "viewBook?bTitle=${bookList[2].bTitle}&bWriter=${bookList[2].bWriter}
                                   &bISBN=${bookList[2].bISBN}&bPublisher=${bookList[2].bPublisher}&bImage=${bookList[2].bImage}
                                   &bPubdate=${bookList[2].bPubdate}">${bookList[2].bWriter}</a>
                                   </td>
                                   </tr>
                                    <tr>
                                   <td>
                                  <a href = "viewBook?bTitle=${bookList[2].bTitle}&bWriter=${bookList[2].bWriter}
                                   &bISBN=${bookList[2].bISBN}&bPublisher=${bookList[2].bPublisher}&bImage=${bookList[2].bImage}
                                   &bPubdate=${bookList[2].bPubdate}">${bookList[2].bPublisher}</a>
                                   </td>
                                   </tr>
                                    <tr>
                                   <td>
                                  <a href = "viewBook?bTitle=${bookList[2].bTitle}&bWriter=${bookList[2].bWriter}
                                   &bISBN=${bookList[2].bISBN}&bPublisher=${bookList[2].bPublisher}&bImage=${bookList[2].bImage}
                                   &bPubdate=${bookList[2].bPubdate}">${bookList[2].bPubdate}</a>
                                   </td>
                                   </tr>
                                   </table>
                              </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                  
                        <div class="service-item" id="service-4">
                        <table>
                            <tr>
                            <td><img src = "${bookList[3].bImage}"></td>
                            </tr>
                            </table>
                            <div class="service-content">
                                <div class="inner-service">
                                <h3><a href = "viewBook?bTitle=${bookList[3].bTitle}&bWriter=${bookList[3].bWriter}
                                   &bISBN=${bookList[3].bISBN}&bPublisher=${bookList[3].bPublisher}&bImage=${bookList[3].bImage}
                                   &bPubdate=${bookList[3].bPubdate}">${bookList[3].bTitle}</a></h3>
                                   <table class = "reviewTable">
                                   <tr>
                                   <td>
                                 <a href = "viewBook?bTitle=${bookList[3].bTitle}&bWriter=${bookList[3].bWriter}
                                   &bISBN=${bookList[3].bISBN}&bPublisher=${bookList[3].bPublisher}&bImage=${bookList[3].bImage}
                                   &bPubdate=${bookList[3].bPubdate}">${bookList[3].bWriter}</a>
                                   </td>
                                   </tr>
                                    <tr>
                                   <td>
                                  <a href = "viewBook?bTitle=${bookList[3].bTitle}&bWriter=${bookList[3].bWriter}
                                   &bISBN=${bookList[3].bISBN}&bPublisher=${bookList[3].bPublisher}&bImage=${bookList[3].bImage}
                                   &bPubdate=${bookList[3].bPubdate}">${bookList[3].bPublisher}</a>
                                   </td>
                                   </tr>
                                    <tr>
                                   <td>
                                   <a href = "viewBook?bTitle=${bookList[3].bTitle}&bWriter=${bookList[3].bWriter}
                                   &bISBN=${bookList[3].bISBN}&bPublisher=${bookList[3].bPublisher}&bImage=${bookList[3].bImage}
                                   &bPubdate=${bookList[3].bPubdate}">${bookList[3].bPubdate}</a>
                                   </td>
                                   </tr>
                                   </table>
                                </div>
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#services -->
        <c:choose>
        <c:when test="${not empty list }">
        <form>   
        <input type = "hidden" name = "bISBN1" value = "${list[0]}"/>  
        <input type = "hidden" name = "bISBN2" value = "${list[1]}"/> 
        <input type = "hidden" name = "bISBN3" value = "${list[2]}"/>
        <input type = "hidden" name = "bISBN4" value = "${list[3]}"/>
        <input type = "hidden" name = "bISBN5" value = "${list[4]}"/>
        <input type = "hidden" name = "bISBN6" value = "${list[5]}"/>
        <input type = "hidden" name = "bISBN7" value = "${list[6]}"/>
        <input type = "hidden" name = "bISBN8" value = "${list[7]}"/>
        </form>
        </c:when>
        <c:otherwise>
        <c:out value="list가 없습니다 "/>
        </c:otherwise>
        </c:choose>
        <div class="content-section" id="portfolio">
            <div class="container">
                <div class="row">
                    <div class="heading-section col-md-12 text-center">
                        <h2>리뷰어 추천책</h2>
                        <p>평점이 높은 책</p>
                    </div> <!-- /.heading-section -->
                </div> <!-- /.row -->
                <div class="row">
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <table>
                            <tr>
                            <td id = "img1"></td>
                            </tr>
                            </table>
                    
                  
                </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                              <table>
                            <tr>
                            <td id = "img2"></td>
                            </tr>
                            </table>
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                             <table>
                            <tr>
                            <td id = "img3"></td>
                            </tr>
                            </table>
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                           <table>
                            <tr>
                            <td id = "img4"></td>
                            </tr>
                            </table>
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                        <table>
                            <tr>
                            <td id = "img5"></td>
                            </tr>
                            </table>
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                        <table>
                            <tr>
                            <td id = "img6"></td>
                            </tr>
                            </table>
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <table>
                            <tr>
                            <td id = "img7"></td>
                            </tr>
                            </table>
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                          
                            <table>
                            <tr>
                            <td id = "img8"></td>
                            </tr>
                            </table>
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#portfolio -->


        <div class="content-section" id="our-team">
            <div class="container">
                <div class="row">
                    <div class="heading-section col-md-12 text-center">
                        <h2>차트로 보는 독서리뷰 </h2>
                      
                 	<div>
               
                 		<div style="width:400px; height:400px; margin:0 auto">
                 		<canvas id="myChart" width="300" height="300"></canvas>	
                 		</div>
                 	</div>
                 	</div>
                 	
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#our-team -->
            
        <div id="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-xs-12 text-left">
                        <span>Copyright &copy; 2020 iBook</span>
                  </div> <!-- /.text-center -->
                    <div class="col-md-4 hidden-xs text-right">
                        <a href="#top" id="go-top">Back to top</a>
                    </div> <!-- /.text-center -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#footer -->
        
         <script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
   </script>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.bundle.min.js"></script>
   <script>
	var ctx = document.getElementById("myChart");
	var myChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: ["월요일", "화요일", "수요일","목요일","금요일","토요일","일요일"],
	        datasets: [{
	        	labels : "매일매일 독서리뷰",
	            data: [${bcdto.MON},${bcdto.TUE},${bcdto.WEN},${bcdto.TUR},${bcdto.FRI},${bcdto.SAT},${bcdto.SUN}],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)',
	                'rgba(200, 189, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)',
	                'rgba(200, 189, 64, 1)'
        	    ]
      	  }]
 	   },
 	  options: { legend: { display: false }}});
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
           
                    	$("#img1").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><img src='" + msg.documents[0].thumbnail + "'></a><br />");
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
           
                    	$("#img2").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><img src='" + msg.documents[0].thumbnail + "'></a><br />");
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
           
                    	$("#img3").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><img src='" + msg.documents[0].thumbnail + "'></a><br />");
                        $("#title3").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><strong>제목:" + msg.documents[0].title + "</strong></a><br />");
                        $("#author3").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><strong>저자:" + msg.documents[0].authors + "</strong></a><br />");
                  });    
                
                $.ajax({
                    method: "GET",
                    url: "https://dapi.kakao.com/v3/search/book", // 전송 주소
                    data: {query: $("input[name=bISBN4]").val()}, 
                    headers: { Authorization: "KakaoAK 6b9a374380958fdd321ffdf370b9e7d9" }
                })
                    .done(function (msg) {  
                    	var isbn0 = msg.documents[0].isbn.substring(11,25);
                    	var title0 = msg.documents[0].title;
                    	var writer0 = msg.documents[0].authors;
                    	var publisher0 = msg.documents[0].publisher;
                    	var pubdate0 = msg.documents[0].datetime.substring(0,10);
                    	var img0 = msg.documents[0].thumbnail;
           
                    	$("#img4").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><img src='" + msg.documents[0].thumbnail + "'></a><br />");
                        $("#title4").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><strong>제목:" + msg.documents[0].title + "</strong></a><br />");
                        $("#author4").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><strong>저자:" + msg.documents[0].authors + "</strong></a><br />");
                  });
                
                $.ajax({
                    method: "GET",
                    url: "https://dapi.kakao.com/v3/search/book", // 전송 주소
                    data: {query: $("input[name=bISBN5]").val()}, 
                    headers: { Authorization: "KakaoAK 6b9a374380958fdd321ffdf370b9e7d9" }
                })
                    .done(function (msg) {  
                    	var isbn0 = msg.documents[0].isbn.substring(11,25);
                    	var title0 = msg.documents[0].title;
                    	var writer0 = msg.documents[0].authors;
                    	var publisher0 = msg.documents[0].publisher;
                    	var pubdate0 = msg.documents[0].datetime.substring(0,10);
                    	var img0 = msg.documents[0].thumbnail;
           
                    	$("#img5").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><img src='" + msg.documents[0].thumbnail + "'></a><br />");
                        $("#title5").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><strong>제목:" + msg.documents[0].title + "</strong></a><br />");
                        $("#author5").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><strong>저자:" + msg.documents[0].authors + "</strong></a><br />");
                  }); 
                
                $.ajax({
                    method: "GET",
                    url: "https://dapi.kakao.com/v3/search/book", // 전송 주소
                    data: {query: $("input[name=bISBN6]").val()}, 
                    headers: { Authorization: "KakaoAK 6b9a374380958fdd321ffdf370b9e7d9" }
                })
                    .done(function (msg) {  
                    	var isbn0 = msg.documents[0].isbn.substring(11,25);
                    	var title0 = msg.documents[0].title;
                    	var writer0 = msg.documents[0].authors;
                    	var publisher0 = msg.documents[0].publisher;
                    	var pubdate0 = msg.documents[0].datetime.substring(0,10);
                    	var img0 = msg.documents[0].thumbnail;
           
                    	$("#img6").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><img src='" + msg.documents[0].thumbnail + "'></a><br />");
                        $("#title6").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><strong>제목:" + msg.documents[0].title + "</strong></a><br />");
                        $("#author6").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><strong>저자:" + msg.documents[0].authors + "</strong></a><br />");
                  });
                
                $.ajax({
                    method: "GET",
                    url: "https://dapi.kakao.com/v3/search/book", // 전송 주소
                    data: {query: $("input[name=bISBN7]").val()}, 
                    headers: { Authorization: "KakaoAK 6b9a374380958fdd321ffdf370b9e7d9" }
                })
                    .done(function (msg) {  
                    	var isbn0 = msg.documents[0].isbn.substring(11,25);
                    	var title0 = msg.documents[0].title;
                    	var writer0 = msg.documents[0].authors;
                    	var publisher0 = msg.documents[0].publisher;
                    	var pubdate0 = msg.documents[0].datetime.substring(0,10);
                    	var img0 = msg.documents[0].thumbnail;
           
                    	$("#img7").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><img src='" + msg.documents[0].thumbnail + "'></a><br />");
                        $("#title7").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><strong>제목:" + msg.documents[0].title + "</strong></a><br />");
                        $("#author7").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><strong>저자:" + msg.documents[0].authors + "</strong></a><br />");
                  });
                
                
                $.ajax({
                    method: "GET",
                    url: "https://dapi.kakao.com/v3/search/book", // 전송 주소
                    data: {query: $("input[name=bISBN8]").val()}, 
                    headers: { Authorization: "KakaoAK 6b9a374380958fdd321ffdf370b9e7d9" }
                })
                    .done(function (msg) {  
                    	var isbn0 = msg.documents[0].isbn.substring(11,25);
                    	var title0 = msg.documents[0].title;
                    	var writer0 = msg.documents[0].authors;
                    	var publisher0 = msg.documents[0].publisher;
                    	var pubdate0 = msg.documents[0].datetime.substring(0,10);
                    	var img0 = msg.documents[0].thumbnail;
           
                    	$("#img8").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><img src='" + msg.documents[0].thumbnail + "'></a><br />");
                        $("#title8").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><strong>제목:" + msg.documents[0].title + "</strong></a><br />");
                        $("#author8").html("<a href = 'viewBook?bTitle="+ title0+"&bISBN="+isbn0+"&bWriter="+writer0+"&bPublisher="+publisher0+"&bImage="+img0+"&bPubdate="+pubdate0+"'><strong>저자:" + msg.documents[0].authors + "</strong></a><br />");
                  });      
        });
        
                  
    </script>
        
        
        <script src="js/vendor/jquery-1.11.0.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.0.min.js"><\/script>')</script>
        <script src="js/bootstrap.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>
       

        <!-- Google Map -->
        <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
        <script src="js/vendor/jquery.gmap3.min.js"></script>
        
        <!-- Google Map Init-->
        <script type="text/javascript">
            jQuery(function($){
                $('#map_canvas').gmap3({
                    marker:{
                        address: '37.769725, -122.462154' 
                    },
                        map:{
                        options:{
                        zoom: 15,
                        scrollwheel: false,
                        streetViewControl : true
                        }
                    }
                });

                /* Simulate hover on iPad
                 * http://stackoverflow.com/questions/2851663/how-do-i-simulate-a-hover-with-a-touch-in-touch-enabled-browsers
                 --------------------------------------------------------------------------------------------------------------*/ 
                $('body').bind('touchstart', function() {});
            });
        </script>
        <!-- templatemo 406 flex -->
    </body>
</html>