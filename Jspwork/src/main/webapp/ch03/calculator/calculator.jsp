<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정수형 계산기</title>
</head>
<body>
	<div id=container>
		<h2>계산기</h2>
		<hr>
		<form action="result.jsp" method="POST">
			<input type="text" name="num1">
			<input type="text" name="num2">
			<button type="submit">계산</button>
			<button type="reset">초기화</button>
		
		</form>
	
	</div>
</body>
</html>