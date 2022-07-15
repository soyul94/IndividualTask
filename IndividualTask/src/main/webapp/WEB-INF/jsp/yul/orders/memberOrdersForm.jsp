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
		<ul>
			<li><a href="<c:url value='/orders/list.do' />">My Order List</a></li>
			<li><a href="<c:url value='/orders/form.do' />">Make Order Form</a></li>
		</ul>
	</aside>
	<section>
		<c:choose> <%-- 아래의 폼에 담긴 정보가 이동할 주소를 결정 --%>
			<c:when test="${not empty searchVO.orderId}">
				<c:url var="actionUrl" value="/orders/update.do" />
			</c:when>
			<c:otherwise>
				<c:url var="actionUrl" value="/orders/insert.do"/>
			</c:otherwise>
		</c:choose>
		
		<form action="${actionUrl}" method="post" >
			<table style="width:100%">
			<colgroup>
				<col style="width : 30%">
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
						<table>
							<tr>
								<th>베이스 :</th>
								<td>
									<select name="orderProductFirst">
										<option value="-- 베이스 --">-- 선택하세요 --</option>
										<option value="베이스 워터 1">베이스 워터 1</option>
										<option value="베이스 워터 2">베이스 워터 2</option>
										<option value="베이스 워터 3">베이스 워터 3</option>
										<option value="베이스 워터 4">베이스 워터 4</option>
										<option value="베이스 워터 5">베이스 워터 5</option>
									</select>
								</td>
								<th>기능 :</th>
								<td>
									<select name="orderProductLast">
										<option value="-- 기능성 --">-- 선택하세요 --</option>
										<option value="기능성 성분 1">기능성 성분 1</option>
										<option value="기능성 성분 2">기능성 성분 2</option>
										<option value="기능성 성분 3">기능성 성분 3</option>
										<option value="기능성 성분 4">기능성 성분 4</option>
										<option value="기능성 성분 5">기능성 성분 5</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>보습 :</th>
								<td>
									<select name="orderProductMiddle">
										<option value="-- 보습 --">-- 선택하세요 --</option>
										<option value="보습제 1">보습제 1</option>
										<option value="보습제 2">보습제 2</option>
										<option value="보습제 3">보습제 3</option>
										<option value="보습제 4">보습제 4</option>
										<option value="보습제 5">보습제 5</option>
									</select>
								</td>
								<th>패키지 :</th>
								<td>
									<select name="orderProducPackage">
										<option value="-- 패키지 --">-- 선택하세요 --</option>
										<option value="패키지 1">패키지 1</option>
										<option value="패키지 2">패키지 2</option>
										<option value="패키지 3">패키지 3</option>
										<option value="패키지 4">패키지 4</option>
										<option value="패키지 5">패키지 5</option>
									</select>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<th>주문 금액</th>
					<td>
						<input type="text" id="orderAmount" name="orderAmount" value="0" disabled/>
					</td>
				</tr>
				
			</table>
			<input type="submit" value="주문하기">
			
		</form>
	</section>
</div>

</body>
</html>