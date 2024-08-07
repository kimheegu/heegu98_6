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
		<c:choose>
			<c:when test="${result=='loginFailed'}">
				<script>
					window.onload=function(){
						alert("아이디나 비밀번호가 올바르지 않습니다.");
					}
				</script>
			</c:when>
		</c:choose>
		<script src="https://cdn.tailwindcss.com"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="${contextPath}/css/font.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	<%@ include file="navbar.jsp" %>
	<div class="w-screen h-screen">
		<%@ include file="sideBann.jsp" %>
	<div class="container">
		<p>메인페이지</p>
	</div>
	</div>
	<%@ include file="footer.jsp" %>
	</body>
</html>
