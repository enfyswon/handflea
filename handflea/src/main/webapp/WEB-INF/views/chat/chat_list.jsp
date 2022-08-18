<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Handflea</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
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
				</div>
				<div id="chat-detail">
					채팅내용
					<div id="chat-history" name="contentsList">
					</div>
					<div id="send_form">
					</div>
				</div>
			</div>			
		</main>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
	const FirstChatList = function() {
		$.ajax({
			url : "${pageContext.request.contextPath}/chat/list", 
			method : "get", 
			data : {
			}, 
			success : function(data) {
				alert("메세지 리스트 로드");
				$("#chat-list").html(data);
				
				$(".chat-list").on('click', function() {
					let chat_roomno = $(this).attr('room');
					let other_no = $(this).attr("other_no");
					
					$(".chat-list-box").not(".chat-list-box.chat-list.box" + chat_roomno).removeClass("active-chat");
					$(".chat-list-box" + chat_roomno).addClass("active-chat");
					
					let send_msg = "";
					send_msg += "<div class='type_msg'>";
					send_msg += "	<div class='input_msg_write row'>";
					send_msg += "		<div class='col-11'>";
					send_msg += "			<input type='text' class='form-control' id='write_chat' placeholder='메세지 입력' />";
					send_msg += "		</div>";
					send_msg += "		<div class='col-1'>";
					send_msg += "			<button id='send_btn' type='button'>전송</button>";
					send_msg += "		</div>";
					send_msg += "	</div>";
					send_msg += "</div>";
					
					$('#send_form').html(send_msg);
					$("#send_btn").on('click', function() {
						SendChat(chat_roomno, other_no);
					});
					ChatContentsList(chat_roomno, other_no);
				});
			}
		})
	};
	
	const ChatList = function() {
		$.ajax({
			url : "${pageContext.request.contextPath}/chat/list", 
			method : "get", 
			data : {
			}, 
			success : function(data) {
				alert("메세지 리스트 로드");
				$("#chat-list").html(data);
				
				$(".chat-list").on('click', function() {
					let chat_roomno = $(this).attr('room');
					let other_no = $(this).attr("other_no");
					
					$(".chat-list-box").not(".chat-list-box.chat-list.box" + chat_roomno).removeClass("active-chat");
					$(".chat-list-box" + chat_roomno).addClass("active-chat");
					
					let send_msg = "";
					send_msg += "<div class='type_msg'>";
					send_msg += "	<div class='input_msg_write row'>";
					send_msg += "		<div class='col-11'>";
					send_msg += "			<input type='text' class='form-control' id='write_chat' placeholder='메세지 입력' />";
					send_msg += "		</div>";
					send_msg += "		<div class='col-1'>";
					send_msg += "			<button id='send_btn' type='button'>전송</button>";
					send_msg += "		</div>";
					send_msg += "	</div>";
					send_msg += "</div>";
					
					$('#send_form').html(send_msg);
					$("#send_btn").on('click', function() {
						SendChat(chat_roomno, other_no);
					});
					ChatContentsList(chat_roomno, other_no);
				});
				$('.chat-list-box:first').addClass('active_chat');
			}
		})
	};
	
	const ChatContentsList = function(chat_roomno, other_no) {
		$.ajax({
			url : "${pageContext.request.contextPath}/chat/detail",
			method : "GET",
			data : {
				chat_roomno : chat_roomno,
				other_no : other_no
			},
			success : function(data) {
				alert("메세지 내용");
				$("#chat-history").html(data);
				$("#chat-history").scrollTop($("#chat-history")[0].scrollHeight);
			},
			error : function() {
				alert("서버 에러");
			}
		})
		
		$(".unread" + chat_roomno).empty();
	};
	
	const SendChat = function(chat_roomno, other_no) {
		let content = $("#write_chat").val();
		content = content.trim();
		
		if (content == "") {
			alert("메세지를 입력하세요.");
		} else {
			$.ajax({
				url : "${pageContext.request.contextPath}/chat/send",
				method : "GET", 
				data : {
					chat_roomno : chat_roomno,
					other_no : other_no,
					chat_contents : content
				}, 
				success : function(data) {
					alert("메세지 전송 성공");
					$("#write_chat").val("");
					
					ChatContentsList(chat_roomno, other_no);
					ChatList();
				}, 
				error : function() {
					alert("서버 에러");
				}
			});
		}
	};
	
	$(document).ready(function() {
		FirstChatList();
	});
	
	</script>
	</body>
</html>