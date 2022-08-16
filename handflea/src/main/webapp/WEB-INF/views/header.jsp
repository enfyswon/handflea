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
				<c:choose>
					<c:when test="${login_info != null && login_info.mem_email != null}">
						<a class="top-item" href="${pageContext.request.contextPath}/logout""> 로그아웃 </a>
						<a class="top-item" href="${pageContext.request.contextPath}/basket/list"> 마이페이지 </a>
						<span class="top-item" style="color:lime;">${login_info.mem_name}님</span>
					</c:when>
					<c:otherwise>
				<a class="top-item" href="${pageContext.request.contextPath}/login_form">로그인</a>
				<a class="top-item" href="${pageContext.request.contextPath}/join/form">회원가입</a>
					</c:otherwise>
				</c:choose>
			</div>
			<div id="middle-header">
				<div id="logo-bar">
					<a href="${pageContext.request.contextPath}/home">
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
					<a href="#">
						<div class="icon">
							<img class="icon_img" alt="Q&A" src="${pageContext.request.contextPath}/resources/img/qna.png">
							<p class="icon_cnts">Q&A</p>
						</div>
					</a>
					<c:if test="true">
					<a href="${pageContext.request.contextPath}/chat/">
						<div class="icon">
							<img class="icon_img" alt="chatting" src="${pageContext.request.contextPath}/resources/img/chat.png">
							<p class="icon_cnts">채팅</p>
						</div>
					</a>
					<a href="${pageContext.request.contextPath}/cart/">
						<div class="icon">
							<img class="icon_img" alt="cart" src="${pageContext.request.contextPath}/resources/img/cart.png">
							<p class="icon_cnts">장바구니</p>
						</div>
					</a>
					</c:if>
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
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">빵</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">청</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">떡</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">잼</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">캔디류</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">초콜릿</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">기타</a>
								</li>
								<li class="smallcate">
									<a class="nonecate">test</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/#">
								<span>니트/뜨개</span>
							</a>
							<ul class="small-menu">
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">장갑</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">목도리</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">모자</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">코스터</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">수세미</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">매트</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">기타</a>
								</li>
								<li class="smallcate">
									<a class="nonecate">test</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/#">
								<span>디자인/아트</span>
							</a>
							<ul class="small-menu">
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">프로필</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">배너</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">스티커</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">이모티콘</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">카톡테마</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">배경화면</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">템플릿</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">기타</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/#">
								<span>캔들/디퓨저</span>
							</a>
							<ul class="small-menu">
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">캔들</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">디퓨저</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">기타</a>
								</li>
								<li class="smallcate">
									<a class="nonecate">test</a>
								</li>
								<li class="smallcate">
									<a class="nonecate">test</a>
								</li>
								<li class="smallcate">
									<a class="nonecate">test</a>
								</li>
								<li class="smallcate">
									<a class="nonecate">test</a>
								</li>
								<li class="smallcate">
									<a class="nonecate">test</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/#">
								<span>가죽공예</span>
							</a>
							<ul class="small-menu">
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">지갑</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">소품</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">가방</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">기타</a>
								</li>
								<li class="smallcate">
									<a class="nonecate">test</a>
								</li>
								<li class="smallcate">
									<a class="nonecate">test</a>
								</li>
								<li class="smallcate">
									<a class="nonecate">test</a>
								</li>
								<li class="smallcate">
									<a class="nonecate">test</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/#">
								<span>액세서리</span>
							</a>
							<ul class="small-menu">
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">귀걸이</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">목걸이</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">반지</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">팔찌</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">발찌</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">기타</a>
								</li>
								<li class="smallcate">
									<a class="nonecate">test</a>
								</li>
								<li class="smallcate">
									<a class="nonecate">test</a>
								</li>
							</ul>
						</li>			
						<li>
							<a href="${pageContext.request.contextPath}/#">
								<span>잡화/기타</span>
							</a>
							<ul class="small-menu">
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">잡화</a>
								</li>
								<li class="smallcate">
									<a href="${pageContext.request.contextPath}/#">기타</a>
								</li>
								<li class="smallcate">
									<a class="nonecate">test</a>
								</li>
								<li class="smallcate">
									<a class="nonecate">test</a>
								</li>
								<li class="smallcate">
									<a class="nonecate">test</a>
								</li>
								<li class="smallcate">
									<a class="nonecate">test</a>
								</li>
								<li class="smallcate">
									<a class="nonecate">test</a>
								</li>
								<li class="smallcate">
									<a class="nonecate">test</a>
								</li>
							</ul>
						</li>		
					</ul>
				</div>
			</div>
		</div>