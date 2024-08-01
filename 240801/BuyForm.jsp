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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="${contextPath}/css/font.css" rel="stylesheet" type="text/css">
		<script src="/js/kg_requestPay.js">
		<style>
		    body {
		        background-image: url('${contextPath}/images/market/');
		        background-size: cover;
		    }
			.a{
				width:50%;
				height:20%;
			}
		    img{
				width:100%;
			}
		    .content {
		        background: rgba(255, 255, 255, 0.9);
		        padding: 20px;
		        border-radius: 8px;
		        opacity: 0.9;
		        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
		        margin-top: 50px;
		    }
		    
		    .content h2 {
		        padding-bottom: 10px;
		    }
		    
		    .card {
		        margin: 20px 0;
		    }
		    
		    .back-button {
		        text-decoration: none;
		        font-size: 1.25rem;
		    }
			
			.wrong_text{font-size:1rem;color:#f44e38;letter-spacing:-.2px;font-weight:300;margin:8px 0 2px;line-height:1em;display:none}
		</style>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/user/navbar.jsp" %>
		<div class="container p-2">
			<c:forEach var="sell" items="${buyList}">
				<img class="a" src="${contextPath}/images/market/${sell.marketImage1}">
				<h2 id="marketTitle">${sell.marketTitle}</h2>
				<p>${sell.marketCategory}</p>
				<p>구매가격 : ${sell.buyPrice}원</p>
				<p>구매수량 : ${sell.buyCount}개</p>
				${sell.marketDescription}	
				<br>
				<p>구매자 전화번호 : ${sell.userPhone}</p>
				<hr>			
				<button class="kg_pay_btn" data-markettitle="${sell.marketTitle}"
				data-buyprice="${sell.buyPrice}" 
				data-orderid="${sell.orderId}"
				data-buyemail="${sell.userEmail}"
				data-buytel="${sell.userPhone}"
				data-buyaddr="${sell.userAddress}"
				data-buycount="${sell.buyCount}"
				onclick="requestPay()">결제하기</button>
			<a href="javascript:history.back()" class="btn btn-secondary back-button">&laquo;뒤로가기</a>
		</div>	
		<%@ include file="/WEB-INF/views/user/footer.jsp" %>
			</c:forEach>
	</body>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
</html>	