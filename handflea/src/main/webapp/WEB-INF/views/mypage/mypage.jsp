<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HandFlea</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/mypage_style.css">
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	
		<main>
			<div id="side">
				<div id="profile">
					<h3>My Page</h3>
					<img alt="profile_photo" src="${pageContext.request.contextPath}/resources/img/user.png">
					<p>member name 님</p>
					<p style="font-size: small; margin-bottom: 10px;">member Email</p>
				</div>
				<div id="menu-box">
					<div id="menu-link">
						<h4>나의 쇼핑</h4>
						<a href="#">주문 내역</a>
						<a href="${pageContext.request.contextPath}/cart/">장바구니</a>
						<h4>나의 활동</h4>
						<a href="#">Q&A 문의 내역</a>
						<a href="#">내가 작성한 후기</a>
						<h4>내 정보</h4>
						<a href="#">회원정보 변경</a>
						<a href="${pageContext.request.contextPath}/mypage/regist">판매자 등록</a>
						<c:if test="false">
						<h4>판매자 메뉴</h4>
						<a href="#">상품 등록 / 관리</a>
						<a href="#">판매 내역</a>
						<a href="#">정산</a>
						</c:if>
					</div>
				</div>
			</div>
			<div id="main-content">
				<div id="order-box">
					<div class="order-cnts">
						<p>진행중인 주문</p>
						<h4>0 건</h4>
					</div>
					<div class="order-cnts">
						<p>환불</p>
						<h4>0 건</h4>
					</div>
					<div class="order-cnts">
						<p>장바구니</p>
						<h4>0 건</h4>
					</div>
					<c:if test="false">
					<div class="order-cnts">
						<p>판매중인 주문</p>
						<h4>0 건</h4>
					</div>
					<div class="order-cnts">
						<p>인출 가능 금액</p>
						<h4>0 원</h4>
					</div>
					</c:if>
				</div>
				<div class="record">
					<h4>최근 주문 내역</h4>
					<div class="list-box">
						<table>
							<tr class="list-top">
								<td>결제일</td>	<td>주문번호</td>	<td>상품명</td>
								<td>주문금액</td>	<td>상태</td>
							</tr>
							<tr>
								<td>결제일</td>	<td>주문번호</td>	<td>상품명</td>
								<td>주문금액</td>	<td>상태</td>
							</tr>
							<tr>
								<td>결제일</td>	<td>주문번호</td>	<td>상품명</td>
								<td>주문금액</td>	<td>상태</td>
							</tr>
							<tr>
								<td>결제일</td>	<td>주문번호</td>	<td>상품명</td>
								<td>주문금액</td>	<td>상태</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="record">
					<h4>나의 문의 내역</h4>
					<div class="list-box">
						<table>
							<tr class="list-top">
								<td>번호</td>	<td>문의제목</td>
								<td>문의날짜</td>	<td>상태</td>
							</tr>
							<tr>
								<td>번호</td>	<td>문의제목</td>
								<td>문의날짜</td>	<td>상태</td>
							</tr>
							<tr>
								<td>번호</td>	<td>문의제목</td>
								<td>문의날짜</td>	<td>상태</td>
							</tr>
							<tr>
								<td>번호</td>	<td>문의제목</td>
								<td>문의날짜</td>	<td>상태</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</main>	
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>