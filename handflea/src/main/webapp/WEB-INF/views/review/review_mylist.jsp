<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
<%@ include file="/WEB-INF/views/header.jsp" %>
<script>
    $(document).ready(function(){
        $("#btnWrite").click(function(){
            // 페이지 주소 변경(이동)
            location.href = "${path}/v/write.do";
        });
    });
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %> 
<!-- menu.jsp로 변경 -->
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
            <td>${row.bno}</td>
            <td><a href="${path}/board/view.do?bno=${row.bno}">${row.contents}</a></td>
            <td>${row.star_point}</td>
            <td>
                <formatDate value="${row.regdate}" pattern="YYYYMMdd"/>
            </td>
        </tr>    
        </c:forEach>
</table>
</body>
</html>