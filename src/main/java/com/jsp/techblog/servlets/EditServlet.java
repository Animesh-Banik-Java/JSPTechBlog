package com.jsp.techblog.servlets;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part; 
import com.jsp.techblog.dao.UserDao;
import com.jsp.techblog.entities.Message;
import com.jsp.techblog.entities.User;
import com.jsp.techblog.healper.ConnectionProvider;
import com.jsp.techblog.healper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String about = request.getParameter("about");
		Part part = request.getPart("updateProfile"); 
		String imageName = part.getSubmittedFileName();
		HttpSession s = request.getSession();
		User user = (User)s.getAttribute("currentUser"); 
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setAbout(about); 
		String oldImage = user.getProfile();
		user.setProfile(imageName); 
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		if(dao.updateDetails(user)) {
			String oldFilePath = request.getRealPath("/")+"profile_pics"+File.separator+oldImage; 
			String path = request.getRealPath("/")+"profile_pics"+File.separator+user.getProfile();  
//			file delete code
			if(!oldImage.equals("default.png")) {
			Helper.deleteOldFile(oldFilePath);
			}
			//end file delete code
			// file save code
			if(Helper.saveImage(part.getInputStream(), path)) {  
				Message msg = new Message("Details Updated..!!", "success", "alert-success"); 
				s.setAttribute("msg", msg);
				response.sendRedirect("profile.jsp");
			}else { 
				Message msg = new Message("File not deleted..! Something went wrong..!!", "error", "alert-danger"); 
				s.setAttribute("msg", msg);
			}
		}else { 
			Message msg = new Message(" Something went wrong..!!", "error", "alert-danger"); 
			s.setAttribute("msg", msg);
		}
		 
	}

}
