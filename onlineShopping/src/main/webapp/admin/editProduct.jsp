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

<h2>Edit Products</h2>
<% %>
<a href="allProductEdit.jsp">Back</a>


	<%
	String id=request.getParameter("id");
	try
	{
		Connection con=ConnectionProvider.getConnection();
		Statement stm=con.createStatement();
		ResultSet rs=stm.executeQuery("select * from products where id='"+id+"' ");
		
		while(rs.next())
		{%>
			<form action="editProductAction.jsp?id=<%=id%>" method="post">


			<div class="left-div">
			<h3>Enter Name</h3>
			<input type="text" name="name" required="required" value="<%=rs.getString(2)%>">
			</div>
			<div class="right-div">
			<h3>Enter Category</h3>
			<input type="text" name="category" required="required" value="<%=rs.getString(3)%>">
			</div>
			<div class="left-div">
			<h3>Enter Price</h3>
			<input type="number" name="price" required="required" value="<%=rs.getString(4)%>" >
			</div>
			<div class="right-div">
			<h3>Active</h3>
			  <select name="active" id="active">
			    <option value="YES">Yes</option>
			    <option value="NO">No</option>

			  </select>
			</div>
			<div>
				<input type="submit" value="Update"  >
			</div>

			</form>
			
			
		<%}
		
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	
	%>
	




</body>
</html>