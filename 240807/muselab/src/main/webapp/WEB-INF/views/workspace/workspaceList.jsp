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
			           <h2 class="py-1">작업실</h2>
			           <hr>
			           <ul class="list-group">
			               <c:forEach var="workspace" items="${workspaceList}" varStatus="status">
			                           <a href="${contextPath}/workspace/workspaceDetail.do?musicId=${workspace.musicId}" class="text-decoration-none text-black">
			                   <li class="list-group-item list-group-item-action">
			                       <div class="d-flex justify-content-between">
			                               <span>[${status.count}] ${workspace.musicTitle}</span>
			                           <span>${workspace.musicDate}</span>
			                       </div>
			                   </li>
			                           </a>
			               </c:forEach>
			           </ul>
			       </div>
		</div>
		<%@ include file="/WEB-INF/views/user/footer.jsp" %>
	</body>
</html>
