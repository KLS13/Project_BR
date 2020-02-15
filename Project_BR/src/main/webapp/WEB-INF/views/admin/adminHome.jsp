<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
  <%--  <%@ include file="template/head.jsp" %> --%>
   <jsp:include page="template/head.jsp">
   	<jsp:param value="${sessionScope.loginDto.uMemberShip }" name="membership"/>
   </jsp:include>
<title>admin page</title>
</head>
<body>
    <div id="wrapper">
    <%@include file="template/mainHeader.jsp" %>
	<%@ include file="template/mainLeftNav.jsp" %>
	<%@ include file="template/mainBodyTop.jsp" %>
                    <div class="col-lg-12 ">
                        <div class="alert alert-info">
                             <strong>Welcome 관리자 !</strong> 오늘도 좋은 하루!
                        </div>
                       
                    </div>
                    </div>
                  <!-- /. ROW  --> 
                  <div class="row text-center pad-top">
                  <!-- <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="adminGoodsViewPage" >
 								<i class="fa fa-circle-o-notch fa-5x"></i>
               			       <h4>오늘 일정</h4>
                      		</a>
                      </div>
      
                  </div> -->
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="adminGoodsViewPage" >
						 <i class="fa fa-archive fa-5x"></i>
                      <h4>물품 관리</h4>
                      </a>
                      </div>
                     
                     
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="reviewPage" >
							 <i class="fa fa-book fa-5x"></i>
                      <h4>리뷰 관리</h4>
                      </a>
                      </div>
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="qnaListPage" >
 								<i class="fa fa-comments-o fa-5x"></i>
                     			<h4>Q&A</h4>
                      		</a>
                      </div>
                  </div>
              </div>
                 <!-- /. ROW  --> 
				<hr/>
			  <div id="chart_div">
			  </div>
                                          
                  </div>

                     
                     
                  </div>

                     
                     
                  </div>

                 <!-- /. ROW  -->   
				  <div class="row">
                    <div class="col-lg-12 ">
					<br/>
                        <div class="alert alert-danger">
                             <!-- <strong>Want More Icons Free ? </strong> Checkout fontawesome website and use any icon <a target="_blank" href="http://fortawesome.github.io/Font-Awesome/icons/">Click Here</a>. -->
    <%@ include file="template/mainBodyBottom.jsp" %>

             <!-- /. PAGE INNER  -->
	<%@ include file="template/mainFooter.jsp" %>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    google.charts.load('current', {packages: ['corechart', 'bar']});
    google.charts.setOnLoadCallback(drawBasic);

    function drawBasic() {

          var data = new google.visualization.DataTable();
          data.addColumn('timeofday', '시간');
          data.addColumn('number', '리뷰수');

          data.addRows([
            [{v: [0, 0, 0], f: '0 am'}, ${hDto.hour00}],
            [{v: [1, 0, 0], f: '1 am'}, ${hDto.hour01}],
            [{v: [2, 0, 0], f: '2 am'}, ${hDto.hour02}],
            [{v: [3, 0, 0], f: '3 am'}, ${hDto.hour03}],
            [{v: [4, 0, 0], f: '4 am'}, ${hDto.hour04}],
            [{v: [5, 0, 0], f: '5 am'}, ${hDto.hour05}],
            [{v: [6, 0, 0], f: '6 am'}, ${hDto.hour06}],
            [{v: [7, 0, 0], f: '7 am'}, ${hDto.hour07}],
            [{v: [8, 0, 0], f: '8 am'}, ${hDto.hour08}],
            [{v: [9, 0, 0], f: '9 am'}, ${hDto.hour09}],
            [{v: [10, 0, 0], f: '10 am'}, ${hDto.hour10}],
            [{v: [11, 0, 0], f: '11 am'}, ${hDto.hour11}],
            [{v: [12, 0, 0], f: '12 pm'}, ${hDto.hour12}],
            [{v: [13, 0, 0], f: '13 pm'}, ${hDto.hour13}],
            [{v: [14, 0, 0], f: '14 pm'}, ${hDto.hour14}],
            [{v: [15, 0, 0], f: '15 pm'}, ${hDto.hour15}],
            [{v: [16, 0, 0], f: '16 pm'}, ${hDto.hour16}],
            [{v: [17, 0, 0], f: '17 pm'}, ${hDto.hour17}],
            [{v: [18, 0, 0], f: '18 pm'}, ${hDto.hour18}],
            [{v: [19, 0, 0], f: '19 pm'}, ${hDto.hour19}],
            [{v: [20, 0, 0], f: '20 pm'}, ${hDto.hour20}],
            [{v: [21, 0, 0], f: '21 pm'}, ${hDto.hour21}],
            [{v: [22, 0, 0], f: '22 pm'}, ${hDto.hour22}],
            [{v: [23, 0, 0], f: '23 pm'}, ${hDto.hour23}],
          ]);

          var options = {
            title: '각 시간 리뷰 수',
            hAxis: {
              title: '각 시간당 리뷰 수',
              format: 'h:mm a',
            },
          };

          var chart = new google.visualization.ColumnChart(
            document.getElementById('chart_div'));

          chart.draw(data, options);
        }
    </script>
   
</body>
</html>
