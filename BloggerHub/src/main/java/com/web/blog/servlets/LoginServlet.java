package com.web.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.blog.dao.UserLoginDAO;
import com.web.blog.entities.User;
import com.web.blog.helpers.Connector;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
@MultipartConfig
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void processREquest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			
			String Email = request.getParameter("Email");
			String Password = request.getParameter("Password");
		
			User user = new User(Email, Password);
			
			UserLoginDAO dao = new UserLoginDAO(Connector.getConnection());
			
			if (dao.ValidateUser(user)) {
				HttpSession session = request.getSession();
				session.setAttribute("currentUser", user);
			}
				
			else {
				out.println("error");
			}
				

		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processREquest(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processREquest(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
