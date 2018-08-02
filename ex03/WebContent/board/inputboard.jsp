<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Gaegu|Rancho" rel="stylesheet">

<title>Insert title here</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);


.font2 {	
font-family: 'Gaegu', cursive;
	font-size: 20px;
}

.font {
	font-family: 'Nanum Pen Script', cursive;
	font-size: 20px;
}

.td_color {
	background-color: #EAEAEA;
	font-size: 13px;
}

td, th {
	border: 0.2px solid gray;
	margin: 10px;
	padding: 10px;
}

input[type="date"]::-webkit-calendar-picker-indicator {
	color: rgba(0, 0, 0, 0); //
	숨긴다 opacity: 1;
	display: block;
	background:
		url(https://mywildalberta.ca/images/GFX-MWA-Parks-Reservations.png)
		no-repeat; // 대체할 아이콘 width : 20px;
	height: 20px;
	border-width: thin;
}

.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
}

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

input::placeholder {
	font-family: 'Nanum Pen Script', cursive;
	font-size: 18px;
}

textarea::placeholder {
	font-family: 'Nanum Pen Script', cursive;
	font-size: 18px;
}
</style>
</head>
<body>
	<br>
	<br>
	<div class="centered">
		<!--  <form action="list.jsp" method="post">-->
		<form action="outputboard.jsp" method="post">
			<div class="shadow p-3 mb-5 bg-white rounded">
				<table border="1" rules="rows" cellpadding="0" cellspacing="0"
					class="table table-bordered">
					<tr>
						<td class="td_color text-center"><b class="font2">작성자</b></td>
						<td><input type="text" name="name" placeholder="작성자를 입력하세요."
							autofozus required></td>
						<td class="td_color text-center"><b class="font2">작성일자</b></td>
						<td><input type="date" name="date" id="datepicker" class="font"></td>
					</tr>

					<tr>
						<td class="td_color text-center"><b class="font2">제목</b></td>
						<td colspan="4"><input type="text" name="title" size="75"
							placeholder="제목을 입력하세요." autofozus required></td>
					</tr>

					<tr>
						<td colspan="5"><textarea cols="85" rows="7" name="content"
								placeholder="내용을 입력하세요." autofozus required style="resize: none"></textarea></td>
					</tr>

					<tr>
						<td colspan="5" align="right">

							<div class="file_input">
								<label> File Attach <input type="file"
									onchange="javascript:document.getElementById('file_route').value=this.value"
									name="FileName">
								</label> <input type="text" readonly="readonly" title="File Route"
									id="file_route">
							</div> <input class="btn btn-secondary btn-sm font2" type="submit" value="등록">
							<input class="btn btn-secondary btn-sm font2" type="reset" value="취소">
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>