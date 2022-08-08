package com.jsp.techblog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.jsp.techblog.entities.User;

public class UserDao {
	Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean saveUser(User user) {
		boolean f = false;
		try {
			String query = "insert into users(name, email, password, gender, about) values(?,?,?,?,?);";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setString(1, user.getName());
			psmt.setString(2, user.getEmail());
			psmt.setString(3, user.getPassword());
			psmt.setString(4, user.getGender());
			psmt.setString(5, user.getAbout());
			psmt.executeUpdate();
			f = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return f;

	}

	public User getUserbyEmailIdAndPassword(String email, String password) {
		User user = null;
		try {
			String query = "select * from users where email =? and password =?";
			PreparedStatement psmt = con.prepareStatement(query);
			psmt.setString(1, email);
			psmt.setString(2, password);

			ResultSet set = psmt.executeQuery();
			if (set.next()) {
				user = new User();
				user.setId(set.getInt("id"));
				user.setName(set.getString("name"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setProfile(set.getString("profile"));
				user.setRdate(set.getTimestamp("rdate"));

			}

		} catch (SQLException e) {

		}

		return user;
	}

	public boolean updateDetails(User user) {
		boolean f = false;
		String query = "update users set name=?, email=?, password=?, about=?, profile=? where id=?";
		try {
			PreparedStatement psmt = con.prepareStatement(query);
			psmt.setString(1, user.getName());
			psmt.setString(2, user.getEmail());
			psmt.setString(3, user.getPassword());
			psmt.setString(4, user.getAbout());
			psmt.setString(5, user.getProfile());
			psmt.setInt(6, user.getId());
			psmt.executeUpdate();
			f = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return f;
	}

	public User getUserByUserId(int userId) {
		User user = null;
		try {
			String query = "select * from users where id=?";
			PreparedStatement psmt = con.prepareStatement(query);
			psmt.setInt(1, userId);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setProfile(rs.getString("profile"));
				user.setRdate(rs.getTimestamp("rdate"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}
}
