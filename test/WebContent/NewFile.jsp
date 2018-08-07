<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>
.file_input label {
	position: relative;
	cursor: pointer;
	display: inline-block;
	vertical-align: middle;
	overflow: hidden;
	width: 100px;
	height: 30px;
	background: #777;
	color: #fff;
	text-align: center;
	line-height: 30px;
	font-family: 'Rancho', cursive;
}

.file_input label input {
	position: absolute;
	width: 0;
	height: 0;
	overflow: hidden;
}

.file_input input[type=text] {
	vertical-align: middle;
	display: inline-block;
	width: 400px;
	height: 28px;
	line-height: 28px;
	font-size: 15px;
	padding: 0;
	border: 0;
	border: 1px solid #777;
}
</style>
<body>
	<form action="imagetest.jsp" method="post"
		enctype="multipart/form-data">

		<div class="file_input">
			<label> File Attach <input type="file"
				onchange="javascript:document.getElementById('file_route').value=this.value"
				name="FileName">
			</label> <input type="text" readonly="readonly" title="File Route"
				id="file_route">
		</div>
		<input class="btn btn-secondary btn-sm font2" type="submit" value="등록">
	</form>
</body>
</html>