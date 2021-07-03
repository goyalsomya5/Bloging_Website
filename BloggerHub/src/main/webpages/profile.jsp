<%@page import="com.web.blog.entities.User"%>
<%@page errorPage="error.jsp"%>
<%
response.setHeader("Cache-Control", "no-cache , no-store, must-revalidate");
response.setHeader("Progma", "no-cache");

User u = (User) session.getAttribute("currentuser");
if (u == null) {
	response.sendRedirect("login.jsp");
}
session.setAttribute("postuser", u);
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
	<%@ include file="navigationbar.jsp"%>
	<div class="container-fluid primary-background">
		<a href="#!" data-toggle="modal" data-target="#add-post">
			<button type="button" class="btn btn-outline-light my-4 my-sm-4"
				style="font-size: 30px; text-color: white; width: 200px; height: 100px; margin-top: 50px; margin-left: 50px;">
				Add Blog <span class="fa fa-plus"></span>

			</button>
		</a>
	</div>
	<!-- Blog post modal -->
	<div class="modal fade" id="add-post" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-white text-center primary-background">
					<h5 class="modal-title" id="exampleModalLongTitle">Add Blog :</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
						
					</button>
				</div>
				<div class="container-fluid">
					<form id="post-blog" action="PostBlogServlet" method="POST"
						enctype="multipart/form-data">
						<div class="form-group">
							<label for="inputPassword4">Blog Title</label> <input type="text"
								class="form-control" id="BlogTitle" name="BlogTitle"
								placeholder="Enter your blog title.." required>
						</div>

						<div class="form-group">
							<label for="inputState">Category</label> <select id="Category"
								name="Category" class="form-control" required>
								<option value="">Choose...</option>
								<%
								ArrayList<Category> c = (ArrayList<Category>) session.getAttribute("categories");
								for (Category c1 : c) {
								%>
								<option value="<%=c1.getCid()%>"><%=c1.getCname()%></option>
								<%
								}
								%>
							</select>
						</div>

						<div class="form-group">
							<label for="exampleFormControlTextarea1">Blog Content</label>
							<textarea class="form-control" id="BlogContent"
								name="BlogContent" rows="7" required></textarea>
						</div>
						<div class="form-group">
							<label for="inputPassword4">Blog Picture</label> <input
								type="file" class="form-control" id="BlogPicture"
								name="BlogPicture" placeholder="Choose Image" accept="image/*">
						</div>
						<div class="text-center">
							<button id="post" type="submit"
								class="btn btn-outline-light primary-background"
								style="margin-bottom: 10px;">Post</button>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>

	<div>
		<h1
			style="font-size: 50px; text-color: white; margin-top: 50px; margin-left: 50px;">Your
			Blog's :</h1>
		<hr>
	</div>

	<!-- User Posts -->
	<%@ include file="posts.jsp"%>

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
            $(document).ready(function () {
                console.log("loaded........")
                $('#post-blog').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    //send register servlet:
                    $.ajax({
                        url: "PostBlogServlet",
                    	type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            if (data.trim() === 'done')
                            {
                                swal("Blog Posted",{
                                	icon:"success",
                                	timer:1000,
                                	button:false,})
                                        .then((value) => {
                                            window.location.reload();
                                        });
                            } else
                            {
                                swal(data,{icon:"warning",});
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Something went wrong..try again",{icon:"error",});
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
</body>
</html>