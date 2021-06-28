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

	public User ValidateUser(User user) {
		User u = null;
		try {
			String query = "Select * from users where (Email = ?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getEmail());
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {

				if (rs.getString("Password").equals(user.getPassword())) {
					u = new User();
					u.setId(rs.getInt("User_Id"));
					u.setFirst_Name(rs.getString("First_Name"));
					u.setLast_Name(rs.getString("Last_Name"));
					u.setPassword(rs.getString("Password"));
					u.setGender(rs.getString("Gender"));
					u.setEmail(rs.getString("Email"));
					u.setAbout(rs.getString("About"));
					u.setPicture(rs.getString("Picture"));
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}

}
