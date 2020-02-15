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
	
	
	