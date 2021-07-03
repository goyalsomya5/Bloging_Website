package com.web.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.web.blog.entities.Category;
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
//				Fetching the post from database.
				Post p = new Post();

				p.setPid(rs.getInt("pid"));
				p.setTitle(rs.getString("ptitle"));
				p.setContent(rs.getString("pcontent"));
				p.setPicture(rs.getString("ppic"));
				p.setRegdate(rs.getString("regdate"));
				p.setCid(rs.getInt("cid"));
				p.setUid(Integer.parseInt(rs.getString("uid")));

//				Getting User details for the post fetched above.

				query = "Select First_Name , Last_Name , Email from users where (User_Id = ?);";

				pstmt = this.con.prepareStatement(query);
				pstmt.setInt(1, p.getUid());

				ResultSet rs1 = pstmt.executeQuery();
				if (rs1.next()) {
					p.setAuthor(rs1.getString("First_Name") + " " + rs1.getString("Last_Name"));

					p.setAuthoremail(rs1.getString("Email"));
				}

				al.add(p);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}

	public ArrayList<Post> fetchpost(User u) throws Exception {
//		System.out.println("********************");
		ArrayList<Post> al = new ArrayList<Post>();
		String query = "Select * from posts where uid = ? Order by pid DESC;";
		PreparedStatement pstmt = this.con.prepareStatement(query);
		pstmt.setInt(1, u.getId());
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
				p.setAuthor(u.getFirst_Name() + " " + u.getLast_Name());
				p.setAuthoremail(u.getEmail());
				al.add(p);
//			System.out.println(p.toString());	
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}

	public ArrayList<Post> fetchpost(Category c) throws Exception {
		ArrayList<Post> al = new ArrayList<Post>();
		String query = "Select * from posts where (cid = ?) Order by pid DESC;";
		PreparedStatement pstmt = this.con.prepareStatement(query);
		ResultSet rs = null;
		try {
			pstmt.setInt(1, c.getCid());
			rs = pstmt.executeQuery();
			while (rs.next()) {

				Post p = new Post();
				p.setPid(rs.getInt("pid"));
				p.setTitle(rs.getString("ptitle"));
				p.setContent(rs.getString("pcontent"));
				p.setPicture(rs.getString("ppic"));
				p.setRegdate(rs.getString("regdate"));
				p.setCid(c.getCid());
				p.setCname(c.getCname());
				p.setUid(rs.getInt("uid"));
//				Getting User details for the post fetched above.

				query = "Select First_Name , Last_Name , Email from users where (User_Id = ?) ;";

				pstmt = this.con.prepareStatement(query);
				pstmt.setInt(1, p.getUid());

				ResultSet rs1 = pstmt.executeQuery();
//				System.out.println(rs1.getString("First_Name"));
				if (rs1.next()) {
					p.setAuthor(rs1.getString("First_Name") + " " + rs1.getString("Last_Name"));

					p.setAuthoremail(rs1.getString("Email"));
				}

				al.add(p);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public Post fetchpost(int pid) {
		Post p = null;
		try {

			String query = "Select * from posts where (pid = ?);";

			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setInt(1, pid);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				p = new Post();
				p.setPid(pid);
				p.setTitle(rs.getString("ptitle"));
				p.setContent(rs.getString("pcontent"));
				p.setPicture(rs.getString("ppic"));
				p.setCid(rs.getInt("cid"));
				p.setUid(rs.getInt("uid"));
				p.setRegdate(rs.getString("regdate"));
				query = "Select * from users where (User_Id = ? );";
				pstmt = this.con.prepareStatement(query);
				pstmt.setInt(1, p.getUid());

//			Fetching the user details for the given post..
				
				ResultSet rs1 = pstmt.executeQuery();
		
				if (rs1.next()) {

					p.setAuthor(rs1.getString("First_Name") + " " + rs1.getString("Last_Name"));
					p.setAuthoremail(rs1.getString("Email"));
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}
}
