<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
			*{
				margin: 0 auto;
				padding : 0;
			}
			main {
				width : 80%;
			}
			#chat {
				width: 90%;
				background-color: #ddd;
				padding : 50px 0;
			}
			#chat-list {
				display: inline-block;
				width : 30%;
				background-color: teal;
				float: left;
			}
			#chat-detail {
				display: inline-block;
				width : 70%;
				background-color: aqua;
				float: right;
			}
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<div id="chat">
				<div id="chat-list">
					채팅목록
				</div>
				<div id="chat-detail">
					채팅내용
				</div>
			</div>			
		</main>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>