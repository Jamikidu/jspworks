<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="abDAO" class="address.AddrBookDAO" scope="application" />
<%
	String username =request.getParameter("username");
	abDAO.deleteAddrBook(username);	//삭제
	
	//페이지 이동
	response.sendRedirect("addrList.jsp");	//삭제 후 이동


%>