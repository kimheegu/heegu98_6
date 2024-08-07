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
	<link href="../../../css/font.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg">
			<div class="container-fluid justify-content-start me-5 fw-semibold">
			<div class="navbar-nav text-center">
				<a class="nav-link mx-3" href="${contextPath}/user/userInfo.do">회원정보</a>
				<a class="nav-link mx-3" href="#">작성 글</a>
				<a class="nav-link mx-3" href="#">작성 댓글</a>
				<a class="nav-link mx-3" href="#">구매 내역</a>
				<a class="nav-link mx-3" href="#">판매 내역</a>
				<a class="nav-link mx-3" href="#">정산 내역</a>
			</div>
			</div>
		</nav>
	</div>
</body>