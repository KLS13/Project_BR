<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function goodsCheck(f) {
	if(f.gImage.value == "") {
		alert("사진을 첨부해주세요. (10MB 이하)");
		return false;
	}
	
	if(document.getElementById("gImage").value!=""){   /* 파일첨부 시 10MB 가 넘지 않도록  */
	    var fileSize = document.getElementById("gImage").files[0].size;
	    var maxSize = 10485760;  // 10MB
	    if(fileSize > maxSize){
	       alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다. ");
	       return false;
	    } 
	}
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
	f.action = "GoodsPostPage";
	f.submit();
}
</script>

<style>
.inputArea {
	margin: 10px 0;
}

label {
	display: inline-block;
	width: 70px;
	padding: 5px;
}

label[for='gdsDes'] {
	display: block;
}

input {
	width: 150px;
}

textarea#gdsDes {
	width: 400px;
	height: 180px;
}

.select_img img {
	margin: 20px 0;
}
.mainBody{
 margin-top: 200px;
}
</style>


</head>
<body>
<div class = "mainBody">
	<h1>관리자 상품등록 페이지</h1>

	<form role="form" method="post" autocomplete="off"
		enctype="multipart/form-data">

		<div class="inputArea">

			<label for="gName">상품명</label> <input type="text" id="gName"
				name="gName" />
		</div>

		<div class="inputArea">
			<label for="gPrice">상품가격</label> <input type="text" id="gPrice"
				name="gPrice" />
		</div>

		<div class="inputArea">
			<label for="gQuantity">상품수량</label> <input type="text" id="gQuantity"
				name="gQuantity" />
		</div>


		<div class="inputArea">
			<label for="gImage">상품사진</label> <input type="file" id="gImage"
				name="file" />
		</div>
	
		<div class="inputArea">
			<label for="gDetail">상품상세</label> 
			<pre>
			<textarea rows="5" cols="50" id="gDetail" name="gDetail">
제품이름 :  ,
제조국가 : 대한민국 ,
제품소재 :  ,
제품규격 : 미정 ,
제품중량 : 미정 ,
제품상태 : 새 제품 ,
평균배송 : 2~3일  ,
유의사항 : ※ 제품의 색상은 화면과 다소 차이가 있을 수 있습니다.  
</textarea>
</pre>
		</div>

		저장 경로 체크 :
		<%=request.getRealPath("/")%>
		<div class="inputArea">
			<input type="button" value="등록" onclick="goodsCheck(this.form)" />
		</div>

	</form>
	</div>
</body>
</html>