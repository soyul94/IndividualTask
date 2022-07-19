<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>여기는 BoardSelect.jsp이다</title>

<link href="${pageContext.request.contextPath}/yul/css/sub.css" rel="stylesheet"/>
<!-- BBS Style -->
<link href="${pageContext.request.contextPath}/asset/BBSTMP_0000000000001/style.css" rel="stylesheet" />
<!-- 공통 Style -->
<link href="${pageContext.request.contextPath}/asset/LYTTMP_0000000000000/style.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>

<%-- 헤더(메뉴바) --%>
<%@ include file = "/WEB-INF/jsp/yul/comm/header.jsp"%>

<%-- 기본 URL --%>
<c:url var="_BASE_PARAM" value="">
	<c:param name="menuNo" value="50" />
	<c:param name="pageIndex" value="${searchVO.pageIndex}" />
	<c:if test="${not empty searchVO.searchCondition}">		
		<c:param name="searchKeyword" value="${searchVO.searchCondition}" />
	</c:if>
	<c:if test="${not empty searchVO.searchKeyword}">		
		<c:param name="searchKeyword" value="${searchVO.searchKeyword}" />
	</c:if>
</c:url>

<div class="container">
	<aside id="subMenu">
		<div class="reviewTop">
			<div id="reviewTitle"><a href="#">Review Detail</a></div>
		</div>
	</aside>
	<div id="contents" style="padding-top: 0;">
		<div id="bbs_wrap">
			<div class="board_view" style="font-size:14px;">
				<dl class="tit_view">
					<dt>제목</dt>
					<dd><c:out value="${result.reviewSj}"/></dd>
				</dl>
				<dl class="info_view2">
					<dt>작성자ID</dt>
					<dd><c:out value="${result.frstRegisterId}"/></dd>
					<dt>작성일</dt>
					<dd><fmt:formatDate value="${result.frstRegistPnttm}" pattern="yyyy-MM-dd"/></dd>
					<dt>조회수</dt>
					<dd><c:out value="${result.inqireCo}"/></dd>
				</dl>
				<dl class="tit_view">
					<dt>피부타입</dt>
					<dd><c:out value="${result.skinType}"/></dd>
				</dl>
				<dl class="tit_view">
					<dt>리뷰 제품</dt>
					<dd><c:out value="${result.reviewProduct}"/></dd>
				</dl>
				<dl class="tit_view">
					<dt>첨부파일목록</dt>
					<dd><!-- /cmm/fms/selectFileInfs.do : 어노테이션 주소 -->
						<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
							<c:param name="param_atchFileId" value="${result.atchFileId}"/>
						</c:import>
					</dd>
				</dl>
				<div class="view_cont" style="min-height: 200px;">
					<c:out value="${result.reviewCn}" escapeXml="fales" />
				</div>
			</div>
			<div class="btn-cont ar">
				<c:choose>
					<c:when test="${not empty searchVO.reviewId}">
						<c:url var="uptUrl" value="/review/regist.do${_BASE_PARAM}">
							<c:param name="reviewId" value="${result.reviewId}"></c:param>
						</c:url>
						<a href="${uptUrl}" class="btn">수정</a>
						
						<c:url var="delUrl" value="/review/delete.do${_BASE_PARAM}">
							<c:param name="reviewId" value="${result.reviewId}"></c:param>
							<c:param name="frstRegisterId" value="${result.frstRegisterId}" />
						</c:url>
						<a href="${delUrl}" id="btn-del" class="btn"><i class="ico-del"></i> 삭제</a>
					</c:when>
					<c:otherwise>
						<a href="none" id="btn-reg" class="btn spot">등록</a>
					</c:otherwise>
				</c:choose>
					<c:url var="listUrl" value="/review/list.do${_BASE_PARAM}" />
					<a href="${listUrl}" class="btn">목록</a>
			</div>
		</div>
		
		
		<%-- 댓글작성 --%>
		<form action="${pageContext.request.contextPath}/comment/insert.do" method="post">
			<input type="hidden" name="boardId" value="${result.reviewId}" />
			<div id="replyInputBox">
				<table id="replyInputTable">
					<tr>
						<th>
							<textarea id="replyContent" name="commentContent"></textarea>
						</th>
						<td>
							<input type="button" value="저장" id="saveBtn"/>
						</td>
					</tr>
				</table>
			</div>
		</form>
		
		<div class="comment-list">
			<c:import url="/comment/list.do" charEncoding="utf-8">
				<c:param name="boardId" value="${result.reviewId}"/>
			</c:import>
		</div>
	</div>
	
	
	
	
</div>

<%-- footer --%>
<%@ include file = "/WEB-INF/jsp/yul/comm/footer.jsp"%>

<script>
	$(document).ready(function(){
		//게시글 삭제
		$("#btn-del").click(function(){
			if(!confirm("삭제하시겠습니까 ? ")){
				return false;
			}
		});
	});
	
	function readComment(){
		$.ajax({
			url : "${pageContext.request.contextPath}/comment/list.do",
			type : "post",
			data : {boardId :"${result.reviewId}"},
			dataType : "html",
			success : function(data){
				$(".comment-list").html(data);
			},error : function(){
				alert(11111);
				//alert("error : list")
			}
		});
	}
	
	
	$('#saveBtn').on('click', function(){ //saveBtn을 클릭하면 함수 실행
		if("${sessionScope.LoginVO.id}"==""){
			alert("로그인 후 댓글을 작성할 수 있습니다.");
		}
		else{
			var content = $('[name="commentContent"]').val();
			if(content==""){
				alert("내용을 입력해주세요");
			}
			else{
				$.ajax({
				  url: "${pageContext.request.contextPath}/comment/insert.do",	//요청주소
				  method: "POST",											//요청방식
				  data: { boardId :$('[name="boardId"]').val(), 
					  	  commentContent : $('[name="commentContent"]').val()
					  },	//파라미터
				  dataType: "text"											//요청의 결과(서버의 응답)으로 받을 데이터의 형식
				}).done(function( msg ) {
				 	alert(msg);
				 	$('[name="commentContent"]').val('');
				 	readComment();
				 	
				}).fail(function( jqXHR, textStatus ) {
				  alert( "Request failed: " + textStatus );
				});	
			}
		}
	});
	
	
	//댓글 삭제 함수
	$('.comment-list').on('click',".replyDeleteBtn", function(){ //saveBtn을 클릭하면 함수 실행

		$.ajax({
			  url: "${pageContext.request.contextPath}/comment/delete.do",	//요청주소
			  method: "POST",											//요청방식
			  data: { boardId : $('[name="boardId"]').val(), 
				  	  commentId : $(this).attr("data-commentId")
				  },	//파라미터
			  dataType: "text"											//요청의 결과(서버의 응답)으로 받을 데이터의 형식
			}).done(function( msg ) {
			 	alert(msg);
			 	readComment();
			 	console.log($(this).attr("data-commentId"));

			}).fail(function( jqXHR, textStatus ) {
			  alert( "Request failed: " + textStatus );
			});	
	});
	
	
	
	
</script>

</body>
</html>
