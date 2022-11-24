
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connector.ConnectionProvider"%>
<%@include file="adminHeader.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="adminFooter.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String msg=request.getParameter("msg");
	if("done".equals(msg))
	{%>
		<h3>Product Added Successfully</h3>
	<%}%>
	<%
	if("failed".equals(msg))
	{%>
		<h3>Something Wrong</h3>	
	<%}%>
	
	
<%
	int id=1;
	try
	{
		Connection con=ConnectionProvider.getConnection();
		Statement stm=con.createStatement();
		ResultSet rs =stm.executeQuery("select max(id) from products");
		
		while(rs.next())
		{
			id=rs.getInt(id);
			id=id+1;
		}
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
%>
<form action="addNewProductAction.jsp" method="post">
<H2>Product ID : <%=id %></H2>
<input  type="hidden" name="id" value="<%=id%>"> 
<div class="left-div">
<h3>Enter Name</h3>
<input type="text" name="name" required="required" placeholder="Enter Product Name">
</div>
<div class="right-div">
<h3>Enter Category</h3>
<input type="text" name="category" required="required" placeholder="Enter Category">
</div>
<div class="left-div">
<h3>Enter Price</h3>
<input type="number" name="price" required="required" placeholder="Enter Price">
</div>
<div class="right-div">
<h3>Active</h3>
  <select name="active" id="active">
    <option value="yes">Yes</option>
    <option value="no">No</option>

  </select>
</div>
<div>
	<input type="submit" value="Save" >
</div>

</form>
<div> 

</div>	
	
</body>
</html>