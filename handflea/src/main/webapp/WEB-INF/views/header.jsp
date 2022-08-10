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
			#top {
				background-color: #0F8BFF;
				height: 35px;
			}
			.top-item {
				color : white;
				float : right;
				margin-top: 6px;
				margin-right: 30px;
			}
			#logo {
				height: 100px;
				width: 200px;
				background-color: gray;
			}
			#nav-bar {
				background-color: light-gray;
				height: 50px;
			}
		</style>
	</head>
	<body>
		<div id="top">
			<a class="top-item" href="#">
				로그인
			</a>
			<a class="top-item" href="#">
				회원가입
			</a>
		</div>
		<div class="container">
			<a href="${pageContext.request.contextPath}/">
				<img id="logo" alt="LOGO" src="#">
			</a>
		</div>
		<div id="nav-bar">
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