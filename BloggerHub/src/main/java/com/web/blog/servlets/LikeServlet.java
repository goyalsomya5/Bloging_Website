package com.web.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.blog.dao.LikeDAO;
import com.web.blog.helpers.Connector;

/**
 * Servlet implementation class LikeServlet
 */
@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LikeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(response, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void processRequest(HttpServletResponse response, HttpServletRequest request) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			int pid = Integer.parseInt(request.getParameter("pid"));
			int uid = Integer.parseInt(request.getParameter("uid"));
//			System.out.println(pid+"	"+uid);
			LikeDAO dao = new LikeDAO(Connector.getConnection());

			boolean f = dao.like(pid, uid);
			if (f) {
				out.println("disliked");
			} else if (!f) {
				out.println("liked");
			}
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
			processRequest(response, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
