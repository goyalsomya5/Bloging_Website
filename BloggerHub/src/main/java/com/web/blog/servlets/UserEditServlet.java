package com.web.blog.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.web.blog.dao.UserEditDAO;
import com.web.blog.entities.User;
import com.web.blog.helpers.Connector;
import com.web.blog.helpers.Encryptor;
import com.web.blog.helpers.ImageNameExtractor;

/**
 * Servlet implementation class UserEditServlet
 */
@WebServlet("/UserEditServlet")
@MultipartConfig
public class UserEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserEditServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NoSuchAlgorithmException {
		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter()) {
			String F_name = request.getParameter("First_Name");
			String L_Name = request.getParameter("Last_Name");
			String Gender = request.getParameter("Gender");
			String Password = request.getParameter("Password");
			String About = request.getParameter("About");
			Part part = request.getPart("Picture");
			String filename = ImageNameExtractor.extract(part);
			HttpSession s = request.getSession();
			User user = (User) s.getAttribute("currentuser");
			String oldpic = user.getPicture();
			user.setFirst_Name(F_name);
			user.setLast_Name(L_Name);
			System.out.println("*	"+About+"	*	" + filename + "	*	" + oldpic);
			if (!user.getPassword().equals(Password))
				user.setPassword(Encryptor.Hash(Password));
			if (Gender != null)
				user.setGender(Gender);
				user.setAbout(About);
			if (!oldpic.equals(filename) && filename.length() != 0)
				user.setPicture(filename);	
				user.setAbout(About);
			System.out.println(user.getFirst_Name() + " * " + user.getLast_Name() + " * " + user.getEmail() + " * "
					+ user.getPassword() + " * " + user.getGender() + " * " + " " + user.getPicture()+" * "+user.getAbout());
			UserEditDAO dao = new UserEditDAO(Connector.getConnection());
			if (dao.editUser(user)) {
				if (!oldpic.equals(filename) && filename.length() != 0) {
					InputStream is = part.getInputStream();

					byte[] data = new byte[is.available()];

					is.read(data);
//					request.get
					String path = getServletContext().getRealPath("/") + "img" + File.separator + filename;
					System.out.println(path);

					FileOutputStream fos = new FileOutputStream(path);

					fos.write(data);
					fos.close();
				}
				out.println("done");
			} else
				out.println("error");

//			out.println("done");
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
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
			processRequest(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
