<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
<%@ include file="/WEB-INF/views/header.jsp" %> 
    <h3>내가 작성한 후기</h3>
    <table border="1" width="600px">
        <tr>
            <th>상품정보</th>
            <th>내용</th>
			<th>평가</th>
			<th>작성일</th>
        </tr>
        <c:forEach items="${review_mylist}" var="data">
        <tr>
            <td>${order_no}</td>
            <td>${review_contents}</td>
            <td>${star_point}</td>
            <td>
                <formatDate value="${reg_date}" pattern="YYYYMMdd"/>
            </td>
        </tr>    
        </c:forEach>
</table>
</body>
</html>