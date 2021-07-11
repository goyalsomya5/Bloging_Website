<%@page import="com.web.blog.dao.LikeDAO"%>
<%@page import="com.web.blog.entities.Category"%>
<%@page import="com.web.blog.entities.User"%>
<%@page import="com.web.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.web.blog.helpers.Connector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.web.blog.dao.FetchBlogsDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User cu = (User) session.getAttribute("currentuser");
User us = (User) session.getAttribute("postuser");
Category category = (Category) session.getAttribute("category");
ArrayList<Post> al = new ArrayList<Post>();
%>

<div class="container-fluid card-columns">
	<%
	int count = 0;
	FetchBlogsDAO fdao = new FetchBlogsDAO(Connector.getConnection());

	//	for a user specific profile page
	if (us != null)
		al = fdao.fetchpost(us);

	//	for a category specific page
	else if (category != null)
		al = fdao.fetchpost(category);
	// for the index page showing all the post..
	else
		al = fdao.fetchpost();
	ArrayList<Category> ct = (ArrayList<Category>) session.getAttribute("categories");
	for (Post p : al) {
		 
		session.setAttribute("post", p);
		p.setCateogory(ct.get(p.getCid() - 1).getCname());
	%>
	<div class="card"
		style="width: 20rem; margin-left: 30px; border-radius: 2%;">
		<div class="card-header">
			<h4 class="display-4 card-title text-center"
				style="text: center; margin-top: 10px; font-size: 30px"><%=p.getTitle().toUpperCase()%></h4>
		</div>
		<%
		if (p.getPicture() != null) {
		%>
		<img class="card-img-top" src="img/<%=p.getPicture()%>" alt=""
			style="padding-left: 50px; padding-right: 50px;">
		<%
		}
		%>

		<div class="card-body">
			<p class="card-text"><%=p.getContent().substring(0, p.getContent().length() / 3)%>
				...
			</p>
			<%
			LikeDAO ldao = new LikeDAO(Connector.getConnection());
			int likes =0;
			int uid = -1;
			if (cu != null)
				uid = cu.getId();
			%>
			<a href="#!" onclick="dolike(<%=p.getPid()%> ,<%=uid%>)"
				class="btn btn-outline-light primary-background">Like <i
				class="fa fa-thumbs-up"></i><span class="<%=p.getPid()%>"><%= ldao.getLikeCount(p.getPid())%></span>
			</a> <a href="blogpost.jsp?pid=<%=p.getPid()%>" class="btn btn-primary">Read
				More</a> <a href="" class="btn btn-outline-light primary-background"
				data-toggle="modal" data-target="#<%=p.getPid()%>">Get Info </a>
		</div>
	</div>
	<%
	}
	%>
</div>

<%
for (Post p : al) {
%>
<div class="modal fade" id="<%=p.getPid()%>" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header primary-background text-light display-4">
				<h5 class="modal-title" id="exampleModalLongTitle">Blog Details
					:</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div id="profile-details">
				<table class="table">

					<tbody>
						<tr>
							<th scope="row">Title :</th>
							<td><%=p.getTitle()%></td>

						</tr>
						<tr>
							<th scope="row">Category :</th>
							<td><%=p.getCateogory()%></td>
						</tr>
						<tr>
							<th scope="row">Author :</th>
							<td><%=p.getAuthor()%></td>
						</tr>
						<tr>
							<th scope="row">Author's Email :</th>
							<td><%=p.getAuthoremail()%></td>
						</tr>
						<tr>
							<th scope="row">Date Posted :</th>
							<td><%=p.getRegdate()%></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<%
}
%>


<a id="back-to-top" href="#" class="btn btn-light btn-lg back-to-top"
	style="position: fixed; bottom: 25px; right: 25px; display: none"
	role="button"><i class="fa fa-chevron-up"></i></a>
<%-- java script --%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script src="js/js.js" type="text/javascript"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 50) {
				$('#back-to-top').fadeIn();
			} else {
				$('#back-to-top').fadeOut();
			}
		});
		// scroll body to 0px on click
		$('#back-to-top').click(function() {
			$('body,html').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});
</script>
<
<script type="text/javascript">

function dolike(pid, uid) {
	console.log(pid + " , " + uid)
	if(uid == -1){
		swal("Please Login First !",{
        	icon:"warning",
        	timer:1800,
        	button:false,})
                .then((value) => {
                    window.location = "login.jsp"
                });}
	else{
		const d = {
		        uid: uid,
		        pid: pid,
		        operation: 'like'
		    }
		
		$.ajax({
	        url: "LikeServlet",
	        data: d,
	        success: function (data, textStatus, jqXHR) {
	            console.log(data); 
	            let c = $('.'+pid).html();
	            if (data.trim() == 'liked')
	            {
	                c++;$('.'+pid).html(c);
	            }
	            else if(data.trim() == 'disliked'){
	            	c--;$('.'+pid).html(c);
	            } 
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
	            console.log(data)
	        }
	    })
		
		
		
		
		
		
	}

}
</script>
