<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당첨자 이벤트</title>
<script src="resources/js/event.js"></script>
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
<jsp:include page="../header.jsp" />
	<div id="container">
		<section id="memberEvent">
			<h2>행운의 추첨(Good Luck)</h2>
			<div class="banner">
				<img alt="한식뷔페" src="./resources/images/bronx.png"></p>
			</div>
			<button type="button" onclick="play()">추첨</button>
			<p id="display"></p>

		</section>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>