<!-- This is our get post loading page... -->
<%@page import="com.jsp.techblog.dao.LikedDao"%>
<%@page import="com.jsp.techblog.entities.Post"%>
<%@page import="com.jsp.techblog.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jsp.techblog.healper.ConnectionProvider"%>
<%@page import="com.jsp.techblog.dao.PostDao"%>
<div class="row">
<%LikedDao likeDao = new LikedDao(ConnectionProvider.getConnection()); %>
<%User  user = (User)session.getAttribute("currentUser");%>
<% Thread.sleep(400);
	PostDao posts = new PostDao(ConnectionProvider.getConnection());
	int catId = Integer.parseInt(request.getParameter("cId"));
	List<Post> list = null;
	if(catId==0){
		list = posts.getAllPost();
	}else{
		list = posts.getPostById(catId);
	}
	if(list.size()==0){
		out.println("<h3 class='display-3 text-center'>No post available in this category..!</h3>");
		return;
	}
	for(Post p: list){%>
	<div class="col-md-6 mt-2">
		<div class="card">
			<img src="post_img/<%=p.getpPic() %>"
				class="card-img-top img-fluid  mx-auto d-block" alt="card image">
			<div class="card-body">
				<b><%=p.getPtitle() %></b>
				<p><%=p.getPcontent() %></p>
			</div>
			<div class="card-footer text-center primary-background">
				<a href="#!" onclick="doLike(<%=p.getPid() %>,<%=user.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"><span class="like-counter"><%=likeDao.countLikeOnPost(p.getPid()) %></span></i></a> 
				<a href="view_single_post.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-light btn-sm">Learn More...</a>
				<a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"><span>10</span></i></a>
			</div>
		</div>
	</div>
	<%}
%>
</div>