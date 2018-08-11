<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<style>
input:hover {
	text-decoration: underline;
}

a:hover {
	text-decoration: underline;
}
p {padding: 5px 25px 5px 25px; border: 1px solid lightgrey; display: inline;}

tr.b { border-bottom: 1px solid lightgrey}
.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body style="text-align: center">
<jsp:include page="../header.jsp"></jsp:include>
	<br />
	<h3 style="text-decoration: underline">Q & A</h3>
	<div class="centered">
		<form action="/board2/writeQnA.khy" method="post">
			<table
				style="width: 1000px; text-align: left; border: 1px solid lightgrey;">
				<tr style="border-top: 1px solid lightgrey; height: 50px" class="b">
					<td colspan="2">&nbsp&nbsp Subject &nbsp&nbsp <select
						name="subject" style="width: 150px">
							<option selected>문의 사항</option>
							<option>상품문의</option>
							<option>배송문의</option>
							<option>교환&환불문의</option>
							<option>기타</option>
					</select></td>
				</tr>
				<tr style="height: 50px;" class="b">
					<td style="width: 150px;">&nbsp&nbsp Name ${name} 
					<input type="hidden" name="name" value="${name}">
					<input type="hidden" name="id" value="${id}"></td>
					<td>Date</td>
				</tr>
				<tr style="height: 300px;  text-align: center" class="b">
					<td colspan="2">
					<textarea name="content" style="width: 900px; height: 250px; resize: none;" 
					placeholder=
					"                        사이즈 문의시, 신체 사이즈와
					평소 착용하시는 사이즈를 적어주세요. 정확한 답변에 도움이 됩니다 :)

					---------------------------------------------------------------">
					</textarea></td>
				</tr>
				<tr style="height: 50px;" class="b">
					<td style="width: 150px">&nbsp&nbsp Password</td>
					<td><input type="password" name="qa_pwd"> &nbsp;&nbsp;
						비밀번호를 입력하세요.</td>
				</tr>
			</table>

			<table style="width: 1000px; text-align: right;">
				<tr>
					<td><br />
						<p>
							<a href="/board2/qaList.khy" style="color: grey">LIST</a>
						</p>
						<p>
							<input type="submit" value="WRITE"
								style="background-color: white; border: 0px; color: grey">
						</p></td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../footer.html"/>
</body>
</html>