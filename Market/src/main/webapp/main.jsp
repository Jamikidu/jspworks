<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome~</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<script src="resources/js/bootstrap.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container my-3">
		<h2>Green Market에 오신 걸 환영합니다.</h2>
		<div class="card mb-3">
			<img src="resources/images/shoppingmall.jpg" class="card-img-top" alt="쇼핑몰">
			<div class="card-body">
				<h5 class="card-title">(똑똑똑) 누구세요?</h5>
				<p class="card-text">사랑해요~</p>
				<p class="card-text">
					<small class="text-muted">Last updated 3 mins ago</small>
				</p>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>