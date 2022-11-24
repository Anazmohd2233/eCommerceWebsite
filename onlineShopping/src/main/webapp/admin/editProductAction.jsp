<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
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
		PreparedStatement stm=con.prepareStatement("update products set name='"+name+"' ,category='"+category+"',price='"+price+"',active='"+active+"' where id='"+id+"' ");
		int i=stm.executeUpdate();
		
		if("NO".equals(active))
		{
			stm.executeUpdate("delete from cart where id='"+id+"' and address is NULL");
		}
		
		if(i>0)
		response.sendRedirect("allProductEdit.jsp?value=done");
	}
	catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("allProductEdit.jsp?value=failed");
	}
%>

</body>
</html>