<%@page import="com.web.blog.helpers.Connector"%>
<%@page import="com.web.blog.dao.CategoriesDAO"%>
<%@page import="com.web.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.web.blog.entities.User"%>
<%
response.setHeader("Cache-Control", "no-cache , no-store, must-revalidate");
response.setHeader("Progma", "no-cache");
User user = (User) session.getAttribute("currentuser");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
					<%
					CategoriesDAO dao = new CategoriesDAO(Connector.getConnection());
					ArrayList<Category> categories = dao.getCategories();
					for (Category c : categories) {
						if (!c.getCname().equals("Other")) {
					%>
					<a class="dropdown-item" href="#"><%=c.getCname()%></a>
					<%
					} else {
					%>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#"><%=c.getCname()%></a>
					<%
					}
					}
					%>

				</div></li>
			<li class="nav-item active"><a class="nav-link"
				href="register.jsp">Start Writing</a></li>

			<li class="nav-item active"><a class="nav-link" href="#">Contact</a>
			</li>
		</ul>
		<%
		if (user != null) {
		%>
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
		<%
		} else {
		%>
		<ul class="navbar-nav mr-right">
			<li class="nav-item active" id="login" type="submit"><a
				class="nav-link" href="login.jsp"><span class="fa fa-sign-out"></span>Login</a></li>
		</ul>
		<%
		}
		%>
	</div>
</nav>
<!-- Profile Modal -->
<!-- Modal -->
<%
if (user != null) {
%>
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
			<div id="profile-details">
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
			</div>
			<!-- Profile Edit Form -->
			<div id="profile-edit" class="container-fluid" style="display: none;">
				<form id="edit-form" action="UserEditServlet" method="POST"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="inputPassword4">User Id</label> <input type="text"
							class="form-control" id="Id" name="Id"
							placeholder="<%=user.getId()%>" disabled>
					</div>
					<div class="form-row">
						<div class="form-group col-md-5">

							<label for="inputEmail4">First Name</label> <input type="text"
								class="form-control" id="First_Name" name="First_Name"
								value="<%=user.getFirst_Name()%>" required>
						</div>
						<div class="form-group col-md-5">
							<label for="inputPassword4">Last Name</label> <input type="text"
								class="form-control" id="Last_Name" name="Last_Name"
								value="<%=user.getLast_Name()%>" required>
						</div>
					</div>
					<div class="form-group">
						<label for="inputState">Gender</label> <select id="Gender"
							name="Gender" class="form-control" required>
							<option value=null selected disabled>Choose...</option>
							<option value="Female">Female</option>
							<option value="Male">Male</option>
						</select>
					</div>
					<div class="form-group">
						<label for="inputAddress">Email</label> <input type="email"
							class="form-control" id="Email" name="Email"
							value="<%=user.getEmail()%>" disabled>
					</div>
					<div class="form-group">
						<label for="inputAddress2">Password</label> <input type="password"
							class="form-control" id="Password" name="Password"
							value="<%=user.getPassword()%>" required>
					</div>
					<div class="form-group">
						<label for="exampleFormControlTextarea1">About</label>
						<textarea class="form-control" id="About" name="About" rows="3"
							value="<%=user.getAbout()%>"><%=user.getAbout()%></textarea>
					</div>
					<div class="form-group">
						<label for="inputPassword4">Profile Picture</label> <input
							type="file" class="form-control" id="Picture" name="Picture"
							placeholder="Choose Image" accept="image/*"
							value="<%=user.getPicture()%>">
					</div>
					<div class="text-center">
						<button id="saveChanges" type="submit" class="btn btn-primary"
							style="margin-bottom: 5px;">Save Changes</button>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="submit" id="btn" class="btn btn-primary">Edit</button>
				<!--  <button type="button" class="btn btn-primary">Save changes</button>-->
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
		$(document).ready(function() {
			let editStatus = false;
			$('#btn').click(function() {
				if (editStatus == false) {
					$('#profile-details').hide();
					$('#profile-edit').show();
					editStatus = true;
					$(this).text("Go Back");
				} else {
					$('#profile-details').show();
					$('#profile-edit').hide();
					editStatus = false;
					$(this).text("Edit");
				}
			})

		})
	</script>
<script>
            $(document).ready(function () {
                console.log("loaded........")
                $('#edit-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    //send register servlet:
                    $.ajax({
                        url: "UserEditServlet",
                    	type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            if (data.trim() === 'done')
                            {
                                swal("Changes Saved",{
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
<%
}
%>








