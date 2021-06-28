package com.web.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.web.blog.entities.User;

public class UserEditDAO {
	private Connection con;

	public UserEditDAO(Connection con) {
		super();
		this.con = con;
	}

	public boolean editUser(User u) {
		boolean f = false;
		try {

			String query = "Update users set First_Name= ? , Last_Name= ? , Gender= ? , Password = ? , About= ? , Picture= ? where(User_Id= ?);";
			System.out.println(u.getAbout());
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, u.getFirst_Name());
			pstmt.setString(2, u.getLast_Name());
			pstmt.setString(3, u.getGender());
			pstmt.setString(4, u.getPassword());
			pstmt.setString(5, u.getAbout());
			pstmt.setString(6, u.getPicture());
			pstmt.setString(7, "" + u.getId());
			System.out.println(pstmt.toString());
			pstmt.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}

}
