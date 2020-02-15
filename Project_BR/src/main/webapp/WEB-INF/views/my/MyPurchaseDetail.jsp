<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/head.jsp" %>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function checkSearch(){
		var isSearch = "${sessionScope.search}";
		if(isSearch =="YES"){
			location.href="mySearchPurchase?key=${key}&value=${value}&currentPage=${currentPage}";
		}else{
			location.href="myPurchaseList?currentPage=${currentPage}";
		}
	}
	$(document).ready(function(){
		$("#searchNoBtn").click(function(){
			var t_invoice = "${pDto.pInvoiceNo}";
			var t_code = "";
			var t_key = "";
			$.ajax({
				url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key=" + t_key + "&t_code=" + t_code + "&t_invoice=" + t_invoice,
				dataType:"json",
				type:"GET",
				success:function(data){
					console.log(data);
					var invoiceData = "";
					if(data.status == false){
						invoiceData += ("<tr><td>" + data.msg + "</td></tr>");
					}else{
						invoiceData += ("<tr>");
						invoiceData += ("<th>배송완료 여부</th>");
						if(data.completeYN == "Y"){
							invoiceData += ("<td>배송완료 </td>");
						}else{
							invoiceData += ("<td>배송중 </td>");
						}
						invoiceData += ("</tr><tr><th>배송완료 예정시간</th>");
						invoiceData += ("<td>" + data.estimate + "</td>");
						invoiceData += ("</tr><tr>");
						invoiceData += ("<th>진행단계</th>");
						if(data.level == "1"){
							invoiceData += ("<td>배송 준비중</td>");
						}else if(data.level == "2"){
							invoiceData += ("<td>집화완료</td>");
						}else if(data.level == "3"){
							invoiceData += ("<td>배송중</td>");
						}else if(data.level == "4"){
							invoiceData += ("<td>지점 도착</td>");
						}else if(data.level == "5"){
							invoiceData += ("<td>배송출발</td>");
						}else{
							invoiceData += ("<td>배송완료</td>");
						}
						invoiceData += ("</tr><tr><th>조회결과</th>");
						invoiceData += ("<td>" + data.result + "</td>");
						invoiceData += ("</tr>")
					}
					$("#trackingInfo").html(invoiceData)
					
					var trackingDetails = data.trackingDetails;
					
					var tracking="";
					var header = "";
					header += ('<tr>');
					header += ('<th>' + "시간" + '</th>');
					header += ('<th>' + "장소" + '</th>');
					header += ('<th>' + "유형" + '</th>');
					header += ('<th>' + "전화번호" + '</th>');
					header += ('</tr>');
					
					$.each(trackingDetails, function(key, value){
						tracking += ('<tr>');
						tracking += ('<td>' + value.timeString + '</td>');
						tracking += ('<td>' + value.where + '</td>');
						tracking += ('<td>' + value.kind + '</td>');
						tracking += ('<td>' + value.telno + '</td>');
						tracking += ('</tr>');
					});
					$("#trackingDetail").html(header + tracking);
				}
			});
		});
	});
</script>
<style type="text/css">
.Detail-title{
	font-size: 1.3em;
	text-align:center;
	}
</style>
</head>
<body>
<div id="wrapper">
<%@ include file="template/mainHeader.jsp" %>
<%@ include file="template/mainLeftNavPurchase.jsp" %>
	<%@ include file="template/mainBodyTopPurchaseDetail.jsp" %>
	<div class="col-md-12">
		<table class="information-detail-table">
			<tr>
				<td class="Detail-title">교환번호</td>
				<td>${pDto.pIdx }</td>
			</tr>
			<tr>
				<td class="Detail-title">유저ID</td>
				<td>${pDto.uId_ }</td>
			</tr>
			<tr>
				<td class="Detail-title">물품번호</td>
				<td>${pDto.gIdx }</td>
			</tr>
			<tr>
				<td class="Detail-title">물품명</td>
				<td>${gDto.gName }</td>
			</tr>
			<tr>
				<td class="Detail-title">교환 수량</td>
				<td>${pDto.pQuantity }</td>
			</tr>
			<tr>
				<td class="Detail-title">사용 포인트</td>
				<td>${pDto.pQuantity * gDto.gPrice }</td>
			</tr>
			<tr>
				<td class="Detail-title">받는 이</td>
				<td>${pDto.pReceiver }</td>
			</tr>
			<tr>
				<td class="Detail-title">연락처</td>
				<td>${pDto.pPhone}</td>
			</tr>
			<tr>
				<td class="Detail-title">주소</td>
				<td>
					${zoneCode}<br/>
					${address }<br/>
					${pDto.pAddressDetail }
				</td>
			</tr>
			<tr>
				<td class="Detail-title">교환일</td>
				<td>${pDto.pDate }</td>
			</tr>
			<tr>
				<td class="Detail-title">운송장번호</td>
				<td>
				<c:choose>
					<c:when test="${pDto.pInvoiceNo eq null }">
						물품 준비 중
					</c:when>
					<c:otherwise>
						${pDto.pInvoiceNo }<br/>
						<input type="button" name="searchNoBtn" id="searchNoBtn" value="운송장조회"/>
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
		</table>
		<br/>
		<div class="btn-box">
			<!-- <input type="button" value="목록으로 이동" onclick="checkSearch()"/> -->
			<a href='javascript:void(0);' onclick="checkSearch();" class="btn btn-primary btn-warning"><span class="glyphicon glyphicon-list"></span> 목록</a>
		</div>
		<br/>
		<hr/>
		<br/>
		<div id="searchNoResult">
			<table id="trackingInfo"  class="table table-striped table-bordered table-hover">
			</table>
			<br/>
			<table id="trackingDetail"  class="table table-striped table-bordered table-hover">
			</table>
		</div>
	</div>
	<%@ include file="template/mainBodyBottom.jsp" %>
</div>
<%@ include file="template/mainFooter.jsp" %>
</body>
</html>