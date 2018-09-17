<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="travel.airportList.com.AirportListDAO"%>
<%@page import="travel.airportList.com.AirportListDTO"%>
<%@page import="java.util.List"%>
<link href="https://fonts.googleapis.com/css?family=Gaegu|Rancho" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/rank.js" ></script>

<div id="content" style="border-radius: 10px;">
<h4 style="text-align: center; font-size: 20px;line-height:2;"><strong style="color:white;">실시간 급상승</strong></h3>
	<div id="rank" style="text-align:center;" >
		<ul>
			<ol>
			<%
			AirportListDAO dao = new AirportListDAO();			
			List<AirportListDTO> list = dao.rankList();			
			for (AirportListDTO dto : list){ %>
				<li><a href="#" style="color:white;"><%=dto.getRank()%>. <%=dto.getRankName()%> <%=dto.getRcount()%></a></li> <%} %>
			</ol>
		</ul>
	</div>
</div>