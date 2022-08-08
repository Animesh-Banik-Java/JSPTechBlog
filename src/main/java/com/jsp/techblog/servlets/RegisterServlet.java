package com.jsp.techblog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.techblog.dao.UserDao;
import com.jsp.techblog.entities.User;
import com.jsp.techblog.healper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String checkBox = request.getParameter("checkbox");
		if(checkBox==null) {
			System.out.println("Please check terms and conditions..!");
		}else { 
			String name = request.getParameter("user_name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String gender = request.getParameter("gender");
			String about = request.getParameter("about");

			User user = new User(name, email, password, gender, about);
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			  if(dao.saveUser(user)) { 
				  System.out.println("done");
				  try {
					  Thread.sleep(2000);
				  }catch(Exception e) {
					  e.printStackTrace();
				  }
				}else {
			      System.out.println("error");
			  }
		}
		 
	}

}
