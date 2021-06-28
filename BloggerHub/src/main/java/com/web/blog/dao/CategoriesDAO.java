package com.web.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.web.blog.entities.Category;

public class CategoriesDAO {
	Connection con = null;

	public CategoriesDAO(Connection con) {
		super();
		this.con = con;
	}

	public ArrayList<Category> getCategories() throws SQLException {
		String query = "Select * from categories;";
		PreparedStatement pstmt = this.con.prepareStatement(query);

		ResultSet rs = pstmt.executeQuery();
		ArrayList<Category> categories = new ArrayList<>();
		while (rs.next()) {
			Category c = new Category();
			c.setCid(rs.getInt("cid"));
			c.setCname(rs.getString("cname"));
			c.setCdescription(rs.getString("cdescription"));
			categories.add(c);
		}

		return categories;
	}

}
