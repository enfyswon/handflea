<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HandFlea</title>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">	-->
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<style type="text/css">
main > div {
	width: 80%;
}
#cart {
	width: 100%;
	text-align: center;
	margin: 10px 0;
}
td {
	padding: 5px;
}
	</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	
		<main>
			<div>
				<h3>장바구니</h3>
				<button>전체 선택</button>
				<button>선택 삭제</button>
				<table id="cart">
					<thead>
						<tr>
							<th>선택</th>	<th>주문 상품</th>		<th>수량</th>
							<th>상품 금액</th>		<th>배송비</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox"></td>
							<td>
								<div></div>
							</td>
							<td>0</td>
							<td>10,200 원</td>
							<td>3,000 원</td>
						</tr>
					</tbody>
				</table>
				<div>
					<div>
						<div>
							<p>선택 상품 금액</p>
							<p>20,400</p> 원
						</div>
						<div>
							<p>배송비</p>
							<p>6,000</p> 원
						</div>
					</div>
					<div>
						<div>
							<p>총 주문 금액</p>
							<p>26,400</p> 원
						</div>
						<button>주문하기</button>
					</div>
				</div>
			</div>
			
		</main>
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>