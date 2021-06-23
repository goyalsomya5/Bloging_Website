<%@page import="com.web.blog.entities.User"%>
<%@page errorPage="error.jsp"%>
<%
response.setHeader("Cache-Control", "no-cache , no-store, must-revalidate");
response.setHeader("Progma", "no-cache");
response.setHeader("Expiers", "0");
User user = (User) session.getAttribute("currentuser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Page</title>
<!-- css -->

<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body style="background-color: #f3e5f5">
	<!-- Dynamic navigation bar -->
	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"><span
			class="fa fa-hand-o-right fa-lg"></span>Blogger Hub</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Categories </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Technical</a> <a
							class="dropdown-item" href="#">Lifestyle</a> <a
							class="dropdown-item" href="#">Poetry</a> <a
							class="dropdown-item" href="#">Art</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Other</a>
					</div></li>
				<li class="nav-item active"><a class="nav-link"
					href="register.jsp">Start Writing</a></li>

				<li class="nav-item active"><a class="nav-link" href="#">Contact</a>
				</li>
			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item active"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#user-info"><span><img
							src="img/<%=user.getPicture()%>" class="img-fluid"
							style="border-radius: 50%; max-width: 22px"> <%=user.getFirst_Name()%>
					</span></a></li>
			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item active" id="logout" type="submit"><a
					class="nav-link" href="LogoutServlet"><span
						class="fa fa-sign-out"></span>Logout</a></li>
			</ul>
		</div>
	</nav>
	<!-- Profile Modal -->
	<!-- Modal -->
	<div class="modal fade" id="user-info" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-white text-center primary-background">
					<h5 class="modal-title" id="exampleModalLongTitle">Profile
						Details :</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="container text-center " style="margin: 15px 15px">
					<img src="img/<%=user.getPicture()%>" class="img-fluid"
						style="border-radius: 50%; max-width: 120px"> <br>
				</div>
				<table class="table">

					<tbody>
						<tr>
							<th scope="row">Id :</th>
							<td><%=user.getId()%></td>

						</tr>
						<tr>
							<th scope="row">Name :</th>
							<td><%=user.getFirst_Name()%> <%=user.getLast_Name()%></td>
						</tr>
						<tr>
							<th scope="row">Gender :</th>
							<td><%=user.getGender()%></td>
						</tr>
						<tr>
							<th scope="row">Email :</th>
							<td><%=user.getEmail()%></td>
						</tr>
						<tr>
							<th scope="row">About :</th>
							<td><%=user.getAbout()%></td>
						</tr>
					</tbody>
				</table>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Edit</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>

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
		
	</script>
</body>
</html>