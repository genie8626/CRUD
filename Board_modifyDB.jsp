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
<%

	request.setCharacterEncoding("utf-8");
	String sub = request.getParameter("sub");
	String cont = request.getParameter("cont");
	
	Connection co = null;
	PreparedStatement prep=null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
		co = ds.getConnection();
	String sql = "update board_a set sub =? , cont=? where no =?";
	prep=co.prepareStatement(sql);
	
	prep.setString(1, sub);
	prep.setString(2, cont);
	prep.executeUpdate();
	
	//co.close();
	
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(co!=null){try{co.close();}catch(Exception e){}}
		if(prep!=null){try{prep.close();}catch(Exception e){}}
		
		}


%>



</head>
<body>
<a href="Board_view.jap">게시판바로가기</a>
</body>
</html>