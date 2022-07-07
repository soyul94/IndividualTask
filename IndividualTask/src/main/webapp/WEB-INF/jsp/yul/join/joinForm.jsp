<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>YulCosmetic - JoinForm</title>

<link href="${pageContext.request.contextPath}/yul/css/sub.css" rel="stylesheet"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
<%-- 헤더 --%>
<%@ include file = "/WEB-INF/jsp/yul/comm/header.jsp"%>

<%-- 회원가입 폼 --%>
<section id="section">
		<form action="/join/addMember.do">
			<table style="width:100%">
			<colgroup>
				<col style="width : 30%">
				<col />
			</colgroup>
				<tr>
					<th>회원 ID</th>
					<td><input type="text" id="" name="id" ></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" id="" name="name" ></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="" name="password" ></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" id="" name="" ></td>
				</tr>
				<tr>
					<th>비밀번호 힌트</th>
					<td>
						<select name="passwordHint">
							<option value="-- 선택하세요 --">-- 선택하세요 --</option>
							<c:forEach var="hint" items="${passwordHint_result}" >
								<option value="${hint}">${hint}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>비밀번호 힌트 정답</th>
					<td><input type="text" id="" name="passwordCnsr" ></td>
				</tr>
				<tr>
					<th>주민등록번호</th>
					<td><input type="password" id="" name="name" ></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="" value="M"><label for="">남자</label>
						<input type="radio" name="" value="F"><label for="">여자</label>
					</td>
				</tr>
				<tr>
					<th>휴대폰 번호</th>
					<td><input type="number" id="" name="" ></td>
				</tr>
				<tr>
					<th>e-mail</th>
					<td><input type="email" id="" name="" ></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td><input type="text" id="" name="" ></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" id="" name="" ></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td><input type="text" id="" name="" ></td>
				</tr>

			</table>
		</form>

</section>

</body>
</html>