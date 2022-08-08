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

import com.jsp.techblog.dao.PostDao;
import com.jsp.techblog.entities.Post;
import com.jsp.techblog.entities.User;
import com.jsp.techblog.healper.ConnectionProvider;
import com.jsp.techblog.healper.Helper;

/**
 * Servlet implementation class DoPostServlet
 */
@WebServlet("/DoPostServlet")
@MultipartConfig
public class DoPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DoPostServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cc = request.getParameter("p_categoryid");
		int pCid = Integer.parseInt(cc);
		String pTitle = request.getParameter("p_title");
		String pContent = request.getParameter("p_content");
		String pCode = request.getParameter("p_code");
		Part part = request.getPart("p_pic");
		HttpSession s = request.getSession();
		User user = (User) s.getAttribute("currentUser");
		Post p = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, pCid, user.getId());
		PostDao pd = new PostDao(ConnectionProvider.getConnection());
		if (pd.sendPost(p)) {
			String path = request.getRealPath("/") + "post_img" + File.separator + part.getSubmittedFileName();
			if (Helper.saveImage(part.getInputStream(), path)) {
				System.out.print("Post upload Successfully.");
			}
		} else {
			System.out.print("Sorry ! Something went wrong on server..!");
		}
	}

}
