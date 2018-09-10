<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
$(function(){
$(".btn1").on({
	"mouseover":function(){
	$(".txt1").css({"background-color":"aqua"});
	},
	"mouseout":function(){
	$(".txt1").css({"background-color":"none"});
	}
	
});
</script>
<p>
<button class="btn1">Hover</button>
</p>
<p class="txt1">내용2</p>
</body>
</html>