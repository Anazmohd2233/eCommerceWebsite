<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connector.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Your Orders</h1>
	<table class="cart-table" >
		<thead>
		<tr>
			<th>Product Name</th>
			<th>Quantity</th>
			<th>Total</th>
			<th>Address</th>
			<th>Payment</th>
		</tr>
		</thead>
		
		<tbody>
		<% 
		String email=session.getAttribute("email").toString();
		
		try
		{
			Connection con=ConnectionProvider.getConnection();
			Statement stm=con.createStatement();
			ResultSet rs=stm.executeQuery("select * from cart where email='"+email+"' and address is not null");

			while(rs.next())
			{
			%>
			<tr>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(6) %></td>
				<td><%=rs.getString(7) %></td>
				<td><%=rs.getString(12) %></td>
				
				
			</tr>
		<%	
			}
	
				
				
		}
		catch(Exception e)
		{
			System.out.println(e);
		}%>
		</tbody>
		</table>
		
</body>
</html>