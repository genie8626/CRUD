<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="Board_WriteDB.jsp">
<table border="1" style="border-collapse: collapse;">
	<tr>
		<td colspan="2"><h3>게시판 글쓰기</h3></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="sub"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea rows="6" cols="22" name="cont"></textarea></td>
	</tr>
	<tr>
		<td>글쓴이</td>
		<td><input type="text" name="writer"></td>
	</tr>

	<tr style="text-align: center;">
		<td colspan="2" ><input type="submit" value="글쓰기"></td>
	</tr>

</table>
</form>

</body>
</html>