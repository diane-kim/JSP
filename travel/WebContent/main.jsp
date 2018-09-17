<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String contentPage=request.getParameter("contentPage");
if(contentPage==null)
    contentPage="airportList.jsp";
%>
<!DOCTYPE html>
<html>
<head>
<title> Main페이지</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/airport.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
<meta charset="utf-8">

<style>
.img { /* 배경화면 조절 */
	position: relative;
	background: url('./w3images/배경2.jpg');
	height: 100%;
	width: 100%;
	background-size: cover;
}
#videobcg { 
     position: absolute;
     top: 0px;
     left: 0px;
     min-width: 100%;
     min-height: 100%;
     width: auto;
     height: auto;
     z-index: -1000;
     overflow: hidden;
}
</style>
</head>

<!-- <body class="img"> -->
<body>

<video id="videobcg" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
     <source src="lax-big.mp4" type="video/mp4">
     <source src="movie.webm" type="video/webm">
          Sorry, your browser does not support HTML5 video.
</video>

	<jsp:include page="rank.jsp"/>
	<div style="height:5%;">
	<jsp:include page="header.jsp" />
	</div>
	<div class="sidebar" style="width:13%; height:100%;">
	<jsp:include page="sidebar.jsp" />
	</div>
	<!--  메인화면 부분 -->
	<div style="width:100%; height:100%;float:left;">
	<jsp:include page="<%=contentPage%>" />
	</div><%-- 
<jsp:include page="footer.jsp" /> --%>
	
	
	<div id="_chatbox" style="display: none">
    <fieldset>
        <textarea id="messageWindow" rows="10" cols="30" readonly="true" autofozus required style="resize: none"></textarea>
        <br/>
        <input class="typetext" id="inputMessage" type="text"/>
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
</body>
</html>