<%@page import="com.web.blog.entities.User"%>
<%@page errorPage="error.jsp"%>
<%
response.setHeader("Cache-Control", "no-cache , no-store, must-revalidate");
response.setHeader("Progma", "no-cache");
response.setHeader("Expires", "0");
User u = (User) session.getAttribute("currentuser");
if (u == null) {
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
<%@ include file="navigationbar.jsp" %>
<div class="container-fluid primary-background">
<button type="button" class="btn btn-outline-light my-4 my-sm-4" style="width : 200px; height : 100px; margin-top : 50px ; margin-left: 50px;font-size : 30px ; font-color : white;">Add Blog <span class="fa fa-plus"></span></button>
</div>

</body>
</html>