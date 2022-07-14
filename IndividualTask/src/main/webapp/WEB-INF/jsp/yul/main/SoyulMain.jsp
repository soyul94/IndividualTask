<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Language" content="ko" >
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <title>SoYul Cosmetic Main</title>

	<%-- <link href="${pageContext.request.contextPath}/yul/css/reset.css" rel="stylesheet"/> --%>
	
	<!-- <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet"> -->
	
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.css"/>
    <script src="https://unpkg.com/swiper@8/swiper-bundle.js"></script>
	<link href="${pageContext.request.contextPath}/yul/css/main.css" rel="stylesheet"/>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>

	<%@ include file = "/WEB-INF/jsp/yul/comm/header.jsp"%>
	<%-- <jsp:include page="/WEB-INF/jsp/yul/comm/header.jsp" /> --%>
	<%-- <%@ include file = "/WEB-INF/jsp/yul/comm/header.jsp"%> 와는 무슨 차이가 있는거지 ? --%>

	<div class="container">
		<!-- Swiper -->
		<div
			class="swiper mySwiper swiper-initialized swiper-horizontal swiper-pointer-events">
			<div class="swiper-wrapper" id="swiper-wrapper-ccfc2e667c56f47f"
				aria-live="polite"
				style="transition-duration: 0ms; transform: translate3d(-4184px, 0px, 0px);">
				<div class="swiper-slide swiper-slide-duplicate"
					data-swiper-slide-index="2" role="group" aria-label="3 / 3">
				</div>
				<div class="swiper-slide img-container" data-swiper-slide-index="0"
					role="group" aria-label="1 / 3">
					<img src="<c:url value='/yul/images/main/task_main_3.png' />"
						alt="">
					<div class="img-text">
						<img src="<c:url value='/yul/images/main/task_text_1.png' />">
					</div>
				</div>
				<div class="swiper-slide img-container" data-swiper-slide-index="1"
					role="group" aria-label="2 / 3">
					<img src="<c:url value='/yul/images/main/task_main_2.png' />"
						alt="">
					<div class="img-text">
						<img src="<c:url value='/yul/images/main/task_text_2.png' />">
					</div>
				</div>
				<div class="swiper-slide swiper-slide-prev img-container"
					data-swiper-slide-index="2" role="group" aria-label="3 / 3">
					<img src="<c:url value='/yul/images/main/task_main_1.png' />"
						alt="">
					<div class="img-text">
						<img src="<c:url value='/yul/images/main/task_text_3.png' />">
					</div>
				</div>
				<div class="swiper-slide swiper-slide-duplicate"
					data-swiper-slide-index="0" role="group" aria-label="1 / 3">
				</div>
			</div>
			<div class="swiper-button-next" tabindex="0" role="button"
				aria-label="Next slide"
				aria-controls="swiper-wrapper-ccfc2e667c56f47f"></div>
			<div class="swiper-button-prev" tabindex="0" role="button"
				aria-label="Previous slide"
				aria-controls="swiper-wrapper-ccfc2e667c56f47f"></div>
			<div
				class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets swiper-pagination-horizontal">
				<span class="swiper-pagination-bullet" tabindex="0" role="button"
					aria-label="Go to slide 1"></span> <span
					class="swiper-pagination-bullet" tabindex="0" role="button"
					aria-label="Go to slide 2"></span> <span
					class="swiper-pagination-bullet" tabindex="0" role="button"
					aria-label="Go to slide 3"></span>
			</div>
			<span class="swiper-notification" aria-live="assertive"
				aria-atomic="true"></span>
		</div>

		<%-- <footer class="footer">
			<jsp:include page="/WEB-INF/jsp/yul/comm/footer.jsp" />
		</footer> --%>
		
		<%@ include file = "/WEB-INF/jsp/yul/comm/footer.jsp"%>
	</div>

	<!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1,
        spaceBetween: 0,
        loop: true,
        effect: 'cube',
        autoplay:{
          delay:3500,
          disableOnInteraction: false,
        },
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
    </script>
<script>
	<c:if test="${not empty message}">
		alert("${message}");
	</c:if>
</script>
</body>
</html>