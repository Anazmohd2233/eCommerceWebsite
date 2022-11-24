<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="signup.css" >
</head>
<body>
	<div class="main-div">
			<div class="login-form">	
		
				<form action="signupAction.jsp" method="post" >		  
					<h1>SignUP</h1>	    
					<div class="content">
							<div class="input-field">
								<input type="text" name="name" placeholder="Enter Name" required  >
							</div>     
							<div class="input-field">
								<input type="email" name="email" placeholder="Enter Email" required>
							</div>      
							<div class="input-field">
								<input type="number" name="phoneNumber" placeholder="Enter Phone Number" required >
							</div>	      
							<div class="input-field">
								<select name="securityQuestions" >
									<option value="fav movie">Which is your favourite movie</option>
									<option value="fav colour">Which is your favourite colour</option>
									<option value="fav vehicle">Which is your favourite vehicle</option>
								</select>
							</div>			    
							<div class="input-field">
								<input type="text" name="answer" placeholder="Enter Answer" required>
							</div>      
							<div class="input-field">
								<input type="password" name="pwd" placeholder="Enter Password" required >
							</div>	
					</div>
					<div class="action">
							<button type="submit" name="signup-button" >SignUp</button>
					</div>
				</form>
				
					<div class="alert" >
							<a href="login.jsp" class="link">Login Here</a>
					</div>
		      
      
			</div>
			<div class="alert" >
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