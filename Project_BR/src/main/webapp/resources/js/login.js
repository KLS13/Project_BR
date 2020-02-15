function login_Start(f){
	
	if(typeof f.uId_.value == "undifine" || f.uId_.value == null || f.uId_.value == ""){
		alert("아이디를 입력하세요");
		f.uId_.focus();
		return;
	}
	
	if(typeof f.uPw.value == "undifine" || f.uPw.value == null || f.uPw.value == ""){
		alert("비밀번호를 입력하세요");
		f.uPassword.focus();
		return;
	}
	
	f.action = "login";
	f.submit();
}
