
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
		String name=request.getParameter("name");
		String email=request.getParameter("email");

		String newpwd=request.getParameter("newpwd");
		
		int check=0;
		
		try
		{
			Connection con = ConnectionProvider.getConnection();
			Statement stm =con.createStatement();
			ResultSet rs= stm.executeQuery("select * from user_data where user_name='"+name+"'"+
					 " and email='"+email+"'   ");
										
			while(rs.next())
			{
				
				check=1;
				stm.executeUpdate("update user_data set password='"+newpwd+"' where email='"+email+"' ");
				
				response.sendRedirect("forgotPassword.jsp?msg=valid");
			}
			if(check==0)
			{
				response.sendRedirect("forgotPassword.jsp?msg=invalid");
			}
			
			 
			 
		}
		catch(Exception e)
		{	
			System.out.println(e);

		}
		
	%>
</body>
</html>