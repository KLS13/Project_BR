<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>    
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
		<input type="button" value="회원가입" onclick="location.href='join_member'"/>
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
                    <div class="container">
                        <div id="menu-wrapper">
                            <div class="row">
                                <div class="logo-wrapper col-md-2 col-sm-2">
                                    <h1>
                                        <a href="home">북리뷰</a>
                                    </h1>
                                </div> <!-- /.logo-wrapper -->