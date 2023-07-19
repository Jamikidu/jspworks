<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인폼</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
	<div id="container">
		<h2>로그인</h2>
		<p>선택한 상품 목록</p>
		<hr>
		
		<%
			// 장바구니 세션 유지
			ArrayList<String> productList
				= (ArrayList)session.getAttribute("cartList");
			
			// 장바구니에 들어있는 품목 출력
			for(String product : productList)
				out.println(product + "<br>");
		%>
		
		
		
		<form action="selProduct.jsp" method="post">
			<p>
				<input type="text" name="username">
				<button type="submit">로그인</button>
			</p>
		</form>
	</div>
</body>
</html>