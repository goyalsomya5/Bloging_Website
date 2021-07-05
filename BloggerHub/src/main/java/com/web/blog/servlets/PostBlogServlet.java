
package com.web.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.web.blog.dao.PostBlogDAO;
import com.web.blog.entities.Post;
import com.web.blog.entities.User;
import com.web.blog.helpers.Connector;
import com.web.blog.helpers.ImageNameExtractor;
import com.web.blog.helpers.ImageSaver;

/**
 * Servlet implementation class PostBlogServlet
 */
@WebServlet("/PostBlogServlet")
@MultipartConfig
public class PostBlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostBlogServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void ProcessRequest(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception, ServletException {
		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter()) {

			String title = request.getParameter("BlogTitle");

			String content = request.getParameter("BlogContent");

			Part part = request.getPart("BlogPicture");
			String picture = "";
			if (part != null)
				picture = ImageNameExtractor.extract(part);
			int cid = Integer.parseInt(request.getParameter("Category"));

			HttpSession s = request.getSession();
			User u = (User) s.getAttribute("currentuser");
			int uid = u.getId();

			Post post = new Post(title, cid, content, title, uid);

			PostBlogDAO dao = new PostBlogDAO(Connector.getConnection());

			if (dao.post(post)) {
				String path = getServletContext().getRealPath("/") + "img" + File.separator + title;
				ImageSaver.savefile(part.getInputStream(), path);
				out.println("done");
			} else
				out.println("error");

		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			ProcessRequest(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
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
			ProcessRequest(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
