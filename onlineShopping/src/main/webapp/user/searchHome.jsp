<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connector.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="userHeader.jsp" %>
<%@ include file="../footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		int z=0;
		String search=request.getParameter("search");
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
		try
	{
			
	
		Connection con=ConnectionProvider.getConnection();
		Statement stm=con.createStatement();
		ResultSet rs=stm.executeQuery("select id,name,category,price from products where name like '%"+search+"%' or category like '%"+search+"%' and active='yes'  ");
		
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
	<% if(z==0)
		{%>
			<h2>No Item Found</h2>
	  <%}%>
	<div class="backtoHome">
	<a  href="home.jsp" >Back to Home</a>
	</div>
	
</body>
</html>