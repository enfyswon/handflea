<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>list</title>
<link type="text/css" rel="stylesheet" href="css/reset.css" media="screen" />
<link type="text/css" rel="stylesheet" href="css/js-load.css" media="screen" />
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="js/js-load.js"></script>
</head>
	<div id="js-btn-wrap" class="btn-wrap"> <a href="javascript:;" class="button">상품 후기</a> </div>
    <div class="myList">
        <table border="1" summary="">
        			
            <tr>
                <td><c:out value="${list.bno}"/></td>
                <td><c:out value="${list.contents}"/></td>
                <td><c:out value="${list.writer}"/></td>
                <td><c:out value="${list.regdate}"/></td>
                <td><c:out value="${list.}"/></td>
            </tr>
        </c:forEach>			
        </table>
    </div>
</html>
