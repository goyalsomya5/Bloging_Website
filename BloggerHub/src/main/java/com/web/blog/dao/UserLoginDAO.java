package com.web.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.web.blog.entities.User;

public class UserLoginDAO {
	public Connection con;

	public UserLoginDAO(Connection con) {
		super();
		this.con = con;
	}
	public boolean ValidateUser(User user) {
		boolean f = false;
		try {
			String query = "Select Password from users where (Email = ?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getEmail());
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
			System.out.println(rs.getString("Password"));
			if(rs.getString("Password").equals(user.getPassword()))
			f = true;}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	

}
