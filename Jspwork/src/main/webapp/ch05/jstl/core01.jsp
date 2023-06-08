<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 예제</title>
<%
	//모델생성
	pageContext.setAttribute("cart", "계란");
%>
</head>
<body>
	<h3>${cart}</h3>
	<%-- <%
		int num = 10;
	
		if(num % 2 == 0){
			out.println("짝수");
		}else{
			out.println("홀수");
		}
	
	%> --%>
	
	<c:set var="num" value="11"></c:set>
	<c:if test="${num % 2 == 0}">
		<c:out value="${'짝수입니다.'}"></c:out>
	</c:if>
	<c:if test="${num % 2 == 1}">
		<c:out value="${'홀수입니다.'}"></c:out>
	</c:if>
	<br>
	<!-- 구구단 -->
	<%-- <c:set var="dan" value="4"></c:set> --%>
	<c:forEach var="dan" begin="2" end="9">
		<c:forEach var="i" begin="1" end="9">
			<c:out value="${dan} x ${i}=${dan*i}" /><br>
		</c:forEach>
		<c:out value="==${dan}단 끝!==" /><br>
	</c:forEach>
</body>
</html>