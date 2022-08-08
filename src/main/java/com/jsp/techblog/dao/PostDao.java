package com.jsp.techblog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.jsp.techblog.entities.Category;
import com.jsp.techblog.entities.Post;

public class PostDao {
	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}

//	get category list 
	public ArrayList<Category> getCategories() {
		ArrayList<Category> categ = new ArrayList<>();
		try {
			String query = "select * from categories";
			Statement psmt = con.createStatement();
			ResultSet set = psmt.executeQuery(query);

			while (set.next()) {
				int cid = set.getInt("cid");
				String name = set.getString("name");
				String description = set.getString("description");

				Category c = new Category(cid, name, description);
				categ.add(c);

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return categ;
	}

//	upload post 
	public boolean sendPost(Post p) {
		boolean f = false;
		try {
			String query = "insert into posts (pTitle, pContent, pCode, pPic, cid, userid) values(?,?,?,?,?,?)";
			PreparedStatement psmt = con.prepareStatement(query);
			psmt.setString(1, p.getPtitle());
			psmt.setString(2, p.getPcontent());
			psmt.setString(3, p.getPcode());
			psmt.setString(4, p.getpPic());
			psmt.setInt(5, p.getCid());
			psmt.setInt(6, p.getUserid());
			psmt.executeUpdate();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

//	Get all the posts
	public List<Post> getAllPost() {
		List<Post> list = new ArrayList<>();
		try {
			String query = "SELECT * FROM POSTS";
			PreparedStatement psmt = con.prepareStatement(query);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				int pid = rs.getInt("pId");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				Timestamp pDate = rs.getTimestamp("pDate");
				int cid = rs.getInt("cid");
				int userid = rs.getInt("userid");
				Post p = new Post(pid, pTitle, pContent, pCode, pPic, pDate, cid, userid);
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

//	Get post using by category ID 

	public List<Post> getPostById(int catId) {
		List<Post> list = new ArrayList<>();
		try {
			String query = "SELECT * FROM POSTS WHERE CID=?";
			PreparedStatement psmt = con.prepareStatement(query);
			psmt.setInt(1, catId);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				int pid = rs.getInt("pId");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				Timestamp pDate = rs.getTimestamp("pDate");
				int userid = rs.getInt("userid");
				Post p = new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userid);
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Post getPostByPid(int i) {
		Post post = null;
		try {
			String query = "SELECT * FROM POSTS WHERE PID=?";
			PreparedStatement psmt = con.prepareStatement(query);
			psmt.setInt(1, i);
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
				int pId = rs.getInt("pId");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				Timestamp pDate = rs.getTimestamp("pDate");
				int cid = rs.getInt("cid");
				int userid = rs.getInt("userid");
				post = new Post(pId, pTitle, pContent, pCode, pPic, pDate, cid, userid);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return post;
	}
}
