<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="login.css" >

</head>
<body>
<div class="container" >
	
		<form action="loginAction.jsp" method="post">
			<input type="email" name="emailLogin" placeholder="Email" required>
			<input type="password" name="pwdLogin" required placeholder="Password"> 
			
			<button type="submit" >Login Button</button>
			
			
		</form>
		<div class="login">
			<a href="signup.jsp" ><button>SignUp</button ></a>
			<a href="forgotPassword.jsp" ><button>SignUp</button ></a>
		</div> 
		
</div>
	<div id="alert" >
	
		
		<%
			String msg=request.getParameter("msg");
			if("notexist".equals(msg))
			{%>
			<h3>Incorrect user name or password</h3>	
		<%  }
			if("invalid".equals(msg))
			{%>
				<h3>Something went wrong...Try again later...!</h3>
			<% }%>	
		
	</div>



</body>
</html>