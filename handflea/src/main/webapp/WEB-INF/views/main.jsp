<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 상품 목록 </title>
<style type="text/css">
#product {
	width: 100%;
}
.product-list {
	width: 100%;
	padding: 20px 0;
}
.item-box {
	width: 100%;
	display: flex;
	flex-direction: row;
	margin: 10px 0;
	flex-wrap: wrap;
}
.item-card {
	width: 23%;
	border: 1px solid #cecece;
	margin-bottom: 30px;
}
.item-card > a {
	color: black;
}
.item-card > a > img {
	width: 100%;
	height: 450px;
}
.item-detail {
	border-top: 1px solid #cecece;
}
.item-detail > p {
	font-size: small;
}
.item-detail > div {
	display: flex;
	flex-direction: row;
}
.item-detail > div > img {
	width: 18px;
	margin: 0;
}
.item-detail > div > p {
	font-size: small;
	margin: 0;
	margin-left: 3px;
	color: #595959;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		
		<main>
			<div id="product">
				<div class="product-list">
					<h3>&nbsp;&nbsp;&nbsp;BEST</h3><br>
					<div class="item-box">
					<c:forEach var="dto" items="${list}">
						<div class="item-card">
							<a href="${pageContext.request.contextPath}/product/detail?prdt_no=${dto.prdt_no}">
								<img alt="product_img" src="${dto.thumbnail_path}">
								<div class="item-detail">
									<div>
										<img alt="profile" src="${pageContext.request.contextPath}/resources/img/user.png"> <p>${dto.mem_email}</p>
									</div>
									<h4>${dto.prdt_name}</h4>
									<p>${dto.price}원</p>
									<p>별점</p>
								</div>
							</a>
						</div>
					</c:forEach>	
					</div>
					<h3>&nbsp;&nbsp;&nbsp;NEW</h3><br>
					<div class="item-box">
					<c:forEach var="dto" items="${list}">
						<div class="item-card">
							<a href="${pageContext.request.contextPath}/product/detail?prdt_no=${dto.prdt_no}">
								<img alt="product_img" src="${dto.thumbnail_path}">
								<div class="item-detail">
									<div>
										<img alt="profile" src="${pageContext.request.contextPath}/resources/img/user.png"> <p>${dto.mem_email}</p>
									</div>
									<h4>${dto.prdt_name}</h4>
									<p>${dto.price}원</p>
									<p>별점</p>
								</div>
							</a>
						</div>
					</c:forEach>	
					</div>
				</div>
			</div>	
		</main>
		
	<%@ include file="/WEB-INF/views/footer.jsp" %>	
</body>
</html>