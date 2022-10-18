<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<style>

#leftbox1, #leftbox2, #leftbox3, #leftbox4, #leftbox5 {

  width: 180px;

  height: 80px;

  margin: 10px;

  padding: 10px;

  border: 1px solid black;

}

#leftbox, #rightbox {
	float: left;
}

.boxs {

  width: 170px;

  height: 80px;

  margin: 10px;

  padding: 10px;

  border: 1px solid black;

}

#rightbox {
  
  width: 500px;

  height: 1500px;

  padding: 10px;

  border: 1px solid black;
  
  background-color: orange;
  
}

#box1, #box3, #box5, #box7, #box9, #box11, #box13, #box15, #box17 {

	margin-right: 10px;
	
}

	</style>
  </head>
  <body>
	<script>
	
	var cnt = 0;
	
	function dragStart(ev) {
	  ev.dataTransfer.setData("text", ev.target.id);
	  
	  if(ev.target.parentNode.id == "leftbox1" || ev.target.parentNode.id == "leftbox2" || ev.target.parentNode.id == "leftbox3" ||
			  ev.target.parentNode.id == "leftbox4" || ev.target.parentNode.id == "leftbox5")
		  cnt--
	}

	
	function dragOver(ev) {
		
		  ev.preventDefault();
		
	}

	function drop(ev) {
	
	  	ev.preventDefault();

	  	var data = ev.dataTransfer.getData("text");
	  	
	  	/*
	  	alert("name : " + ev.target.name);
	  	alert("value : " + ev.target.value);
	  	alert("nodeType : " + ev.target.nodeType );
	  	alert("nodeName : " + ev.target.nodeName );
	  	alert("parentNode.nodeName : " + ev.target.parentNode.nodeName);
	  	alert("parentNode.id : " + ev.target.parentNode.id);
	  	alert("nextSibling.id : " + ev.target.nextSibling.nextSibling.id);
	  	alert("parentNode : " + ev.target.parentNode);
	  	alert("parentElement : " + ev.target.parentElement );
	  	alert("srcElement.value : " + ev.target.srcElement.value);
	  	*/
	  
	  	
	  	/* || ev.target.nodeName == "IMG" */
	  	if(ev.target.parentNode.id == "leftbox"){
		  cnt++
	 	} 
	  
	  
		  /*
		  if(ev.target.id == "leftbox1" || ev.target.id == "leftbox2" || ev.target.id == "leftbox3" || ev.target.id == "leftbox4" || ev.target.id == "leftbox5"){
			  cnt++
		  }	  
		  */	
		  
		 if(ev.target.parentNode.id == "rightbox"){
			  cnt+2
		  }
		  
		  
		 if(ev.target == "[object HTMLImageElement]"){
			  alert("빈 공간에 삽입해주세요.");
			  return;
		  }
		 
		  
		  if(cnt >= 6){
			  cnt--
			  alert("5개 이상 등록이 불가능합니다.")
			  return;
		  }
		  
		  alert("cnt : " + cnt);
	
		  ev.target.appendChild(document.getElementById(data));
	
	}
	
		$(document).ready(function() {
			$("#saveBtn").click(function() {
				if(cnt == 0){
					alert("5개를 더 등록해 주세요.")
					return;
				}else if(cnt == 1){
					alert("4개를 더 등록해 주세요.")
					return;
				}else if(cnt == 2){
					alert("3개를 더 등록해 주세요.")
					return;
				}else if(cnt == 3){
					alert("2개를 더 등록해 주세요.")
					return;
				}else if(cnt == 4){
					alert("1개를 더 등록해 주세요.")
					return;
				}
			});
		});
		
	
	</script>
	
	<div id="leftbox">
     
	<div id="leftbox1" ondrop="drop(event)" ondragover="dragOver(event)"></div>
	
	<div id="leftbox2" ondrop="drop(event)" ondragover="dragOver(event)"></div>
	
	<div id="leftbox3" ondrop="drop(event)" ondragover="dragOver(event)"></div>
	
	<div id="leftbox4" ondrop="drop(event)" ondragover="dragOver(event)"></div>
	
	<div id="leftbox5" ondrop="drop(event)" ondragover="dragOver(event)"></div>
	
	</div>    
	
	<div id="rightbox">
	
	<div id="box1" ondrop="drop(event)" ondragover="dragOver(event)" class="boxs">
	
		<img src="${pageContext.request.contextPath}/resources/img/btn1.png" draggable="true" ondragstart="dragStart(event)" ondragend="dragEnd(event)" id="drag1" width="180" height="80">
	
	</div>
	
	<div id="box2" ondrop="drop(event)" ondragover="dragOver(event)" class="boxs">
	
		<img src="${pageContext.request.contextPath}/resources/img/btn2.png" draggable="true" ondragstart="dragStart(event)" ondragend="dragEnd(event)" id="drag2" width="180" height="80">
	
	</div>
	
	<div id="box3" ondrop="drop(event)" ondragover="dragOver(event)" class="boxs">
	
		<img src="${pageContext.request.contextPath}/resources/img/btn3.png" draggable="true" ondragstart="dragStart(event)" ondragend="dragEnd(event)" id="drag3" width="180" height="80">
	
	</div>
	
	<div id="box4" ondrop="drop(event)" ondragover="dragOver(event)" class="boxs">
	
		<img src="${pageContext.request.contextPath}/resources/img/btn4.png" draggable="true" ondragstart="dragStart(event)" ondragend="dragEnd(event)" id="drag4" width="180" height="80">
	
	</div>
	
	<div id="box5" ondrop="drop(event)" ondragover="dragOver(event)" class="boxs">
	
		<img src="${pageContext.request.contextPath}/resources/img/btn5.png" draggable="true" ondragstart="dragStart(event)" ondragend="dragEnd(event)" id="drag5" width="180" height="80">
	
	</div>
	
	<div id="box6" ondrop="drop(event)" ondragover="dragOver(event)" class="boxs">
	
		<img src="${pageContext.request.contextPath}/resources/img/btn6.png" draggable="true" ondragstart="dragStart(event)" ondragend="dragEnd(event)" id="drag6" width="180" height="80">
	
	</div>
	
	<div id="box7" ondrop="drop(event)" ondragover="dragOver(event)" class="boxs">
	
		<img src="${pageContext.request.contextPath}/resources/img/btn7.png" draggable="true" ondragstart="dragStart(event)" ondragend="dragEnd(event)" id="drag7" width="180" height="80">
	
	</div>
	
	<div id="box8" ondrop="drop(event)" ondragover="dragOver(event)" class="boxs">
	
		<img src="${pageContext.request.contextPath}/resources/img/btn8.png" draggable="true" ondragstart="dragStart(event)" ondragend="dragEnd(event)" id="drag8" width="180" height="80">
	
	</div>
	
	<div id="box9" ondrop="drop(event)" ondragover="dragOver(event)" class="boxs">
	
		<img src="${pageContext.request.contextPath}/resources/img/btn9.png" draggable="true" ondragstart="dragStart(event)" ondragend="dragEnd(event)" id="drag9" width="180" height="80">
	
	</div>
	
	<div id="box10" ondrop="drop(event)" ondragover="dragOver(event)" class="boxs">
	
		<img src="${pageContext.request.contextPath}/resources/img/btn10.png" draggable="true" ondragstart="dragStart(event)" ondragend="dragEnd(event)" id="drag10" width="180" height="80">
	
	</div>
	
	<div id="box11" ondrop="drop(event)" ondragover="dragOver(event)" class="boxs">
	
		<img src="${pageContext.request.contextPath}/resources/img/btn11.png" draggable="true" ondragstart="dragStart(event)" ondragend="dragEnd(event)" id="drag11" width="180" height="80">
	
	</div>
	
	<div id="box12" ondrop="drop(event)" ondragover="dragOver(event)" class="boxs">
	
		<img src="${pageContext.request.contextPath}/resources/img/btn12.png" draggable="true" ondragstart="dragStart(event)" ondragend="dragEnd(event)" id="drag12" width="180" height="80">
	
	</div>
	
	<div id="box13" ondrop="drop(event)" ondragover="dragOver(event)" class="boxs">
	
		<img src="${pageContext.request.contextPath}/resources/img/btn13.png" draggable="true" ondragstart="dragStart(event)" ondragend="dragEnd(event)" id="drag13" width="180" height="80">
	
	</div>
	
	<div id="box14" ondrop="drop(event)" ondragover="dragOver(event)" class="boxs">
	
		<img src="${pageContext.request.contextPath}/resources/img/btn14.png" draggable="true" ondragstart="dragStart(event)" ondragend="dragEnd(event)" id="drag14" width="180" height="80">
	
	</div>
	
	<div id="box15" ondrop="drop(event)" ondragover="dragOver(event)" class="boxs">
	
		<img src="${pageContext.request.contextPath}/resources/img/btn15.png" draggable="true" ondragstart="dragStart(event)" ondragend="dragEnd(event)" id="drag15" width="180" height="80">
	
	</div>
	
	<div id="box16" ondrop="drop(event)" ondragover="dragOver(event)" class="boxs">
	
		<img src="${pageContext.request.contextPath}/resources/img/btn16.png" draggable="true" ondragstart="dragStart(event)" ondragend="dragEnd(event)" id="drag16" width="180" height="80">
	
	</div>
	
	<div id="box17" ondrop="drop(event)" ondragover="dragOver(event)" class="boxs">
	
		<img src="${pageContext.request.contextPath}/resources/img/btn17.png" draggable="true" ondragstart="dragStart(event)" ondragend="dragEnd(event)" id="drag17" width="180" height="80">
	
	</div>
	
	<div id="box18" ondrop="drop(event)" ondragover="dragOver(event)" class="boxs">
	
		<img src="${pageContext.request.contextPath}/resources/img/btn18.png" draggable="true" ondragstart="dragStart(event)" ondragend="dragEnd(event)" id="drag18" width="180" height="80">
	
	</div>
	
	<div id="box19" ondrop="drop(event)" ondragover="dragOver(event)" class="boxs">
	
		<img src="${pageContext.request.contextPath}/resources/img/btn19.png" draggable="true" ondragstart="dragStart(event)" ondragend="dragEnd(event)" id="drag19" width="180" height="80">
	
	</div>
	
</div>
	
	
	
	
  </body>
	<button id="saveBtn">저장</button>

</html>
