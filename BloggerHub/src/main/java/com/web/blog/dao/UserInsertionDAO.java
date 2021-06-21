package com.web.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.web.blog.entities.User;

public class UserInsertionDAO {
	private Connection con;
	public UserInsertionDAO(Connection con) {
		super();
		this.con = con;
	}

	public boolean insertUser(User user) {
		boolean f = false;
		try {
			String query = "Insert into users(First_Name ,Last_Name ,Gender , Email , Password , About) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getFirst_Name());
			pstmt.setString(2, user.getLast_Name());
			pstmt.setString(3, user.getGender());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getPassword());
			pstmt.setString(6, user.getAbout());
			System.out.println(user.getAbout());
			pstmt.executeUpdate();
			
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}

}
