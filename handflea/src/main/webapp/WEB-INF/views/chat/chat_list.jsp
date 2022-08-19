<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Handflea</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">	-->
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
#chat {
	width: 100%;
	height: 900px;
	max-height: 1000px;
	display: flex;
	flex-direction: row;
	border: 1px solid #cecece;
}
#chat-list-box {
	width : 30%;
	border-right: 1px solid #cecece;
}
#list-title {
	height: 50px;
	box-shadow: 0 3px 3px -1px rgba(0, 0, 0, 0.06);
	display: flex;
	align-items: center;
	text-align: center;
}
#list-title > h3 {
	margin: 0 auto;
}
#chat-list {
	margin-top: 5px;
}
.chat-list-box :hover {
	background-color: #C6E4FF;
}
.active-chat {
	background-color: #ededed;
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
.chat-ib > h4 {
	margin: 0;
}
.chat-ib > h4 > span {
	font-size: x-small;
	color: #808080;
	float: right;
	font-weight: 300;
}
.chat-cnts {
	width: 100%;
	display: flex;
	flex-direction: row;
	padding-top: 5px;
}
.chat-cnts-p {
	width: 85%;
	font-size: small;
	color: #808080;
	margin: 0;
}
.chat-cnts-p > p {
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 180px;
	margin: 0;
}
.unread {
	width: 8%;
	margin: 0;
}
.badge {
	height: 100%;
	aspect-ratio: 1 / 1;
	color: white;
	font-weight: 400;
	font-size: small;
	text-align: center;
	margin: 0;
	float: right;
	background-color: #F41137;
	border-radius: 50%;
}
#chat-detail {
	width : 70%;
}
#chat-history {
	overflow-y: auto; 
}
#contents-title {
	height: 50px;
	box-shadow: 0 3px 3px -1px rgba(0, 0, 0, 0.06);
	display: flex;
	align-items: center;
}
#contents-title > img {
	height: 100%;
	margin: 0;
}
#contents-title > h5 {
	width: 80%; 
	margin: 0 5px;
}
.time_date {
	color: #808080;
	font-size: x-small;
	font-weight: 300;
}
.received_chat {
	width: 60%;
	vertical-align: top;
	margin: 0 0 0 10px;
}
.received_chat p {
	background: #ededed none repeat scroll 0 0; 
	margin: 0;
	border-radius: 10px 10px 10px 0;
	font-size: 15px;
	padding: 5px;
}
.outgoing_chat {
	overflow-x: auto;
	width: 60%;
	text-align: right;
	padding-left: 35%;
}
.sent_chat {
	margin: 0;
}
.outgoing_chat p {
	background: #0F8BFF none repeat scroll 0 0; 
	margin: 0;
	border-radius: 10px 10px 0 10px;
	color : white;
	font-size: 15px;
	padding: 5px;
}
#input-chat {
	display: flex;
	flex-direction: row;
}
#write_chat {
	
}
#send_btn {

}
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<div id="chat">
				<div id="chat-list-box">
					<div id="list-title">
						<h3>채팅 내역</h3>
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
					send_msg += "	<div id='input-chat'>";
					send_msg += "		<div>";
					send_msg += "			<input type='text' class='form-control' id='write_chat' placeholder='메세지 입력' />";
					send_msg += "		</div>";
					send_msg += "		<div>";
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
					send_msg += "	<div id='input-chat'>";
					send_msg += "		<div>";
					send_msg += "			<input type='text' class='form-control' id='write_chat' placeholder='메세지 입력' />";
					send_msg += "		</div>";
					send_msg += "		<div>";
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
						$("#write_chat").val("");
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