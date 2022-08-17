<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HandFlea</title>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/mypage_style.css">
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
						<a onclick="pwd_ch()">회원정보 변경</a>
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
				<h2>판매자 등록</h2>
				<div id="regist-box">
					<div class="input-block">
						<div class="input-label">
							<label for="seller_name">마켓명</label>
						</div>
						<div class="input-box">
							<input type="text" id="seller_name" name="seller_name" maxlength="20">
						</div>
					</div>
					<div class="input-block">
						<div class="input-label">
							배송지 주소
						</div>
						<div class="input-box">
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
					<div class="input-block">
						<div class="input-label">
							계좌
						</div>
						<div class="input-box">
							<div>
								<select id="bank" name="bank">
									<option value="0">--은행 선택--</option>
								</select>
								<button type="button" id="account_btn" name="account_btn">환불 계좌 가져오기</button> 
							</div>
							<div>
								<input type="text" id="account_no" name="account_no" placeholder="계좌 번호">
							</div>
						</div>
					</div>
					<div class="input-block">
						<button type="button" id="regist_btn" name="regist_btn">판매자 등록</button>
					</div>
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
	</script>
	<script>
	function pwd_ch() {
		var userinput = prompt("비밀번호를 입력해주세요.");
		if ("${login_info.mem_pwd}" == userinput) {
			location.href="${pageContext.request.contextPath}/mypage/myinfo";
		} else {
			alert("비밀번호가 틀렸습니다.");
			location.href="${pageContext.request.contextPath}/mypage/";
		}
	}
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