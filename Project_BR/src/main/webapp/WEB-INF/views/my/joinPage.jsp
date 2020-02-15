<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="resources/css/joinform.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/postmap.js"></script>
<script type="text/javascript" src="resources/js/join.js"></script>

</head>
<body>
	<div>
		<form method="post">
			<div class = "main">
				<h5>아이디</h5>
				<%-- 아이디 중복체크 추가해야함 --%>
				<input type="text" class="df" name="uId_" id="uId_" onkeyup="check_id_f()" placeholder="아이디" />
				<input type="button" value="중복확인" class="submit" onclick="idCheck()" />
				<p>
					<span id="uId_span"></span>
				</p>
				<h5>비밀번호</h5>
				<input type="password" class="df" name="uPassword" id="uPassword"
					onkeyup="check_pw_f()" placeholder="비밀번호" />
				<p>
					<span id="uPw_span"></span>
				</p>
				<h5>비밀번호 확인</h5>
				<input type="password" class="df" name="pw_check" id="pw_check" placeholder="비밀번호 확인" />
				<h5>이름</h5>
				<input type="text" class="df" name="uName" id="uName" placeholder="이름" />
				<h5>생년월일</h5>
				<input type="text" class="un" name="uBirthYear" class="birth" id="uBirthYear" placeholder="년" />년 <select
					name="uBirthMonth" id="uBirthMonth">
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>월 
				<input type="text" name="uBirthDate" class="un" id="uBirthDate" placeholder="일" />일 <br />
				
				<h5>연락처</h5>
				<input type="text" class="un" name="uPhone_first_number" class="phone"
					id="uPhone_first_number" /> - <input type="text"
					name="uPhone_middle_number" class="un" id="uPhone_middle_number" /> - <input
					type="text" name="uPhone_last_number" class="un" id="uPhone_last_number" /> <br />
				<h5>이메일</h5>
				<input type="text" class="df" name="uEmail" id="uEmail" placeholder="이메일" /> <br />

				<h5>주소(선택)</h5>
				<%-- 밑의 두 input은 우편번호 검색api 결과값 넣기 --%>
				<input type="text" class="un" name="uAddress_zoneCode" class="postnum" id="uAddress_zoneCode" readonly="readonly" />
				<input type="button" value="우편번호 검색" name="search_addr_btn" id="search_addr_btn" /><br /> 
				<input type="text" class="dff" name="uAddress_addr" id="uAddress_addr" readonly="readonly" />
				<h6>상세 주소 입력</h6>
				<input type="text" class="df" name="uAddress_detail" id="uAddress_detail" /> <br />
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
					<input type="button" class="submit" value="회원가입" onclick="create(this.form)" />
					<input type="reset"  class="submit" value="다시 작성" />
				</div>
			</div>
		</form>
	</div>
</body>
</html>