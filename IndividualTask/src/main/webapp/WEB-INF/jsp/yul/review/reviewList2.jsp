<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%-- 기본 --%>
<c:url var="_BASE_PARAM" value="">
	<c:param name="menuNo" value="50"/>
	<c:if test="${not empty searchVO.searchCondition}">
		<c:param name="searchCondition" value="${searchVO.searchCondition}" />
	</c:if>
	<c:if test="${not empty searchVO.searchKeyword}">
		<c:param name="searchKeyword" value="${searchVO.searchKeyword}" />
	</c:if>
</c:url>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>YulCosmetic - Review</title>

<!-- BBS Style -->
<link href="${pageContext.request.contextPath}/asset/BBSTMP_0000000000001/style.css" rel="stylesheet" />
<!-- 공통 Style -->
<link href="${pageContext.request.contextPath}/asset/LYTTMP_0000000000000/style.css" rel="stylesheet" />
<!-- 내 CSS -->
<link href="${pageContext.request.contextPath}/yul/css/sub.css" rel="stylesheet"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- <style>
/* @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap'); */

body{
       font-family: 'Noto Sans KR', sans-serif;  
      }
</style> -->
</head>
<body>
<%-- 헤더(메뉴바) --%>
<%@ include file = "/WEB-INF/jsp/yul/comm/header.jsp"%>

