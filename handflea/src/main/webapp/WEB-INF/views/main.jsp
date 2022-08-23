<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title> 상품 목록 </title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/product_style.css">
	</head>
	<body>
		<c:choose>
			<c:when test="${login_info.mem_email == 'admin'}">
				<%@include file="/WEB-INF/views/admin-header.jsp" %>
			</c:when>
			<c:otherwise>
				<%@ include file="/WEB-INF/views/header.jsp" %>
			</c:otherwise>
		</c:choose>
			
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
											<img alt="profile" src="${dto.mem_photopath}">
											<p>${dto.seller_name}</p>
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
											<img alt="profile" src="${dto.mem_photopath}"> <p>${dto.seller_name}</p>
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