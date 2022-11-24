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
<div class="main-div">
	<div class="login-form">
		  <form action="loginAction.jsp" method="post">
		    <h1>Login</h1>
		    <div class="content">
		      <div class="input-field">
		        <input type="email"  name="email" placeholder="EMAIL" >
		      </div>
		      <div class="input-field">
		        <input type="password" name="password" placeholder="PASSWORD" >
		      </div>
		      <a href="forgotPassword.jsp" class="link">Forgot Your Password?</a>
		    </div>
		    <div class="action">
		      <button type="submit" >Login</button>
		      <button type="submit" formaction="signup.jsp">SignUp</button>
		    </div>
		     </form>
		        <div class="action">
      
    </div>
 
	</div>
	<div class="alert" >
<%
			String msg=request.getParameter("msg");
			if("notexist".equals(msg))
			{%>
			<h3><b>Incorrect User Name or Password</b></h3>	
		<%  }
			if("invalid".equals(msg))
			{%>
				<h3><b>Something went wrong...Try Again Later...!</b></h3>	
				
			<% }%>	
		
	</div>
</div>

</body>
</html>