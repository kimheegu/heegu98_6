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
			form[name='userProfileFrm']{position: relative;}
			#deleteImage{
				position: absolute;
				top: 0px;
				right: 240px;
				cursor: pointer;
			}
			/* 이미지 버튼 영역 */
			.profile-btn-area{
				width: 230px;
				margin: 20px 0;

				display: flex;
				justify-content: center;
				align-items: center;
			}

			.profile-btn-area > *{
				width: 110px;
				height: 33px;
				padding: 5px 10px;

				border: 1px solid black;
				background-color: white;
				font-size: 14px;
				cursor: pointer;
				text-align: center;
			}

			#imageInput{ display: none;}

			.profile-btn-area > button{
				background-color: #fe06c9;
				color : white;
				margin-left: 2px;
			}
			.nickname_ok{
				color:#008000;
				display:none;
			}
			.nickname_already{
				color:#802400;
				display:none;
			}
			textarea {
			    width: 100%;
			    height: 6.25em;
			    border: none;
			    resize: none;
			  }
		</style>
		<meta charset="UTF-8">
		<title>MuseLab</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="${contextPath}/css/font.css" rel="stylesheet" type="text/css">
		<script type="https://code.jquery.com/jquery-latest.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script type = "text/javascript" src="${contextPath}/js/modify.js"></script>
		<script src="/js/address.js"> 
		<script src="/js/profile.js"> 
	</head>
	<body>
		<%@ include file="/WEB-INF/views/user/navbar.jsp" %>
		<%@ include file="myPageCategory.jsp" %>
		<div class="container">
			<c:forEach var="user" items="${userList}">
			<!-- 토큰 값 X (일반 가입 유저) -->
			<c:if test="${sessionScope.accessToken==null}">
				<form action="${contextPath}/user/userProfileMod.do" method="post" name="userProfileFrm" id="profileFrm" enctype="multipart/form-data">
					<div class="profile-image-area">
							<!-- 프로필 이미지가 없으면 기본 이미지 -->
						<c:if test="${empty user.userProfile}" >
							<img src="${contextPath}/images/userprofile/profile.png" id="profileImage">
						</c:if>
						<!-- 프로필 이미지가 있으면 있는 이미지 -->
						<c:if test="${!empty user.userProfile}" >
							<img src="${contextPath}/images/userprofile/${user.userProfile}" id="profileImage">
						</c:if>
					</div>
					<div class="profile-btn-area">
						<label for="imageInput">이미지 선택</label>
						<input type="file" name="userProfile" id="imageInput">
						<button type="submit">변경하기</button>
					</div>
				</form>
				<form name="userModfrm" action="${contextPath}/user/userInfoMod.do" method="post" onSubmit="return checkUser()">
					<label>이름 &nbsp;</label><br>
					<input type="text" class="form-control" name="userName" value = "${user.userName}"><br>
					<label>전화번호 &nbsp;</label>
					<input type="text" class="form-control" name="userPhone" value = "${user.userPhone}"><br>
					<label>이메일 &nbsp;</label>
					<input type="email" class="form-control" name="userEmail" value = "${user.userEmail}"><br>
					<label>닉네임 &nbsp;</label>
					<input type="text" class="form-control" name="userNickname" value = "${user.userNickname}" oninput = "nicknameCheck()">
					<!-- 닉네임 실시간 중복 체크-->
					<span class = "nickname_ok">사용 가능한 닉네임입니다.</span>
					<span class = "nickname_already">중복된 닉네임입니다.</span>
					<br>
					<label>자기소개 &nbsp;</label><br>
					<textarea name="userInfo">${user.userInfo}</textarea><br>
					<label>주소 &nbsp;</label><br>
					<input type="text" class="form-control" name ="userPostcode" id="sample6_postcode" placeholder="우편번호" value="${user.userPostcode}"><br>
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" class="form-control" name ="userAddress" id="sample6_address" placeholder="주소" value="${user.userAddress}"><br>
					<input type="text" class="form-control" name ="userDetailAddress" id="sample6_detailAddress" placeholder="상세주소" value="${user.userDetailAddress}"><br>
					<input type="text" class="form-control" name ="userNote" id="sample6_extraAddress" placeholder="참고항목" value="${user.userNote}"><br>
					<label>거래은행 &nbsp;</label>
					<select id="bankselect" name="userBank">
						<option value="국민은행">국민은행</option>
						<option value="신한은행">신한은행</option>
						<option value="하나은행">하나은행</option>
						<option value="우리은행">우리은행</option>
						<option value="iM뱅크">iM뱅크</option>
						<option value="SC제일은행">SC제일은행</option>
						<option value="한국씨티은행">한국씨티은행</option>
						<option value="케이뱅크">케이뱅크</option>
						<option value="카카오뱅크">카카오뱅크</option>
						<option value="토스뱅크">토스뱅크</option>
						<option value="농협은행">농협은행</option>
						<option value="수협은행">수협은행</option>
						<option value="부산은행">부산은행</option>
						<option value="광주은행">광주은행</option>
						<option value="경남은행">경남은행</option>
						<option value="전북은행">전북은행</option>
						<option value="제주은행">제주은행</option>
						</select><br>
					<label>계좌번호 &nbsp;</label>
					<input type="text" class="form-control" name="userAccount" value = "${user.userAccount}"><br>
					<a class = "text-decoration-none" href = "${contextPath}/user/pwdModForm.do">비밀번호 변경</a>
					<button type="submit" class="btn btn-primary">등록</button>
				</form>
			</c:if>
			<!-- 토큰 값 O (카카오 가입 유저) -->
			<c:if test="${sessionScope.accessToken!=null}">
				<h3>카카오 회원가입 유저는 이름, 전화번호 및 이메일 변경이 불가합니다.</h3>
				<form action="${contextPath}/user/userProfileMod.do" method="post" name="userProfileFrm" id="profileFrm" enctype="multipart/form-data">
					<div class="profile-image-area">
						<!-- 프로필 이미지가 없으면 기본 이미지 -->
						<c:if test="${empty user.userProfile}" >
							<img src="${contextPath}/images/userprofile/profile.png" id="profileImage">
						</c:if>
						<!-- 프로필 이미지가 있으면 있는 이미지 -->
						<c:if test="${!empty user.userProfile}" >
							<img src="${contextPath}/images/userprofile/${user.userProfile}" id="profileImage">
						</c:if>
					</div>
					<div class="profile-btn-area">
						<label for="imageInput">이미지 선택</label>
						<input type="file" name="userProfile" id="imageInput">
						<button type="submit">변경하기</button>
					</div>
				</form>
				<form name="userModfrm" action="${contextPath}/user/userInfoMod.do" method="post" onSubmit="return checkUser()">
					<label>이름 &nbsp;${user.userName}</label><br>
					<input type="hidden" class="form-control" name="userName" value = "${user.userName}"><br>
					<label>전화번호 &nbsp; ${user.userPhone}</label>
					<input type="hidden" class="form-control" name="userPhone" value = "${user.userPhone}"><br>
					<label>이메일 &nbsp; ${user.userEmail}</label>
					<input type="hidden" class="form-control" name="userEmail" value = "${user.userEmail}"><br>
					<label>닉네임 &nbsp;</label>
					<input type="text" class="form-control" name="userNickname" value = "${user.userNickname}" oninput = "nicknameCheck()">
					<!-- 닉네임 실시간 중복 체크-->
					<span class = "nickname_ok">사용 가능한 닉네임입니다.</span><br>
					<span class = "nickname_already">중복된 닉네임입니다.</span><br>
					<label>자기소개 &nbsp;</label><br>
					<textarea name="userInfo">${user.userInfo}</textarea><br>
					<label>주소 &nbsp;</label><br>
					<input type="text" name ="userPostcode" id="sample6_postcode" placeholder="우편번호" value="${user.userPostcode}"><br>
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name ="userAddress" id="sample6_address" placeholder="주소" value="${user.userAddress}"><br>
					<input type="text" name ="userDetailAddress" id="sample6_detailAddress" placeholder="상세주소" value="${user.userDetailAddress}"><br>
					<input type="text" name ="userNote" id="sample6_extraAddress" placeholder="참고항목" value="${user.userNote}"><br>
					<label>거래은행 &nbsp;</label>
					<select id="bankselect" name="userBank">
						<option value="">선택</option>
						<option value="국민은행">국민은행</option>
						<option value="신한은행">신한은행</option>
						<option value="하나은행">하나은행</option>
						<option value="우리은행">우리은행</option>
						<option value="iM뱅크">iM뱅크</option>
						<option value="SC제일은행">SC제일은행</option>
						<option value="한국씨티은행">한국씨티은행</option>
						<option value="케이뱅크">케이뱅크</option>
						<option value="카카오뱅크">카카오뱅크</option>
						<option value="토스뱅크">토스뱅크</option>
						<option value="농협은행">농협은행</option>
						<option value="수협은행">수협은행</option>
						<option value="부산은행">부산은행</option>
						<option value="광주은행">광주은행</option>
						<option value="경남은행">경남은행</option>
						<option value="전북은행">전북은행</option>
						<option value="제주은행">제주은행</option>
						</select><br>
					<label>계좌번호 &nbsp;</label>
					<input type="text" class="form-control" name="userAccount" value = "${user.userAccount}"><br>
					<button type="submit" class="btn btn-primary">등록</button>
				</form>
			</c:if>
			</c:forEach>
		</div>
		<%@ include file="/WEB-INF/views/user/footer.jsp" %>
	</body>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>