<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>My Orders Form</title>


<link href="${pageContext.request.contextPath}/yul/css/sub.css" rel="stylesheet"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
<%-- 헤더(메뉴바) --%>
<%@ include file = "/WEB-INF/jsp/yul/comm/header.jsp"%>

<div id="contentContainer">
	<aside id="subMenu">
		<div class="orderMenu">
			<div id="orderListA" ><a href="<c:url value='/orders/list.do' />">My Order List</a></div>
			<div id="orderFormA" style="text-decoration: underline;"><a href="<c:url value='/orders/form.do' />">Make Order Form</a></div>
			<%-- <ul>
				<li><a href="<c:url value='/orders/list.do' />">My Order List</a></li>
				<li><a href="<c:url value='/orders/form.do' />">Make Order Form</a></li>
			</ul> --%>
		</div>
	</aside>
	<section>
		<c:choose> <%-- 아래의 폼에 담긴 정보가 이동할 주소를 결정 --%>
			<c:when test="${not empty searchVO.orderId}">
				<c:url var="actionUrl" value="/orders/update.do" />
				<c:set var="submitBtn" value="수정하기"></c:set>
			</c:when>
			<c:otherwise>
				<c:url var="actionUrl" value="/orders/insert.do"/>
				<c:set var="submitBtn" value="주문하기"></c:set>
			</c:otherwise>
		</c:choose>
		<div id="orderFormTable" style="width:60%; margin:5% auto;">
		<form id="orderFormSubmint" action="${actionUrl}" method="post" onsubmit="return regist()">
			<table style="width:100%; font-size: 16px;">
			<colgroup>
				<col style="width : 40%">
				<col />
			</colgroup>
			
				<tr>
					<th>주문자 ID</th>
					<td>
						<input type="text" id="ordererId" name="ordererId" value="${USER_INFO.emplyrId}" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<th>주문자 이름</th>
					<td>
						<input type="text" id="ordererName" name="ordererName" value="${USER_INFO.userNm}" readonly="readonly"/>
					</td>
				</tr>

				<c:choose>
					<c:when test="${not empty searchVO.orderId}">
						<input type="hidden" id="orderId" name="orderId" value="${searchVO.orderId}" />
						<tr>
							<th>주문자 번호</th>
							<td>
								<input type="text" id="recipientPhone" name="recipientPhone" value="${result.recipientPhone}" />
							</td>
						</tr>
						<tr>
							<th>배송 주소</th>
							<td><input type="text" id="recipientAddress"
								name="recipientAddress" value="${result.recipientAddress}" />
							</td>
						</tr>
						<tr>
							<th>배송 상세주소</th>
							<td>
								<input type="text" id="recipientDetailAddress" name="recipientDetailAddress" value="${result.recipientDetailAddress}" />
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<th>주문자 번호</th>
							<td>
								<input type="text" id="recipientPhone" name="recipientPhone" value="${USER_INFO.mbtlnum}" />
							</td>
						</tr>
						<tr>
							<th>배송 주소</th>
							<td><input type="text" id="recipientAddress"
								name="recipientAddress" value="${USER_INFO.houseAdres}" />
							</td>
						</tr>
						<tr>
							<th>배송 상세주소</th>
							<td>
								<input type="text" id="recipientDetailAddress" name="recipientDetailAddress" value="${USER_INFO.detailAdres}" />
							</td>
						</tr>
					</c:otherwise>
				</c:choose>

				
				<tr>
					<th>요청사항</th>
					<td>
						<textarea name="requestedTerm" rows="5" cols="30"><c:out value="${result.requestedTerm}" /></textarea>
					</td>
				</tr>
				
				<tr>
					<th>주문 제품</th>
					<td>
						<table style="width:80%; font-size: 14px;">
							<tr>
								<th style="width: 20%;">베이스 :</th>
								<td>
									<select name="orderProductFirst">
										<option>-- 선택하세요 --</option>
										<option value="베이스 워터 1" <c:if test="${result.orderProductFirst eq '베이스 워터 1'}">selected="selected"</c:if>> 베이스 워터 1 </option>
										<option value="베이스 워터 2" <c:if test="${result.orderProductFirst eq '베이스 워터 2'}">selected="selected"</c:if>> 베이스 워터 2 </option>
										<option value="베이스 워터 3" <c:if test="${result.orderProductFirst eq '베이스 워터 3'}">selected="selected"</c:if>> 베이스 워터 3 </option>
										<option value="베이스 워터 4" <c:if test="${result.orderProductFirst eq '베이스 워터 4'}">selected="selected"</c:if>> 베이스 워터 4 </option>
										<option value="베이스 워터 5" <c:if test="${result.orderProductFirst eq '베이스 워터 5'}">selected="selected"</c:if>> 베이스 워터 5 </option>
									</select>
								</td>
							</tr>
							<tr>
								<th  style="width: 30%;">기능 :</th>
								<td>
									<select name="orderProductLast">
										<option>-- 선택하세요 --</option>
										<option value="기능성 성분 1" <c:if test="${result.orderProductLast eq '기능성 성분 1'}">selected="selected"</c:if>>기능성 성분 1</option>
										<option value="기능성 성분 2" <c:if test="${result.orderProductLast eq '기능성 성분 2'}">selected="selected"</c:if>>기능성 성분 2</option>
										<option value="기능성 성분 3" <c:if test="${result.orderProductLast eq '기능성 성분 3'}">selected="selected"</c:if>>기능성 성분 3</option>
										<option value="기능성 성분 4" <c:if test="${result.orderProductLast eq '기능성 성분 4'}">selected="selected"</c:if>>기능성 성분 4</option>
										<option value="기능성 성분 5" <c:if test="${result.orderProductLast eq '기능성 성분 5'}">selected="selected"</c:if>>기능성 성분 5</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>보습 :</th>
								<td>
									<select name="orderProductMiddle">
										<option>-- 선택하세요 --</option>
										<option value="보습제 1" <c:if test="${result.orderProductMiddle eq '보습제 1'}">selected="selected"</c:if>>보습제 1</option>
										<option value="보습제 2" <c:if test="${result.orderProductMiddle eq '보습제 2'}">selected="selected"</c:if>>보습제 2</option>
										<option value="보습제 3" <c:if test="${result.orderProductMiddle eq '보습제 3'}">selected="selected"</c:if>>보습제 3</option>
										<option value="보습제 4" <c:if test="${result.orderProductMiddle eq '보습제 4'}">selected="selected"</c:if>>보습제 4</option>
										<option value="보습제 5" <c:if test="${result.orderProductMiddle eq '보습제 5'}">selected="selected"</c:if>>보습제 5</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>패키지 :</th>
								<td>
									<select name="orderProducPackage">
										<option>-- 선택하세요 --</option>
										<option value="패키지 1" <c:if test="${result.orderProducPackage eq '패키지 1'}">selected="selected"</c:if>>패키지 1</option>
										<option value="패키지 2" <c:if test="${result.orderProducPackage eq '패키지 2'}">selected="selected"</c:if>>패키지 2</option>
										<option value="패키지 3" <c:if test="${result.orderProducPackage eq '패키지 3'}">selected="selected"</c:if>>패키지 3</option>
										<option value="패키지 4" <c:if test="${result.orderProducPackage eq '패키지 4'}">selected="selected"</c:if>>패키지 4</option>
										<option value="패키지 5" <c:if test="${result.orderProducPackage eq '패키지 5'}">selected="selected"</c:if>>패키지 5</option>
									</select>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<th>주문 금액</th>
					<td>
						<input type="text" id="orderAmount" name="orderAmount" value="0" readonly="readonly"/>
					</td>
				</tr>
				
			</table>
			<input type="submit" value="${submitBtn}">
			
		</form>
		</div>
	</section>
