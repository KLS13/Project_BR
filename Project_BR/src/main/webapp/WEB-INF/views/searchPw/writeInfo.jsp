<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인증하기</title>
<link rel="stylesheet" type="text/css" href="resources/css/loginform.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	var authKey = 0;
	$(function(){
		$("#sendKeyBtn").click(function(){
			if($("#uId_").val() == ""){
				alert("회원 아이디를 입력하세요.");
				return;
			}
			if($("#uName").val() == ""){
				alert("회원 이름 입력하세요.");
				return;
			}
			
			var keyBox = "<input type='text' name='userKey'class='un' id='userKey'/> <button type='button' id='confirmBtn'>인증하기</button>";
			$("#confirmForm").empty();
			$("#confirmForm").append(keyBox);
			var uId = $("#uId_").val();
			var uName = $("#uName").val();
			if($(":checked").val() == "byEmail"){
				$.ajax({
					url:"searchPwByEmail",
					type:"POST",
					data:"uId_="+uId+"&uName="+uName,
					dataType:"json",
					success:function(data){
						var obj = data;
						authKey = obj.authKey;
						alert("인증번호를 전송하였습니다. 아이디와 이름이 일치하지 않으면 전송이 안될수도 있습니다.");
					},
					error:function(){
						alert("error 관리자에게 문의하세요.");
					}
				});
			}else if($(":checked").val() == "byPhone"){
				$.ajax({
					url:"searchPwByPhone",
					type:"POST",
					data:"uId_="+uId+"&uName="+uName,
					dataType:"json",
					success:function(data){
						var obj = data;
						authKey = obj.authKey;
						alert("인증번호를 전송하였습니다. 아이디와 이름이 일치하지 않으면 전송이 안될수도 있습니다.");
					},
					error:function(){
						alert("error 관리자에게 문의하세요.");
					}
				});
			}else{
				alert("인증방식을 선택하세요.");
				return;
			}
			$("#confirmBtn").click(function(){
				if($("#userKey").val() == authKey){
					alert("인증되었습니다.");
					location.href="pwChangePage?uId_=" + uId;/* 여기에 비밀번호 변경 페이지 주소를 넣어주세요. 추가로 필요한 파라미터도 같이 넘겨주셔야 합니다. */
				}else{
					alert("인증에 실패했습니다.");
					return;
				}
			});
		});
	});
</script>
</head>
<body>
	<form id="searchPwForm">
		<div class="searchBox">
			<input type="text" name="uId_" class="un" id="uId_" placeholder="아이디" /><br/>
			<input type="hidden" name="uId_" />
			<input type="text" name="uName" class="un" id="uName" placeholder="이름" /><br/>
			<input type="hidden" name="uName" />
			<h5>인증번호는 회원가입시 작성했던 정보를 기반으로 전달됩니다.</h5>
			<p>
				<input type="radio" name="means" value="byEmail">이메일 인증 
				<input type="radio" name="means" value="byPhone">휴대폰 인증&nbsp;&nbsp;
				<button type="button" id="sendKeyBtn">인증번호 전송</button>
			</p>
			<div id="confirmForm">
			</div>
		</div>
	</form>
</body>
</html>