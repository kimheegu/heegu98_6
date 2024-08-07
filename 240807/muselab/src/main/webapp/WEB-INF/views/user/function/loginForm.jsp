<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval expression="@environment.getProperty('kakao.restAPI')" var="restAPI"/>
<spring:eval expression="@environment.getProperty('kakao.Login')" var="Login"/>
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
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="${contextPath}/css/font.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<%@ include file="/WEB-INF/views/user/navbar.jsp" %>
		<div class="container text-center">
		<div class="d-flex justify-content-between">
			<div class="d-inline-block justify-content-between px-5 py-3">
				<div class="p-4 shadow bg-white">
					<h2 class="py-1">Login</h2>
					<form class="form-signin" action="${contextPath}/user/userLogin.do" method="post" id="loginFrm">
						<table>
							<tr>
								<td class="px-2">
									<div class="mb-3" style="border-bottom:1px solid black;">
										<input type="text" class="text-decoration-none p-2" style="border:none; outline:none;" name="userId" placeholder="ID" autofocus>
									</div>
									<div style="border-bottom:1px solid black;">
										<input type="password" class="text-decoration-none p-2" style="border:none; outline:none;" name="userPwd" placeholder="Password">
									</div>
								</td>
								<td rowspan="2">
									<button type="submit" class="text-decoration-none" style="color:black;" onclick="document.getElementById('loginFrm').submit();">
										<div class="mx-1 py-5 px-4" style="cursor:pointer;">
											<b>Login</b>
										</div>
									</button>
								</td>
							</tr>
						</table>
					</form>
					<!-- 카카오 로그인 -->
					<a href="https://kauth.kakao.com/oauth/authorize?client_id=${restAPI}&redirect_uri=${Login}&response_type=code&prompt=login"><img src="../images/kakao_login_medium_narrow.png"/></a>
				</div>
			</div>
		</div>
		</div>
		<%@ include file="/WEB-INF/views/user/footer.jsp" %>
	</body>
</html>
