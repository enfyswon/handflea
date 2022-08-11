<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %>     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<style type="text/css">
			*{
				margin : 0;
				margin : auto;
				padding : 0;
			}
			a {
				text-decoration: none;
			}
			ul {
				z-index: 999;
			}
			li {
				list-style: none;
			}
			#header {
				box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.06);
			}
			#top-header {
				background-color: #0F8BFF;
				height: 35px;
			}
			.top-item {
				color : white;
				float : right;
				margin-top: 6px;
				margin-right: 30px;
			}
			#middle-header {
				width : 80%;
				height : 130px;
				padding-top : 15px;
			}
			#logo-bar {
				width : 20%;
				display: inline-block;
				float : left;
				margin-right: 15px;
			}
			#logo {
				height : 100px;
				float : left;
			}
			#search-bar {
				width: 50%;
				display: inline-block;
				float : left;
				padding : 40px;
			}
			#search {
				width : 90%;
				height: 35px;
			}
			#search > input {
				width : 80%;
				line-heigth : 30px;
				padding : 5.5px;
				margin : 0;
				font-size: 13pt;
				display: inline-block;
			}
			#search > button {
				display : inline-block;
				text-align : center;
				text-decoration : none;
				font-size : 12pt;
				width : 60px;
				height : 35px;
				background-color: #0F8BFF;
				color : white;
				margin : 0;
				border : 0;
				outline : 0;
				border-radius: 4px;
			}
			#icon-bar {
				width : 22%;
				display: inline-block;
				float: right;
				padding-top : 15px;
			}
			.icon {
				width : 54px;
				height : 70px;
				float : left;
				margin : 7px;
			}
			.icon_img{
				width : 50px;
				margin : 0px 2px;
			}
			.icon_cnts {
				font-size : small;
				color : gray;
				width : 54px;
				text-align: center;
			}
			#bottom-header {
				width : 80%;
				height: 40px;
				border-bottom: 1px;
				border-bottom-color: #595959;
			}
			#navMenu {
				width: 100%;
				margin-bottom: 20px;
				text-align : center;
				position: relative;
			}
			#navMenu:after {
				content: ""; display: block; clear: both;
			}
			#big-menu > li {
				float : left;
				width : 13.5%;
				line-height: 40px;
			}
			#big-menu span:hover {
				color : 0F8BFF;
			}
			#big-menu span {
				font-size : medium;
				font-weight: bold;
			}
			.small-menu {
				position : absolute;
				top: 40px;
				width : 13.5%;
				display: none;
				padding : 20px 0;
				background-color: rgba(255, 255, 255, 0.5);
			}
			.side {
				float : none;
			}
			.side:after {
				content: "";
				display: block;
				clear : both;
			}
			.side:hover {
				color : #0F8BFF;
			}
		</style>
		<script type="text/javascript">
		$(document).ready(function() {
			$("#big-menu").mouseover(function() {
				$(".small-menu").stop().slideDown(300);
			});
			$("#big-menu").mouseout(function() {
				$(".small-menu").stop().slideUp(300);
			});
			$(".small-menu").mouseout(function() {
				$(".small-menu").stop().slideUp(300);
			});
		});
		</script>
	</head>
	<body>
		<div id="header">
			<div id="top-header">
				<a class="top-item" href="#">
					로그인
				</a>
				<a class="top-item" href="#">
					회원가입
				</a>
			</div>
			<div id="middle-header">
				<div id="logo-bar">
					<a href="${pageContext.request.contextPath}/">
						<img id="logo" alt="LOGO" src="${pageContext.request.contextPath}/resources/img/logo.png">
					</a>
				</div>
				<div id="search-bar">
					<div id="search">
						<input type="text" placeholder="검색">
						<button>검색</button>
					</div>
				</div>
				<div id="icon-bar">
					<div class="icon">
						<a href="#">
							<img class="icon_img" alt="cart" src="${pageContext.request.contextPath}/resources/img/cart.png">
							<p class="icon_cnts">장바구니</p>
						</a>
					</div>
					<div class="icon">
						<a href="${pageContext.request.contextPath}/chat/">
							<img class="icon_img" alt="chatting" src="${pageContext.request.contextPath}/resources/img/chat.png">
							<p class="icon_cnts">채팅</p>
						</a>
					</div>
					<div class="icon">
						<a href="#">
							<img class="icon_img" alt="Q&A" src="${pageContext.request.contextPath}/resources/img/qna.png">
							<p class="icon_cnts">Q&A</p>
						</a>
					</div>
				</div>
			</div>
			<div id="bottom-header">
				<div id="navMenu">
					<ul class="clearfix" id="big-menu">
						<li><span>디저트</span>
							<ul class="small-menu">
								<li class="side">빵</li>
								<li class="side">청</li>
								<li class="side">떡</li>
								<li class="side">잼</li>
								<li class="side">캔디류</li>
								<li class="side">초콜릿</li>
								<li class="side">기타</li>
							</ul>
						</li>
						<li><span>니트/뜨개</span>
							<ul class="small-menu">
								<li class="side">장갑</li>
								<li class="side">목도리</li>
								<li class="side">모자</li>
								<li class="side">코스터</li>
								<li class="side">수세미</li>
								<li class="side">매트</li>
								<li class="side">기타</li>
							</ul>
						</li>
						<li><span>디자인/아트</span>
							<ul class="small-menu">
								<li class="side">프로필</li>
								<li class="side">배너</li>
								<li class="side">스티커</li>
								<li class="side">이모티콘</li>
								<li class="side">카톡테마</li>
								<li class="side">배경화면</li>
								<li class="side">템플릿</li>
								<li class="side">기타</li>
							</ul>
						</li>
						<li><span>캔들/디퓨저</span>
							<ul class="small-menu">
								<li class="side">캔들</li>
								<li class="side">디퓨저</li>
								<li class="side">기타</li>
							</ul>
						</li>
						<li><span>가죽공예</span>
							<ul class="small-menu">
								<li class="side">지갑</li>
								<li class="side">소품</li>
								<li class="side">가방</li>
								<li class="side">기타</li>
							</ul>
						</li>
						<li><span>액세서리</span>
							<ul class="small-menu">
								<li class="side">귀걸이</li>
								<li class="side">목걸이</li>
								<li class="side">반지</li>
								<li class="side">팔찌</li>
								<li class="side">발찌</li>
								<li class="side">기타</li>
							</ul>
						</li>			
						<li><span>잡화/기타</span>
							<ul class="small-menu">
								<li class="side">잡화</li>
								<li class="side">기타</li>
							</ul>
						</li>		
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>