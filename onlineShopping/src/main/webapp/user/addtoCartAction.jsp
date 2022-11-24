
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
		int quantity=1;
		int price=0;
		int total=0;
		String product=null;
		String id=request.getParameter("id"); 
		String email=session.getAttribute("email").toString();
		
		int z=0;
		
		try
		{
			Connection con=ConnectionProvider.getConnection();
			Statement stm=con.createStatement();
			ResultSet rs=stm.executeQuery("select * from products where id='"+id+"' ");
			
			while(rs.next())
			{
				price=rs.getInt(4);
				total=price;
				
				product=rs.getString(2);
			}
			
			ResultSet rs1=stm.executeQuery("select * from cart where id='"+id+"' and email='"+email+"' and address is NULL ");
			while(rs1.next())
			{
				quantity=rs1.getInt(4);
				quantity=quantity+1;
				
				price=rs1.getInt(5);
				total=rs1.getInt(6);
				
				total=total+price;
				
				z=1;
				
			}
			
			if(z==0)
			{
				PreparedStatement prep=con.prepareStatement("insert into cart (email,id,product,quantity,price,total)values(?,?,?,?,?,?) ");
				prep.setString(1, email);
				prep.setString(2, id);
				prep.setString(3, product);
				prep.setInt(4, quantity);
				prep.setInt(5, price);
				prep.setInt(6, total);
				prep.executeUpdate();
				
				response.sendRedirect("home.jsp?msg=added");
			}
			
			if(z==1)
			{ 
				stm.executeUpdate("update cart set quantity='"+quantity+"' , total='"+total+"' where id='"+id+"' and email='"+email+"' and address is NULL   ");
				response.sendRedirect("home.jsp?msg=updated");
			}
				
		}
		catch(Exception e)
		{
			System.out.println(e);
			response.sendRedirect("home.jsp?msg=invalid");	
		}
	%>
</body>
</html>