<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style type="text/css">
			*{
				margin : 0;
				margin : auto;
			}
			a {
				text-decoration: none;
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
				height : 150px;
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
				width : 19%;
				display: inline-block;
				float: right;
				padding-top : 15px;
			}
			.icon {
				width : 50px;
				height : 70px;
				float : left;
				margin : 7px;
			}
			.icon_img{
				width : 50px;
			}
			.icon_cnts {
				font-size : small;
				color : gray;
				width : 50px;
				text-align: center;
			}
			#bottom-header {
				width : 80%;
				height: 40px;
				border-bottom: 1px;
				border-bottom-color: #595959;
			}
			.cate {
				display: inline-block;
				width: 13.5%;
				text-align: center;
			}
			.cate > a {			
				color : #595959;
			}
			.cate > a:hover {
				color : #0F8BFF;
			}
		</style>
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
						<img id="logo" alt="LOGO" src="./resources/img/logo.png">
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
							<img class="icon_img" alt="cart" src="./resources/img/cart.png">
							<p class="icon_cnts">장바구니</p>
						</a>
					</div>
					<div class="icon">
						<a href="#">
							<img class="icon_img" alt="chatting" src="./resources/img/chat.png">
							<p class="icon_cnts">채팅</p>
						</a>
					</div>
					<div class="icon">
						<a href="#">
							<img class="icon_img" alt="Q&A" src="./resources/img/qna.png">
							<p class="icon_cnts">Q&A</p>
						</a>
					</div>
				</div>
			</div>
			<div id="bottom-header">
				<div class="cate">
					<a href="#">디저트</a>
				</div>
				<div class="cate">
					<a href="#">니트/뜨개</a>
				</div>
				<div class="cate">
					<a href="#">디자인/아트</a>
				</div>
				<div class="cate">
					<a href="#">캔들/디퓨저</a>
				</div>
				<div class="cate">
					<a href="#">가죽 공예</a>
				</div>
				<div class="cate">
					<a href="#">액세사리</a>
				</div>
				<div class="cate">
					<a href="#">잡화/기타</a>
				</div>
			</div>
		</div>
	</body>
</html>