<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("userid");
	String userPw = request.getParameter("passwd");
	


%>
<h3>로그인 되었습니다.</h3>
<hr>
<p>아이디 : <%= userId %> </p>
<p>비밀번호 : <%= userPw %> </p>