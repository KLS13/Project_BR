<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Write something else you want</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function () {
    $('#qContent').keyup(function(){
        cut_500(this);
    });

    $('#commit-btn').click(function(){
        if(getTextLength($('#qContent').val()) > 500){
            
            return false;
        }
    });
});

function getTextLength(str) {
    var len = 0;
    for (var i = 0; i < str.length; i++) {
        if (escape(str.charAt(i)).length == 6) {
            len++;
        }
        len++;
    }
    return len;
}

function cut_500(obj){
    var text = $(obj).val();
    var leng = text.length;
    while(getTextLength(text) > 500){
        leng--;
        text = text.substring(0, leng);
    }
    $(obj).val(text);
    $('#qContent').text(getTextLength(text));
}

	function update(f) {
		var qCategory = f.qCategory.value;
		var qTitle = f.qTitle.value;
		var qContent = f.qContent.value;
		
		if(qCategory == "") {
			alert("문의유형을 선택해주세요.");
			return false;
		}
		if(qTitle == "") {
			alert("제목을 입력해주세요.");
			return false;
		}
		if(qContent == "") {
			alert("내용을 입력해주세요.");
			return false;
		}
		
		f.action="qnaModify";
		f.submit();
	}
</script>
<style type="text/css">
.pull-right {
	background-color: white;
	border: 0px;
}

.container {
	margin-top: 100px;
}
</style>
</head>
<body>


<div class="container">
      
<table class="table table-bordered">
    <thead>
        <caption> 고객지원 - 문의하기 </caption>
    </thead>
    <tbody>
        <form method="post">
        	<tr>
        		<th>문의 유형</th>
        		<td>
        		<select id="qCategory" name="qCategory">		
        			<option value="">문의유형선택</option>
        			<option value="1">공지사항</option>
        			<option value="2">가입정보변경</option>
        			<option value="3">오류 및 신고</option>
        			<option value="4">기타</option>
        		</select>
        		</td>
        	</tr>
            <tr>
                <th>문의 제목</th>
                <td><input type="text" id="qTitle" name="qTitle" value="${qDto.qTitle}"
                class="form-control" placeholder="제목을 입력하세요."/></td>
            </tr>
            <tr>
                <th>작성자 ID</th>
                 <td>${qDto.uId_ }</td>
            </tr>
            <tr>
                <th>문의 내용</th>
                
                <td><pre><textarea rows="10" cols="50" placeholder="250자 이내 내용을 입력하세요. " id="qContent" name="qContent" class="form-control">${qDto.qContent }</textarea></pre></td>
            </tr>

            <tr>
                <td colspan="2">
     		 ※ 음란물, 차별, 비하, 혐오 및 초상권, 저작권 침해 게시물은 민, 형사상의 책임을 질 수 있습니다.<br />
     		 ※ 허위문의 또는 광고관련 스팸문의는 제재대상이 될 수 있습니다.
                    <button type="button" class="pull-right">
                    <img src="resources/images/취소.jpg"/>
                    </button>
                  
                    <button type="button" id="commit-btn" class="pull-right" onclick="update(this.form)">
                    <img src="resources/images/등록.jpg"/>
                    </button>
                    <input type="hidden" id="qIdx" name="qIdx" value="${qDto.qIdx }">
                </td>
            </tr>
       	</form>
    </tbody>
</table>
</div>
</body>
</html>