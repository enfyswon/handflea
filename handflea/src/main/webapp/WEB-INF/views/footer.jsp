<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style type="text/css">
			* {
				margin : 0;
				margin : auto;
			}
			#footer {
				box-shadow: -3px -4px 6px -1px rgba(0, 0, 0, 0.06);
			}
			#footer-main {
				width: 80%;
				padding-top : 20px;
			}
			#footer-logo {
				display: inline-block;
				float : left;
			}
			#footer-logo>img {
				width : 200px;
			}
			.footer-cnts {
				display: inline-block;
				margin-right : 8%;
				float : right;
			}
			.footer-cnts>p {
				font-size: small;
			}
			#center {
				font-size : medium;
				font-weight: bold;
			}
			#tel {
				font-size : x-large;
				font-weight : bold;
				color : #0F8BFF;
				margin-bottom : 8px;
			}
		</style>
	</head>
	<body>
		<div id="footer">
			<div id="footer-main">
				<div id="footer-logo">
					<img alt="logo" src="${pageContext.request.contextPath}/resources/img/logo.png">
				</div>
				<div class="footer-cnts">
					<br><br>
					<p>상품 문의는 각 상품의 판매자에게 1:1 채팅을 통해 문의해주세요.</p>
					<br>
					<p>핸드필리는 통신 판매중개자이며, 통신 판매의 당사자가 아닙니다.</p>
					<p>따라서 핸드플리는 상품, 거래 정보 및 거래에 대하여 책임을 지지 않습니다.</p>
				</div>
				<div class="footer-cnts">
					<p id="center">고객센터</p>
					<p id="tel">02-1111-1111</p>
					<p>평일 오전 10시 ~ 오후 6시 / 점심 시간 12:00 - 13:00</p>
					<p>토, 일요일 및 공휴일 휴무</p>
					<br>
					<p>광고/제휴 context : HandFlea@handflea.co.kr</p>
				</div>
			</div>
		</div>
	</body>
</html>