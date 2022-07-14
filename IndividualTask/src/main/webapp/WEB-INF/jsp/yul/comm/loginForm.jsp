<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="${pageContext.request.contextPath}/yul/css/sub.css" rel="stylesheet"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/yul/asset/front/css/style.css" />

</head>
<body>
<%-- 헤더 --%>
<%@ include file = "/WEB-INF/jsp/yul/comm/header.jsp"%>
	
		
	<!-- 로그인 -->
	
	<div class="layer-popup layer-login" ">
		<h1>로그인</h1>
		<header class="layer-header">
			<div class="login-img">
				<img src="<c:url value='/yul/images/main/task_logo.png' />" alt="소율 로고">
			</div>
			<!-- <span class="logo"> <span class="img-logo">한국폴리텍대학
					대전캠퍼스 스마트소프트웨어학과</span>
			</span> -->
			<!-- <button type="button" class="layer-close">
				<span>팝업 닫기</span>
			</button> -->
		</header>
		<div class="layer-body">
			<form action="${pageContext.request.contextPath}/login/actionLogin.do" id="frmLogin" name="frmLogin"
				method="post" onsubmit="return vali()">
				<input type="hidden" name="userSe" value="USR" />
				<input type="hidden" name="address" value="${address}" />
				<fieldset>
					<legend>로그인을 위한 아이디/비밀번호 입력</legend>
					<div class="ipt-row">
						<input type="text" id="loginId" name="id" placeholder="아이디"
							required="required">
					</div>
					<div class="ipt-row">
						<input type="password" id="loginPw" name="password"
							placeholder="비밀번호" required="required">
					</div>
					<button type="submit" class="btn-login">
						<span>로그인</span>
					</button>
				</fieldset>
			</form>
		</div>
		<div class="txt_find"> <a href="#"
			class="link_find">아이디</a> / <a href="#"
			class="link_find">비밀번호 찾기</a>
		</div>
	</div>
	</header>
	

	<%@ include file = "/WEB-INF/jsp/yul/comm/footer.jsp"%>

	<script>
		/* $(document).ready(function() {
			//로그인
			$(".login").click(function() {
				$(".dim, .layer-login").fadeIn();
				return false;
			})

			//레이어닫기
			$(".layer-close").click(function() {
				$(".dim, .layer-login").fadeOut();
				return false;
			})
		}); */

		function vali() {
			if (!$("#loginId").val()) {
				alert("아이디를 입력해주세요.");
				$("#loginId").focus();
				return false;
			}
			if (!$("#loginPw").val()) {
				alert("비밀번호를 입력해주세요.");
				$("#loginPw").focus();
				return false;
			}
		}

		<c:if test="${not empty loginMessage}">
			alert("${loginMessage}");
		</c:if>
	</script>
</body>
</html>