<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="id01" class="modal">

		<form class="modal-content animate w3-border w3-hover-border-red" action="<%=request.getContextPath()%>/member/loginOk.jsp">
			<div
				class="bgimg w3-display-container w3-animate-opacity w3-text-white">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="close" title="Close Modal">&times;</span>

				<div class="w3-display-middle">
					<label for="uname" class="w3-jumbo w3-animate-top"><b>Username</b></label>
					<input class="typetext" type="text" placeholder="Enter Username" name="id"
						required> <label for="psw" class="w3-jumbo w3-animate-top"><b>Password</b></label>
					<input type="password" placeholder="Enter Password" name="pwd"
						required>

					<button class="bt" type="submit"><b>Login</b></button> 
					<button class="w3-button w3-red w3-margin-middle bt" onclick="location.href='MemberJoin.do'"><b>Join</b></button>
					
					<span class="psw">Forgot <a href="#">password?</a></span>
				</div>

				<div class="w3-display-bottomleft w3-padding-large">
					<button type="button" class="bt"
						onclick="document.getElementById('id01').style.display='none'"><b>Cancel</b></button>
				</div>
			</div>
		</form>
	</div>
	
	<!-- 구독자 UI 부분-->
<div id="id02" class="modal">

		<form class="modal-content animate w3-border w3-hover-border-red" action="<%=request.getContextPath()%>/submail.jhw" target="_blank">
			<div
				class="bgimg1 w3-display-container w3-animate-opacity w3-text-white">
				<span onclick="document.getElementById('id02').style.display='none'"
					class="close" title="Close Modal">&times;</span>

				<div class="w3-display-middle">
				<label for="uname" class="w3-xxxlarge w3-animate-top "><br><b>Get the best offers first!</b></br></label>
					<label for="uname" class="w3-xlarge w3-animate-top"><b>Join our newsletter.</b></label>
					

     	 			<input class="typetext" type="text" placeholder="Enter Your Email address" name="Submail" required>
      				<button class="w3-button w3-red w3-margin-top bt" type="submit" >Subscribe</button>
   	  				

					
				</div>

				<div class="w3-display-bottomleft w3-padding-large">
					<button type="button" class="bt"
						onclick="document.getElementById('id02').style.display='none'"><b>Cancel</b></button>
				</div>
			</div>
		</form>
	</div>
	
	<!-- send Message 부분  -->
	<div id="id03" class="modal">

		<form class="modal-content animate w3-border w3-hover-border-red" action="<%=request.getContextPath()%>/insert.jhw" target="_blank" >
			<div
				class="bgimg2 w3-display-container w3-animate-opacity w3-text-white">
				<span onclick="document.getElementById('id03').style.display='none'"
					class="close" title="Close Modal">&times;</span>

				<div class="w3-display-middle">
				<label for="uname" class="w3-xxxlarge w3-animate-top "><br><b>Contact us</b></br></label>

     	 			<input class="typetext" type="text" placeholder="Enter Username" name="Name" required>
     	 			<input class="typetext" type="text" placeholder="Enter Your Email address" name="Email" required>
     	 			<input class="typetext" type="text" placeholder="Please enter a message" name="Message" required>
      				<button class="w3-button w3-red w3-margin-top bt" type="submit">Send Message</button>
   	  				
					
					
				</div>

				<div class="w3-display-bottomleft w3-padding-large">
					<button type="button" class="bt"
						onclick="document.getElementById('id03').style.display='none'"><b>Cancel</b></button>
				</div>
			</div>
		</form>
	</div>
	
	

	<script>
// Get the modal
var modal = document.getElementById('id01');
var modal1 = document.getElementById('id02');
var modal2 = document.getElementById('id03');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
    else if (event.target == modal1) {
        modal1.style.display = "none";
    }
    else if (event.target == modal2) {
        modal2.style.display = "none";
    }
}
</script>
</body>
</html>