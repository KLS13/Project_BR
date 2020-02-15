<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <%@ include file="template/head.jsp" %>
</head>
<body>
    <div id="wrapper">
    <%@include file="template/mainHeader.jsp" %>
	<%@ include file="template/mainLeftNav.jsp" %>
	<%@ include file="template/mainBodyTop.jsp" %>
                    <div class="col-lg-12 ">
                        <div class="alert alert-info">
                             <strong> </strong>${loginDto.uName }님 오늘도 좋은 하루!
                        </div>
             </div>
            </div>
    <%@ include file="template/mainBodyBottom.jsp" %>

             <!-- /. PAGE INNER  -->
	<%@ include file="template/mainFooter.jsp" %>
    
   
</body>
</html>
