<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connector.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String category=request.getParameter("category");
		String price=request.getParameter("price");
		String active=request.getParameter("active");
		
		try
		{
			Connection con=ConnectionProvider.getConnection();
			PreparedStatement stm=con.prepareStatement("insert into products values(?,?,?,?,?)");
			stm.setString(1, id);
			stm.setString(2, name);
			stm.setString(3,category);
			stm.setString(4,price);
			stm.setString(5,active);
			
			stm.executeUpdate();
			response.sendRedirect("addNewProduct.jsp?msg=done");
			
		}
		catch(Exception e)
		{
			System.out.println(e);
			response.sendRedirect("addNewProduct.jsp?msg=failed");
		}
	%>

</body>
</html>