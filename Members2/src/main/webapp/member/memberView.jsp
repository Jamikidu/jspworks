<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
<jsp:include page="../header.jsp" />
   <div id="container">
      <section id="detail">
         <h2>회원 정보</h2>
         <table>
         	<tbody>
         		<tr>
         			<td><label>아이디</label></td>
         			<%-- <td><input type="text" name="memberId" value="${member.memberId}" readonly></td> --%>
         			<td><span>${member.memberId}</span></td>
         		</tr>
         		<tr>
         			<td><label>비밀번호</label></td>
         			<%-- <td><input type="text" name="passwd" value="${member.passwd}"></td> --%>
         			<td><span>${member.passwd}</span></td>
         		</tr>
         		<tr>
         			<td><label>이름</label></td>
         			<%-- <td><input type="text" name="name" value="${member.name}" readonly></td> --%>
         			<td><span>${member.name}</span></td>
         		</tr>
         		<tr>
         			<td><label>성별</label></td>
         			<td>
         				<c:if test="${member.gender eq '남'}">
         				<input type="radio" name="gender" value="남" checked onclick="return(false)">남
         				<input type="radio" name="gender" value="여" onclick="return(false)">여
         				</c:if>
         				<c:if test="${member.gender eq '여'}">
         				<input type="radio" name="gender" value="남" onclick="return(false)">남
         				<input type="radio" name="gender" value="여" checked onclick="return(false)">여
         				</c:if>
         			</td>
         		</tr>
         		<tr>
         			<td><label>가입일</label></td>
         			<td><fmt:formatDate value="${member.joinDate}" pattern="yyyy-MM-dd HH:mm:ss " /></td>
         		</tr>
         		<tr>
         			<td colspan="2">
         				<a href="/memberList.do"><button type="button">목록으로</button></a>
         				<a href="/memberUpdateForm.do?memberId=${member.memberId}"><button type="button">수정</button></a>
         				<a href="/deleteMember.do?memberId=${member.memberId}" onclick="return confirm('정말로 탈퇴하시겠습니까?')">
         				<button type="button">탈퇴</button></a>
         			</td>
         		</tr>
         	</tbody>
         </table>
         
      </section>
   </div>
	<jsp:include page="../footer.jsp" />
</body>
</html>