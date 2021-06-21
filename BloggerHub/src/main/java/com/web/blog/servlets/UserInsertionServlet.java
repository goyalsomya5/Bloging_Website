package com.web.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.blog.dao.UserInsertionDAO;
import com.web.blog.entities.User;
import com.web.blog.helpers.Connector;

/**
 * Servlet implementation class UserInsertionServlet
 */
@WebServlet("/UserInsertionServlet")
@MultipartConfig
public class UserInsertionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    
    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	response.setContentType("text/html;charset=UTF-8");
   
    	try(PrintWriter out = response.getWriter()){
    		String check = request.getParameter("check");
    		System.out.println(check);
    		if(check == null)
    			out.print("box not checked");
    		else {
    			String First_Name = request.getParameter("F_Name");
    			String Last_Name  = request.getParameter("L_Name");
    			String Gender = request.getParameter("Gender");
    			String Email = request.getParameter("Email");
    			String Password = request.getParameter("Password");
    			String About = request.getParameter("About");
    			
//    			Creating an instance of User to Store in the Database getting all the entities.
    			
    			User user = new User(First_Name, Last_Name, Gender, Email, Password, About);
    			
//    			Creating an Instance of Data Insertion Class UserInsetionDao using a new connection instance from helpers - "Connector" method.
    			
    			UserInsertionDAO dao = new UserInsertionDAO(Connector.getConnection());
    			if(dao.insertUser(user))
    				out.println("done");
    			else
    				out.println("error");
    		}
    	}
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
