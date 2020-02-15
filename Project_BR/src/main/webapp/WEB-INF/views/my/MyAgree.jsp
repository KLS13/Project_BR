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
     <script type="text/javascript">
	function removeMember(){	
		if(!confirm("정말로 삭제하시겠습니까?")){
			return false;
		}else{
			return true;
		}
	}
</script>
	<form action = "delete" onsubmit="return removeMember()" method="post">
                   <div class="btn-box">
                   <input type="submit" value="회원 삭제" />
					</div>
			</form>
			</div>
    <%@ include file="template/mainBodyBottom.jsp" %>

             <!-- /. PAGE INNER  -->
	<%@ include file="template/mainFooter.jsp" %>
    
   
</body>
</html>
