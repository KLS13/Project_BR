<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title> 리뷰 다시 작성하기 </title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/templatemo_misc.css">
<link rel="stylesheet" href="css/templatemo_style.css">
<script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
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

	function commit(f) {
	
		var qContent = f.qContent.value;
	    var qGrade = f.qGrade.value;
		if(qContent == "") {
			alert("내용을 입력해주세요.");
			return false;
		}
		if(qGrade == ""){
			alert("평점을 꼭 입력해야 합니다.");
			return false;
		}
		
		
		f.action="reviewModify";
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
caption{
 font-size: 20px;
}
</style>
</head>
<body>
<div class="container">
      
<table class="table table-bordered">
    <thead>
        <caption> ${param.bTitle} 리뷰 다시 작성 하기  </caption>
    </thead>
    <tbody>
        <form method="post">
        	 <input type = "hidden" name = "bISBN" value = "${param.bISBN }"/>
    		 <input type = "hidden" name = "bTitle" value = "${param.bTitle }"/>
     		 <input type = "hidden" name = "bWriter" value = "${param.bWriter }"/>
     		 <input type = "hidden" name = "bPublisher" value = "${param.bPublisher }"/>
    		 <input type = "hidden" name = "bPubdate"value = "${param.bPubdate }"/>
    		 <input type = "hidden" name = "bImage" value = "${param.bImage }"/>
             <input type = "hidden" name = "rIdx" value = "${param.rIdx}"/>
            <tr>
                <th>작성자</th>
                <td><input type = "text" name = "uId_" value = "${loginDto.uId_}" readonly/></td>
            </tr>
            
            <tr>
                <th>리뷰 내용</th>
                <td><textarea rows="10" cols="50" placeholder="250자 이내 내용을 입력하세요. " id="qContent" name="rContent" class="form-control"> ${param.rContent }</textarea></td>
            </tr>
            
            <tr>
            <th>평점</th>
            <td>0<input id="qGrade" type="radio" name="rGrade" value = "0"/>&nbsp;&nbsp;
				1<input id="qGrade" type="radio" name="rGrade" value = "1" />&nbsp;&nbsp;
				2<input id="qGrade" type="radio" name="rGrade" value = "2" />&nbsp;&nbsp;
				3<input id="qGrade" type="radio" name="rGrade" value = "3" />&nbsp;&nbsp;
				4<input id="qGrade" type="radio" name="rGrade" value = "4" />&nbsp;&nbsp;
				5<input id="qGrade" type="radio" name="rGrade" value = "5" />
			</td>
            </tr>
            
            <tr>
                <td colspan="2">
     		 ※ 음란물, 차별, 비하, 혐오 및 초상권, 저작권 침해 게시물은 민, 형사상의 책임을 질 수 있습니다.<br />
     		 ※ 허위문의 또는 광고관련 스팸문의는 제재대상이 될 수 있습니다.
                    <button type="button" class="pull-right">
                    <img src="resources/images/취소.jpg"/>
                    </button>
                  
                    <button type="button" id="commit-btn" class="pull-right" onclick="commit(this.form)">
                    <img src="resources/images/등록.jpg"/>
                    </button>
                </td>
            </tr>
       	</form>
    </tbody>
</table>
</div>
</body>
</html>