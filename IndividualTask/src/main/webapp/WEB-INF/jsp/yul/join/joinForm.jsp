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
<div id="contentContainer">
	<aside id="subMenu">
		<div class="reviewTop">
			<div id="reviewTitle"><a href="#">Join to be a Member</a></div>
		</div>
	</aside>
	<section id="section">
		<div id="joinFormTable" style="width:60%; margin:5% auto;">
		<form action="${pageContext.request.contextPath}/member/addMember.do" id="joinForm" method="post" onsubmit="return regist()">
			<table style="width:100%; font-size: 16px;">
			<colgroup>
				<col style="width : 40%">
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
							<option>-- 선택하세요 --</option>
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
						<div id="sexCodeBox">
							<div class="sexCode">
								<input type="radio" name="sexdstnCode" value="M"><label for="">남자</label>
							</div>
							<div class="sexCode">
								<input type="radio" name="sexdstnCode" value="F"><label for="">여자</label>
							</div>
						</div>
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
		</div>
	</section>
</div>
<%@ include file = "/WEB-INF/jsp/yul/comm/footer.jsp"%>

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
		 	//alert(msg);
		 	if(msg=='사용 가능한 아이디입니다.'){
			 	$('#checkIdDplct').css({"color":"skyblue"});
		 	}
		 	else{
		 		$('#checkIdDplct').css({"color":"coral"});
		 	}
		 	$('#checkIdDplct').text(msg);
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
				$('#password_check_result').text('비밀번호가 동일합니다.').css({"color":"skyblue"});
			}
			else{
				$('#password_check_result').text('비밀번호가 다릅니다.').css({"color":"coral"});
			}
				
		});
	});
	
	
	
	function regist(){
		$("#sexCodeBox").css({"border":"1px solid #ddd"});
		if($("#checkIdDplct").text()!="사용 가능한 아이디입니다."){
			alert("이이디 중복확인을 해주세요.");
			$("#emplyrId").focus();
			return false;
		}
		if(!$("#emplyrId").val()){	
			alert("이이디를 입력해주세요.");
			$("#emplyrId").focus();
			return false;
		}
		else if(!$("#userNm").val()){	
			alert("이름을 입력해주세요.");
			$("#userNm").focus();
			return false;
		}
		else if(!$("#password").val()){	
			alert("비밀번호를 입력해주세요.");
			$("#password").focus();
			return false;
		}
		else if(!$("#password_check").val() || ($("#password_check_result").text()=="비밀번호가 다릅니다.")){	
			alert("비밀번호를 확인해주세요");
			$("#password_check").focus();
			return false;
		}
		else if($("[name='passwordHint']").val()=='-- 선택하세요 --'){
			alert("비밀번호 힌트를 선택해주세요.");
			$("[name='passwordHint']").focus();
			return false;
		}
		else if(!$("#passwordCnsr").val()){	
			alert("비밀번호 힌트의 정답을 입력해주세요");
			$("#passwordCnsr").focus();
			return false;
		}
		else if(!$("#ihidnum").val()){
			alert("주민번등록번호를 입력해주세요.");
			$("#ihidnum").focus();
			return false;
		}
		else if($(':radio[name="sexdstnCode"]:checked').length < 1){
		    alert('성별을 입력해주세요');                        
		    //$("[name='sexdstnCode']").focus();
		    $("#sexCodeBox").css({"border":"3px sold #000"});
		    return false;
		}
		else if(!$("#mbtlnum").val()){
			alert("휴대폰 번호를 입력해주세요.");
			$("#mbtlnum").focus();
			return false;
		}
		else if(!$("#emailAdres").val()){
			alert("이메일을 입력해주세요.");
			$("#emailAdres").focus();
			return false;
		}
		else if(!$("#zip").val()){
			alert("우편번호를 입력해주세요.");
			$("#zip").focus();
			return false;
		}
		else if(!$("#houseAdres").val()){
			alert("주소를 입력해주세요.");
			$("#houseAdres").focus();
			return false;
		}
		else if(!$("#detailAdres").val()){
			alert("상세주소를 입력해주세요.");
			$("#detailAdres").focus();
			return false;
		}
		else{
			alert("회원가입을 완료했습닏. 로그인을 해주세요.");
			return true;
		}
			//!$("[name='sexdstnCode']").val()||
	}
//	function regist(){ //제목이 입력되지 않았을 때 실패를 반환
//		if(!$("#userNm, #password_check,[name='passwordHint'],#passwordCnsr,#ihidnum,[name='sexdstnCode'],#mbtlnum,#emailAdres,#zip,#houseAdres,#detailAdres").val()){
//			alert("빈값이 있습니다.");
//			return false;
//		}	
//	}
/* 	function regist(){ //제목이 입력되지 않았을 때 실패를 반환
		if(!$("#userNm, #password_check,[name='passwordHint'],#passwordCnsr,#ihidnum,[name='sexdstnCode'],#mbtlnum,#emailAdres,#zip,#houseAdres,#detailAdres").children().val()){
			alert("빈값이 있습니다.");
			return false;
		}
	
	} */

</script>

</body>
</html>