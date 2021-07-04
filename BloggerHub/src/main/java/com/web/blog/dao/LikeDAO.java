package com.web.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikeDAO {
	private Connection con;

	public LikeDAO(Connection con) {
		super();
		this.con = con;
	}

	public int getLikeCount(int pid) throws Exception {

		String query = "Select count(*) from likes where (pid = ?);";

		int count = 0;

		PreparedStatement pstmt = this.con.prepareStatement(query);
		pstmt.setInt(1, pid);

		ResultSet rs = pstmt.executeQuery();

		if (rs.next())
			count = rs.getInt("count(*)");

		return count;
	}

	@SuppressWarnings("resource")
	public boolean like(int pid, int uid) throws Exception {

		boolean f = false;

		String query = "Select * from likes where (pid = ? AND uid = ?)";

		PreparedStatement pstmt = this.con.prepareStatement(query);
		pstmt.setInt(1, pid);
		pstmt.setInt(2, uid);

		try {

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				query = "Delete from likes where (lid = ?);";

				pstmt = this.con.prepareStatement(query);

				pstmt.setString(1, rs.getString("lid"));

				pstmt.executeUpdate();

				f = true;
			} else {
				query = "Insert into likes (pid , uid) values(? , ?);";

				pstmt = this.con.prepareStatement(query);

				pstmt.setInt(1, pid);
				pstmt.setInt(2, uid);

				pstmt.executeUpdate();

				f = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}
