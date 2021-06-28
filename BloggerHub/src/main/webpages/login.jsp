<%@page import="com.web.blog.entities.User"%>
<%@page errorPage="error.jsp"%>
<%
response.setHeader("Cache-Control", "no-cache , no-store, must-revalidate");
response.setHeader("Progma", "no-cache");
User u = (User) session.getAttribute("currentuser");
if (u != null) {
	response.sendRedirect("profile.jsp");
}
%>
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
<body style="background-color: #f3e5f5">

	<!-- navigation bar -->
	<%@ include file="navigationbar.jsp"%>

	<h1>
		<span class="fa fa-id-badge fa-lg	"></span>Login
	</h1>

	<div class="container">
		<form class="px-4 py-3" id="log-form" action="LoginServlet"
			method="POST">
			<div class="form-group">
				<label for="exampleDropdownFormEmail1">Email address</label> <input
					name="Email" required type="email" class="form-control"
					id="exampleDropdownFormEmail1" placeholder="email@example.com">
			</div>
			<div class="form-group">
				<label for="exampleDropdownFormPassword1">Password</label> <input
					name="Password" required type="password" class="form-control"
					id="exampleDropdownFormPassword1" placeholder="Password">
			</div>
			<div class="form-group" align="center">
				<button id="submit-btn" type="submit" class="btn btn-primary">login
				</button>
			</div>
		</form>
		<div class="dropdown-divider"></div>
		<a class="dropdown-item" href="register.jsp">New around here? Sign
			up</a> <a class="dropdown-item" href="#">Forgot password?</a>
	</div>

	<!-- JavaScript -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="js/js.js" type="text/javascript"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script>
		$(document).ready(function() {
			console.log("loaded........")
			$('#log-form').on('submit', function(event) {
				event.preventDefault();
				let form = new FormData(this);
				//send register servlet:
				$.ajax({
					url : "LoginServlet",
					type : 'POST',
					data : form,
					success : function(data, textStatus, jqXHR) {
						console.log(data)
						if(data.trim() === "error"){
						swal("Invalid Email Address or Password!",{icon:"error",});}
						else{
							swal({
								icon:"success",
								timer:1350,
								button:false,
							}).then((value) =>
							{window.location = "profile.jsp"});
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						swal("Something went wrong..Please try again!",{icon:"info",});
					},
					processData : false,
					contentType : false
				});
			});
		});
	</script>


</body>
</html>