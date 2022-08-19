<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>list</title>
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
        url : "/review/getList",
        type : "post",
        dataType : "json",
        data : {"startNum":startNum},
        
        success : function(data) {
            if(data.length < 8){
                $("#addBtn").remove();   // 더보기 버튼을 div 클래스로 줘야 할 수도 있음
            }else{
            var addListHtml ="";
            if(data.length > 0){
                
                for(var i=0; i<data.length;i++) {
                    var idx = Number(startNum)+Number(i)+1;   
                    // 글번호 : startNum 이  10단위로 증가되기 때문에 startNum +i (+1은 i는 0부터 시작하므로 )
                    addListHtml += "<tr>";
                    addListHtml += "<td>"+ idx + "</td>";
                    addListHtml += "<td>"+ data[i].title + "</td>";
                    addListHtml += "<td>"+ data[i].description + "</td>";
                    addListHtml += "</tr>";
                }
                $("#listBody").append(addListHtml);
             
           		 }else{
                
                if(data.length < 8) {
                	if(data.length != '' || data.length != null) {
                	for(var i=0; i<data.length;i++) {
                	var idx = Number(startNum)+Number(i)+1;

                	addListHtml += "<tr>";
                	addListHtml += "<td>"+ idx + "</td>";
                	addListHtml += "<td>"+ data[i].title + "</td>";
                	addListHtml += "<td>"+ data[i].description + "</td>";
                	addListHtml += "</tr>";
                	}
                	} else {
                	// 데이터 없을 때 마크업
                	}
                	$("#addBtn").remove(); // 더보기 버튼을 div 클래스로 줘야 할 수도 있음
                	}
            }
            }
        }
    });
 
}
</script>
