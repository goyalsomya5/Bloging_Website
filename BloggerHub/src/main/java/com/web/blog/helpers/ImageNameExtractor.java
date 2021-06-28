package com.web.blog.helpers;

import javax.servlet.http.Part;

public class ImageNameExtractor {

	public static String extract(Part part) {
		System.out.println("\n"+part);
		if(part == null)
			return "default.jpeg";
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				String st = s.substring(s.indexOf("=") + 2, s.length() - 1);
				return st;
			}
		}

		return "default.jpeg";
		 
	}

}
