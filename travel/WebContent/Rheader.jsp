<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> <!-- 헤더 css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/airport.css" />
<div class="w3-bar w3-white w3-border-bottom w3-xlarge front" >
<a href="index.jsp" class="w3-bar-item w3-button w3-text-red w3-hover-red"><b><i class="fa fa-map-marker w3-margin-right"></i>Yolo-Travel</b></a>
  <% 
  if(session.getAttribute("id") == null){ 
  %>
  <button class="w3-bar-item w3-button w3-text-red w3-hover-red w3-right" onclick="document.getElementById('id01').style.display='block'">Login</button>
  <%}else{ %>
  <strong class="w3-bar-item w3-right" style="font-size:11px;"><%out.print(session.getAttribute("id")+"님 안녕하세요.");%></strong>
  <button class="w3-bar-item w3-button w3-text-red w3-hover-red w3-right" onclick="location='<%=request.getContextPath()%>/member/logOut.jsp'">Logout</button>
  
  <%} 
  %>
<%--   <% 
  if(("admin").equals(session.getAttribute("id"))) { 
  %>
  <button class="w3-bar-item w3-button w3-text-red w3-hover-red" onclick="document.getElementById('id01').style.display='block'">Login</button>
  <%}else{ %>
  <button class="w3-bar-item w3-button w3-text-red w3-hover-red" onclick="location='<%=request.getContextPath()%>/member/logOut.jsp'">Logout</button>
  <%} 
  %> --%>
    <button class="w3-bar-item w3-button w3-text-red w3-hover-red w3-right" onclick="document.getElementById('id02').style.display='block'">Subscribe</button>
  <button class="w3-bar-item w3-button w3-text-red w3-hover-red w3-right" onclick="document.getElementById('id03').style.display='block'">Contact</button>
</div>

  