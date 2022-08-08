package com.jsp.techblog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikedDao {
	Connection con;

	public LikedDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean insertLike(int pid, int uid) {
		boolean f = false;
		try {
			String query = "INSERT INTO LIKED (PID,UID) VALUES(?,?)";
			PreparedStatement psmt = con.prepareStatement(query);
			psmt.setInt(1, pid);
			psmt.setInt(2, uid);
			psmt.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public int countLikeOnPost(int c) {
		int count = 0;
		try {
			String query = "SELECT COUNT(*) FROM LIKED WHERE PID=?";
			PreparedStatement psmt = con.prepareStatement(query);
			psmt.setInt(1, c);
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public boolean isLikedByUser(int pid, int uid) {
		boolean f = false;
		try {
			String query = "SELECT * FORM LIKED WHARE PID=? AND UID=?";
			PreparedStatement psmt = con.prepareStatement(query);
			psmt.setInt(1, pid);
			psmt.setInt(2, uid);
			psmt.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean deleteLiked(int pid, int uid) {
		boolean f = false;
		try {
			String query = "DELETE FORM LIKED WHARE PID=? AND UID=?";
			PreparedStatement psmt = con.prepareStatement(query);
			psmt.setInt(1, pid);
			psmt.setInt(2, uid);
			psmt.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
