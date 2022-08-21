<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>list</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
<div>
    <table id="addList" border="1">
        <thead>
            <tr>
                <th>글쓴이</th>
                <th>작성일</th>
                <th>사진</th>
                <th>옵션</th>
                <th>별점</th>
                <th>내용</th>
            </tr>
        </thead>
        <tbody id="listBody">
        </tbody>
    </table>  
</div>  
        <button id="addBtn" onclick="moreList();"><span>더보기</span></button>
</body>
</html>
 
<script>
moreList(); //함수 호출

function moreList() {
 
    var startNum = $("#listBody tr").length;  //마지막 리스트 번호를 알아내기 위해서 tr태그의 length를 구함.
    var addListHtml = "";  
    console.log("startNum", startNum); //콘솔로그로 startNum에 값이 들어오는지 확인
 
   		$.ajax({
        url : "${pageContext.request.contextPath}/review/getList",
        type : "get",
        dataType : "json",
        data : {"startNum":startNum},

        success : function(data) {
/*
        	if(data.length < 8) {
	        	if(data.length != '' || data.length != null) {
		        	for(var i=0; i<data.length;i++) {
			        	var idx = Number(startNum)+Number(i)+1;
			
			        	addListHtml += "<tr>";
			        	addListHtml += "<td>"+ mem_no + "</td>";
			        	addListHtml += "<td>"+ reg_date + "</td>";
			        	addListHtml += "<td>"+ review_photo + "</td>";
			        	addListHtml += "<td>"+ option_no + "</td>";
			        	addListHtml += "<td>"+ star_point + "</td>";
			        	addListHtml += "<td>"+ review_contents + "</td>";
			        	addListHtml += "</tr>";
		        	}
	        	} else {
	        	}
	        	$("#addBtn").remove();
        	}
*/
            if(data.length < 8){
                $("#addBtn").remove();   // 더보기 버튼을 div 클래스로 줘야 할 수도 있음
            }else{
	            var addListHtml ="";
	            if(data.length > 0){
	                for(var i=0; i<data.length;i++) {
	                    var idx = Number(startNum)+Number(i)+1;   
	                    // 글번호 : startNum 이  10단위로 증가되기 때문에 startNum +i (+1은 i는 0부터 시작하므로 )
	                    addListHtml += "<tr>";
	                	addListHtml += "<td>"+ data[i].mem_no + "</td>";
	                	addListHtml += "<td>"+ data[i].reg_date + "</td>";
	                	addListHtml += "<td>"+ data[i].review_photo + "</td>";
	                	addListHtml += "<td>"+ data[i].option_no + "</td>";
	                	addListHtml += "<td>"+ data[i].star_point + "</td>";
	                	addListHtml += "<td>"+ data[i].review_contents + "</td>";
	                	addListHtml += "</tr>";
	                }
	                $("#listBody").append(addListHtml);
	            }
            }
        }
    });
 
}
</script>
