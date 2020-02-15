src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"

var regId = /^[a-z][a-zA-Z0-9]{3,11}$/;
var regPw = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
var regPhone = /^\d{3}-\d{3,4}-\d{4}$/;
	
function create(f) {
	
	// 정규식 폼 체크
	if (regId.test(f.uId_.value) == false) {
		alert("아이디 형식이 맞지 않습니다.");
		f.uId_.focus();
		return;
	}
	
	if (regPw.test(f.uPassword.value) == false) {
		alert("비밀번호 형식이 맞지 않습니다.");
		f.uPassword.focus();
		return;
	}
	if (f.uPassword.value != f.pw_check.value) {
		alert("비밀번호 확인이 안 되었습니다.");
		return;
	}
	if ((isNaN(f.uBirthYear.value) || isNaN(f.uBirthDate.value)) == true) {
		alert("생년월일이 잘못 입력되었습니다.");/* year는 4자리가 맞는지, day는 1~31안에 들어와 있는지 추가 확인을 구현해야함 */
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
	
	f.action = "join";
	f.submit();
}

// id 중복 확인 체크
$(function(){
	$("#uId_").keyup(function(){
		$.ajax({
			url: "idCheck",
			method: "GET",
			data: "uId_=" + $("#uId_").val(),
			success : function(data){
				var obj = data;
				if ( regId.test($("#uId_").val()) ) {
					if(obj.RESULT == 1) {
						$("#uId_span").text("사용이 가능한 아이디입니다.");
					} else {
						$("#uId_span").text("이 아이디는 이미 존재합니다.");
					}
				} else {
					$("#uId_span").text("아이디 형식이 올바르지 않습니다.(3~11자 영어 소문자, 대문자, 숫자 조합만 가능합니다.)");
				}
			} // end success
		}); // end ajax
	}); // end click
}); // end function



function check_pw_f() {
	if (regPw.test(uPassword.value) == false) {
		document.getElementById("uPw_span").innerHTML = "비밀번호 형식이 올바르지 않습니다.(6~20 사이 대문자, 소문자, 숫자, 특수문자 조합만 가능합니다.)";
	} else {
		document.getElementById("uPw_span").innerHTML = "비밀번호 형식이 맞습니다.";
	}
}