<%--목록 출력하기 --%>
<div class="container">
	<aside id="subMenu">
		<div class="reviewTop">
			<div id="reviewTitle"><a href="#">Review List</a></div>
		</div>
	</aside>
	<div id="contents" style="padding-top: 0;">
		<%--검색영역 --%>
		<div id="bbs_search">
			<form name="frm" method="post" action="${pageContext.request.contextPath}/review/list.do">
				<fieldset>
					<legend>검색조건 입력폼</legend>
					<label for="ftext" class="hdn">검색분류 선택</label>
					<select name="searchCondition" id="ftext">
						<option value="0" <c:if test="${searchVO.searchCondition eq '0'}">selected="selected"</c:if>>제목</option>
						<option value="1" <c:if test="${searchVO.searchCondition eq '1'}">selected="selected"</c:if>>내용</option>
						<option value="2" <c:if test="${searchVO.searchCondition eq '2'}">selected="selected"</c:if>>작성자</option>
						<option value="3" <c:if test="${searchVO.searchCondition eq '3'}">selected="selected"</c:if>>피부 타입</option>
					</select>
					<label for="inp_text" class="hdn">검색어 입력</label>
					<input name="searchKeyword" value="<c:out value="${searchVO.searchKeyword}"/>" type="text" class="inp_s" id="inp_text"/>
					<span class="bbtn_s">
						<input type="submit" value="검색" title="검색(수업용 게시판 게시물 내)"/>
					</span>
				</fieldset>
			</form>
		</div>
		<%--목록영역 --%>
		<div id="bbs_wrap">

			<div class="bss_list">
				<table class="list_table">
					<!-- <thead>
						<tr>
							<th class="num" scope="col">번호</th>
							<th class="tit" scope="col">제목</th>
							<th class="writer" scope="col">작성자</th>
							<th class="date" scope="col">작성일</th>
							<th class="hits" scope="col">조회수</th>
						</tr>
					</thead> -->
					<tbody>
						<%--공지글 --%>
						<c:forEach var="result" items="${noticeResultList}" varStatus="status">
							<tr class="notice">
								<td class="num"><span class="label-bbs spot">공지</span></td>
								<td class="tit">
									<c:url var="viewUrl" value="/review/select.do${_BASE_PARAM}">
										<c:param name="reviewId" value="${result.reviewId}"/>
										<c:param name="pageIndex" value="${searchVO.pageIndex}"/>
									</c:url>
									<a href="${viewUrl}"><c:out value="${result.reviewSj}"/></a>
								</td>
								<td class="writer" data-cell-geader="작성자  : ">
									<c:out value="${result.frstRegisterId}"/>
								</td>
								<td class="date" data-cell-header="작성일 : ">
									<fmt:formatDate value="${result.frstRegistPnttm}" pattern="yyyy-MM-dd"/>
								</td>
								<td class="hits" data-cell-header="조회수 : ">
									<c:out value="${result.inqireCo}"/>
								</td>
							</tr>
						</c:forEach>
						<c:if test="${fn:length(noticeResultList)==0}">
							<table class="list_table">
								<tbody>
								<%--게시글이 없을 경우 --%>
								<tr class="empth">
									<td colspan="5"> 공지사항이 없습니다.</td>
								</tr>
								</tbody>
							</table>
						</c:if>
					</table>
					<br>
					
			<div class="btn-cont ar">
				<a href="${pageContext.request.contextPath}/review/regist.do" class="btn spot">
					<i class="ico-check-spot"></i> 글쓰기
				</a>
			</div>
			<%-- 게시물 총 수 --%>		
			<div class="total">
				총 게시물 <strong><c:out value="${paginationInfo.totalRecordCount}"/></strong>건 
				| 현재 페이지 <strong><c:out value="${paginationInfo.currentPageNo}"/></strong> 
				/ <c:out value="${paginationInfo.totalPageCount}"/>
			</div>
			<%--일반글 --%>
			<div class="reviewList">
			<c:if test="${fn:length(resultList)==0}">
				<%--게시글이 없을 경우 --%>
				<div class="reviewEmpty">
					<br><br>
					아직 등록된 리뷰가 없습니다. <br>
					첫 리뷰를 작성해주세요.
				</div>
			</c:if>
			<c:forEach var="result" items="${resultList}" varStatus="status">
					<div class="reviewBody">
		                <div class="reviewSum">
		                	<c:if test="${not empty result.atchFileNm}">
								<c:url var="thumbUrl" value="/cmm/fms/getThumbImage.do">
									<c:param name="thumbYn" value="Y"/>
									<c:param name="atchFileNm" value="${result.atchFileNm}"/>
								</c:url>
								<div id="reviewSumImg">
									<img src="${thumbUrl}" alt="썸네일">
								</div>
							</c:if>
		                </div>
		                <div class="reviewTable">
		                	<p>&nbsp<fmt:formatDate value="${result.frstRegistPnttm}" pattern="yyyy-MM-dd"/></p>
		                	<br>
		                    <dl>
		                        <dt style="width:15%;">번호</dt>
		                        <dd style="width:15%;">
		                        	&nbsp<c:out value="${paginationInfo.totalRecordCount-((searchVO.pageIndex-1)*searchVO.pageUnit)-(status.count-1)}"/>
		                        </dd>
		                        <dt style="width:15%;">좋아요</dt>
		                        <dd style="width:20%;">&nbsp 999</dd>
		                        <dt style="width:15%;">조회수</dt>
		                        <dd style="width:20%;">&nbsp<c:out value="${result.inqireCo}"/></dd>
		                    </dl>
		                    <dl>
		                        <dt style="width:15%;">피부</dt>
		                        <dd style="width:35%;">&nbsp${result.skinType}</dd>
		                        <dt style="width:15%;">작성자</dt>
                        		<dd style="width:35%;">&nbsp<c:out value="${result.frstRegisterId}"/></dd>
		                    </dl>
		                    <dl>
		                        <dt style="width:15%;">제목</dt>
		                        <dd style="width:85%;">
									<c:url var="viewUrl" value="/review/select.do${_BASE_PARAM}">
										<c:param name="reviewId" value="${result.reviewId}"/>
										<c:param name="pageIndex" value="${searchVO.pageIndex}"/>
									</c:url>
									<a href="${viewUrl}">
										<c:if test="${result.othbcAt eq 'Y'}">
											<img src="/asset/BBSTMP_0000000000001/images/ico_board_lock.gif" alt="비밀글 아이콘"/>
										</c:if>
										&nbsp<c:out value="${result.reviewSj}"/>
									</a>
		                        </dd>
		                    </dl>
		                    <dl>
		                        <dt style="width:15%;">제품</dt>
		                        <dd style="width:85%;">&nbsp<c:out value="${result.reviewProduct}"/></dd>
		                    </dl>
		                </div>
           			</div>
			</c:forEach>
			</div>
			
			
			</div>
			<div id="paging">
				<c:url var="pageUrl" value="/review/list.do${_BASE_PARAM}"/>
				<c:set var="pagingParam"><c:out value="${pageUrl}"/></c:set>
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="${pagingParam}"/>
			</div>
		</div>
		
	</div>
</div>

<%-- footer --%>
<%@ include file = "/WEB-INF/jsp/yul/comm/footer.jsp"%>

<script>
	<c:if test="${not empty message}">
		alert("${message}");
	</c:if>
</script>
</body>
</html>