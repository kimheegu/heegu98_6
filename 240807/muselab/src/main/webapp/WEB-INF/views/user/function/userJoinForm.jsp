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
			.id_ok{
				color:#008000;
				display:none;
			}
			.id_already{
				color:#802400;
				display:none;
			}
			
			.pwd_no{
				color:#802400;
				display:none;
			}

			.nickname_ok{
				color:#008000;
				display:none;
			}
			.nickname_already{
				color:#802400;
				display:none;
			}
			
			.email_ok{
				color:#008000;
				display:none;
			}
			.email_no{
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
		<script type = "text/javascript" src="${contextPath}/js/join.js"></script>
		<script src="/js/randomNickName.js"></script>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/user/navbar.jsp" %>
		<div class="container">
			<form name="userJoinfrm" method="post" action="${contextPath}/user/userJoin.do" onSubmit="return checkUser()">
				<div>
					<label >아이디 &nbsp;</label>
					<input type="text" class="form-control" name="userId">
					<button class = "btn btn-primary idChk" type = "button" id = "idChk" name = "idChk" value = "N" onclick="idCheck();">중복 확인</button>
					<!-- 아이디 중복 체크 -->
					<span class = "id_ok">사용 가능한 아이디입니다.</span>
					<span class = "id_already">중복된 아이디입니다.</span>
					<br>
					<label>비밀번호 &nbsp;</label>
					<input type="password" class="form-control" name="userPwd"><br>
					<label>비밀번호 확인 &nbsp;</label>
					<input type="password" class="form-control" name="userPwd1" placeholder="비밀번호를 한 번 더 입력해 주세요.">
					<!-- 비밀번호 일치 체크 -->
					<span class = "pwd_no">비밀번호가 일치하지 않습니다.</span>
					<br>
					<label>닉네임 &nbsp;</label>
					<input type="text" class="form-control" name="userNickname" id="userNickname" oninput = "nicknameCheck()" value = "">
					<!-- 닉네임 실시간 중복 체크-->
					<span class = "nickname_ok">사용 가능한 닉네임입니다.</span>
					<span class = "nickname_already">중복된 닉네임입니다.</span>
					<br>
					<div id="mailInput" name="mailInput">
						<label for="email">이메일 &nbsp;</label>
						<input type="text" class="form-control" name="userEmail1" id="userEmail1">
						<select class = "form-control" name="userEmail2" id="userEmail2">
							<option>@naver.com</option>
							<option>@daum.net</option>
							<option>@gmail.com</option>
							<option>@hanmail.com</option>
							<option>@nate.com</option>
						</select>
						<button type="button" class="btn btn-primary" name = "mailChkBtn" id="mailChkBtn" onclick="mailCheck()" >본인인증</button>
					</div><br>
					<div id="mailNumber" name="mailNumber" style="display: none">
						<input type = "text" class="form-control" id = "codeNumber" name = "codeNumber" placeholder="인증번호 6자리를 입력해주세요!" maxlength="6">
						<button type="button" class="btn btn-primary" name="codeBtn" id="codeBtn" value = "N" onclick="confirmNumber()">이메일 인증</button>
					</div>
					<input type="text" id="confirm" name="confirm" style="display: none" value="">
					<!-- 본인인증 체크 -->
					<span class = "email_ok">인증이 완료되었습니다.</span>
					<span class = "email_no">인증번호가 틀렸습니다.</span>
					<br>
					<label>전화번호 &nbsp;</label>
					<input type="text" class="form-control" name="userPhone" placeholder="ex)010-1234-5678"><br>
				</div>
				<button type="submit" class="btn btn-primary">회원가입</button>
			</form>
		</div>
		<%@ include file="/WEB-INF/views/user/footer.jsp" %>
	</body>
</html>
