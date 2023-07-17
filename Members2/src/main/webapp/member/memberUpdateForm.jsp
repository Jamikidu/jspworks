<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
<link rel="stylesheet" href="resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>

<script type="text/javascript">
	function checkID(){
		//alert("test");
		let memberId = $('#memberId').val();
		if(memberId === ""){
			alert("아이디를 입력해주세요");
			return false;
		}
		$.ajax({
			type: "post", 
			url: "checkid",
			dataType: "text",
			data: {id: memberId},	//서블릿으로 id를 보냄
			success: function(data){
				console.log(data);
				console.log($('#btnChk').val());
				if($.trim(data) == "usable"){	//trim()은 앞뒤 공백 제거(필수)
					
					$('#btnChk').attr('value', 'Y');	//중복 버튼을 누름
					$('#check').text("사용가능한 ID입니다.")
							   .css({'color': 'red', 'padding-top': '5px'})
				} else{
					$('#check').text("이미 가입된 ID입니다.")
							   .css({'color': 'red', 'padding-top': '5px'})
				}
			},
			error: function(){
				alert("에러 발생!");	
			}
		});
		
	}
	
	function checkMember(){
		//alert("test");
		let form = document.member;
		let id = form.memberId.value;
		let pw1 = form.passwd1.value;
		let pw2 = form.passwd2.value;
		let name = form.name.value;
		
		//정규표현식
		let pw_pat1 = /[0-9]+/	//숫자만
		let pw_pat2 = /[a-zA-Z]+/	//영어만
		let pw_pat3 = /[~!@#$%^&*()_=]+/	//특수문자만
		let pw_pat4 = /[가-힣]+/		//한글만
		
		if(id.length < 4 || id.length > 15){
			alert("아이디는 4~15자까지 입력 가능합니다.");
			form.id.focus();
			return false;
		} else if(pw1.length < 8 || !pw_pat1.test(pw1) || !pw_pat2.test(pw1) || !pw_pat3.test(pw1)){
			alert("비밀번호는 영문자,숫자,특수문자 포함 8자 이상입니다.");
			form.pw1.focus();
			return false;
		} else if(pw1 != pw2){
			alert("비밀번호가 일치하지 않습니다.");
			form.pw2.focus();
			return false;
		} else if(name=="" ||pw_pat1.test(name) || pw_pat3.test(name)){
			alert("이름은 한글과 영어만 가능합니다.(자음,모음 X)");
			form.name.focus();
			return false;
		} 
			
		else{
			form.submit();
			
		}
		
	}

</script>
</head>
<body>
	<!-- 다국어 Locale 설정 -->
	<fmt:setLocale value="${language}" />
	<fmt:bundle basename="bundle.message">

		<jsp:include page="../header.jsp" />
		<div id="container">
			<section id="register">
				<div class="language">
					<a href="/memberUpdateForm.do?memberId=${member.memberId}&language=ko">한국어</a> | 
					<a href="/memberUpdateForm.do?memberId=${member.memberId}&language=en">English</a>
				</div>
				<h2><fmt:message key="signup.title2" /></h2>
				<form action="/updateMember.do" method="post" name="member">
					<fieldset>
						<ul>
							<li><label for="memberId"><fmt:message key="signup.id" /></label> <input type="text"
								id="memberId" name="memberId"
								value="${member.memberId}" readonly>
								
								<p id="check"></p></li>
							<li><label for="passwd1"><fmt:message key="signup.passwd1" /></label> <input type="password"
								id="passwd1" name="passwd1"
								value="${member.passwd}"></li>
							<li><label for="passwd2"><fmt:message key="signup.passwd2" /></label> <input
								type="password" id="passwd2" name="passwd2"
								value="${member.passwd}"></li>
							<li><label for="name"><fmt:message key="signup.name" /></label> <input type="text"
								id="name" name="name" value="${member.name}">
							</li>
							<li>
							<label for="gender"><fmt:message key="signup.gender" /></label>
							<c:if test="${member.gender eq '남'}">
								<label class="radio">
								<input type="radio" name="gender" value="남" checked><fmt:message key="signup.man" />
								<input type="radio" name="gender" value="여"><fmt:message key="signup.woman" />
								</label>
							</c:if>
							<c:if test="${member.gender eq '여'}">
								<label class="radio">
								<input type="radio" name="gender" value="남"><fmt:message key="signup.man" />
								<input type="radio" name="gender" value="여" checked><fmt:message key="signup.woman" />
								</label>
							</c:if>
							</li>
						</ul>
					</fieldset>
					<div class="button">
						<input type="button" value="<fmt:message key='signup.save' />" onclick="checkMember()">
						<input type="reset" value="<fmt:message key='signup.cancel' />">
					</div>
				</form>
			</section>
		</div>
		<jsp:include page="../footer.jsp" />
	</fmt:bundle>
</body>
</html>