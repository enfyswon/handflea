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
.info {
	margin-bottom: 2%;
}
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
	padding: 10px 0 ;
}
.info-label {
	width: 20%;
	text-align: center;
	display: flex;
	align-items: center;
}
#info-guide {
	font-size: small;
	margin-left: 10%;
}
.info-contents {
	width: 80%;
}
.info-contents > img {
	width: 100px;
}
.info-contents input {
	margin-top: 5px;
	padding: 5px;
}
#add_btn {
	background-color: #0F8BFF;
	color: white;
	outline: 0;
	border: 0;
	width: 100px;
	height: 30px;
	border-radius: 4px;
}
#button-box {
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
					<p>${login_info.mem_name} 님</p>
					<p style="font-size: small; margin-bottom: 10px;">${login_info.mem_email}</p>
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
						<a href="${pageContext.request.contextPath}/product/form">상품 등록 / 관리</a>
						<a href="#">판매 내역</a>
						<a href="#">정산</a>
						</c:if>
					</div>
				</div>
			</div>
			<div id="main-content">
				<div class="info">
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
								<img alt="profile" src="${pageContext.request.contextPath}/resources/img/user.png">
								사진은 회원님의 게시물이나 리뷰 등에 사용됩니다.
								<button type="button">사진 변경</button>
							</div>
						</div>
						<div class="info-line">
							<div class="info-label">
								<p>이메일</p>
							</div>
							<div class="info-contents">
								${login_info.mem_email}
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
								${login_info.mem_name}
							</div>
						</div>
						<div class="info-line">
							<div class="info-label">
								<p>기본 배송지</p>
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
								<input type="text" id="pnum" name="pnum">
							</div>
						</div>
						<div class="info-line">
							<p id="info-guide">이메일, 이름은 수정이 불가능합니다.</p>
						</div>
					</div>
				</div>
				<div class="info">
					<div class="info-title">
						<h2>추가 회원 정보</h2>
						<h2 class="type">선택</h2>
					</div>
					<div class="info-line">
						<div class="info-label">
							<p>생년월일</p>
						</div>
						<div class="info-contents">
							<p>1997.01.01</p>
						</div>
					</div>
					<div class="info-line">
						<div class="info-label">
							<p>환불 계좌</p>
						</div>
						<div class="info-contents">
							<select id="bank" name="bank">
								<option value="0">--은행 선택--</option>
							</select>
							<input type="text" id="account_no" name="account_no" placeholder="계좌 번호">
						</div>
					</div>
				</div>
				<c:if test="true">
				<div class="info">
					<h2>판매자 정보</h2>
					<div class="info-line">
						<div class="info-label">
							<p>발송지</p>
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
							<p>인출계좌</p>
						</div>
						<div class="info-contents">
							<select id="bank2" name="bank">
								<option value="0">--은행 선택--</option>
							</select>
							<input type="text" id="account_no" name="account_no" placeholder="계좌 번호">
						</div>
					</div>
				</div>
				</c:if>
				<div id="button-box">
					<button type="button" id="quit_btn" name="quit_btn">회원 탈퇴</button>
					<button type="button" id="save_btn" name="save_btn">저장</button>
				</div>
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