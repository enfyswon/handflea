<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style type="text/css">
			*{margin : auto;}
			a {
				text-decoration: none;
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
			}
			#logo {
				height : 150px;
				display : inline-block;
				margin : 0;
				float : left;
			}
			#search-bar {
				width: 50%;
				display : inline-block;
				margin: 0;
				float : left;
			}
			#icon-bar {
				width : 30%;
				display : inline-block;
				margin: 0;
				float : left;
			}
			#bottom-header {
				background-color: light-gray;
				height: 80px;
			}
		</style>
	</head>
	<body>
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
				검색창
			</div>
			<div id="icon-bar">
				<a href="#">
					<img alt="Q&A" src="./resources/img/QnA.png">
					<p>Q&A</p>
				</a>
			</div>
		</div>
		<div id="bottom-header">
			<a href="#">디저트</a>
			<a href="#">니트/뜨개</a>
			<a href="#">디자인/아트</a>
			<a href="#">캔들/디퓨저</a>
			<a href="#">가죽 공예</a>
			<a href="#">액세사리</a>
			<a href="#">잡화/기타</a>
		</div>
	</body>
</html>