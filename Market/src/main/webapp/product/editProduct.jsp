<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보 수정</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container my-4">
		<h3 class="text-left mx-4 my-4">상품 정보 수정</h3>
		<div class="row mx-5" align="center" style="background-color: beige;">
			<c:forEach items="${productList}" var="product">
				<div class="col-4">
					<img src="./upload/${product.productImage}" style="width: 100%; height: 400px;">
					<h3 class="my-2">${product.pname}</h3>
					<p>${product.description}</p>
					<p>${product.unitPrice}원</p>
					<p>
						<!-- edit = update라면 수정 버튼 -->
						<c:if test="${edit eq 'update'}">
							<a href="/updateProductForm.do?productId=${product.productId}"
								class="btn btn-success">수정 &raquo;</a>
						</c:if>
						<!-- edit = delete라면 삭제 버튼 -->
						<c:if test="${edit eq 'delete'}">
							<a href="/deleteProduct.do?productId=${product.productId}"
								class="btn btn-danger"
								onclick="return confirm('정말로 삭제하시겠습니까?')">삭제 &raquo;</a>
						</c:if>
					</p>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>