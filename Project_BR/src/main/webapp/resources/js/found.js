function scan(f){
	
	if(f.uId_.value == ""){
		alert("아이디를 입력해주세요");
		f.email.focus();
		return;
	}
	if(f.uEmail.value == ""){
		alert("이메일을 입력해주세요");
		f.email.focus();
		return;
	}
	
	f.action="pwFindCheck";
	f.submit();
}

