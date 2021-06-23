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
import javax.servlet.http.Part;

import com.web.blog.dao.UserInsertionDAO;
import com.web.blog.entities.User;
import com.web.blog.helpers.Connector;
import com.web.blog.helpers.ImageNameExtractor;

/**
 * Servlet implementation class UserInsertionServlet
 */
@WebServlet("/UserInsertionServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 5, // 10MB
		maxRequestSize = 1024 * 1024 * 25)
public class UserInsertionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NoSuchAlgorithmException {
		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter()) {
			String check = request.getParameter("check");
			System.out.println(check);
			if (check == null)
				out.print("Please agree to the terms and conditions.");
			else {
				String First_Name = request.getParameter("F_Name");
				String Last_Name = request.getParameter("L_Name");
				String Gender = request.getParameter("Gender");
				String Email = request.getParameter("Email");
				String Password = request.getParameter("Password");
				String About = request.getParameter("About");
//				for Image
				Part part = request.getPart("Picture");
				String Filename = ImageNameExtractor.extract(part);

				if (First_Name.length() == 0 || Last_Name.length() == 0 || Password.length() == 0
						|| Email.length() == 0)
					out.println("Please fill all the details correctly !");
				else {
//    			Creating an instance of User to Store in the Database getting all the entities.

					User user = new User(First_Name, Last_Name, Gender, Email, Password, About, Filename);

//    			Creating an Instance of Data Insertion Class UserInsetionDao using a new connection instance from helpers - "Connector" method.

					UserInsertionDAO dao = new UserInsertionDAO(Connector.getConnection());
					if (dao.insertUser(user)) {
						if(part != null) {
						InputStream is = part.getInputStream();
						
						byte[] data = new byte[is.available()];
						
						is.read(data);
						String path = request.getRealPath("/") + "img" + File.separator + Filename;
						
						FileOutputStream fos = new FileOutputStream(path);
						
						fos.write(data);
						fos.close();}
						
						out.println("done");
					} else
						out.println(Email + "\n  An account with this email address already exists!");
				}
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (NoSuchAlgorithmException | ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			processRequest(request, response);
		} catch (NoSuchAlgorithmException | ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
