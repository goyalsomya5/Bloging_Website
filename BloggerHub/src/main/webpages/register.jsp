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
<body style="background-color: #f3e5f5">
	<!-- nav bar -->
	<%@ include file="navigationbar.jsp"%>

	<h1>
		<span class="fa fa-group fa=lg"></span> Sign Up!
	</h1>

	<form id="reg-form" action="UserInsertionServlet" method="POST">
		<div class="form-group">
			<div class="form-row">
				<div class="col">
					<label for="inputName">First Name</label> <input name="F_Name"
						type="text" class="form-control" placeholder="First name">
				</div>
				<div class="col">
					<label for="inputLastName">Last Name</label> <input name="L_Name"
						type="text" class="form-control" placeholder="Last name">
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="exampleFormControlSelect2">Gender</label> <select
				class="form-control" id="exampleFormControlSelect2" name="Gender"
				placeholder="Gender">
				<option>Male</option>
				<option>Female</option>
			</select>
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Email address</label> <input
				name="Email" type="email" class="form-control"
				id="exampleFormControlInput1" placeholder="name@example.com">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Password</label> <input
				name="Password" type="password" class="form-control"
				id="exampleInputPassword1" placeholder="Password">
		</div>
		<div class="form-group">
			<label for="exampleFormControlTextarea1">About</label>
			<textarea name="About" class="form-control"
				id="exampleFormControlTextarea1" rows="3"
				placeholder="Write About Yourself"></textarea>
		</div>
		<div class="form-group">
			<div class="form-check">
				<input name="check" type="checkbox" class="form-check-input"
					id="exampleCheck1"> <label class="form-check-label"
					for="exampleCheck1">Agree terms and conditions.</label>
			</div>
		</div>
		<button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
	</form>

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
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    //send register servlet:
                    $.ajax({
                        url: "UserInsertionServlet",
                    	type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            if (data.trim() === 'done')
                            {
                                swal("Registered successfully..We are going to redirect to login page.")
                                        .then((value) => {
                                            window.location = "login.jsp"
                                        });
                            } else
                            {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("something went wrong..try again");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
</body>
</html>