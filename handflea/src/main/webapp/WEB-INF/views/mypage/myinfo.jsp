<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HandFlea</title>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
								프로필 사진
							</div>
							<div class="info-contents">
								<img alt="profile" src="${pageContext.request.contextPath}/resources/img/user.png">
								사진은 회원님의 게시물이나 리뷰 등에 사용됩니다.
								<button type="button">사진 변경</button>
							</div>
						</div>
						<div class="info-line">
							<div class="info-label">
								이메일
							</div>
							<div class="info-contents">
								member Email
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
								이름
							</div>
							<div class="info-contents">
								member name
							</div>
						</div>
						<div class="info-line">
							<div class="info-label">
								기본 배송지
							</div>
							<div class="info-contents">
								<div>
									<input type="text" id="seller_add_1" name="seller_add_1" placeholder="우편번호">
									<button type="button" id="add_btn" name="add_btn" onclick="DaumPostcode()">우편번호 찾기</button>
								</div>
								<div>
									<input type="text" id="seller_add_2" name="seller_add_2" placeholder="도로명 주소">
								</div>
								<div>
									<input type="text" id="seller_add_3" name="seller_add_3" placeholder="상세 주소">
									<input type="text" id="seller_add_4" name="seller_add_4" placeholder="참고항목">
								</div>
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
						<div class="info-line">
						이메일, 이름은 수정이 불가능합니다.
						</div>
					</div>
				</div>
				<div>
					<div class="info-title">
						<h2>추가 회원 정보</h2>
						<h2 class="type">선택</h2>
					</div>
					<div class="info-line">
						<div class="info-label">
							생년월일
						</div>
						<div class="info-contents">
							<p>1997.01.01</p>
						</div>
					</div>
					<div class="info-line">
						<div class="info-label">
							환불 계좌
						</div>
						<div class="info-contents">
							<div>
								<select id="bank" name="bank">
									<option value="0">--은행 선택--</option>
								</select>
							</div>
							<div>
								<input type="text" id="account_no" name="account_no" placeholder="계좌 번호">
							</div>
						</div>
					</div>
				</div>
				<c:if test="true">
				<div>
					<h2>판매자 정보</h2>
					<div class="info-line">
						<div class="info-label">
							발송지
						</div>
						<div class="info-contents">
							<div>
								<input type="text" id="seller_add_1" name="seller_add_1" placeholder="우편번호">
								<button type="button" id="add_btn" name="add_btn" onclick="DaumPostcode()">우편번호 찾기</button>
							</div>
							<div>
								<input type="text" id="seller_add_2" name="seller_add_2" placeholder="도로명 주소">
							</div>
							<div>
								<input type="text" id="seller_add_3" name="seller_add_3" placeholder="상세 주소">
								<input type="text" id="seller_add_4" name="seller_add_4" placeholder="참고항목">
							</div>
						</div>
					</div>
					<div class="info-line">
						<div class="info-label">
							인출계좌
						</div>
						<div class="info-contents">
							<div>
								<select id="bank2" name="bank">
									<option value="0">--은행 선택--</option>
								</select>
								<button type="button" id="account_btn" name="account_btn">환불 계좌 가져오기</button> 
							</div>
							<div>
								<input type="text" id="account_no" name="account_no" placeholder="계좌 번호">
							</div>
						</div>
					</div>
				</div>
				</c:if>
			</div>
		</main>	
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
	$(document).ready(function() {
		$.get(
				"${pageContext.request.contextPath}/mypage/bank",
				function(data, status) {
					$.each(JSON.parse(data), function(idx, dto) {
						$("#bank").append("<option value='" + dto.bank_no + "'>" + dto.bank_name + "</option>");
					})
				}
		);
	});
	$(document).ready(function() {
		$.get(
				"${pageContext.request.contextPath}/mypage/bank",
				function(data, status) {
					$.each(JSON.parse(data), function(idx, dto) {
						$("#bank2").append("<option value='" + dto.bank_no + "'>" + dto.bank_name + "</option>");
					})
				}
		);
	});
	</script>
	<script>
	function DaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				let addr = '';
				let extraAddr = '';
				
				if(data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else {
					addr = data.jibunAddress;
				}
				
				if(data.userSelectedType === 'R') {
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					
					if(data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== ''?', ' + data.buildingName : data.buildingName);
					}
					
					if(extraAddr !== '') {
						extraAddr = '(' + extraAddr + ')';
					}
					
					document.getElementById("seller_add_4").value = extraAddr;
				} else {
					document.getElementById("seller_add_4").value = '';
				}
				
				document.getElementById("seller_add_1").value = data.zonecode;
				document.getElementById("seller_add_2").value = addr;
				document.getElementById("seller_add_3").focus();
			}
		}).open();
	}
	</script>
	</body>
</html>