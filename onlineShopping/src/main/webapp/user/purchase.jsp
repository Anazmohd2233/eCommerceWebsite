<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form action="purchaseAction.jsp" method="post">
		<div class="">
			<label>Address</label><input  type="text" name="address" placeholder="type here" required="required">
		</div>
		<div class="">
			<label>City</label><input  type="text" name="city" placeholder="type here" required="required">
		</div>
		<div class="">
			<label>State</label><input  type="text" name="state" placeholder="type here" required="required">
		</div>
		<div class="">
			<label>Country</label><input  type="text" name="country" placeholder="type here" required="required">
		</div  >
		<div class="">
			<label>Mobile Number</label><input  type="number" name="mob" placeholder="type here" required="required">
		</div>
		<div class="payment-option">
			<select name="payment">
			<option value="cod">COD</option>
			<option value="upi">UPI</option>
			<option value="netbank">INTERNET BANKING</option>
			</select>
		</div>
		<input type="submit"  value="Purchase">
			
		
		</form>	
		

	
	</div>
</body>
</html>