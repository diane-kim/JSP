<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBGXKB1k8LOAYWW0KCV9G0NNupVvav0XAs"></script> -->
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--  <script type="text/javascript" src="<%= request.getContextPath() %>/js/GoogleMapMark.js"></script> --%> 
<script>createMap('${dto.fromName}','${dto.toName}',${dto.fromLatitude},${dto.toLatitude},${dto.fromLongitude},${dto.toLongitude}) </script>
<div id="map" style="width:100%;height:400px;"></div>

