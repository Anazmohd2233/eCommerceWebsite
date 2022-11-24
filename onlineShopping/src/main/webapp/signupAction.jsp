<%@page import="java.sql.PreparedStatement"%>
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
String phoneNumber=request.getParameter("phoneNumber");
String securityQuestion=request.getParameter("securityQuestions");
String answer=request.getParameter("answer");
String password=request.getParameter("pwd");
String address="";
String city="";
String state="";
String country="";

try
{
 	Connection con=ConnectionProvider.getConnection();
 	PreparedStatement stm=con.prepareStatement("insert into user_data values(?,?,?,?,?,?,?,?,?,?)");
 	stm.setString(1,name );
 	stm.setString(2,email );
 	stm.setString(3, phoneNumber);
 	stm.setString(4, securityQuestion);
 	stm.setString(5, answer);
 	stm.setString(6,password );
 	stm.setString(7,address );
 	stm.setString(8, city);
 	stm.setString(9, state);
 	stm.setString(10,country );
 	stm.executeUpdate();
 	
 	response.sendRedirect("signup.jsp?msg=valid");
 	
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("signup.jsp?msg=invalid");
}

%>

</body>
</html>