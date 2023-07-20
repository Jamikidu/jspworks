<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">GREEN SHOP</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="/productList.do">상.품.목.록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/productForm.do">상.품.등.록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/editProduct.do?edit=update">상.품.수.정</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/editProduct.do?edit=delete">상.품.삭.제</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/cart.do">장.바.구.니</a>
        </li>
      </ul>
    </div>
  </div>
</nav>