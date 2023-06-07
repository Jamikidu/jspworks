<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션 가져오기
	String id = (String)session.getAttribute("userId");	//null  <-지워짐
	String pw = (String)session.getAttribute("userPw");

	out.println("설정된 세션의 속성값[1]: " + id + "<br>");
	out.println("설정된 세션의 속성값[2]: " + pw + "<br>");
	
	//세션 모두 삭제
	session.invalidate();
	
	//삭제 이후에 session02가서 다시 켜보면 세션값이 사라져있음 

%>