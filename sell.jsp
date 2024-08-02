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
		<script type="text/javascript">
			var sell_price;
			var amount;
			
			function init() {
				sell_price = document.form.sell_price.value;
				amount = document.form.amount.value;
				document.form.sum.value = sell_price;
				change();
			}
			
			function add() {
				hm = document.form.amount;
				sum = document.form.sum;
				hm.value++;
				
				sum.value = parseInt(hm.value) * sell_price;
				updateHiddenFields();
			}
			
			function del() {
				hm = document.form.amount;
				sum = document.form.sum;
				
				if(hm.value > 1){
					hm.value--;
					sum.value = parseInt(hm.value) * sell_price;
					updateHiddenFields();
				}
			}
			
			function change() {
				hm = document.form.amount;
				sum = document.form.sum;
				
				if(hm.value < 0){
					hm.value = 0;
				}
				sum.value = parseInt(hm.value) * sell_price;
				updateHiddenFields();
			}
			
			function updateHiddenFields() {
			    var amount = document.form.amount.value;
			    var totalPrice = document.form.sum.value;

			    // 아래 폼의 숨겨진 필드에 값을 설정
			    document.buyForm.buyCount.value = amount;
			    document.buyForm.buyPrice.value = totalPrice;
			}
		</script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="${contextPath}/css/font.css" rel="stylesheet" type="text/css">
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
		</style>
	</head>
		<body onload="init();">
			<%@include file="/WEB-INF/views/user/navbar.jsp"%>
				<div class="d-flex flex-row">
					<div class="container p-2">
						<c:forEach var="sell" items="${mkList}">
							<img class="a" src="${contextPath}/images/market/${sell.marketImage1}">
							<h2>${sell.marketTitle}</h2>
							<p>${sell.marketCategory}</p>
							<p>${sell.marketUser}</p>
							<c:choose>
								<c:when test="${sell.marketStock == 0}">
									<p>수량없음</p>
								</c:when>
								<c:otherwise>
									<form name="form" method="get">
										<input type=hidden name="sell_price" value="${sell.marketPrice}">
										<input type="text" name="amount" value="1" size="3" onchange="change();">
										<input type="button" value=" + " onclick="add();">
										<input type="button" value=" - " onclick="del();"><br>
										<p>가격 : <input type="text" name="sum" size="13" readonly>원</p>
									</form>
								</c:otherwise>	
						</c:choose>
						${sell.marketDescription}
						<form name="buyForm" action="${contextPath}/market/buyInsert.do" method="post">	
							<input type="hidden" name="marketId" value="${sell.marketId}">
							<input type="hidden" name="marketUser" value="${sell.marketUser}">
							<input type="hidden" name="buyPrice" value="">
							<input type="hidden" name="buyCount" value="">
							<input type="submit" value="구매하기">
						</form>
						<hr>
							<div class="card w-75 mx-auto">
								<div class="card-body">
									<p class="card-title text-end">${sell.marketContent}</p>
										<img src="${contextPath}/images/market/${sell.marketImage2}" >
										<img src="${contextPath}/images/market/${sell.marketImage3}">
										<img src="${contextPath}/images/market/${sell.marketImage4}">
										<img src="${contextPath}/images/market/${sell.marketImage5}">
						</c:forEach>
						<a href="javascript:history.back()" class="btn btn-secondary back-button">&laquo;뒤로가기</a>
					</div>
				</div>
			</div>
		</div>
	<%@include file="/WEB-INF/views/user/footer.jsp"%>	
	</body>
</html>	