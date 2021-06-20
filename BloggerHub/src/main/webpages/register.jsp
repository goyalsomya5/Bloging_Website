<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<!-- css -->
<style>
h1 {
	text-align: center;
	padding-top: 20px;
}

form {
	padding-left: 100px;
	padding-right: 100px;
}
</style>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body style = "background-color:#f3e5f5">
	<!-- nav bar -->
	<%@ include file="navigationbar.jsp"%>

	<h1>
		<span class="fa fa-group fa=lg"></span> Sign Up!
	</h1>

	<form >
		<div class="form-group">
			<div class="form-row">
				<div class="col">
					<label for="inputName">First Name</label> <input type="text"
						class="form-control" placeholder="First name">
				</div>
				<div class="col">
					<label for="inputLastName">Last Name</label> <input type="text"
						class="form-control" placeholder="Last name">
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="exampleFormControlSelect2">Gender</label> <select
				class="form-control" id="exampleFormControlSelect2"
				placeholder="Gender">
				<option>Male</option>
				<option>Female</option>
			</select>
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Email address</label> <input
				type="email" class="form-control" id="exampleFormControlInput1"
				placeholder="name@example.com">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Password</label> <input
				type="password" class="form-control" id="exampleInputPassword1"
				placeholder="Password">
		</div>
		<div class="form-group">
			<label for="exampleFormControlTextarea1">About</label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				rows="3" placeholder="Write About Yourself"></textarea>
		</div>
		<div class = "form-group">
		<div class="form-check">
			<input type="checkbox" class="form-check-input" id="exampleCheck1">
			<label class="form-check-label" for="exampleCheck1">Agree terms and conditions.</label>
		</div>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</body>
</html>