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
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	
	if("admin@gmail.com".equals(email)&&"123".equals(password))
	{
		session.setAttribute("email", email);
		response.sendRedirect("admin/adminHome.jsp");
	}	
	else
	{
		int z=0;
		 
	try{
		 Connection con=ConnectionProvider.getConnection();
		 Statement stm =con.createStatement();
		 ResultSet rs =stm.executeQuery
				 ("select * from user_data where email='"+email+"'&& password='"+password+"'");
		 while(rs.next())
		 {
			z=1;
			session.setAttribute("email", email);
			response.sendRedirect("user/home.jsp");
		 }
		 if(z==0)
		 {
			 response.sendRedirect("login.jsp?msg=notexist");
		 }
		}
	catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("login.jsp?msg=invalid");
		
		
	}
		  
	}
	%>

</body>
</html>