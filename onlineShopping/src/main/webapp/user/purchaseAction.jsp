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
	<%
		int i=0;
		String email=session.getAttribute("email").toString();
		
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String country=request.getParameter("country");
		String number=request.getParameter("mob");
		String payment=request.getParameter("payment");
		
		try
		{
			Connection con=ConnectionProvider.getConnection();
			Statement stm=con.createStatement();
			i=stm.executeUpdate("update cart set address='"+address+"',city='"+city+"',state='"+state+"',country='"+country+"' , mobileNumber='"+number+"' , payment='"+payment+"'  where email='"+email+"'   ");
							 
			if(i!=0)
			{
				response.sendRedirect("myCart.jsp?msg=added");
			}
			else
			{
				response.sendRedirect("myCart.jsp?msg=failed");
			}
		}
		catch(Exception e)
		{
			response.sendRedirect("myCart.jsp?msg=invalid");
			System.out.println(e);
			
		}
	%>
	
	
	
</body>
</html>