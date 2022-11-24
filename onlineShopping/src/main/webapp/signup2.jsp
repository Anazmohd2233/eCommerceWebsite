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
		
			<form action="signupAction.jsp" method="post" >
			<input type="text" name="name" placeholder="Enter Name" required  >
			<input type="email" name="email" placeholder="Enter Email" required>
			<input type="number" name="phoneNumber" placeholder="Enter Phone Number" required >
			<select name="securityQuestions" >
			<option value="fav movie">Which is your favourite movie</option>
			<option value="fav colour">Which is your favourite colour</option>
			<option value="fav vehicle">Which is your favourite vehicle</option>
			</select>
			<input type="text" name="answer" placeholder="Enter Answer" required>
			<input type="password" name="pwd" placeholder="Enter Password" required >
			<input type="submit" value="Signup">
			</form>
			<h2><a href="login.jsp" >Login</a></h2>
		</div>
		<div class="whysign" >
		<%String msg=request.getParameter("msg");
		if("valid".equals(msg))
		{%>
			<h3>SignUp Successful ! </h3>
	  <%}
		if("invalid".equals(msg))
		{%>
			<h3>Sorry....SignUp Failed.Try Again !!</h3>	
		<%}
		%>
			
		</div>
	</div>
	
</body>
</html>