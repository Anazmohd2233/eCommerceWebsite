<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="userHeader.jsp" %>
<%@ include file="../footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

	.cart-table 
	{
	  font-family: arial, sans-serif;
	  border-collapse: collapse;
	  width: 100%;
	}
	td, th 
	{
	  border: 1px solid #dddddd;
	  text-align: left;
	  padding: 8px;
	}
	tr:nth-child(even) 
	{
  		background-color: #dddddd;
	}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
		String msg=request.getParameter("msg");
		if("added".equals(msg))
		{%>
			<h2>Product Ready For Delivery</h2>
<%      }
		if("failed".equals(msg))
		{%>
			<h2>Purchase failed..Try again...!</h2>
<%      }
		if("invalid".equals(msg))
		{%>
			<h2>Something went wrong..Try again Later...!</h2>
<%      }
		
	%>
	<h1>Your Cart</h1>
	<table class="cart-table" >
		<thead>
		<tr>
			<th>ID</th>
			<th>NAME</th>
			<th>QUANTITY</th>
			<th>PRICE</th>
			<th>TOTAL PRICE</th>
			<th>EDIT</th>
		</tr>
		</thead>
		
		<tbody>
		<% 
		String id=null;
		String p_name=null;
		try
		{
			Connection con=ConnectionProvider.getConnection();
			Statement stm=con.createStatement();
			ResultSet rs=stm.executeQuery("select * from cart where email='"+email+"' and address is NULL");

			while(rs.next())
			{
			%>
			<tr>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td><a href="#" >Edit</a></td>
				
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
		
		<a href="purchase.jsp" >Purchase</a>
			

</body>
</html>