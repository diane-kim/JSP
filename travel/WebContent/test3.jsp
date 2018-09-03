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
	var arr1 = ["test1","test2","test3","test4","test5"];
	var data1=[];
	var j=arr1.length;
	
	for(var i=0;i<j;i++){		
		data1.push(arr1.pop());
		console.log(i+", "+data1);
	}
	document.write(data1);
</script>
</body>
</html>