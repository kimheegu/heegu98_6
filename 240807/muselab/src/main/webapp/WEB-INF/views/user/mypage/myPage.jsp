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
			.profile-image-area{
			    width: 150px;
			    height: 150px;
			    border: 3px solid #ccc;
			    border-radius: 50%;

			    position: relative;

			    overflow: hidden;
			    display: flex;
			    justify-content: center;
			    align-content: center;
			}
			#profileImage{
			    height: 100%;
			}
		</style>
		<meta charset="UTF-8">
		<title>MuseLab</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="${contextPath}/css/font.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<%@ include file="/WEB-INF/views/user/navbar.jsp" %>
		<%@ include file="myPageCategory.jsp" %>
		<div class="container">
			<c:if test="${sessionScope.accessToken==null}"> <!-- 토큰 값 X (일반 가입 유저) -->
			<c:forEach var="user" items="${userList}">
			<div class="profile-image-area">
				<!-- 프로필 이미지가 없으면 기본 이미지 -->
				<c:if test="${empty user.userProfile}" >
					<img src="${contextPath}/images/userprofile/profile.png" id="profileImage">
				</c:if>
				<!-- 프로필 이미지가 있으면 있는 이미지 -->
				<c:if test="${!empty user.userProfile}" >
					<img src="${contextPath}/images/userprofile/${user.userProfile}" id="profileImage">
				</c:if>
			</div><br>
			<label>이름 &nbsp;${user.userName}</label><br>
			<label>아이디 &nbsp;${user.userId}</label><br>
			<label>전화번호 &nbsp;${user.userPhone}</label><br>
			<label>이메일 &nbsp;${user.userEmail}</label><br>
			<label>닉네임 &nbsp;${user.userNickname}</label><br>
			<label>자기소개 &nbsp;${user.userInfo}</label><br>
			<label>주소 &nbsp;${user.userPostcode} | ${user.userAddress} ${user.userDetailAddress}</label><br>
			<label>거래은행 &nbsp;${user.userBank}</label><br>
			<label>계좌번호 &nbsp;${user.userAccount}</label><br>
			</c:forEach>
			</c:if>
			<c:if test="${sessionScope.accessToken!=null}"> <!-- 토큰 값 O (카카오 가입 유저) -->
			<c:forEach var="user" items="${userList}">
			<div class="profile-image-area">
				<!-- 프로필 이미지가 없으면 기본 이미지 -->
				<c:if test="${empty user.userProfile}" >
					<img src="${contextPath}/images/userprofile/profile.png" id="profileImage">
				</c:if>
				<!-- 프로필 이미지가 있으면 있는 이미지 -->
				<c:if test="${!empty user.userProfile}" >
					<img src="${contextPath}/images/userprofile/${user.userProfile}" id="profileImage">
				</c:if>
			</div><br>
			<label>이름 &nbsp;${user.userName}</label><br>
			<label>전화번호 &nbsp;${user.userPhone}</label><br>
			<label>이메일 &nbsp;${user.userEmail}</label><br>
			<label>닉네임 &nbsp;${user.userNickname}</label><br>
			<label>자기소개 &nbsp;${user.userInfo}</label><br>
			<label>주소 &nbsp;${user.userPostcode} | ${user.userAddress} ${user.userDetailAddress}</label><br>
			<label>거래은행 &nbsp;${user.userBank}</label><br>
			<label>계좌번호 &nbsp;${user.userAccount}</label><br>
			</c:forEach>
			</c:if>
			<a class = "text-decoration-none" href = "${contextPath}/user/userModForm.do">정보 수정</a>
		</div>
		<%@ include file="/WEB-INF/views/user/footer.jsp" %>
	</body>
</html>
