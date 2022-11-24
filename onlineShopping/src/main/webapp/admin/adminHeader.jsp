<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%String email=session.getAttribute("email").toString();
	%>
	
	<div class="adminHead">
	
		 <h3>Online Shopping</h3>
		<a href="addNewProduct.jsp" >Add New Product</a>
		<a href="allProductEdit.jsp" >All Products & Edit Products</a>
		<a href="#" >Message Received</a>
		<a href="#" >Orders Received</a>
		<a href="#" >Cancel Orders</a>
		<a href="#" >Delivery Orders</a>
		<a href="../logout.jsp" >Logout</a>
		
	</div>
</body>
</html>