<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Write something else you want</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<script type="text/javascript">
	function qnaRemove(f) {
		var result = confirm("문의내용을 삭제하시겠습니까?");

		if (result) {
			f.action = "qnaDelete";
			f.submit();
		} else {
			return false;
		}
	}

	$(document).ready(function() {
		$('#cContent').keyup(function() {
			cut_500(this);
		});

		$('#commit-btn').click(function() {
			if (getTextLength($('#cContent').val()) > 500) {

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

	function cut_500(obj) {
		var text = $(obj).val();
		var leng = text.length;
		while (getTextLength(text) > 500) {
			leng--;
			text = text.substring(0, leng);
		}
		$(obj).val(text);
		$('#cContent').text(getTextLength(text));
	}

	function commentCommit(f) {

		var cContent = f.cContent.value;

		if (cContent == "") {
			alert("내용을 입력해주세요.");
			return false;
		}

		f.action = "commentWrite";
		f.submit();
	}
</script>
<style type="text/css">
.container {
	margin-top: 150px;
}

tr :nth-child(1) {
	width: 150px;
}

pre {
	width: 500px;
}

.pull-right {
	background: white;
	border: 0px;
}
</style>

</head>
<body>
	<div class="container">

		<table class="table table-bordered" style="margin-bottom: 100px">
			<thead>
			<caption>고객지원 - 문의내용</caption>
			</thead>
			<tbody>
				<form method="post">
					<tr>
						<th>문의 유형</th>
						<td><c:if test="${qDto.qCategory eq 1 }">
        		공지사항
        		</c:if> <c:if test="${qDto.qCategory eq 2 }">
        		배송 및 포인트
        		</c:if> <c:if test="${qDto.qCategory eq 3 }">
        		오류 및 신고
        		</c:if> <c:if test="${qDto.qCategory eq 4 }">
        		기타
        		</c:if></td>
					</tr>
					<tr>
						<th>문의 제목</th>
						<td>${qDto.qTitle }</td>
					</tr>
					<tr>
						<th>작성자 ID</th>
						<td>${qDto.uId_ }</td>
					</tr>
					<tr>
						<th>문의 내용</th>
						<td style="white-space: pre-line;">${qDto.qContent}</td>
					</tr>

					<tr>
						<td colspan="2">
						<c:if test="${sessionScope.loginDto.uId_ eq qDto.uId_ or sessionScope.loginDto.uId_ eq 'admin'}">
							<button type="button" value="수정하기"
								onclick="location.href='qnaModifyPage?qIdx=${qDto.qIdx}'"
								class="pull-right">
								<img src="images/수정.png" />
							</button>
							<button type="button" value="삭제하기" onclick="qnaRemove(this.form)"
								class="pull-right">
								<img src="images/삭제.png" />
							</button>

							
						</c:if>
							<button type="button" value="목록으로 가기"
								onclick="location.href='qnaListPage'" class="pull-right">
								<img src="images/목록.png" />
							</button> <input type="hidden" id="qIdx" name="qIdx" value="${qDto.qIdx}">
						</td>
					</tr>
				</form>
			</tbody>

		</table>

		<c:if test="${qDto.qCategory ne 1 }">
			<table class="table table-bordered">
				<thead>
				<caption>관리자 - 답변내용</caption>
				</thead>
				<tbody>
					<c:if test="${empty cDto}">
						<tr>
							<td colspan="2">답변내용이 없습니다.</td>
					</c:if>

					<c:if test="${!empty cDto}">
						<tr>
							<th>답변 등록일</th>
							<td>${cDto.cDate}</td>
						</tr>
						<tr>
							<th>답변 제목</th>
							<td>${qDto.uId_ }님 답변입니다.</td>
						</tr>
						<tr>
							<th>답변 내용</th>
							<td style="white-space: pre-line;">${cDto.cContent}</td>
						</tr>
						<tr>
							<td colspan="2">
						<c:if test="${sessionScope.loginDto.uId_ eq 'admin'}">
							<button type="button" value="수정하기"
								onclick="location.href='commentModifyPage?qIdx=${cDto.qIdx}'"
								class="pull-right">
								<img src="images/수정.png" />
							</button>
						</c:if>
						</tr>
					</c:if>
				</tbody>
			</table>
		</c:if>
		<c:if test="${sessionScope.loginDto.uMemberShip eq 'admin' and empty cDto}">

			<form method="post">
				<!-- 관리자만 -->
				<table class="table table-bordered" style="width: 100%">
					<thead>
					<caption>관리자 - 답변하기</caption>
					</thead>
					<tbody>
						<tr>
							<th>답변 제목</th>
							<td>${qDto.uId_ }님 답변입니다.</td>
						</tr>
						<tr>
							<th>답변 내용</th>

							<td><pre style="width: 100%">
									<textarea style="width: 100%; resize: none;" rows="10"
										placeholder="250자 이내 내용을 입력하세요." id="cContent" name="cContent"
										class="form-control"></textarea>
								</pre></td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" id="commit-btn" class="pull-right"
									onclick="commentCommit(this.form)">
									<img src="images/등록.jpg">
								</button> <input type="hidden" id="qIdx" name="qIdx"
								value="${qDto.qIdx }">
								</form>
					</tbody>
				</table>
		</c:if>
	</div>
</body>
</html>