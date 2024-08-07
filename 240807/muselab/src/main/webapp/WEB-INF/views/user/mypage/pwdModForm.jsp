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
		<style>
			.origin_no{
				color:#802400;
				display:none;
			}
			.same_no{ 
				color:#802400;
				display:none;
			}
			.pwd_no{
				color:#802400;
				display:none;
			}
		</style>
		<meta charset="UTF-8">
		<title>MuseLab</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="${contextPath}/css/font.css" rel="stylesheet" type="text/css">
		<script type="https://code.jquery.com/jquery-latest.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script type = "text/javascript" src="${contextPath}/js/pwdmodify.js"></script>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/user/navbar.jsp" %>
		<%@ include file="myPageCategory.jsp" %>
		<div class="container">
			<c:forEach var="user" items="${userList}">
				<form name="userPwdModfrm" action="${contextPath}/user/userPwdMod.do" method="post" onSubmit="return pwdMod()">
					<input type="hidden" name="userId" id="userId" value="${user.userId}">
					<label>기존 비밀번호 입력 &nbsp;</label><br>
					<input type="password" class="form-control" name="originPwd" id="originPwd" oninput = "pwdCheck()" value = ""><br>
					<!-- 비밀번호 일치 체크 -->
					<span class = "origin_no">비밀번호가 일치하지 않습니다.</span>
					<br>
					<label>새로운 비밀번호 입력 &nbsp;</label><br>
					<input type="password" class="form-control" name="newPwd1" id="newPwd1"><br>
					<label>비밀번호 확인 &nbsp;</label><br>
					<input type="password" class="form-control" name="newPwd2" id="newPwd2"><br>
					<!-- 비밀번호 일치 체크 -->
					<span class = "same_no">기존 비밀번호와 동일합니다. 다른 비밀번호를 입력해 주세요.</span>
					<br>
					<span class = "pwd_no">비밀번호가 일치하지 않습니다.</span>
					<br>
					<button type="submit" class="btn btn-primary">등록</button>
				</form>
			</c:forEach>
		</div>
		<%@ include file="/WEB-INF/views/user/footer.jsp" %>
	</body>
</html>