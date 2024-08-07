<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MuseLab</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="${contextPath}/css/font.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<%@ include file="/WEB-INF/views/user/navbar.jsp" %>
		<div class="container">
			<div>
				<c:forEach var="user" items="${userList}">
				<label >아이디 &nbsp;</label>
				<h3>${user.userId}</h3>
				<label>닉네임 &nbsp;</label>
				<h3>${user.userNickname}</h3>
				</c:forEach>
			</div>
			<a class = "text-decoration-none" href="${contextPath}/user/userMain.do">메인으로</a>
			<a class = "text-decoration-none" href="${contextPath}/user/loginForm.do">로그인</a>
		</div>
		<%@ include file="/WEB-INF/views/user/footer.jsp" %>
	</body>
</html>
