<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container" >
		<div class="signup">
		
			<form action="forgotPasswordAction.jsp" method="post" >
			
			<input type="text" name="name" placeholder="Enter Name" required  >
			<input type="email" name="email" placeholder="Enter Email" required>
			<input type="password" name="newpwd" placeholder="Enter your new Password" required >
			<input type="submit" value="Update Password">
			</form>
			<h2><a href="login.jsp" >Login</a></h2>
		</div>
		<div class="whyforgot" >
		<%
			String msg=request.getParameter("msg");
			
			if("valid".equals(msg))
			{
			%>
				<h2>Password Updated Successfully</h2>
			<%}%>
			
			<%
			if("invalid".equals(msg))
			{
			%>
				<h2>Password Updated Failed</h2>
			<%}%>
			<%
			if("failed".equals(msg))
			{
			%>
				<h2>Something went wrong</h2>
			<%}%>
		
	
		</div>
	</div>
	
</body>
</html>