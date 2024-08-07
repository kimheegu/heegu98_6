<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<body>
<div id="obj">
  <div class="container">
	<a class="text-decoration-none" href="${contextPath}/kakao/muselabMap.do">지도</a>
  </div>
</div>
</body>

<style>
	#obj {
		position: absolute;
		width: 70px;
		height: 350px;
		right: 50px;
		border-radius: 70px;
		top: 250px;
		border: 1px solid #dddddd;
	}
</style>

<script>
	$(document).ready(function () {
		var tmp = parseInt($("#obj").css('top'));

		$(window).scroll(function () {
			var scrollTop = $(window).scrollTop();
			var obj_position = scrollTop + tmp + "px";
 
			$("#obj").stop().animate({
				"top": obj_position
			}, 500);
		}).scroll();
	});
</script>