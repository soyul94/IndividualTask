
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<table id="replyList">
<tr>
	<th class="commentRegisterId">작성자</th>
	<th class="commentContent" style="text-align: center;">댓글</th>
	<th class="commentRegisterDate">등록일</th>
	<th class="commentController">관리</th>
</tr>
<c:forEach var="vo" items="${commentList}" >
<tr>
	<td class="commentRegisterId"><c:out value="${vo.commentRegisterId}"/></td>
	<td class="commentContent"><c:out value="${vo.commentContent}"/></td>
	<td class="commentRegisterDate"><c:out value="${vo.commentRegisterDate}"/></td>
	<td class="commentController">
		<c:if test="${sessionScope.LoginVO.id eq vo.commentRegisterId }">
			<button class="replyEditBtn" >수정</button>
			<button class="replyDeleteBtn" data-commentId="${vo.commentId}" >삭제</button>
		</c:if>
	</td>
</tr>
</c:forEach>
</table>