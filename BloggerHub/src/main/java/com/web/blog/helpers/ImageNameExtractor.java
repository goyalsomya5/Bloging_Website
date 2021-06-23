package com.web.blog.helpers;

import javax.servlet.http.Part;

public class ImageNameExtractor {

	public static String extract(Part part) {

		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}

		return "default.jpeg";
		 
	}

}
