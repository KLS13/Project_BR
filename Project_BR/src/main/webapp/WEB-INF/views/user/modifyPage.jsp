<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <!-- taglib functions fn 태그 추가  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 수정</title>
<link rel="stylesheet" type="text/css" href="resources/css/joinform.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/postmap.js"></script>
<!-- <script type="text/javascript" src="resources/js/modify.js"></script> -->

<script type="text/javascript">

	var regPw = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
	var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var regPhone = /^\d{3}-\d{3,4}-\d{4}$/;

	function modify_account(f) {
		
		// 정규식 폼 체크
		if (regPw.test(f.uPassword.value) == false) {
			alert("비밀번호 형식이 맞지 않습니다.");
			f.uPassword.focus();
			return;
		}
		if (f.uPassword.value != f.pw_check.value) {
			alert("비밀번호 확인이 안 되었습니다.");
			return;
		}
		var phone = f.uPhone_first_number.value + "-"
				+ f.uPhone_middle_number.value + "-"
				+ f.uPhone_last_number.value;
		if (regPhone.test(phone) == false) {
			alert("연락처가 잘못 입력되었습니다.");
			return;
		}
		if (regEmail.test(f.uEmail.value) == false) {
			alert("이메일이 잘못 입력되었습니다.");
			return;
		}
		
		f.action = "modify";
		f.submit();
		
	}

	function check_pw_f() {
		if (regPw.test(uPassword.value) == false) {
			document.getElementById("uPw_span").innerHTML = "비밀번호 형식이 올바르지 않습니다.(6~20 사이 대문자, 소문자, 숫자, 특수문자 조합만 가능합니다.)";
		} else {
			document.getElementById("uPw_span").innerHTML = "비밀번호 형식이 맞습니다.";
		}
	}

</script>
</head>
<body>
	<c:set var="str" value="${loginDto.uPhone }" /><!-- 변수추가 loginDto.uPhone -->
	<c:set var="addr" value="${loginDto.uAddress }" /><!-- 변수추가 loginDto.uAddress -->
	<div>
		<form method="post">
			<div class = "main">
				<c:if test="${loginDto ne null }">
					<input type="hidden" name="uId_" id="uId_" value="${loginDto.uId_ }" />
				</c:if>
				
 				<h5>비밀번호</h5>
				<input type="password" class="df" name="uPassword" id="uPassword"
					onkeyup="check_pw_f()" placeholder="비밀번호" />
				<p>
					<span id="uPw_span"></span>
				</p>
				
				<h5>비밀번호 확인</h5>
				<input type="password" class="df" name="pw_check" id="pw_check" placeholder="비밀번호 확인" />
				 
				<h5>연락처</h5><!-- 휴대폰 앞자리 중간자리 뒷자리 value 추가 -->
				<input type="text" class="un" name="uPhone_first_number" class="phone"
					id="uPhone_first_number" value="${fn:substring(str, 0, 3)}" /> - <input type="text"
					name="uPhone_middle_number" class="un" id="uPhone_middle_number" value="${fn:substring(str, 4, 8)}" /> - <input
					type="text" name="uPhone_last_number" class="un" id="uPhone_last_number" value="${fn:substring(str, 9, 13)}" /> <br />
				
				<h5>이메일</h5>
				<input type="text" class="df" name="uEmail" id="uEmail" value="${loginDto.uEmail }" placeholder="이메일" /> <br />

				<h5>주소</h5> <!-- 우편번호, 우편주소, 우편 상세주소 삽입 (안나오면 substring 값을 수정하시면 됩니다.)  -->
				<%-- 밑의 두 input은 우편번호 검색 api 결과값 넣기 --%>
				<input type="text" class="un" name="uAddress_zoneCode" class="postnum" id="uAddress_zoneCode" value="${fn:substring(addr, 0, 5)}" readonly="readonly" />
				<input type="button" value="우편번호 검색" name="search_addr_btn" id="search_addr_btn" /><br /> 
				<input type="text" class="dff" name="uAddress_addr" id="uAddress_addr"  value="${fn:substring(addr, 5, 27)}" readonly="readonly" />
				<h6>상세 주소 입력</h6>
				<input type="text" class="df" name="uAddress_detail" id="uAddress_detail" value="${fn:substring(addr, 27, 30)}" /> <br />
				
				<h5>선호장르(선택)</h5>
				<select name="uGenre">
					<option value="">:: 선호하는 장르를 선택하세요 ::</option>
					<option value="literature">문학</option>
					<option value="Inscription">비문학</option>
					<option value="Humanities">인문</option>
					<option value="Natural">자연과학</option>
					<option value="Science">기술과학</option>
					<option value="Histoty">역사</option>
				</select>
				<div class="btn">
					<input type="button" class="submit" value="회원수정" onclick="modify_account(this.form)" />
					<input type="reset"  class="submit" value="다시 작성" />
				</div>
			</div>
		</form>
	</div>
</body>
</html>