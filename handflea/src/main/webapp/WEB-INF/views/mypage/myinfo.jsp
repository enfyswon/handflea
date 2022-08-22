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
#mem_pwd {
	display: block;
	margin: 0;
}
.info-contents label {
	font-size: small;
	color: red;
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
#seller_add_btn{
	background-color: #0F8BFF;
	color: white;
	outline: 0;
	border: 0;
	width: 100px;
	height: 30px;
	border-radius: 4px;
}
#button-box {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	margin-bottom: 20px;
}
#button-box button {
	margin: 0;
	padding: 5px;
	width: 100px;
	border-radius: 4px;
}
#quit_btn {
	background-color: #f4f4f4;
}
#save_btn {
	background-color: #333333;
	color: white;
}
</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	
		<main>
			<div id="side">
				<div id="profile">
					<h3>My Page</h3>
					<!-- ${pageContext.request.contextPath}/resources/img/user.png -->
					<img alt="profile_photo" src="${myinfo.mem_photopath}">
					<p>${myinfo.mem_name} 님</p>
					<p style="font-size: small; margin-bottom: 10px;">${myinfo.mem_email}</p>
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
						<c:if test="${login_info.seller_yn != null && login_info.seller_yn != '0'}">
						<h4>판매자 메뉴</h4>
						<a href="${pageContext.request.contextPath}/product/form">상품 등록 / 관리</a>
						<a href="#">판매 내역</a>
						<a href="#">정산</a>
						</c:if>
					</div>
				</div>
			</div>
			<div id="main-content">
				<form id="user_info">
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
									<img alt="profile" src="${myinfo.mem_photopath}">
									<input type="file" id="profile" name="profile">
									<p>사진은 회원님의 게시물이나 리뷰 등에 사용됩니다.</p>
								</div>
							</div>
							<div class="info-line">
								<div class="info-label">
									<p>이메일</p>
								</div>
								<div class="info-contents">
									${myinfo.mem_email}
								</div>
							</div>
							<div class="info-line">
								<div class="info-label">
									<label for="mem_pwd">비밀번호</label>
								</div>
								<div class="info-contents">
									<input type="password" id="mem_pwd" name="mem_pwd"  value="${myinfo.mem_pwd}">
									<input type="password" id="repwd" name="repwd"  value="${myinfo.mem_pwd}">
									<label for="mem_pwd" id="mem_pwd_label"></label>
								</div>
							</div>
							<div class="info-line">
								<div class="info-label">
									<p>이름</p>
								</div>
								<div class="info-contents">
									${myinfo.mem_name}
								</div>
							</div>
							<div class="info-line">
								<div class="info-label">
									<p>기본 배송지</p>
								</div>
								<div class="info-contents">
									<div>
										<input type="text" id="post_code" name="post_code" placeholder="우편번호" readonly="readonly" value="${myinfo.post_code}">
										<button type="button" id="add_btn" name="add_btn" onclick="DaumPostcode()">우편번호 찾기</button>
									</div>
									<div>
										<input type="text" id="add_1" name="add_1" placeholder="도로명 주소" readonly="readonly" value="${myinfo.add_1}">
									</div>
									<div>
										<input type="text" id="add_2" name="add_2" placeholder="상세 주소" value="${myinfo.add_2}">
										<input type="text" id="add_3" name="add_3" placeholder="참고항목" readonly="readonly">
										<label id="add_label" for="add_2"></label>
									</div>
								</div>
							</div>
							<div class="info-line">
								<div class="info-label">
									<label for="pnum">휴대폰 번호</label>
								</div>
								<div class="info-contents">
									<input type="text" id="pnum" name="pnum" value="${myinfo.pnum}">
									<label id="pnum_label" for="pnum"></label>
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
								<p>환불 계좌</p>
							</div>
							<div class="info-contents">
								<input id="bank" value="${myinfo.bank_no}" hidden="hidden">
								<select id="bank_no" name="bank_no">
									<option value="0">--은행 선택--</option>
								</select>
								<input type="text" id="account_no" name="account_no" placeholder="계좌 번호" value="${myinfo.account_no}">
								<label id="account_no_label" for="account_no"></label>
							</div>
						</div>
					</div>
				
			<c:if test="${login_info.seller_yn != null && login_info.seller_yn != '0'}">
				<div class="info">
					<h2>판매자 정보</h2>
					<div class="info-line">
						<div class="info-label">
							<p>마켓명</p>
						</div>
						<div class="info-contents">
							<input type="text" id="seller_name" name="seller_name" maxlength="20" value="${myinfo.seller_name}">
						</div>
					</div>
					<div class="info-line">
						<div class="info-label">
							<p>발송지</p>
						</div>
						<div class="info-contents">
							<div>
								<input type="text" id="seller_post_code" name="seller_post_code" placeholder="우편번호" readonly="readonly" value="${myinfo.seller_post_code}">
								<button type="button" id="seller_add_btn" name="add_btn" onclick="sellerDaumPostcode()">우편번호 찾기</button>
							</div>
							<div>
								<input type="text" id="seller_add_1" name="seller_add_1" placeholder="도로명 주소" readonly="readonly" value="${myinfo.seller_add_1}">
							</div>
							<div>
								<input type="text" id="seller_add_2" name="seller_add_2" placeholder="상세 주소" value="${myinfo.seller_add_2}">
								<input type="text" id="seller_add_3" name="seller_add_3" placeholder="참고항목" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="info-line">
						<div class="info-label">
							<p>인출계좌</p>
						</div>
						<div class="info-contents">
							<input id="bank2" value="${myinfo.seller_bank_no}" hidden="hidden">
							<select id="seller_bank_no" name="seller_bank_no">
								<option value="0">--은행 선택--</option>
							</select>
							<input type="text" id="seller_account_no" name="seller_account_no" placeholder="계좌 번호" value="${myinfo.seller_account_no}">
						</div>
					</div>
				</div>
		</c:if>	
			</form>
				<div id="button-box">
					<button type="button" id="quit_btn" name="quit_btn">회원 탈퇴</button>
					<button type="button" id="save_btn" name="save_btn">저장</button>
				</div>
			</div>
		</main>	
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
	$(document).ready(function() {
		var addr = $("#add_2").val();
		var pos = addr.lastIndexOf(' ');
		if (pos != -1) {
			var extraaddr = addr.substring(pos+1);
			var add2 = addr.substring(0, pos);
			$("#add_2").val(add2);
			$("#add_3").val(extraaddr);
		}
		 
	});
	$(document).ready(function() {
		$.get(
				"${pageContext.request.contextPath}/mypage/bank",
				function(data, status) {
					$.each(JSON.parse(data), function(idx, dto) {
						$("#bank_no").append("<option value='" + dto.bank_no + "'>" + dto.bank_name + "</option>");
					});
					if($("#bank").val() != 0) {
						$("#bank_no").val($("#bank").val()).prop("selected", true);
					}
				}//callback function
		);
		
	});

	$(document).ready(function() {
		$.get(
				"${pageContext.request.contextPath}/mypage/bank",
				function(data, status) {
					$.each(JSON.parse(data), function(idx, dto) {
						$("#seller_bank_no").append("<option value='" + dto.bank_no + "'>" + dto.bank_name + "</option>");
					})
					if($("#bank2").val() != 0) {
						$("#seller_bank_no").val($("#bank2").val()).prop("selected", true);
					}
				}
		);
	});
	$(document).ready(function() {
		let pwd = ${login_info.mem_pwd};
		let onlyPwd = /^[a-z0-9~!@#$%^&*().]+$/;
		let onlyNum = /^[0-9]+$/;
		$("#save_btn").click(function() {
			if ($("#mem_pwd").val() != "") {
				if( $("#mem_pwd").val().match(onlyPwd) == null ){//허용되지 않은 글자는 null.
					$("#mem_pwd_label").text("영문 소문자, 숫자, 특수 문자만 허용 됩니다.");
					return;
				} else { $("#mem_pwd_label").text(""); }

				if( $("#mem_pwd").val() != $("#repwd").val() ){
					$("#mem_pwd_label").text("비밀번호와 비밀번호 확인이 서로 다릅니다.");
					return;
				} else { $("#mem_pwd_label").text(""); }
				pwd = $("#mem_pwd").val();
			} else { $("#mem_pwd_label").text(""); }
			
			if( $("#add_2").val() == "") {
				$("#add_label").text("상세주소를 입력해주세요.");
				return;
			} else { $("#add_label").text(""); }

			let add2 = $("#add_2").val();
			if ($("#add_3").val() != "") {
				add2 = add2 + " " + $("#add_3").val();
			}
			
			let pnum = $.trim($("#pnum").val());
			
			if (pnum == "") {
				$("#pnum_label").text("전화번호를 입력해주세요.");
				return;
			} else { $("#pnum_label").text(""); }

			if( ( pnum != "" && pnum.match(onlyNum) == null )){
				$("#pnum_label").text("숫자만 허용 됩니다.");
				return;
			} else { $("#pnum_label").text(""); }
			
			
			let account = $.trim($("#account_no").val());
			
			if (account != "" && account.match(onlyNum) == null) {
				$("#account_no_label").text("숫자만 허용됩니다.");
				return;
			} else { $("#account_no_label").text(''); }
			
			let form = new FormData( document.getElementById( "user_info" ) );
			
			let keys = form.keys();
			for(key of keys) console.log(key);

			let values = form.values();
			for(value of values) console.log(value);
			
			$.ajax({
				type : "POST" 
				, encType : "multipart/form-data" 
				, url : "${pageContext.request.contextPath}/mypage/info_update" 
				, data : form 
				, processData : false
				, contentType : false 
				, cache : false 
				, success : function(result) {
					alert("회원 정보가 수정되었습니다.");
					location.href = "${pageContext.request.contextPath}/mypage/myinfo";
				}, 
				error : function(xhr) {
					alert("잠시 후 다시 시도해주세요.");
				}
			});
			
		});//click
	});//ready
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
	$(document).ready(function() {
		$("#seller_add_btn"),click(function() {
			
		});//click
	});//ready
	function sellerDaumPostcode() {
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
					
					document.getElementById("seller_add_3").value = extraAddr;
				} else {
					document.getElementById("seller_add_3").value = '';
				}
				
				document.getElementById("seller_post_code").value = data.zonecode;
				document.getElementById("seller_add_1").value = addr;
				document.getElementById("seller_add_2").focus();
			}
		}).open();
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
					
					document.getElementById("add_3").value = extraAddr;
				} else {
					document.getElementById("add_3").value = '';
				}
				
				document.getElementById("post_code").value = data.zonecode;
				document.getElementById("add_1").value = addr;
				document.getElementById("add_2").focus();
			}
		}).open();
	}
	</script>
	</body>
</html>