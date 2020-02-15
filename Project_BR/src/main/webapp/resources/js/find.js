
function scan_id(f){
	if(f.uName.value == ""){
		alert("이름을 입력해주세요");
		f.name.focus();
		return;
	}
	if(f.uEmail.value == ""){
		alert("이메일을 입력해주세요");
		f.email.focus();
		return;
	}
	
	f.action="idFind";
	f.submit();
}
