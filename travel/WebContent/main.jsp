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
<script src="application.js" type="text/javascript"></script>
<link href="https://fonts.googleapis.com/css?family=Gaegu|Rancho"
	rel="stylesheet">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
.myLink {display: none}
 .font2 {
	font-family: 'Gaegu', cursive;
	font-size: 30px;
}

.font {
	font-family: 'Nanum Pen Script', cursive;
	font-size: 20px;
}
#content {
    width: 100px;
    position: fixed;
    bottom: 3%;
    right: 3%; 
}
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
#rank a {
    color: black; /*글자색*/
    text-decoration: none;
}

#rank a:hover { /*검색어 마우스 올릴시 밑줄 언더라인*/
    text-decoration: underline;
}

#rank { /*구역 부분 위치조정*/
    overflow: hidden;
    width: 160px;
    height: 30px; 
    margin: 0;
}

#rank ul {
    position: relative;
    margin: 0;
}

#rank ol { /* 글자 위치 부분 */
    position: absolute;
    top: 0;
    left: 0;
    margin: 0;
    padding: 0;
    list-style-type: none;    
}
#rank li { /* 순위 문장 사이의 거리 */
    height: 35px;
    line-height: 35px;
}
</style>
</head><body class="w3-light-grey" contenteditable="false">
<div id="content">			
            <div id="rank">
                <ul>
                    <ol>
                        <li><a href="#" class="font2">1 하노이</a></li>
                        <li><a href="#" class="font2">2 도쿄</a></li>
                        <li><a href="#" class="font2">3 싱가포르</a></li>
                        <li><a href="#" class="font2">4 LA</a></li>
                        <li><a href="#" class="font2">5 런던</a></li>
                        <li><a href="#" class="font2">6 오사카</a></li>
                        <li><a href="#" class="font2">7 상해</a></li>
                        <li><a href="#" class="font2">8 평양</a></li>
                        <li><a href="#" class="font2">9 시드니</a></li>
                        <li><a href="#" class="font2">10 멜버른</a></li>
                    </ol>
                </ul>
            </div>
      </div>
<!-- Navigation Bar -->
<div class="w3-bar w3-white w3-border-bottom w3-xlarge">
  <a href="#" class="w3-bar-item w3-button w3-text-red w3-hover-red"><b><i class="fa fa-map-marker w3-margin-right"></i>Logo</b></a>
  <a href="#" class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey"><i class="fa fa-search"></i></a>
</div>
  

<jsp:include page="header.jsp"></jsp:include>

<!-- Page content -->
<div class="w3-content" style="max-width:1100px;">

  <!-- Good offers -->
  <div class="w3-container w3-margin-top">
    <h3>Good Offers Right Now</h3>
    <h6>Up to <strong>50%</strong> discount.</h6>
  </div>
  <div class="w3-row-padding w3-text-white w3-large">
    <div class="w3-half w3-margin-bottom">
      <div class="w3-display-container">
        <img src="<%=request.getContextPath()%>/w3images/vally.jpg" alt="Cinque Terre" style="width:100%">
        <span class="w3-display-bottomleft w3-padding">Cinque Terre</span>
      </div>
    </div>
    <div class="w3-half">
      <div class="w3-row-padding" style="margin:0 -16px">
        <div class="w3-half w3-margin-bottom">
          <div class="w3-display-container">
            <img src="<%=request.getContextPath()%>/w3images/Liberty.jpg" alt="New York" style="width:100%">
            <span class="w3-display-bottomleft w3-padding">New York</span>
          </div>
        </div>
        <div class="w3-half w3-margin-bottom">
          <div class="w3-display-container">
            <img src="<%=request.getContextPath()%>/w3images/bridge.jpg" alt="San Francisco" style="width:100%">
            <span class="w3-display-bottomleft w3-padding">San Francisco</span>
          </div>
        </div>
      </div>
      <div class="w3-row-padding" style="margin:0 -16px">
        <div class="w3-half w3-margin-bottom">
          <div class="w3-display-container">
            <img src="<%=request.getContextPath()%>/w3images/top.jpg" alt="Pisa" style="width:100%">
            <span class="w3-display-bottomleft w3-padding">Pisa</span>
          </div>
        </div>
        <div class="w3-half w3-margin-bottom">
          <div class="w3-display-container">
            <img src="<%=request.getContextPath()%>/w3images/tower.jpg" alt="Paris" style="width:100%">
            <span class="w3-display-bottomleft w3-padding">Paris</span>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Explore Nature 리스트를 보여줄 예정 -->
  <div class="w3-container">
    <h3>Explore Nature</h3>
    <p>Travel with us and see nature at its finest.</p>
  </div>
  
  
  <div class="w3-row-padding">
  <c:forEach var="l" items="${list}">
    <div class="w3-half w3-margin-bottom">
      <img src="<%=request.getContextPath()%>/Imagelist/${l.thumnail}" alt="Norway" style="width:100%">
      <div class="w3-container w3-white">
        <h3>${l.title}</h3>
        <p class="w3-opacity">${l.price}</p>
        <p>${l.content}</p>
        <button class="w3-button w3-margin-bottom">Buy Tickets</button>
      </div>
    </div>
