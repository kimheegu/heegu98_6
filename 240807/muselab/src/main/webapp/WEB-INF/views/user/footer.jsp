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
	  <div class="container-fluid justify-content-end me-5 fw-semibold">
	      <div class="navbar-nav text-end">
	        <a class="nav-link mx-3" href="#">공지사항</a>
	        <a class="nav-link mx-3" href="#">운영참여</a>
	        <a class="nav-link mx-3" href="#">개인정보처리방침</a>
	        <a class="nav-link mx-3" href="#">이용약관</a>
	      </div>
	  </div>
	</nav>
		</div>
	<div class="p-3 mb-2" style="background-color: #262626;">
		<div class="container">
		<p id="logo" href="#" style="margin:0;">MuseLab</p>
		<small class="text-white">
			법인명 : ㈜뮤즈랩<br>
			대표 : 강가연, 김희구, 신호연, 유성문<br>
			<a id="companymap" href="${contextPath}/kakao/companyMap.do">대전광역시 서구 대덕로 182 10층</a><br>
			사업자등록번호 : 987-65-11111<br>
			©2024 muselab Inc. All rights Reserved<br>
		</small>
	<div>
		</div>
</body>

</html>