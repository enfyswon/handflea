<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 마 이 페 이 지 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> 마 이 페 이 지 </h3>
		<hr>
		<div class="row">
			<!-- 주문 내역 start -->
			<div class="col-6">
				<div class="text-right mb-1">
						<a href="${pageContext.request.contextPath}/history/my_order_list">
							<button type="button" class="btn btn-link btn-sm">
								구매 내역 더보기
							</button>
						</a>
				</div>
			</div>
			<!-- 주문 내역 end -->
			<!-- 판매 내역 start -->
			<div class="col-6">
				<div class="text-right mb-1">
						<a href="javascript:alert('준비 중 입니다.');">
							<button type="button" class="btn btn-link btn-sm">
								판매 내역 더보기
							</button>
						</a>
				</div>
			</div>
			<!-- 판매 내역 end -->
		</div><!-- row -->
		<hr>
		<div class="row">
			<!-- 신용카드 정보 start -->
			<div class="col-6">
				<div class="text-right">
					<a href="${pageContext.request.contextPath}/credit/card/form">
						<button type="button" class="btn btn-link btn-sm">
							신용카드 정보 변경 바로가기
						</button>
					</a>
				</div>
				<iframe src="${pageContext.request.contextPath}/mypage/list_credit_card" title="test"
				width="100%" height="325" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0></iframe>
			</div>
			<!-- 신용카드 정보 end -->
			<!-- 배송지 정보 start -->
			<div class="col-6">
				<div class="text-right">
					<a href="${pageContext.request.contextPath}/delivery/form">
						<button type="button" class="btn btn-link btn-sm">
							배송지 정보 변경 바로가기
						</button>
					</a>
				</div>
				<iframe src="${pageContext.request.contextPath}/mypage/list_delivery" title="test"
				width="100%" height="325" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0></iframe>
			</div>
			<!-- 배송지 정보 end -->
		</div><!-- row -->
		<hr>
	<%@ include file="/WEB-INF/views/footer.jsp" %>

	</body>
</html>
