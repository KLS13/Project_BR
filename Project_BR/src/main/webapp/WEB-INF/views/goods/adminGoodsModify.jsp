<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function goodsReConfirm(f) {

	if ( f.gPrice.value == "" ) {
		alert("가격을 입력해주세요.");
		f.gPrice.focus();
		return false;
	}
	if ( f.gQuantity.value == "" ) {
		alert("수량을 입력하세요.");
		f.gQuantity.focus();
		return false;
	}
	if ( f.gName.value == "" ) {
		alert("상품명을 입력하세요.");
		f.gName.focus();
		return false;
	}
	f.action = "adminModifyRegPage";
	f.submit();
}

</script>
<style>
	.inputArea{
		margin: 10px 0;
	}
	label{
		display: inline-block;
		width : 70px;
		padding: 5px;
	}
	
	label[for='gdsDes'] {
		display: block;
	}
	
	input {
		width : 150px;
	}
	textarea#gdsDes {
	width : 400px;
	height : 180px;
	}
	
	.select_img img {
	margin : 20px 0;
	}
</style>


</head>
<body>
<h1>관리자 상품수정 페이지</h1>

<form role="form" method="post" autocomplete="off">

<div class="inputArea">
등록일 : ${gdto.gDate}
</div>

<div class="inputArea">
<input type="hidden" id="gIdx" name="gIdx" value="${gdto.gIdx }" />

 <label for="gName">상품명</label>
 <input type="text" id="gName" name="gName" value="${gdto.gName }"/>
</div>

<div class="inputArea">
 <label for="gPrice">상품가격</label>
 <input type="text" id="gPrice" name="gPrice" value="${gdto.gPrice}" />
</div>

<div class="inputArea">
 <label for="gQuantity">상품수량</label>
 <input type="text" id="gQuantity" name="gQuantity" value="${gdto.gQuantity}" />
</div>

<div class="inputArea">
 <label for="gDetail">상품소개</label>
 <textarea rows="5" cols="50" id="gDetail" name="gDetail">
 	${gdto.gDetail }
 	
 </textarea>
</div>
<div class="inputArea">
 <input type="button" value="재등록" onclick="goodsReConfirm(this.form)"/>
</div>
</form>
</body>
</html>