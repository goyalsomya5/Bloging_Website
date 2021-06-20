<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Here!</title>
<!-- css -->
<style>
h1 {
	text-align: center;
	padding-top: 20px;
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
<body style="background-color:#f3e5f5">
	<!-- navigation bar -->
	<%@ include file="navigationbar.jsp"%>

	<h1><span class = "fa fa-id-badge fa-lg	"></span>Login</h1>

	<div class="container">
		<form class="px-4 py-3">
			<div class="form-group">
				<label for="exampleDropdownFormEmail1">Email address</label> <input
					type="email" class="form-control" id="exampleDropdownFormEmail1"
					placeholder="email@example.com">
			</div>
			<div class="form-group">
				<label for="exampleDropdownFormPassword1">Password</label> <input
					type="password" class="form-control"
					id="exampleDropdownFormPassword1" placeholder="Password">
			</div>
			<div class="form-check">
				<input type="checkbox" class="form-check-input" id="dropdownCheck">
				<label class="form-check-label" for="dropdownCheck">
					Remember me </label>
			</div>
			<button type="submit" class="btn btn-primary">login in</button>
		</form>
		<div class="dropdown-divider"></div>
		<a class="dropdown-item" href="register.jsp">New around here? Sign up</a> <a
			class="dropdown-item" href="#">Forgot password?</a>
	</div>


</body>
</html>