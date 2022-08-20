<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HandFlea</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
table {
	width: 100%;
	border: 1px solid #cecece;
	border-collapse: collapse;
}
th {
	font-weight: 500;
}
main > h3 {
	width: 80%;
}
main > div {
	margin: 20px auto;
	width: 80%;
}
#prdt-info-table {
	text-align: center;
}
#prdt-info-table th {
	border-bottom: 1px solid #cecece;
}
#prdt-info-table td {
	border-bottom: 1px solid #cecece;
}
.table-order {
	height: 80px;
}
.table-prdt {
	width: 60%;
}
.order-prdt {
	width: 100%;
	display: flex;
	flex-direction: row;
	margin: 0;
	align-items: center;
}
.order-prdt-img {
	width: 15%;
	display: flex;
	align-items: center;
}
.order-prdt-img > img {
	height: 70px;
	width: auto;
	overflow: hidden;
}
.order-prdt-outline {
	width: 90%;
	text-align: left;
	margin-left: 5px;
}
.order-prdt-outline a {
	color: black;
	text-decoration: none;
}
.order-prdt-outline a:hover {
	color: #0F8BFF;
}
.order-prdt-outline > p {
	font-size: small;
	margin-top: 5px;
}
.order-prdt-outline span {
	background-color: #808080;
	color: white;
	padding: 0 5px;
	margin-right: 5px;
}
.table-qty {
	width: 5%;
}
.table-dprice {
	width: 10%;
}
.table-prdtprice {
	width: 10%;
}
.table-totalprice {
	width: 15%;
}
#order-btn-box {
	text-align: center;
}
#order_btn {
	background-color: #0F8BFF;
	color: white;
	padding: 10px;
	border-radius: 5px;
}
</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	
		<main>
			<h3>결제하기</h3>
			<div id="buyer-info">
				<h5>수령자 정보</h5>
				<table>
					<tr>
						<th>수령인</th>
						<td>${buyer_info.mem_name}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${buyer_info.pnum}</td>
					</tr>
					<tr>
						<th>수령인</th>
						<td>(${buyer_info.post_code})${buyer_info.add_1} ${buyer_info.add_2}</td>
						<td>
							<button>배송지 변경</button>
						</td>
					</tr>
					<tr>
						<th>배송 메모</th>
						<td>
							<select>
								<option>배송시 요청 사항을 선택해주세요.</option>
								<option>부재시 경비실에 맡겨주세요.</option>
								<option>배송 전 문자 주세요.</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
			<div id="prdt-info">
				<h5>상품 정보</h5>
				<table id="prdt-info-table">
					<thead>
						<tr class="table-title">
							<th>상품</th>	<th>수량</th>	<th>배송비</th>
							<th>상품 금액</th>	<th>총 주문 금액</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="sum_prdt_qty" value="0" />
						<c:set var="sum_total_price" value="0" />
						<c:forEach var="order" items="${list}">
						<c:set var="sum_prdt_qty" value="${sum_prdt_qty + 1}" />
						<c:set var="sum_total_price" value="${sum_total_price + order.total_price}" />
						<tr class="table-order">
							<td class="table-prdt">
								<div class="order-prdt">
									<div class="order-prdt-img">
										<img alt="product_img" src="${order.thumbnail_path}">
									</div>
									<div class="order-prdt-outline">
										<a href="${pageContext.request.contextPath}/product/detail?prdt_no=${order.prdt_no}">
											<p>${order.prdt_name}</p>
										</a>
										<p><span>옵션</span>${order.option_contents}</p>
									</div>
								</div>
							</td>
							<td class="table-qty">${order.buy_qty}</td>
							<td class="table-dprice">${order.delivery_price}</td>
							<td class="table-prdtprice">${order.price * order.buy_qty}</td>
							<fmt:parseNumber var="total_price" integerOnly="true" type="number" value="${order.total_price}" />
							<td class="table-totalprice">${total_price}</td>
						</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td>
								<p>상품수 : <span id="span_sum_prdt_qty">${sum_prdt_qty}</span></p>
							</td>
							<td colspan="4">
								<fmt:parseNumber var="total_sum" integerOnly="true" type="number" value="${sum_total_price}" />
								최종 결제 금액 : ${total_sum}
							</td>
						</tr>
					</tfoot>
				</table>
			</div>	
			<div id="order-btn-box">
				<button id="order_btn">결제하기</button>
			</div>
		</main>
		
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
	<script type="text/javascript">
	let str_basket_no = "";
	$.each( ${arr_basket_no}, function(idx, str) {
		if (idx == 0) {
			str_basket_no = str_basket_no + str;
		} else {
			str_basket_no = str_basket_no + "," + str;
		}
	});
	let buy_now_prdt_no = "${list[0].prdt_no}";
	let buy_now_qty = "${list[0].buy_qty}";
	let buy_now_option_no = "${list[0].option_no}";
	</script>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$("#order_btn").click(function() {
			$.post(
					"${pageContext.request.contextPath}/order/insert",
					{
						prdt_cnt : ${sum_prdt_qty}, 
						total_pay_amt : ${total_sum},
						str_basket_no : str_basket_no, 
						buy_now_prdt_no : buy_now_prdt_no, 
						buy_now_qty : buy_now_qty,
						buy_now_option_no : buy_now_option_no
					}, 
					function(data, status) {
						if (data >= 1) {
							alert("주문 성공");
							location.href="${pageContext.request.contextPath}/mypage/";
						} else if (data == 0) {
							alert("주문 실패");
						} else {
							alert("서버 에러");
						}
					}
			);
		});
	});
	</script>
</html>