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
		<form action="${pageContext.request.contextPath}/member/addMember.do" method="post">
			<table style="width:100%">
			<colgroup>
				<col style="width : 30%">
				<col />
			</colgroup>
				<tr>
					<th>회원 ID</th>
					<td>
						<p id="checkIdDplct">아이디 중복을 확인해주세요.</p>
						<input type="text" id="emplyrId" name="emplyrId" >
						<input type="button" id="btnIdDplct" value="중복확인" />
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" id="userNm" name="userNm" ></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="password" name="password" ></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<p><span id="password_check_result"></span></p>
						<input type="password" id="password_check" name="password_check" >
					</td>
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
					<td><input type="text" id="passwordCnsr" name="passwordCnsr" ></td>
				</tr>
				<tr>
					<th>주민등록번호</th>
					<td><input type="password" id="ihidnum" name="ihidnum" ></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="sexdstnCode" value="M"><label for="">남자</label>
						<input type="radio" name="sexdstnCode" value="F"><label for="">여자</label>
					</td>
				</tr>
				<tr>
					<th>휴대폰 번호</th>
					<td><input type="number" id="mbtlnum" name="mbtlnum" ></td>
				</tr>
				<tr>
					<th>e-mail</th>
					<td><input type="email" id="emailAdres" name="emailAdres" ></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td><input type="text" id="zip" name="zip" ></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" id="houseAdres" name="houseAdres" ></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td><input type="text" id="detailAdres" name="detailAdres" ></td>
				</tr>

			</table>
			<input type="submit" value="가입하기">
		</form>

</section>


<script type="text/javascript">
	
	//아이디 중복 확인 메소드
	$('#btnIdDplct').on('click', function(){ //saveBtn을 클릭하면 함수 실행
		var request = $.ajax({
		  url: "${pageContext.request.contextPath}/member/idDplctCnfirmAjax.do",	//요청주소
		  method: "POST",											//요청방식
		  data: { emplyrId : $('#emplyrId').val(), 
			  	},	//파라미터
		  dataType: "text"											//요청의 결과(서버의 응답)으로 받을 데이터의 형식
		});
		//요청에 대한 응답을 성공적으로 받았을 때 실행할 함수
		request.done(function( msg ) {
			
		 /*  $( "#log" ).html( msg ); */
			//서버로부터 받은 응답이 인자로 전달된다. 즉, 위의 결과 값의 msg로 전달되는 것
		 	alert(msg);
		 	console.log(msg);
		 	console.log($('#emplyrId').val());
		 	//$('#checkIdDplct').append(msg);
		});
		//요청이 실패한 경우 실행할 함수
		request.fail(function( jqXHR, textStatus ) {
		  alert( "Request failed: " + textStatus );
		});	
	});
	
	$(document).ready(function(){
		$('#password, #password_check').change(function(){
			var a = $('#password').val();
			var b = $('#password_check').val();
			if(a===b){
				$('#password_check_result').text('비밀번호가 동일합니다.')
			}
			else{
				$('#password_check_result').text('비밀번호를 다시 입력해주세요.')
			}
				
		});
	});
	
	

</script>

</body>
</html>