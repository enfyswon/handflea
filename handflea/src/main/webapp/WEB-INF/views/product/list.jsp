<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
	.parent{

    width: 100%;

    margin: 10px auto;

	display: flex;

}



.first {

    flex:1;

    width:25%;

    box-sizing: border-box;

}



.second{

    flex:1;

    margin-left: 5%;

    width:25%;

    box-sizing: border-box;

}



.third{

    flex:1;

    margin-left: 5%;

    width:25%;

    box-sizing: border-box;

}

.force{ 

    flex:1;

	margin-left: 5%;

    width:25%;

    box-sizing: border-box;

}
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<br>
		<h3 style="margin-left : 12%;"> 판매 상품 리스트 </h3>
		<br>
	<div class="parent">

        <div class="first">
        	<div className="product_img_div"><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA3MjdfMTg5%2FMDAxNjU4OTAxMDIzNTkx.0FCyJsaY8VubqA3EVb2fxTTL8iTZo5YfYKDaPUwiPRUg.FF5sqh0PqeqWbfQ_9rHlH9NRkRrqSv7VPRwBc_MBaeMg.JPEG.atelier517%2FKakaoTalk_20220727_142641229_12.jpg&type=a340" className="product_img"/></div>
            <p className="product_seller"> 판매자명</p>
            <h5 className="product_title"> 상품 제목</h5>
            <div className="product_mon"> 월 : 15,000원</div>
        </div>

        <div class="second">
			<div className="product_img_div"><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA3MjdfMTg5%2FMDAxNjU4OTAxMDIzNTkx.0FCyJsaY8VubqA3EVb2fxTTL8iTZo5YfYKDaPUwiPRUg.FF5sqh0PqeqWbfQ_9rHlH9NRkRrqSv7VPRwBc_MBaeMg.JPEG.atelier517%2FKakaoTalk_20220727_142641229_12.jpg&type=a340" className="product_img"/></div>
            <p className="product_seller"> 판매자명</p>
            <h5 className="product_title"> 상품 제목</h5>
            <div className="product_mon"> 월 : 15,000원</div>
        </div>    
        <div class="third">
			<div className="product_img_div"><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA3MjdfMTg5%2FMDAxNjU4OTAxMDIzNTkx.0FCyJsaY8VubqA3EVb2fxTTL8iTZo5YfYKDaPUwiPRUg.FF5sqh0PqeqWbfQ_9rHlH9NRkRrqSv7VPRwBc_MBaeMg.JPEG.atelier517%2FKakaoTalk_20220727_142641229_12.jpg&type=a340" className="product_img"/></div>
            <p className="product_seller"> 판매자명</p>
            <h5 className="product_title"> 상품 제목</h5>
            <div className="product_mon"> 월 : 15,000원</div>
        </div>    
        <div class="force">
			<div className="product_img_div"><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA3MjdfMTg5%2FMDAxNjU4OTAxMDIzNTkx.0FCyJsaY8VubqA3EVb2fxTTL8iTZo5YfYKDaPUwiPRUg.FF5sqh0PqeqWbfQ_9rHlH9NRkRrqSv7VPRwBc_MBaeMg.JPEG.atelier517%2FKakaoTalk_20220727_142641229_12.jpg&type=a340" className="product_img"/></div>
            <p className="product_seller"> 판매자명</p>
            <h5 className="product_title"> 상품 제목</h5>
            <div className="product_mon"> 월 : 15,000원</div>
        </div>    
    </div>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>