<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome~</title>
<script src="/resources/js/memberValidation.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container my-3" align="center">
		<div class="col-4">
		<%
			String error = request.getParameter("error");
			if(error != null){
				out.println("<div class='alert alert-danger'>");
				out.println("아이디와 비밀번호를 확인해 주세요");
				out.println("</div>");
			}
		%>
		<h3>Please Log In</h3>
		<c:if test="${not empty error}">
			<div class="alert alert-danger">
				${error}
			</div>
		</c:if>
		<form action="/processLogin.do" method="post">
			<div class="form-group my-3">
				<input type="text" name="mid" class="form-control my-2"
					   placeholder="ID" required autofocus>
			</div>
			<div class="form-group">
				<input type="password" name="passwd" class="form-control my-2"
					   placeholder="Password" required>
			</div>
			<div class="d-grid my-3">
			<button type="submit" class="btn btn-success">로그인</button>
			</div>
		</form>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>