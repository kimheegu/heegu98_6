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
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="${contextPath}/css/font.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div style="background-color: #262626;" class="shadow">
		<div class="container">
			<div class="d-flex justify-content-between">
				<a id="logo" href="${contextPath}/user/userMain.do">MuseLab</a>
				<span class="pt-3">
				  <button class="btn" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#F5F5F5" class="bi bi-person-fill" viewBox="0 0 16 16">
					  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
					</svg>
				  </button>
				  <ul class="dropdown-menu">
				<c:if test="${sessionScope.user==null}">
				    <li><a class="dropdown-item" href="${contextPath}/user/loginForm.do">로그인</a></li>
				    <li><a class="dropdown-item" href="${contextPath}/user/userJoinForm.do">회원가입</a></li>
				</c:if>
				<c:if test="${sessionScope.user!=null}">
					<li><a class="dropdown-item" href="${contextPath}/user/userInfo.do">마이페이지</a></li>
				    <li><a class="dropdown-item" href="${contextPath}/user/logout.do">로그아웃</a></li>
				</c:if>
				  </ul>

				<button class="btn"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="#F5F5F5" class="bi bi-envelope-fill" viewBox="0 0 16 16">
  <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414zM0 4.697v7.104l5.803-3.558zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586zm3.436-.586L16 11.801V4.697z"/>
</svg></button>
				<button class="btn"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#F5F5F5" class="bi bi-search" viewBox="0 0 16 16">
  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
</svg></button>
				</span>				
			</div>
		</div>
		<nav class="navbar navbar-expand-lg pb-2" data-bs-theme="dark" style="padding:0;">
			<div class="container">
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
					data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent"> <!-- 내비바 -->
					<ul class="navbar-nav mb-2 mb-lg-0 fw-bolder text-center">
						<li class="nav-item me-3">
							<a class="nav-link active" id="userNav" href="${contextPath}/workspace/workspaceList.do">작업실</a>
						</li>
						<li class="nav-item mx-3">
							<a class="nav-link active" id="userNav" href="#">라이브러리</a>
						</li>
						<li class="nav-item mx-3">
							<a class="nav-link active" id="userNav" href="#">커뮤니티</a>
						</li>
						<li class="nav-item mx-3">
							<a class="nav-link active" id="userNav" href="#">뮤즈마켓</a>
						</li>
						<li class="nav-item mx-3">
							<a class="nav-link active" id="userNav" href="#">아티클</a>
						</li>
						<li class="nav-item mx-3">
							<a class="nav-link active" id="userNav" href="#">이벤트</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
</body>
</html>