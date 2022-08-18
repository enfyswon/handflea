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
	height: 500px;
	max-height: 1000px;
	display: flex;
	flex-direction: row;
	border: 1px solid #cecece;
}
#chat-list-box {
	width : 30%;
}
#list-title {
	height: 50px;
	box-shadow: 0 3px 3px -1px rgba(0, 0, 0, 0.06);
	display: flex;
	align-items: center;
	text-align: center;
}
#list-title > h5 {
	margin: 0 auto;
}
#chat-list {
	margin-top: 5px;
}
.chat-room {
	border-bottom: 1px solid #cecece;
	padding-top: 5px;
}
.chat-people {
	display: flex;
	flex-direction: row;
}
.chat-img {
	width: 15%;
	margin: 0 5px;
}
.chat-img img {
	width: 100%;
}
.chat-ib {
	width: 80%;
	margin: 0 5px;
}
.chat-ib > h6 > span {
	font-size: x-small;
	color: #808080;
	float: right;
}
.chat-cnts {
	width: 100%;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	display: flex;
	flex-direction: row;
}
.chat-cnts > p {
	width: 85%;
	font-size: small;
	color: #808080;
	margin: 0;
}
.badge {
	width: 100%;
	color: white;
	font-weight: 300;
	margin: 0;
	padding-bottom: 5px;
	border-radius: 45%;
	float: right;
}
#chat-detail {
	width : 70%;
	background-color: aqua;
}
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<div id="chat">
				<div id="chat-list-box">
					<div id="list-title">
						<h5>채팅 내역</h5>
					</div>
					<div id="chat-list">
					</div>
				</div>
				<div id="chat-detail">
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
				$("#chat-list").html(data);
				
				$(".chat-room").on('click', function() {
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
					
					$("#send_form").html(send_msg);
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
				$("#chat-list").html(data);
				
				$(".chat-room").on('click', function() {
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
			return;
		} 
		
		$.post(
				"${pageContext.request.contextPath}/chat/send",
				{
					chat_roomno : chat_roomno,
					other_no : other_no,
					chat_contents : content
				},
				function(data, status) {
					if (data >= 1) {
						ChatContentsList(chat_roomno, other_no);
						ChatList();
					} else if (data == 0) {
						alert("메세지 전송 실패");
					} else {
						alert("서버 에러");
					}
				}
		);
		
		/* $.ajax({
			url : "${pageContext.request.contextPath}/chat/send",
			method : "POST", 
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
		}) */
	};
	
	$(document).ready(function() {
		FirstChatList();
	});
	
	</script>
	</body>
</html>