<%@page import="java.text.DateFormat"%>
<%@page import="com.jsp.techblog.dao.UserDao"%>
<%@page import="com.jsp.techblog.entities.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jsp.techblog.healper.ConnectionProvider"%>
<%@page import="com.jsp.techblog.entities.Message"%>
<%@page import="com.jsp.techblog.entities.User"%>
<%@page import="com.jsp.techblog.entities.Category"%>
<%@page import="com.jsp.techblog.dao.PostDao"%>
<%@page import="com.jsp.techblog.dao.LikedDao"%>
<%@page errorPage="error_page.jsp"%>
<% 
	User user =(User)session.getAttribute("currentUser");
	if(user==null){
		response.sendRedirect("login.jsp");
	 } 
%>
<%
	int pid = Integer.parseInt(request.getParameter("post_id"));
	PostDao postDao = new PostDao(ConnectionProvider.getConnection());
	Post p = postDao.getPostByPid(pid);
	
%>

<% LikedDao likeDao = new LikedDao(ConnectionProvider.getConnection());%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="icon" href=""> -->
<title><%=p.getPtitle() %></title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v14.0" nonce="UQKYgdkz"></script>
<style type="text/css">
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 68% 94%, 31% 100%, 0 95%, 0 0
		);
}

.post-title {
	font-weight: 100;
	font-size: 30px;
}

.post-content {
	font-weight: 100;
	font-size: 22px;
}

.post-code {
	font-weight: 100;
	font-size: 20px;
}

.post-user-info {
	font-size: 16px;
}

.post-date {
	font-style: italic;
	font-size: 16px;
}

.row-user {
	border: 1px solid #e8e7e3;
	padding-top: 15px;
}

