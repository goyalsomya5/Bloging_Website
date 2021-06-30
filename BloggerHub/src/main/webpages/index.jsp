<%@page import="com.web.blog.entities.Post"%>
<%@page import="com.web.blog.dao.FetchBlogsDAO"%>
<%@page import="com.web.blog.helpers.Connector"%>
<%
response.setHeader("Cache-Control", "no-cache , no-store, must-revalidate");
response.setHeader("Progma", "no-cache");
User u = (User) session.getAttribute("currentuser");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Blogger Hub</title>

<!-- css -->

<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>

<body style="background-color: #f3e5f5 !important">
	<!-- navigation bar -->
	<%@ include file="navigationbar.jsp"%>

	<!-- Banner -->
	<div class="jumbotron primary-background text-white" style = "border-radius:0%;">
		<div class="container">
			<h3 class="display-4">Welcome To Blogger Hub!</h3>
			<p>A perfect place for writing your blogs.</p>
			<a href="register.jsp">
				<button class="btn btn-outline-light my-2 my-sm-0">Start
					Writing!</button>
			</a> <a href="login.jsp">
				<button class="btn btn-outline-light my-2 my-sm-0">Login</button>
			</a>
		</div>
	</div>

	<div class="container-fluid card-columns">
		<%
		int count = 0;
		FetchBlogsDAO fdao = new FetchBlogsDAO(Connector.getConnection());
		ArrayList<Post> al = fdao.fetchpost();
		for (Post p : al) {
		%>
		<%
		if (count++ == 5) {
			count = 0;
		%>
		<br>
		<%
		}
		%>
		<div class="card" style="width: 20rem; margin-left: 30px; border-radius:2%;">
		<div class = "card-header">
			<h4 class="display-4 card-title text-center"
				style="text: center; margin-top: 10px; font-size : 30px"><%=p.getTitle().toUpperCase()%></h4></div>
			<%
			if (p.getPicture() != null) {
			%>
			<img class="card-img-top" src="img/<%=p.getPicture()%>" alt="" style = "padding-left:50px;padding-right:50px">
			<%
			}
			%>

			<div class="card-body">

				<p class="card-text"><%=p.getContent()%></p>
				<a href="#" class="btn btn-outline-light primary-background">Like <span class="fa fa-thumbs-up"></span></a>
				<a href="#" class="btn btn-primary">Read More</a>
			</div>
		</div>
		<%
		}
		%>
	</div>
<a id="back-to-top" href="#" class="btn btn-light btn-lg back-to-top" role="button"><i class="fa fa-chevron-up"></i></a>
	<%-- java script --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>

</html>