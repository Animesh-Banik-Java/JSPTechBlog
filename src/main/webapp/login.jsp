<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.jsp.techblog.entities.Message"%>
<%@page import="com.jsp.techblog.entities.User"%>
<% 
	User user =(User)session.getAttribute("currentUser");
	if(user!=null){
		response.sendRedirect("profile.jsp");
	 } 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 68% 94%, 31% 100%, 0 95%, 0 0
		);
}
</style>
</head>
<body>

	<!-- Navbar  -->

	<%@include file="header.jsp"%>

	<main
		class="d-flex align-items-center primary-background banner-background"
		style="height: 75vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header primary-background text-white text-center">
							<span class="fa fa-user-circle-o fa-3x"></span>
							<p>Login here..!</p>
						</div>
						<%
						 	Message m =(Message)session.getAttribute("msg");
							if(m != null){
								%>
						<div class="alert <%= m.getCssClass() %>" role="alert"><%= m.getContant() %></div>
						<%
								session.removeAttribute("msg");
							}
						%>

						<div class="card-body">
							<form action="LoginServlet" method="POST">
								<div class="form-group">
									<label for="Email">Email address</label> <input type="email"
										class="form-control" name="email" required> <small
										id="emailHelp" class="form-text text-muted"> We'll
										never share your email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="password">Password</label> <input type="password"
										class="form-control" name="password" required>
								</div>
								<div class="container text-center">
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>



	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/javascripts.js"></script>
</body>
</html>