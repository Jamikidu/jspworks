<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container my-4">
		<h3 class="text-left mx-4 my-4">상품 목록 페이지</h3>
		<div class="row" align="center" style="background-color: beige;">
			<c:forEach items="${productList}" var="product">
				<div class="col-4">
					<img src="./upload/${product.productImage}" style="width: 100%; height: 400px;">
					<h3 class="my-2">${product.pname}</h3>
					<p>${product.description}</p>
					<p>${product.unitPrice}원</p>
					<p>
						<a href="/productInfo.do?productId=${product.productId}"
							class="btn btn-secondary">상세 정보 &raquo;</a>
					</p>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>