<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="travel.airportList.com.AirportListDAO"%>
<%@page import="travel.airportList.com.AirportListDTO"%>
<%@page import="java.util.List"%>
<link href="https://fonts.googleapis.com/css?family=Gaegu|Rancho" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/rank.js" ></script>
<div id="content">
	<div id="rank">
		<ul>
			<ol>
			<%
			AirportListDAO dao = new AirportListDAO();			
			List<AirportListDTO> list = dao.rankList();			
			for (AirportListDTO dto : list){ %>
				<li><a href="#" class="font2"><%=dto.getRank()%> <%=dto.getRankName()%> <%=dto.getRcount()%></a></li> <%} %>
			</ol>
		</ul>
	</div>
</div>