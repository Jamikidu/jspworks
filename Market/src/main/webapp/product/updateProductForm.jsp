<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<script src="resources/js/bootstrap.js"></script>
<script src="resources/js/validation.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container my-4">
		<h3 class="text-left mx-4 my-4">상품 수정</h3>
		<div class="row mx-5" align="center" style="background-color: beige;">
			<form action="/updateProduct.do" method="post"
				encType="multipart/form-data" name="newProduct">
				<div class="form-group row">
					<label class="col-sm-2">상품 코드</label>
					<div class="col-sm-3 my-2">
						<input type="text" name="productId" id="productId"
							class="form-control" value="${product.productId}">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">상품명</label>
					<div class="col-sm-3 my-2">
						<input type="text" name="pname" id="pname" 
							class="form-control" value="${product.pname}">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">가격</label>
					<div class="col-sm-3 my-2">
						<input type="text" name="unitPrice" id="unitPrice"
							class="form-control" value="${product.unitPrice}">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">상품 설명</label>
					<div class="col-sm-5 my-2">
						<textarea rows="2" cols="50" name="description"
							class="form-control">${product.description}</textarea>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">제조사</label>
					<div class="col-sm-3 my-2">
						<input type="text" name="manufacturer" 
						class="form-control" value="${product.manufacturer}">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">분류</label>
					<div class="col-sm-3 my-2">
						<input type="text" name="category" 
						class="form-control" value="${product.category}">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">재고수</label>
					<div class="col-sm-3 my-2">
						<input type="text" name="unitsInStock" id="unitsInStock"
							class="form-control" value="${product.unitsInStock}">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">이것은 신상? 중고?</label>
					<div class="col-sm-5 my-2" align="left">
					<c:if test="${product.condition eq 'new'}">
						<label><input type="radio" name="condition" value="new" checked>신상품</label>
						<label><input type="radio" name="condition" value="old">중고품</label>
					</c:if>
					<c:if test="${product.condition eq 'old'}">
						<label><input type="radio" name="condition" value="new">신상품</label>
						<label><input type="radio" name="condition" value="old" checked>중고품</label>
					</c:if>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">상품 이미지</label>
					<div class="col-sm-5 my-2">
						<input type="file" name="productImage" 
						class="form-control" value="${product.productImage}">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-2 my-2">
						<input type="button" value="수정완료" onclick="checkAddProduct()"
							class="btn btn-primary">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>