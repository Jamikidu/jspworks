<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강남 커뮤니티입니다</title>
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="container">
		<section id="main">
			<h2><i class="fa-regular fa-hand"></i> 안녕하세요~ 강남 커뮤니티입니다. <i class="fa-regular fa-hand"></i></h2>
			<div id="main_img">
				<img src="resources/images/gangnam.jpg" alt="배경 사진">
			</div>
			
			<div class="newBoard">
				<h3>최신게시글 <i class="fa-solid fa-feather"></i></h3>
				<c:forEach items="${boardList}" var="board">
					<p>
						<a href="/boardView.do?bnum=${ board.bnum }">
							${ board.title } (<fmt:formatDate value="${board.regDate}"
								pattern="yyyy-MM-dd HH:mm:ss" />
							, <i class="fa-solid fa-user-pen"></i>글쓴이: ${board.memberId})
						</a>
					</p>
				</c:forEach>
			</div>
			
		</section>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>