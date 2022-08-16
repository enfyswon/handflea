<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HandFlea</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/mypage_style.css">
<style type="text/css">
#regist-box {
	background-color: #f4f4f4;
	border: 1px solid #cecece;
	margin: 10px 0;
}
.input-block {
	display: flex;
	flex-direction: row;
	margin: 3% 0;
}
.input-label {
	width: 20%;
	padding: 0 5%;
}
.input-box {
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
				<h3>판매자 등록</h3>
				<div id="regist-box">
					<div class="input-block">
						<div class="input-label">
							마켓명
						</div>
						<div class="input-box">
							<input type="text" id="seller_name" name="seller_name">
						</div>
					</div>
					<div class="input-block">
						<div class="input-label">
							배송지 주소
						</div>
						<div class="input-box">
							<div>
								<input type="text" id="seller_add_1" name="seller_add_1">
								<button>우편번호 찾기</button>
							</div>
							<div>
								<input type="text" id="seller_add_2" name="seller_add_2" placeholder="도로명 주소">
								<input type="text" id="seller_add_3" name="seller_add_3" placeholder="상세 주소">
							</div>
						</div>
					</div>
					<div class="input-block">
						<div class="input-label">
							계좌
						</div>
						<div class="input-box">
							<input type="text" placeholder="은행 이름">
							<input type="text" placeholder="계좌 번호">
							<button>환불 계좌 가져오기</button> 
						</div>
					</div>
					<button>판매자 등록</button>
				</div>
			</div>
		</main>
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>