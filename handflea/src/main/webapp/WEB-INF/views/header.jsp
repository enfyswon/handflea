<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %>     
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400;500&display=swap" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/basic_style.css">
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
						<input type="text" placeholder="검색 키워드">
						<button>검 색</button>
					</div>
				</div>
				<div id="icon-bar">
					<a href="${pageContext.request.contextPath}/cart/">
						<div class="icon">
							<img class="icon_img" alt="cart" src="${pageContext.request.contextPath}/resources/img/cart.png">
							<p class="icon_cnts">장바구니</p>
						</div>
					</a>
					<a href="${pageContext.request.contextPath}/chat/">
						<div class="icon">
							<img class="icon_img" alt="chatting" src="${pageContext.request.contextPath}/resources/img/chat.png">
							<p class="icon_cnts">채팅</p>
						</div>
					</a>
					<a href="#">
						<div class="icon">
							<img class="icon_img" alt="Q&A" src="${pageContext.request.contextPath}/resources/img/qna.png">
							<p class="icon_cnts">Q&A</p>
						</div>
					</a>
				</div>
			</div>
			<div id="bottom-header">
				<div id="navMenu">
					<ul id="big-menu">
						<li>
							<a href="${pageContext.request.contextPath}/#">
								<span>디저트</span>
							</a>
							<ul class="small-menu">
								<a href="#">
									<li class="side">빵</li>
								</a>
								<a href="#">
									<li class="side">청</li>
								</a>
								<a href="#">
									<li class="side">떡</li>
								</a>
								<a href="#">
									<li class="side">잼</li>
								</a>
								<a href="#">
									<li class="side">캔디류</li>
								</a>
								<a href="#">
									<li class="side">초콜릿</li>
								</a>
								<a href="#">
									<li class="side">기타</li>
								</a>
							</ul>
						</li>
						<li>
							<a href="#">
								<span>니트/뜨개</span>
							</a>
							<ul class="small-menu">
								<a href="#">
									<li class="side">장갑</li>
								</a>
								<a href="#">
									<li class="side">목도리</li>
								</a>
								<a href="#">
									<li class="side">모자</li>
								</a>
								<a href="#">
									<li class="side">코스터</li>
								</a>
								<a href="#">
									<li class="side">수세미</li>
								</a>
								<a href="#">
									<li class="side">매트</li>
								</a>
								<a href="#">
									<li class="side">기타</li>
								</a>
							</ul>
						</li>
						<li>
							<a href="#">
								<span>디자인/아트</span>
							</a>
							<ul class="small-menu">
								<a href="#">
									<li class="side">프로필</li>
								</a>
								<a href="#">
									<li class="side">배너</li>
								</a>
								<a href="#">
									<li class="side">스티커</li>
								</a>
								<a href="#">
									<li class="side">이모티콘</li>
								</a>
								<a href="#">
									<li class="side">카톡테마</li>
								</a>
								<a href="#">
									<li class="side">배경화면</li>
								</a>
								<a href="#">
									<li class="side">템플릿</li>
								</a>
								<a href="#">
									<li class="side">기타</li>
								</a>
							</ul>
						</li>
						<li>
							<a href="#">
								<span>캔들/디퓨저</span>
							</a>
							<ul class="small-menu">
								<a href="#">
									<li class="side">캔들</li>
								</a>
								<a href="#">
									<li class="side">디퓨저</li>
								</a>
								<a href="#">
									<li class="side">기타</li>
								</a>
							</ul>
						</li>
						<li>
							<a href="#">
								<span>가죽공예</span>
							</a>
							<ul class="small-menu">
								<a href="#">
									<li class="side">지갑</li>
								</a>
								<a href="#">
									<li class="side">소품</li>
								</a>
								<a href="#">
									<li class="side">가방</li>
								</a>
								<a href="#">
									<li class="side">기타</li>
								</a>
							</ul>
						</li>
						<li>
							<a href="#">
								<span>액세서리</span>
							</a>
							<ul class="small-menu">
								<a href="#">
									<li class="side">귀걸이</li>
								</a>
								<a href="#">
									<li class="side">목걸이</li>
								</a>
								<a href="#">
									<li class="side">반지</li>
								</a>
								<a href="#">
									<li class="side">팔찌</li>
								</a>
								<a href="#">
									<li class="side">발찌</li>
								</a>
								<a href="#">
									<li class="side">기타</li>
								</a>
							</ul>
						</li>			
						<li>
							<a href="#">
								<span>잡화/기타</span>
							</a>
							<ul class="small-menu">
								<a href="#">
									<li class="side">잡화</li>
								</a>
								<a href="#">
									<li class="side">기타</li>
								</a>
							</ul>
						</li>		
					</ul>
				</div>
			</div>
		</div>
