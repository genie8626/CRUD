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
int nom=Integer.parseInt(request.getParameter("nom"));

Connection co = null;
PreparedStatement prep = null;

try{
	Context init = new InitialContext();
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
	co = ds.getConnection();
String sql = "delete from board_a where nom=?";
prep=co.prepareStatement(sql);

prep.setInt(1, nom);

prep.executeUpdate();

//co.close();

	
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(co!=null){try{co.close();}catch(Exception e){}}
	if(prep!=null){try{prep.close();}catch(Exception e){}}
	
	}


%>

%>
</body>
</html>