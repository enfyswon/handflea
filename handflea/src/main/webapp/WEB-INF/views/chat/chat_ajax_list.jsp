<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:forEach var="tmp" items="${chat_list}">
	<div class="chat-list-box${tmp.chat_roomno} chat-list-box">
		<div type="button" class="chat-list" room="${tmp.chat_roomno}" other_no="${tmp.other_no}">
			<div class="chat-people">
				<div class="chat-img">
					<img src="#" alt="profile">
				</div>
				<div class="chat-ib">
					<h5>${tmp.other_name}<span class="chat_date">${tmp.chat_date}</span></h5>
					<div class="row">
						<div class="col-10">
							<p>${tmp.chat_contents}
						</div>
						<c:if test="${tmp.unread > 0}">
							<div class="col-2 unread${tmp.chat_roomno}">
								<span class="badge bg-danger">${tmp.unread}</span>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>