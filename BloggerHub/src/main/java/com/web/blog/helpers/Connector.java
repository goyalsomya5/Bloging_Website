package com.web.blog.helpers;

import java.sql.*;
public class Connector {
	private static Connection con;

	public static Connection getConnection() {
		
		try {
			if (con == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloggerhub", "root", "harvestgold");
				
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
