<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8" />
    <title> 여행 출발지,목적지 </title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBGXKB1k8LOAYWW0KCV9G0NNupVvav0XAs&sensor=false"></script>
    <script type="text/javascript" src="/travel/js/GoogleMapMark.js"></script>
</head>

<body>
<script>createMap('${dto.fromName}','${dto.toName}',${dto.fromLatitude},${dto.toLatitude},${dto.fromLongitude},${dto.toLongitude}) </script>
<div id="map" style="width:800px;height:600px;margin-top:20px;"></div>
</body>
</html>



