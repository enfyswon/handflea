<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
}
th {
	font-weight: 500;
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
				<table>
					<thead>
						<tr>
							<th>상품</th>	<th>수량</th>	<th>배송비</th>
							<th>상품 금액</th>	<th>총 주문 금액</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="sum_total_price" value="0" />
						<c:forEach var="order" items="${order_list}">
						<c:set var="sum_total_price" value="${sum_total_price + order_list.total_price}" />
						<tr>
							<td>
								<div class="order-prdt">
									<div class="order-prdt-img">
										<img alt="product_img" src="${order_list.thumbnail_path}">
									</div>
									<div class="order-prdt-outline">
										<p>${order_list.prdt_name}</p>
										<p>옵션 : ${order_list.option_contents}</p>
									</div>
								</div>
							</td>
							<td>${order_list.buy_qty}</td>
							<td>${order_list.delivery_price}</td>
							<td>${order_list.price * order_list.buy_qty}</td>
							<td class="prdt-total-price">${order_list.total_price}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			<div>
			</div>
			<button>${sum_total_price}원 결제하기</button>
		</main>
		
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
	<script type="text/javascript">
	$(document).ready(function() {
	});
	</script>
</html>