</div>

<%-- footer --%>
<%@ include file = "/WEB-INF/jsp/yul/comm/footer.jsp"%>

<script type="text/javascript">

$(document).ready(function(){
	$("[name='orderProductFirst'], [name='orderProductLast'], [name='orderProductMiddle'], [name='orderProducPackage']").change(function(){
		var a = 5000;
		var b = 4000;
		var c = 6000;
		var d = 2000;
		var sum=0;
		if($("[name='orderProductFirst']").val()!='-- 선택하세요 --')
			sum= sum+a;
		if($("[name='orderProductLast']").val()!='-- 선택하세요 --')
			sum= sum+b;
		if($("[name='orderProductMiddle']").val()!='-- 선택하세요 --')
			sum= sum+c;
		if($("[name='orderProducPackage']").val()!='-- 선택하세요 --')
			sum= sum+d;
		
		$("#orderAmount").val(sum);
		
	});
});



function regist(){
	if(!$("#recipientPhone").val()){	
		alert("주문자 번호를 입력해주세요.");
		$("#recipientPhone").focus();
		return false;
	}
	else if(!$("#recipientAddress").val()){	
		alert("배송 주소를 입력해주세요.");
		$("#recipientAddress").focus();
		return false;
	}
	else if(!$("#recipientDetailAddress").val()){	
		alert("상세주소를 입력해주세요.");
		$("#recipientDetailAddress").focus();
		return false;
	}
	else if(!$("[name='requestedTerm']").val()){	
		alert("요청사항을 확인해주세요");
		$("[name='requestedTerm']").focus();
		return false;
	}
	else if($("[name='orderProductFirst']").val()=='-- 선택하세요 --'){
		alert("베이스 워터를 선택해주세요.");
		$("[name='orderProductFirst']").focus();
		return false;
	}
	else if($("[name='orderProductLast']").val()=='-- 선택하세요 --'){
		alert("기능성 성분을 선택해주세요.");
		$("[name='orderProductLast']").focus();
		return false;
	}
	else if($("[name='orderProductMiddle']").val()=='-- 선택하세요 --'){
		alert("보습제를 선택해주세요.");
		$("[name='orderProductMiddle']").focus();
		return false;
	}
	else if($("[name='orderProducPackage']").val()=='-- 선택하세요 --'){
		alert("패키지를 선택해주세요.");
		$("[name='orderProducPackage']").focus();
		return false;
	}
	else{
		if('${searchVO.orderId}'==""){
			alert("주문서 작성을 완료했습니다. 승인을 기다려주세요.");
		}
		
		return true;
	}
		//!$("[name='sexdstnCode']").val()||
}
</script>
</body>
</html>