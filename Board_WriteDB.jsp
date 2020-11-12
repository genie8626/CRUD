<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String sub = request.getParameter("sub");
	String cont = request.getParameter("cont");
	String writer = request.getParameter("writer");
	
	Connection co = null;
	PreparedStatement prep = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
		co = ds.getConnection();
	String sql = "insert into board_a(sub,cont,writer)values(?,?,?)";
	prep=co.prepareStatement(sql);
	
	prep.setString(1, sub);
	prep.setString(2, cont);
	prep.setString(3, writer);
	prep.executeUpdate();
	
	//co.close();
	
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(co!=null){try{co.close();}catch(Exception e){}}
		if(prep!=null){try{prep.close();}catch(Exception e){}}
		
		}


%>
</body>

<a href="Board_view.jsp">게시판 바로가기</a>



</html>