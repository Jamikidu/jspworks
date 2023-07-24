<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script src="resources/js/bootstrap.js"></script>
<script src="https://kit.fontawesome.com/1e31f1a091.js" crossorigin="anonymous"></script>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">GREEN SHOP</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="/productList.do"><i class="fa-solid fa-box-open"></i> 상-품-목-록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/productForm.do">상-품-등-록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/editProduct.do?edit=update">상-품-수-정</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/editProduct.do?edit=delete">상-품-삭-제</a>
        </li>
        
        <!-- 로그인 세션 처리 -->
        <c:choose>
        	<c:when test="${empty sessionId}">
		        <li class="nav-item">
		          <a class="nav-link" href="/loginForm.do">로-그-인</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="/memberForm.do">회-원-가-입</a>
		        </li>
        	</c:when>
        	<c:otherwise>
        		<li class="nav-item">
		          <a class="nav-link" href="/logout.do">${sessionId} 님(로그아웃)</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="/memberInfo.do?mid=${sessionId}">나-의-정-보</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="/cart.do"><i class="fa-solid fa-cart-shopping"></i> 장-바-구-니</a>
		        </li>
        	</c:otherwise>
        
        </c:choose>
      </ul>
    </div>
  </div>
</nav>