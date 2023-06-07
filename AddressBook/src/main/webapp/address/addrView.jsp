<%@page import="address.AddrBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 상세보기</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>
<jsp:useBean id="abDAO" class="address.AddrBookDAO" scope="application" />
<%
	String username = request.getParameter("username");
	AddrBook aB = abDAO.getAddrBook(username);
%>
<body>
	<div id="container">
		<h2>주소록 상세보기</h2>
		<hr>
			<table id="tbl_view">
				<tr>
					<td>이름</td>
					<td><input type="text" name="username" value="<%=aB.getUsername()%>" readonly="readonly"></td> 
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="tel" value="<%=aB.getTel()%>" readonly="readonly")></td> 
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" value="<%=aB.getEmail()%>" readonly="readonly"></td> 
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="text" name="gender" value="<%=aB.getGender()%>" readonly="readonly"></td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="addrList.jsp"><input type="button" value="목록"></a>
					</td>
				</tr>
			</table>
		
	</div>
</body>
</html>