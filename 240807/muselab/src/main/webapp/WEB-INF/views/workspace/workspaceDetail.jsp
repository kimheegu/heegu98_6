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
			<div class="content p-3">
				<c:forEach var="workspace" items="${workspaceList}">
				                <h2>${workspace.musicTitle}</h2>
				                <hr>
				                <div class="card w-75 mx-auto">
				                    <div class="card-body">
				                        <p class="card-title text-end">${workspace.musicDate}</p>
				                        <h4 class="card-text"><pre>${workspace.musicInfo}</pre></h4>
				                    </div>
				                </div>
				            </c:forEach>
				            <hr>
				            <a href="javascript:history.back()" class="btn btn-lg btn-secondary back-button">&laquo;&nbsp;Back</a>
							
							<hr>
							<form action="${contextPath}/workspace/musicCommentInsert.do" method="post">
								<input type="text" class="form-control" name="musicCommentContent">
								<input type="hidden" name="musicId" value=${musicId}>
								<input type="hidden" name="userId" value=${user[0].userId}>
								<button type="submit" class="btn btn-primary">등록</button>
							</form>	
			       </div>
		</div>
		<%@ include file="/WEB-INF/views/user/footer.jsp" %>
	</body>
</html>
