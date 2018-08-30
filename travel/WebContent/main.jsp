<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html><head><title>여행</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script><!-- JQuery 호출하기 위한 링크 선언 -->
<%-- <script src="<%=request.getContextPath()%>/js/scroll.js" type="text/javascript"></script> --%>
<script src="<%=request.getContextPath()%>/js/rank.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/main.js" type="text/javascript"></script>
<link href="https://fonts.googleapis.com/css?family=Gaegu|Rancho"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/rank.css" />
<% String id = (String)session.getAttribute("id");%>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
.myLink {display: none}
#_chatimage {
	position: fixed;
    bottom: 3%;
	left: 1%;
	width: 100px; 
}
#_chatbox {
    position: fixed;
    bottom: 15%;
 	left: 0%; 
}
</style>
</head>
<body class="w3-light-grey" contenteditable="false">


<jsp:include page="rank.jsp"/>

<div class="w3-bar w3-white w3-border-bottom w3-xlarge " >
  <a href="#" class="w3-bar-item w3-button w3-text-red w3-hover-red"><b><i class="fa fa-map-marker w3-margin-right"></i>Logo</b></a>
  <button class="w3-bar-item w3-button w3-text-red w3-hover-red" onclick="document.getElementById('id01').style.display='block'">Login</button>
  <a href="#" class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey"><i class="fa fa-search"></i></a>  
  <button class="w3-bar-item w3-button w3-text-red w3-hover-red w3-right" onclick="document.getElementById('id02').style.display='block'">Subscribe</button>
  <button class="w3-bar-item w3-button w3-text-red w3-hover-red w3-right" onclick="document.getElementById('id03').style.display='block'">Contact</button>
</div>
<jsp:include page="member/loginform.jsp"/>
<jsp:include page="header.jsp"/>

<!-- Page content -->
<div class="w3-content" style="max-width:1100px;">

  
  <!-- 채팅 -->
   <div id="_chatbox" style="display: none">
    <fieldset>
        <textarea id="messageWindow" rows="10" cols="30" readonly="true" autofozus required style="resize: none"></textarea>
        <br/>
        <input id="inputMessage" type="text"/>
        <input type="submit" value="send" onclick="send()" />
    </fieldset>  
    </div>
    <img id="_chatimage" class="chat" src="./img/chat.png" />
    
    <script>
    $(".chat").on({
        "click" : function() {
            if ($(this).attr("src") == "./img/chat.png") {
                $(".chat").attr("src", "./img/chathide.png");
                $("#_chatbox").css("display", "block");
            } else if ($(this).attr("src") == "./img/chathide.png") {
                $(".chat").attr("src", "./img/chat.png");
                $("#_chatbox").css("display", "none");
            }
        }
    });
	</script> 
	
	 <script>
        var textarea = document.getElementById("messageWindow");
       /*  var webSocket = new WebSocket('ws://192.168.0.73/travel/broadcasting');  */
        var webSocket = new WebSocket('ws://192.168.0.73/travel/broadcasting'); 
        var inputMessage = document.getElementById('inputMessage');
        
    webSocket.onerror = function(event) {
      onError(event)
    };
    webSocket.onopen = function(event) {
      onOpen(event)
    };
    webSocket.onmessage = function(event) {
      onMessage(event)
    };
    function onMessage(event) {
        textarea.value += event.data + "\n";
    }
    function onOpen(event) {
        textarea.value += "연결 성공\n";
    }
    function onError(event) {
      alert(event.data);
    }
    function send() {
        textarea.value += "<%=session.getAttribute("id")%> : " + inputMessage.value + "\n";
        webSocket.send("<%=session.getAttribute("id")%>" +" : "+inputMessage.value);
        inputMessage.value = "";
    }
  </script> 
  
<%--   <!-- Contact -->
  <div class="w3-container">
    <h2>Contact</h2>
    <p>Let us book your next trip!</p>
    <i class="fa fa-map-marker" style="width:30px"></i> Chicago, US<br>
    <i class="fa fa-phone" style="width:30px"></i> Phone: +00 151515<br>
    <i class="fa fa-envelope" style="width:30px"> </i> Email: mail@mail.com<br>
    <form action="<%=request.getContextPath()%>/insert.jhw" target="_blank"> 
      <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Name" required="" name="Name"></p>
      <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Email" required="" name="Email"></p>
      <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Message" required="" name="Message"></p>
      <p><button class="w3-button w3-black w3-padding-large" type="submit">SEND MESSAGE</button></p>
    </form>
  </div> --%>
  
<!-- End page content -->
</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>