// kg 이니시스 결제 API
var IMP = window.IMP;
IMP.init("imp28106118"); // 가맹점 식별코드

// IMP.request_pay(param, callback) 결제창 호출
function requestPay() {
    var title = document.querySelector(".kg_pay_btn").dataset.markettitle; // 상품이름
    var price = document.querySelector(".kg_pay_btn").dataset.buyprice; // 구매 총 가격
	var buycount = document.querySelector(".kg_pay_btn").dataset.buycount; // 주문번호
    var email = document.querySelector(".kg_pay_btn").dataset.buyemail; // 구매자 이메일
//  var name = document.querySelector(".kg_pay_btn").dataset.buyname; // 구매자 이름
    var phone = document.querySelector(".kg_pay_btn").dataset.buyphone; // 구매자 전화번호
    var addr = document.querySelector(".kg_pay_btn").dataset.buyaddr; // 구매자 주소
    var orderid = document.querySelector(".kg_pay_btn").dataset.buyorderid; // 주문번호
    
    IMP.request_pay(
        {
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: orderid,
          name: title,
          amount: 100,
		  count: buycount,
          buyer_email: email,
//        buyer_name: name,
          buyer_tel: phone,
          buyer_addr: addr,
          buyer_postcode: "1112121", // 우편번호 추가 예정
        },
        function (rsp) { // callback
            console.log(rsp);
            if (rsp.success) { // 결제 성공시
                var msg = "결제가 완료되었습니다.";
                alert(msg); // 성공 메시지 표시

                var result = {
                    orderid: rsp.merchant_uid, //주문번호
                    pay_method: rsp.pay_method, // 결제수단
                    name: rsp.name, // 상품이름
					count : rsp.count,
                    amount: rsp.amount, // 결제금액
                    buy_date: new Date().toISOString().slice(0, 10), // 결제일 
                    buy_site: "MuseLab",
					market_price:price
                };
                
				$.ajax({
				  url:'insertPay',
				  type:'POST',
				  contentType: 'application/json',
				  data:JSON.stringify(result),
				  success: function (res) {
				  console.log(res);
				  location.href=res;
				 },
				 error: function (err) {
				   console.log(err);
				  }
				}); //ajax
				alert(msg+JSON.stringify(result));
			} else {
				var msg = '결제 실패';
				msg += '\n에러내용 : ' + rsp.error_msg;
				alert(msg)
			}
	});
}