<%--     
    <div class="w3-half w3-margin-bottom">
      <img src="<%=request.getContextPath()%>/w3images/mountain.jpg" alt="Austria" style="width:100%">
      <div class="w3-container w3-white">
        <h3>Mountains, Austria</h3>
        <p class="w3-opacity">One-way from $39</p>
        <p>Praesent tincidunt sed tellus ut rutrum sed vitae justo.</p>
        <button class="w3-button w3-margin-bottom">Buy Tickets</button>
      </div>
    </div> --%>
    </c:forEach>
    </div>

  <!-- Newsletter -->
  <div class="w3-container">
    <div class="w3-panel w3-padding-16 w3-black w3-opacity w3-card w3-hover-opacity-off">
      <h2>Get the best offers first!</h2>
      <p>Join our newsletter.</p>
      <label>E-mail</label>
      <input class="w3-input w3-border" type="text" placeholder="Your Email address">
      <button type="button" class="w3-button w3-red w3-margin-top">Subscribe</button>
    </div>
  </div>
  
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
  
  <!-- Contact -->
  <div class="w3-container">
    <h2>Contact</h2>
    <p>Let us book your next trip!</p>
    <i class="fa fa-map-marker" style="width:30px"></i> Chicago, US<br>
    <i class="fa fa-phone" style="width:30px"></i> Phone: +00 151515<br>
    <i class="fa fa-envelope" style="width:30px"> </i> Email: mail@mail.com<br>
    <form action="<%=request.getContextPath()%>/insert.jhw" target="_blank"> sdfsdbsafdsabd
      <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Name" required="" name="Name"></p>
      <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Email" required="" name="Email"></p>
      <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Message" required="" name="Message"></p>
      <p><button class="w3-button w3-black w3-padding-large" type="submit">SEND MESSAGE</button></p>
    </form>
  </div>
  
<!-- End page content -->
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script>
$(document).ready(function(){
        
    $("#_chatimage").hide(); // 탑 버튼 숨김
    $(function () {
               try{  
        $(window).scroll(function () {
            if ($(this).scrollTop() > 100) { // 스크롤 내릴 표시
                $('#_chatimage').fadeIn();
            } else {
                $('#_chatimage').fadeOut();
            }
        });
        }catch(e){
        console.log(e);
        }
    }); 
});
</script>
<!-- 채팅 -->
 <script>
        var textarea = document.getElementById("messageWindow");
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
        textarea.value += "상대 : " + event.data + "\n";
    }
    function onOpen(event) {
        textarea.value += "연결 성공\n";
    }
    function onError(event) {
      alert(event.data);
    }
    function send() {
        textarea.value += "나 : " + inputMessage.value + "\n";
        webSocket.send(inputMessage.value);
        inputMessage.value = "";
    }
  </script>
<script>
// Tabs
function openLink(evt, linkName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("myLink");
  for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
  }
  document.getElementById(linkName).style.display = "block";
  evt.currentTarget.className += " w3-red";
}
// Click on the first tablink on load
document.getElementsByClassName("tablink")[0].click();
</script>
<script>
$('#something').click(function() {
location.reload();
});

$(function() {
    var count = $('#rank li').length;
    var height = $('#rank li').height();

    function step(index) {
        $('#rank ol').delay(2000).animate({top: -height * index }, 500, function() {
            step((index + 1 ) % count);
        });
    }
    step(1);
});
</script>

</body>
</html>