<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connector.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.user-header
	{
		background-color: #1a8cff;
	}
	
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String email=session.getAttribute("email").toString();
		String name=null;
	
		try
		{
			Connection con=ConnectionProvider.getConnection();
			Statement stm=con.createStatement();
			ResultSet rs=stm.executeQuery("select user_name from user_data where email='"+email+"'");
			while(rs.next())
			{
				name=rs.getString(1);
			}
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	
	%>
	<div class="user-header">
			<h1>Online Shopping</h1>
		
		
		<a href="#" ><%="Hello "+name %></a>
		<a href="home.jsp" >Home</a>
		<a href="myCart.jsp" >My Cart</a>
		<a href="userOrders.jsp" >My Orders</a>
		<a href="#" >Change Details</a>
		<a href="#" >Message Us</a>
		<a href="#" >About</a>
		<a href="../logout.jsp" >Logout</a>
		
		<div>
			<form action="searchHome.jsp" method="post"> 
			<input type="text" name="search" placeholder="search" >
			<button type="submit" >search</i></button>
			
			</form>
		</div>
	</div>

</body>
</html>