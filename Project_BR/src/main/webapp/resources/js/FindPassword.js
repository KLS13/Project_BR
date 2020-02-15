var regPw = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
	function scan(f) {
		
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
		
		// 알림
		var select = confirm("비밀번호를 변경하시겠습니까?");
		if(select){
			alert("비밀번호가 변경되었습니다.");
			f.action = "ChangePw";
			f.submit();
		}else{
			alert("비밀번호가 변경되지 않았습니다.");
			return;
		}
		
		
		

	}
	
	function check_pw_f() {
		if (regPw.test(uPassword.value) == false) {
			document.getElementById("uPw_span").innerHTML = "비밀번호 형식이 올바르지 않습니다.(6~20 사이 대문자, 소문자, 숫자, 특수문자 조합만 가능합니다.)";
		} else {
			document.getElementById("uPw_span").innerHTML = "비밀번호 형식이 맞습니다.";
		}
	}
	