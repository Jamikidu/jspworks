<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://kit.fontawesome.com/1e31f1a091.js" crossorigin="anonymous"></script>
<header>
	<div id="logo">
		<h1><a href="/">Gangnam</a></h1>
	</div>
	<nav>
		<c:choose>
			<c:when test="${empty sessionId}">
				<ul id="topMenu">
					<li><a href="/loginForm.do"><i class="fa-solid fa-arrow-right-to-bracket"></i> 로그인</a></li>
					<li><a href="/memberForm.do"><i class="fa-solid fa-user-plus"></i> 회원가입</a></li>
					<li><a href="/boardList.do"><i class="fa-regular fa-clipboard"></i> 게시판</a></li>
					<li><a href="/memberList.do"><i class="fa-solid fa-address-book"></i> 회원목록</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul id="topMenu">
					<li><a href="/logout.do">(${sessionId})님 로그아웃 <i class="fa-solid fa-plug-circle-xmark"></i></a></li>
					<li><a href="/memberView.do?memberId=${sessionId}"><i class="fa-solid fa-id-card"></i> 나의 정보</a></li>
					<li><a href="/boardList.do"><i class="fa-regular fa-clipboard"></i> 게시판</a></li>
					<li><a href="/memberList.do"><i class="fa-solid fa-address-book"></i> 회원목록</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
	</nav>

</header>