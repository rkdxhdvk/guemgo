<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style>
body {
    margin: 0 auto;
    max-width: 800px;
    padding: 0 20px;
}

.container {
    border: 2px solid #dedede;
    background-color: #f1f1f1;
    border-radius: 5px;
    padding: 10px;
    margin: 10px 0;
}

.darker {
    border-color: #ccc;
    background-color: #ddd;
}

.container::after {
    content: "";
    clear: both;
    display: table;
}

.container img {
    float: left;
    max-width: 60px;
    width: 100%;
    margin-right: 20px;
    border-radius: 50%;
}

.container img.right {
    float: right;
    margin-left: 20px;
    margin-right:0;
}

.time-right {
    float: right;
    color: #aaa;
}

.time-left {
    float: left;
    color: #999;
}
</style>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/sockjs-0.3.4.js"/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#sendBtn").click(function(){
			sendMessage();
		});
	});
	var sock;
	sock = new SockJS("<c:url value="/echo"/>");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	function sendMessage(){
		message = {};
		message.content = $("#message").val();
		message.sender = $("#name").val();
		message.receiver = 'bbb';
		message.room = ${room };
		sock.send(JSON.stringify(message));
	}
	
	function getTimeStamp(){
		var d = new Date();
		var s =
			leadingZeros(d.getFullYear(), 4) + '-' + 
			leadingZeros(d.getMonth() + 1 , 2) + '-' +
			leadingZeros(d.getDate(), 2) + ' ' +
			
			leadingZeros(d.getHours(), 2) + ':' +
			leadingZeros(d.getMinutes(), 2) + ':' +
			leadingZeros(d.getSeconds(), 2);
			
			return s;
	}
	
	function leadingZeros(n, digits){
		var zero = '';
		n = n.toString();
		
		if(n.length<digits){
			for(i=0;i<digits-n.length;i++)
				zero += '0';
		}
		return zero + n;
	}
	
	function onMessage(evt){
		var data = evt.data;
		var obj = JSON.parse(data);
		var t = getTimeStamp();
		var user = '${user }';
		if(obj.sender === user){
			$("#data").append("<div class='container'><p>"+obj.content + "</p><span class=time-left>" +t +"</span></div>");
		}else{
			$("#data").append("<div class='container darker'><p>"+obj.content + "</p><span class=time-right>" +t +"</span></div>");
		}
	}
	
	function onClose(evt){
		$("#data").append("연결끊김");
	}
</script>
</head>
	<h2>Chat Messages</h2>
<body>
	<input type="text" id="name"/>
	<input type="text" id="message" />
	<input type="button" id="sendBtn" value="전송" />
	<a href="<c:url value='/home?room=${room }'/>">나가기</a>
	<div id="data">
		<c:forEach var="vo" items="${list }">
			<fmt:formatDate value="${vo.time }" pattern="yyyy-MM-dd HH:mm:ss" var="regdate"/>
			${vo.sender} : ${vo.msg } ${time } <br>
		</c:forEach>
	</div>


                                
          
</body>
</html>