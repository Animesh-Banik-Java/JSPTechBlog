<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Registation here</title>
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
	<!-- Navbar -->
	<%@include file="header.jsp"%>


	<main
		class="d-flex align-items-center primary-background banner-background p-5"
		style="height: 125vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div class="card-header primary-background text-white text-center">
							<span class="fa fa-user-plus fa-3x"></span>
							<p>Register here..!</p>
						</div>
						<div class="card-body">
							<form id="reg-form" method="post">
								<div class="form-group">
									<label for="user_name">Name</label> <input type="text"
										class="form-control" id="user_name" name="user_name" required>
								</div>
								<div class="form-group">
									<label for="Email">Email address</label> <input type="email"
										class="form-control" name="email" required>
								</div>
								<div class="form-group">
									<label for="Password">Password</label> <input type="password"
										class="form-control" name="password" required>
								</div>
								<div class="form-group">
									<label for="about">Write something about yourself.</label>
									<textarea class="form-control" name="about" rows="3"></textarea>
								</div>
								<div class="form-group">
									<label for="gender">Gender: </label> <br> <input
										type="radio" name="gender" value="Male"> Male <input
										type="radio" name="gender" value="Female"> Female
								</div>
								<div class="form-group form-check">
									<input type="checkbox" class="form-check-input" id="checkbox"
										name="checkbox" required> <label
										class="form-check-label" for="checkbox">Agree tems and
										conditions</label>
								</div>
								<div class="container text-center" id="loader"
									style="display: none;">
									<span class="fa fa-refresh fa-spin fa-2x"></span>
									<h4>Please wait..!</h4>
								</div>
								<div class="container text-center">
									<button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
	
    
	$(document).ready(function (){   
		
		$("#reg-form").on('submit', function(event){ 
			event.preventDefault(); 
			let f = $(this).serialize(); 
			$("#loader").show();
			$("#submit-btn").hide(); 
			$.ajax({
				url: "RegisterServlet",
				data: f,
				type: 'POST',
				success: function(data, textStatus, jqXHR){   
					$("#reg-form")[0].reset();
					$("#loader").hide();
					$("#submit-btn").show(); 
						swal("Register Successfully..!! We redirect to login page")
						.then((value) => {
						  window.location = "login.jsp";
						}); 
					 
				},
				error: function(jqXHR, textStatus, errorThrown){ 
					$("#loader").hide();
					$("#submit-btn").show();
					swal("Something went wrong..try again");
				}  
			});
		});
	});
</script>


</body>
</html>