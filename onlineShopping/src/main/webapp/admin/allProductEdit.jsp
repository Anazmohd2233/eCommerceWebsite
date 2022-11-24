<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connector.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="adminHeader.jsp" %>
<%@include file="adminFooter.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<H1>All Products & Edit Product</H1>

<%
	String value=request.getParameter("value");
	if("done".equals(value))
	{%>
		<h3>Product Updated Successfully</h3>
  <%}
	if("failed".equals(value))
	{%>
		<h3>Product Updated Failed</h3>
  <%} %>



<table>
	<thead>
		<tr>
			<th>ID</th>
			<th>NAME</th>
			<th>CATEGORY</th>
			<th>PRICE</th>
			<th>STATUS</th>
			<th>EDIT</th>
		</tr>
	</thead>
	<tbody>
		<tr>
		<%
		try
		{
			Connection con=ConnectionProvider.getConnection();
			Statement stm=con.createStatement();
			ResultSet rs=stm.executeQuery("select * from products");
			
			while(rs.next())
			{%>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><a href="editProduct.jsp?id=<%=rs.getString(1)%>">Edit</a></td>
		</tr>
		<%  }
		 }
		catch(Exception e)
		{
			System.out.println(e);
		}
		 %>
	
		
			
	</tbody>
</table>
</body>
</html>