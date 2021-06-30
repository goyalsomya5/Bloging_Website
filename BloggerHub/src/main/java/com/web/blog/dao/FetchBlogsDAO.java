package com.web.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.web.blog.entities.Post;
import com.web.blog.entities.User;
import com.web.blog.helpers.Connector;

public class FetchBlogsDAO {
	Connection con;

	public FetchBlogsDAO(Connection con) {
		super();
		this.con = con;
	}

	public ArrayList<Post> fetchpost() throws Exception {
		ArrayList<Post> al = new ArrayList<Post>();
		String query = "Select * from posts Order by pid DESC;";
		PreparedStatement pstmt = this.con.prepareStatement(query);
		ResultSet rs;
		try {
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Post p = new Post();
				p.setPid(rs.getInt("pid"));
				p.setTitle(rs.getString("ptitle"));
				p.setContent(rs.getString("pcontent"));
				p.setPicture(rs.getString("ppic"));
				p.setRegdate(rs.getString("regdate"));
				p.setCid(rs.getInt("cid"));
				al.add(p);			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}

}
