function scan(f){
	
	if(f.injeung.value == ""){
		alert("인증번호를 입력 하셔야합니다.");
		f.uMail_injeung.focus();
		return;
	}
	
	if(f.injeung.value != correctCode.value){
		alert("인증번호가 틀렸습니다. 다시 확인해주세요.");
		f.uMail_injeung.focus();
		return;
	}
	
	f.action="changPw";
	f.submit();
}