body {
	background: url("img/bg-view.jpg");
	background-size: cover;
	background-attachment: fixed;
}
</style>
</head>
<body>
	<!-- Nav bar start from here -->
	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"><span class="fa fa-at"></span>
			Tech Blog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="profile.jsp"><span class="fa fa-book"></span> LearnCode <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-expanded="false"> <span
						class="fa fa-group"></span> Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">Project Implimentation</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Stracture</a>
					</div></li>

				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-id-card-o"></span> Contact</a></li>

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#do-post-btn"><span
						class="fa fa-asterisk"></span> Do Post</a></li>
			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profileModal"><span
						class="fa fa-user-circle-o"></span> <%=user.getName() %></a></li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span
						class="fa fa-power-off"></span> Logout</a></li>
			</ul>
		</div>
	</nav>

	<!-- end of navbar -->

	<!-- start content body  -->
	<div class="container">
		<div class="row my-2">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header primary-background text-white">
						<h4 class="post-title"><%=p.getPtitle() %></h4>
					</div>
					<div class="card-body">
						<img src="post_img/<%=p.getpPic() %>"
							class="card-img-top img-fluid mb-2" alt="card image">
						<div class="row my-3 row-user">
							<% UserDao d = new UserDao(ConnectionProvider.getConnection());	%>
							<div class="col-md-9">
								<p class="post-user-info">
									<a href="#!"><%= d.getUserByUserId(p.getUserid()).getName() %></a>
									has posted
								</p>
							</div>
							<div class="col-md-3">
								<p class="post-date"><%=DateFormat.getInstance().format(p.getPdate()) %></p>
							</div>
						</div>
						<p class="post-content"><%= p.getPcontent() %></p>
						<div class="post-code">
							<pre><%= p.getPcode() %></pre>
						</div>
					</div>
					<div class="card-footer primary-background"> 
						<a href="#!" onclick="doLike(<%=p.getPid() %>,<%=user.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"><span class="like-counter"><%=likeDao.countLikeOnPost(p.getPid()) %></span></i></a> 
						<a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"><span>10</span></i></a>
					</div>
					<div class="card-footer"> 
						<div class="fb-comments" data-href="http://localhost:8080/JSPTechBlog/view_single_post.jsp?post_id=<%=p.getPid() %>" data-width="" data-numposts="5"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- end content body  -->

	<!-- start profile modal -->
	<div class="modal fade" id="profileModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="profile_pics/<%=user.getProfile()%>"
							style="max-width: 100px; border-radius: 50%;"><br>
						<h4 class="mt-3"><%=user.getName() %></h4>
						<!-- user details here in the table -->
						<table id="view-details" class="table">
							<tr>
								<th class="text-left" scope="row">ID:</th>
								<td class="text-left"><%=user.getId() %></td>
							</tr>
							<tr>
								<th class="text-left" scope="row">EMAIL ID:</th>
								<td class="text-left"><%=user.getEmail() %></td>
							</tr>
							<tr>
								<th class="text-left" scope="row">GENDER:</th>
								<td class="text-left"><%=user.getGender() %></td>
							</tr>
							<tr>
								<th class="text-left" scope="row">ABOUT:</th>
								<td class="text-left"><%=user.getAbout() %></td>
							</tr>
							<tr>
								<th class="text-left" scope="row">REGISTERED ON:</th>
								<td class="text-left"><%=user.getRdate() %></td>
							</tr>
						</table>

						<!-- Edit details -->
						<form id="edit-details" action="EditServlet" method="post"
							enctype="multipart/form-data" style="display: none;">
							<table class="table">
								<tr>
									<th class="text-left" scope="row">ID:</th>
									<td class="text-left"><%=user.getId() %></td>
								</tr>
								<tr>
									<th class="text-left" scope="row">NAME:</th>
									<td class="text-left"><input type="text" name="name"
										class="form-control" value="<%=user.getName() %>" required></td>
								</tr>
								<tr>
									<th class="text-left" scope="row">EMAIL ID:</th>
									<td class="text-left"><input type="email" name="email"
										class="form-control" value="<%=user.getEmail() %>" required></td>
								</tr>
								<tr>
									<th class="text-left" scope="row">PASSWORD:</th>
									<td class="text-left"><input type="password"
										name="password" class="form-control"
										value="<%=user.getPassword() %>" required></td>
								</tr>
								<tr>
									<th class="text-left" scope="row">GENDER:</th>
									<td class="text-left"><%=user.getGender() %></td>
								</tr>
								<tr>
									<th class="text-left" scope="row">ABOUT:</th>
									<td class="text-left"><textarea rows="3" name="about"
											class="form-control"><%=user.getAbout() %></textarea></td>
								</tr>
								<tr>
									<th class="text-left" scope="row">New Profile:</th>
									<td class="text-left"><input type="file"
										name="updateProfile" class="form-control"
										value="<%=user.getAbout() %>"></td>
								</tr>
								<tr>
									<th class="text-left" scope="row">REGISTERED ON:</th>
									<td class="text-left"><%=user.getRdate() %></td>
								</tr>
							</table>
							<input type="submit" class="btn btn-outline-primary" value="Save">
						</form>

					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" id="edit-btn" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- end profile modal -->

	<!-- start do Post -->
	<!-- Modal -->
	<div class="modal fade" id="do-post-btn" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						post details...</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="post-form" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<select class="form-control" name="p_categoryid">
								<option selected disabled>---Select Category--</option>
								<% 
				        	PostDao dao = new PostDao(ConnectionProvider.getConnection());
				        	ArrayList<Category> list = dao.getCategories();
				        	for(Category c: list){%>
								<option value="<%=c.getId()%>"><%= c.getName() %></option>
								<%} 
				        %>
							</select>
						</div>
						<div class="form-group">
							<input type="text" id="p_title" name="p_title"
								placeholder="Enter your title..." class="form-control" required>
						</div>
						<div class="form-group">
							<textarea rows="4" id="p_content" name="p_content"
								placeholder="Enter write something ..." class="form-control"
								required></textarea>
						</div>
						<div class="form-group">
							<textarea rows="4" id="p_code" name="p_code"
								placeholder="Enter your program code (if any)"
								class="form-control"></textarea>
						</div>
						<div class="form-group">
							<label>Select your pic...</label><br> <input type="file"
								id="p_pic" name="p_pic">
						</div>
						<div class="form-group text-center">
							<button type="submit" id="submit-btn" class="btn btn-primary">Post</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- end do Post -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/javascripts.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
	//this is our ajax post request to database code
	var form = document.getElementById('post-form');
	form.onsubmit = function() {
	  var formData = new FormData(form); 
	  var xhr = new XMLHttpRequest(); 
	  xhr.onreadystatechange = function() {
		    if (xhr.readyState == XMLHttpRequest.DONE) { 
		    	form.reset();
		        swal("Post upload Successfully.")
				.then((value) => {
				  window.location = "profile.jsp";
				});
		    }else{
		    	swal("Sorry ! Something went wrong on server..!");
		    }
		}
	  xhr.open('POST', 'DoPostServlet', true);
	  xhr.send(formData);
	  return false; // To avoid actual submission of the form
	}
      
</script>

	<script>
		$(document).ready(function(){
			let tableStatus = false;
			$("#edit-btn").click(function(){
				if(tableStatus == false){
					$("#view-details").hide();
					$("#edit-details").show();
					tableStatus = true;
					$(this).text("Back");
				}else{ 
					$("#view-details").show();
					$("#edit-details").hide();
					tableStatus = false;
				}
			});
		});
	</script>

</body>
</html>