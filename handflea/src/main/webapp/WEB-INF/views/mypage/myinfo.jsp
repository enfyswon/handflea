<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HandFlea</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/mypage_style.css">
<style type="text/css">
.info-title {
	display: inline-flex;
	flex-direction: row;
}
.info-title > h2 {
	margin-right: 7px;
}
.type {
	color: #0F8BFF;
}
.info-line {
	display: flex;
	flex-direction: row;
	border-top: 1px solid #595959;
}
.info-label {
	width: 20%;
	text-align: center;
}
.info-contents {
	width: 80%;
}
</style>
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
						<a href="${pageContext.request.contextPath}/mypage/myinfo">회원정보 변경</a>
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
				<div id="info">
					<div class="info-title">
						<h2>기본 회원 정보</h2>
						<h2 class="type">필수</h2>
					</div>
					<div class="info-box">
						<div class="info-line">
							<div class="info-label">
								<p>프로필 사진</p>
							</div>
							<div class="info-contents">
							</div>
						</div>
						<div class="info-line">
							<div class="info-label">
								<p>이메일</p>
							</div>
							<div class="info-contents">
								<p>member Email</p>
							</div>
						</div>
						<div class="info-line">
							<div class="info-label">
								<label for="mem_pwd">비밀번호</label>
							</div>
							<div class="info-contents">
								<input type="password" id="mem_pwd" name="mem_pwd" placeholder="비밀번호">
							</div>
						</div>
						<div class="info-line">
							<div class="info-label">
								<p>이름</p>
							</div>
							<div class="info-contents">
								<p>member name</p>
							</div>
						</div>
						<div class="info-line">
							<div class="info-label">
								<p>기본 배송지</p>
							</div>
							<div class="info-contents">
								<div></div>
							</div>
						</div>
						<div class="info-line">
							<div class="info-label">
								<label for="tel">휴대폰 번호</label>
							</div>
							<div class="info-contents">
								<input type="text" id="tel" name="tel">
							</div>
						</div>
					</div>
				</div>
				<div>
					<div class="info-title">
						<h2>추가 회원 정보</h2>
						<h2 class="type">선택</h2>
					</div>
				</div>
				<c:if test="true">
				<div>
					<h2>판매자 정보</h2>
				</div>
				</c:if>
			</div>
		</main>	
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>