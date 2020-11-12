<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="board_delDB.jsp" method="post">
<table border="1" style="border-collapse: collapse">
  <tr>
    <td colspan="2">게시판 글 삭제</td>
  </tr>
  <tr>
    <td>글번호</td>
    <td><input type="text" name="nom"></td>
  </tr>
  <tr style="text-align: center;">
    <td colspan="2"><input type="submit" value="글삭제"></td>
  </tr>
</table>
</form>

</body>
</html>