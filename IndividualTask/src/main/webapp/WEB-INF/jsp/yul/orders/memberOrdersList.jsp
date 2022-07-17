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
<title>My Orders List</title>

<%-- <link href="${pageContext.request.contextPath}/yul/css/reset.css" rel="stylesheet"/> --%>
<!-- BBS Style -->
<link href="${pageContext.request.contextPath}/asset/BBSTMP_0000000000001/style.css" rel="stylesheet" />
<!-- 공통 Style -->
<link href="${pageContext.request.contextPath}/asset/LYTTMP_0000000000000/style.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/yul/css/sub.css" rel="stylesheet"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
<%-- 헤더(메뉴바) --%>
<%@ include file = "/WEB-INF/jsp/yul/comm/header.jsp"%>

<div id="contentContainer">
	<aside id="subMenu">
	<div class="orderMenu">
		<div id="orderListA" style="text-decoration: underline;"><a href="<c:url value='/orders/list.do' />">My Order List</a></div>
		<div id="orderFormA"><a href="<c:url value='/orders/form.do' />">Make Order Form</a></div>
		<%-- <ul>
			<li><a href="<c:url value='/orders/list.do' />">My Order List</a></li>
			<li><a href="<c:url value='/orders/form.do' />">Make Order Form</a></li>
		</ul> --%>
	</div>
	</aside>
	<section id="mberOrderList">
		<div class="total">
			총 게시물 <strong><c:out value="${paginationInfo.totalRecordCount}" /></strong>건 | 
			현재 페이지 <strong><c:out value="${paginationInfo.currentPageNo}" /></strong> /
			<c:out value="${paginationInfo.totalPageCount}" />
		</div>
		
		
		
		<div class="orderList" style="border: 1px solid #aaa;">
		<c:forEach var="vo" items="${ordersList}">
		<div class="orderDetail" style="border: 1px solid #aaa;">
			<div class="orderState">
				<table>
					<tr>
						<th>날짜</th>	 <td><c:out value="${vo.orderDate}" /></td>	
						<th>관리자 승인</th> <td><c:out value="${vo.orderApproval}" /></td>
						<th>상태</th>	 <td><c:out value="${vo.orderState}" /></td>	
						<th>금액</th>	 <td><c:out value="${vo.orderAmount}" /></td>
						<th>리뷰</th> <td><c:out value="${vo.reviewCheak}" /></td>
						<th>
							<c:url var="updateUrl" value='/orders/form.do' >
								<c:param name="orderId" value="${vo.orderId}" />
								<c:param name="ordererId" value="${vo.ordererId}" />
							</c:url>
							<a id="btn-del" href="${updateUrl}">주문수정</a>
						</th>
						<th>
							<c:url var="deleteUrl" value='/orders/delete.do' >
								<c:param name="orderId" value="${vo.orderId}" />
								<c:param name="ordererId" value="${vo.ordererId}" />
							</c:url>
							<a id="orderDeleteBtn" href="${deleteUrl}">주문취소</a>
						</th>
						<th class="toggle-btn"><a href="#none">상세보기</a></th>
					</tr>
				</table>
			</div>
			<div class="orderDetail" style="display: none;">
				<p style="font-size:14px;">&nbsp;&nbsp; 주문 제품</p>
				<table>
					<tr>
						<th>베이스워터</th>
						<td><c:out value="${vo.orderProductFirst}" /></td>
						<th>기능성 성분</th>
						<td><c:out value="${vo.orderProductLast}" /></td>
					</tr>
					<tr>
						<th>보습 성분</th>
						<td><c:out value="${vo.orderProductMiddle}" /></td>
						<th>제품 패키지</th>
						<td><c:out value="${vo.orderProductPackage}" /></td>
					</tr>
					<tr>
						<th>요청사항</th>
						<td><c:out value="${vo.requestedTerm}" /></td>
					</tr>
				</table>
				<p style="font-size:14px;">&nbsp;&nbsp; 배송지 정보</p>
				<table>
					<tr>
						<th>배송자 이름</th>
						<td><c:out value="${vo.ordererName}" /></td>
						<th>배송지 주소</th>
						<td><c:out value="${vo.recipientAddress}" /></td>
					</tr>
					<tr>
						<th>배송자 번호</th>
						<td><c:out value="${vo.recipientPhone}" /></td>
						<th>배송지 상세주소</th>
						<td><c:out value="${vo.recipientDetailAddress}" /></td>
					</tr>
				</table>
			</div>		
		</div>
		</c:forEach>
		<%--게시글이 없을 경우 --%>
		<c:if test="${fn:length(ordersList)==0}">
			<div class="orderEmpty">
					<br><br>
					아직 주문한 내역이 없습니다. <br>
					첫 주문서를 작성해주세요.
			</div>
		</c:if>
		</div>
		
		<div id="paging">
			<c:url var="pageUrl" value="/orders/list.do"/>
			<c:set var="pagingParam"><c:out value="${pageUrl}"/></c:set>
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="${pagingParam}"/>
		</div>
	</section>
	
</div>


<%-- footer --%>
<%@ include file = "/WEB-INF/jsp/yul/comm/footer.jsp"%>
<script>
	<c:if test="${not empty message}">
		alert("${message}");
	</c:if>
	
	$(document).ready(function(){
		//게시글 삭제
		$("#orderDeleteBtn").click(function(){
			if(!confirm("삭제하시겠습니까 ? ")){
				return false;
			}
		});
	});
	
	$(".orderState").on('click','.toggle-btn', function(){
		$(this).parents(".orderState").next(".orderDetail").stop().slideToggle("fast");
	});
	
</script>
</body>
</html>