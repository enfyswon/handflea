<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 로그인 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400;500&display=swap" rel="stylesheet">
<style type="text/css">
* {
	margin : 0 auto;
	padding : 0;
	font-family: 'IBM Plex Sans KR', sans-serif;
}
main {
	width: 70%;
	margin-top : 20px;
	margin-bottom: 20px;
	text-align: center;
}
a {
	text-decoration: none;
}
img {
	width: 40%;
}
.mem-input input {
	padding: 5px;
	width: 30%;
	margin-top: 5px;
}
#login_btn {
	background-color: #0F8BFF;
	color: white;
	font-size: medium;
	width: 30%;
	border: 0;
	border-radius: 5px;
	outline: 0;
	padding: 5px;
	margin-top: 10px;
}
#mem_search {
	font-size: small;
	color: #c3c3c3;
	float: right;
}
</style>
	</head>
	<body>
		<main>
			<div>
				<a href="${pageContext.request.contextPath}/home">
					<img alt="logo" src="${pageContext.request.contextPath}/resources/img/logo.png">
				</a>
				<h4>로그인</h4>
			</div>
			<div class="mem-input">
				<input type="text" id="mem_email" name="mem_email" maxlength="20" placeholder="이메일" value="test@naver.com">
			</div>
			<div class="mem-input">
				<input type="password" id="mem_pwd" name="mem_pwd" maxlength="20" placeholder="비밀번호" value="1111">
			</div>
			<div>
				<button id="login_btn">로그인</button>
			</div>
			<div>
				<a href="#" id="mem_search">아이디/비밀번호 찾기</a>
			</div>
		</main>
		
	<script type="text/javascript">
	$(document).ready(function() {
		$("#login_btn").click(function() {

			$.post(
					"${pageContext.request.contextPath}/login"
					, {
						mem_email : $("#mem_email").val()
						, mem_pwd : $("#mem_pwd").val()
					}
					, function(data, status) {
						if(data == 0){
							alert("아이디와 패스워드가 올바르지 않습니다.");
						} else if(data == 1){
							location.href = "${pageContext.request.contextPath}/home";
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//post

		});//click
	});//ready
	</script>

	<script type="text/javascript">
	$(document).ready(function() {
		$("#mem_pwd").keyup(function() {

			if(event.keyCode == 13) {
				$("#login_btn").click();
			}

		});//click
	});//ready
	</script>

	</body>
</html>









