
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<table>
<tr>
	<th>작성자</th>
	<th>댓글</th>
	<th>등록일</th>
	<th>삭제</th>
</tr>
<c:forEach var="vo" items="${commentList}" >
<tr>
	<td><c:out value="${vo.commentRegisterId}"/></td>
	<td><c:out value="${vo.commentContent}"/></td>
	<td><c:out value="${vo.commentRegisterDate}"/></td>
	<td>삭제</td>
</tr>
</c:forEach>
</table>