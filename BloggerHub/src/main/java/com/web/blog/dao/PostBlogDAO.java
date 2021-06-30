package com.web.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.web.blog.entities.Post;

public class PostBlogDAO {
	private Connection con;

	public PostBlogDAO(Connection con) {
		super();
		this.con = con;
	}

	public boolean post(Post post) {
			boolean f = false;
		try {
			String query = "Insert into posts(ptitle ,pcontent , ppic , cid , uid) values(?,?,?,?,?);";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1 , post.getTitle());
			pstmt.setString(2, post.getContent());
			pstmt.setString(3, post.getPicture());
			pstmt.setString(4, ""+post.getCid());
			pstmt.setString(5, ""+post.getUid());
			
			pstmt.executeUpdate();
			f = true;

		} catch (SQLException e) {

			e.printStackTrace();
		}
			return f;
	}

}
