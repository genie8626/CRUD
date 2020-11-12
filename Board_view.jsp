<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="javax.sql.*" %>
    <%@page import="javax.naming.*" %>
    <%@page import="java.util.Date" %>
    <%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<%

request.setCharacterEncoding("utf-8");
String cont = request.getParameter("writedate");






Connection co = null;
PreparedStatement prep =null;
ResultSet rs=null;
try{
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
	co=ds.getConnection();
	String sql="select * from Board_a";
	prep=co.prepareStatement(sql);
	
	rs=prep.executeQuery();
	//rs.next();	
%>

<form action="board_del.jsp">
<h3>게시판리스트</h3>
<table border="1" style="border-collapse: collapse; ">
  <tr>
    <td>글 번호</td>
    <td>제목</td>
    <td>작성자</td>
    <td>작성일</td>
    <td rowspan="7"><input type="submit" value="글 삭제"></td>
  </tr>
  <%while(rs.next()){ %>
  <tr>
    <td><%=rs.getInt("nom") %></td>
    <td><a href="board_modify.jsp?nom=<%=rs.getInt("nom") %>"><%=rs.getString("sub") %></a></td>
    <td><%=rs.getString("writer") %></td>
    <td><%=rs.getString("writedate") %></td>
  </tr>
 <%}; %>
</table>
</form>


<% 	
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(co!=null){try{co.close();}catch(Exception e){}}
	if(rs!=null){try{rs.close();}catch(Exception e){}}
	if(prep!=null){try{prep.close();}catch(Exception e){}}
	
	}
%>

</body>
</html>