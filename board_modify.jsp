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
	int nom = Integer.parseInt(request.getParameter("nom"));
	String writer = request.getParameter("writer");
	
	
	Connection co=null;
	PreparedStatement prep=null;
	ResultSet rs =null;
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		co=ds.getConnection();
		String sql ="select * from Board_a where nom=?";
		prep=co.prepareStatement(sql);
		prep.setInt(1, nom);
		rs=prep.executeQuery();
		if(rs.next()){
			
	
		%>
		<form action="Board_modifyDB.jsp">
		<table border="1" style="border-collapse: collapse;">
			<tr>	
				<td colspan="2"><h3>게시판 글 수정</h3></td>
			</tr>
			<tr>	
				<td>글번호</td>
				<td><%=rs.getInt("nom")%>
				<input type="hidden" name="nom" value="<%=rs.getString("nom")%>"></td>
			</tr>
			<tr>	
				<td>제목</td>
				<td><input type="text" name="sub" placeholder="수정할 내용입력" value="<%=rs.getString("sub")%>"></td>
			</tr>
			<tr>	
				<td>내용</td>
				<td><textarea rows="6" cols="22" name="cont" placeholder="수정할 내용입력"><%=rs.getString("cont")%></textarea></td>
			</tr>
			<tr>	
				<td>작성자</td>
				<td><input type="text" name="writer" value="<%=rs.getString("writer")%>" readonly="readonly"></td>
			</tr>
			<tr>	
				<td colspan="2" style="text-align: center;"><input type="submit" value="글수정"></td>
			</tr>

		</table>
	</form>
	<%
		//co.close();
		//rs.next();
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(co!=null){try{co.close();}catch(Exception e){}}
		if(prep!=null){try{prep.close();}catch(Exception e){}}
		
		}
	 %>

	
</body>
</html>