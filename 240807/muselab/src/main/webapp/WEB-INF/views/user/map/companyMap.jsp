<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval expression="@environment.getProperty('kakao.jsAPI')" var="jsAPI"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=${jsAPI}&libraries=services"></script>
		<meta charset="UTF-8">
		<title>MuseLab</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="${contextPath}/css/font.css" rel="stylesheet" type="text/css">
		<script src="https://cdn.tailwindcss.com"></script>
	</head>
	
	<body>
	<%@ include file="/WEB-INF/views/user/navbar.jsp" %>
	<div class="w-screen h-screen">
		<%@ include file="/WEB-INF/views/user/sideBann.jsp" %>
		<div class = "container">
		<h2>MuseLab 위치 정보</h2>
		<h5>대전광역시 서구 대덕대로 182 10층, 1005호실</h5>
		<hr>
		</div>
		<div class = "container">
			<div id="map" style="width:100%; height:500px;"></div>
				<script>
					var mapContainer = document.getElementById("map"), // 지도를 표시할 div 
						mapOption = {
							center: new kakao.maps.LatLng(36.349297874553194, 127.37766559092924), // 지도의 중심좌표
							level: 3 // 지도의 확대 레벨
						};  
					// 지도 생성
					var map = new kakao.maps.Map(mapContainer, mapOption); 
			
					// 주소-좌표 변환 객체를 생성
					var geocoder = new kakao.maps.services.Geocoder();
			
					// 주소로 좌표를 검색
					geocoder.addressSearch('대전광역시 서구 대덕대로 182', function(result, status) {
			
					// 정상적으로 검색이 완료됐으면 
					if (status === kakao.maps.services.Status.OK) {
			
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
					// 결과값으로 받은 위치를 마커로 표시
					var marker = new kakao.maps.Marker({
						map: map,
						position: coords
					});
					
					// 인포윈도우로 장소에 대한 설명, 길찾기 표시
					var infowindow = new kakao.maps.InfoWindow({
						content: '<div style="width:150px;text-align:center;padding:6px 0;">MuseLab <br><a class = "text-decoration-none" href="https://map.kakao.com/link/to/MuseLab,36.349297874553194, 127.37766559092924" style="color:#fe06c9" target="_blank">길찾기</a></div>'
					});
					infowindow.open(map, marker);
			
					// 지도의 중심을 결과값으로 받은 위치로 이동
						map.setCenter(coords);
						} 
					});
				</script>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/user/footer.jsp" %>
	</body>
</html>
