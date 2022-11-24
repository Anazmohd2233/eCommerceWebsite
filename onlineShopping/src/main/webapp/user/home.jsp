<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connector.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="userHeader.jsp" %>
<%@ include file="../footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">

	body
	{
		background-color: #ccffdd
	}
	table 
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

</head>
<body>
	<h1>Home</h1>
	
	<%
		String msg=request.getParameter("msg");
	
		if("added".equals(msg))
		{%>
			<h2>Item added to your cart</h2>
      <%}

	%>
		<%
	
		if("updated".equals(msg))
		{%>
			<h2>Item already in your cart..! Quantity Increased</h2>
      <%}

	%>
		<%
	
		if("invalid".equals(msg))
		{%>
			<h2>Something went wrong</h2>
      <%}

	%>
	
	<table>
		<thead>
		<tr>
			<th>ID</th>
			<th>NAME</th>
			<th>CATEGORY</th>
			<th>PRICE</th>
			<th>ADD TO CART</th>
		</tr>
		</thead>
		
		<tbody>
	<%
		int z=0;
		try
		{	
		Connection con=ConnectionProvider.getConnection();
		Statement stm=con.createStatement();
		ResultSet rs=stm.executeQuery("select id,name,category,price from products where active='yes' ");
		
		while(rs.next())
		{
			z=1;
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><a href="addtoCartAction.jsp?id=<%=rs.getString(1)%>">Add to cart</a></td>
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
	<%
		if(z==0)
		{%>
			<h2>No Item Found</h2>
	  <%}
	
	%>
	
</body>
</html>