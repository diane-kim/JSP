<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="boardProc.jsp" method="post">
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th>���̵�</th>
				<td><input type="text" name="id" maxlength="12"></td>
			</tr>
			<tr>
				<th>��й�ȣ</th>
				<td><input type="password" name="pwd" maxlength="15"></td>
			</tr>
			<tr>
				<th>����</th>
				<td><input type="text" name="title" maxlength="20"></td>
			</tr>
			<tr>
				<th>����</th>
				<td><textarea rows="25" cols="50" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="���">
					<input type="reset" value="���"></td>
			</tr>
		</table>
	</form>
	</body>
</html>