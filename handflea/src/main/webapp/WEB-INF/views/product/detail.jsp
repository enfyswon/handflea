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
#prdt-outline {
	display: flex;
	flex-direction: row;
	width: 100%;
}
#prdt-img {
	width: 60%;
	margin: 5px;
	height: 450px;
	text-align: center;
}
#prdt-img > img {
	height: 100%;
}
#prdt-detail {
	width: 40%;
	height: 450px;
	border: 2px solid #cecece;
	margin: 10px;
}
#prdt-detail > div {
	margin: 10px 15px;
}
#prdt-detail h3 {
	padding: 5px 0;
}
#profile {
	display: flex;
	flex-direction: row;
	align-items: center;
}
#profile > img {
	width: 30px;
	height: 30px;
	margin: 0;
}
#profile > p {
	margin: 0 5px;
}
.prdt-element {
	display: flex;
	flex-direction: row;
	padding-top: 10px;
}
.element-label {
	width: 40%;
	margin: 0;
}
.element-value {
	width: 60%;
	margin: 0;
	display: flex;
	flex-direction: row;
}
.element-value > p {
	margin: 0;
}
.element-value > select {
	margin: 0;
}
.element-value > input {
	margin: 0;
}
#button-box {
	display: flex;
	flex-direction: row;
	padding: 20px 0 ;
}
#button-box button {
	margin: 0;
}
#left-button {
	align-items: flex-start;
}
#right-button {
}
	</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	
		<input type="hidden" id="prdt_no" value="${detail_dto.prdt_no}">
		<input type="hidden" id="mem_no" value="${detail_dto.mem_no}">
		<main>
			<div id="prdt-outline">
				<div id="prdt-img">
					<img alt="product_pic" src="${detail_dto.thumbnail_path}">
				</div>
				<div id="prdt-detail">
					<div id="profile">
						<img alt="profile" src="${pageContext.request.contextPath}/resources/img/user.png">
						<p>${detail_dto.seller_name}</p>
					</div>
					<div>
						<h3>${detail_dto.prdt_name}</h3>
					</div>
					<div class="prdt-element">
						<div class="element-label">
							판매가
						</div>
						<div class="element-value">
							<p id="price">${detail_dto.price}</p> <p>원</p>
						</div>
					</div>
					<div class="prdt-element">
						<div class="element-label">
							배송비
						</div>
						<div class="element-value">
							<p id="delivery">${detail_dto.delivery_price}</p> <p>원</p>
						</div>
					</div>
					<div class="prdt-element">
						<div class="element-label">
							상품 준비 기간
						</div>
						<div class="element-value">
							<p id="price">${detail_dto.prdt_rdy}</p> <p>일</p>
						</div>
					</div>
					<div class="prdt-element">
						<div class="element-label">
							구매 후기
						</div>
						<div class="element-value">
							<p>★★★★★</p>
						</div>
					</div>
					<div class="prdt-element">
						<div class="element-label">
							옵션
						</div>
						<div class="element-value">
							<select id="option_no" name="option_no">
								<option value="0" selected="selected">옵션을 선택하세요.</option>
							</select>
						</div>
					</div>
					<div class="prdt-element">
						<div class="element-label">
							수량
						</div>
						<div class="element-value">
							<input type="number" >
						</div>
					</div>
					<div id="button-box">
						<div id="left-button">
							<button id="chat_btn">문의하기</button>
						</div>
						<div id="right-button">
							<button>장바구니</button>
							<button>구매하기</button>
						</div>
					</div>
				</div>
			</div>
			<div>
				상품 설명
				<p>${detail_dto.description}</p>
			</div>
			<div>
				상품 후기
			</div>
		</main>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
	$(document).ready(function() {
		$.get(
				"${pageContext.request.contextPath}/product/option"
				, { prdt_no : $("#prdt_no").val() }
				, function(data, status) {
					$.each(JSON.parse(data), function(idx, dto) { 
						$("#option_no").append("<option value='" + dto.option_no + "'>" + dto.option_contents + "</option>");
					});//each
				}//call back function
		);//get
		$("#chat_btn").click(function() {
			alert($("#mem_no").val());
		});
	});//ready
	</script>
	
	</body>
</html>