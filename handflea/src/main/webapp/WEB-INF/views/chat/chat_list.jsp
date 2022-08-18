<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Handflea</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">	-->
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
			#chat {
				width: 100%;
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
			<h1>채팅</h1>
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
	<script type="text/javascript">
	const MessageList = function() {
		$.ajax({
			url : "${pageContext.request.contextPath}/chat/list", 
			method : "get", 
			data : {
			}, 
			success : function(data) {
				alert("메세지 리스트 로드");
				$("#chat-list").html(data);
			}
		})
	};
	$(document).ready(function() {
		MessageList();
	});
	
	</script>
	</body>
</html>