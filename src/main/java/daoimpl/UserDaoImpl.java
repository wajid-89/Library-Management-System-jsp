package daoimpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.UserDAO;
import models.Role;
import models.User;
import util.Database;

public class UserDaoImpl implements UserDAO {

	Connection conn = Database.getConnection();

	@Override
	public Integer addUser(User user) {
		Integer row = null;
		try {
			java.util.Date date = new java.util.Date();
			java.sql.Date createDate = new Date(date.getTime());
			PreparedStatement pst = conn.prepareStatement(
					"INSERT INTO `user`(`name`,email,`password`,role,create_date,created_by,`status`) VALUES(?,?,?,?,?,?,1)");
			pst.setString(1, user.getName());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getPassword());

			pst.setInt(4, user.getRole().getId());
			pst.setDate(5, createDate);
			pst.setInt(6, user.getCreatedBy().getId());

			row = pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		}
		return row;
	}

	@Override
	public Integer updateUser(User user) {
		Integer row = null;
		try {
			java.util.Date date = new java.util.Date();

			java.sql.Date updatedDate = new Date(date.getTime());
			PreparedStatement pst = conn.prepareStatement(
					"UPDATE `user` SET name=?,`email`=?,`password`=?,`role`=?,`update_date`=?,`updated_by`=? where id=?");

			pst.setString(1, user.getName());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getPassword());
			pst.setInt(4, user.getRole().getId());
			pst.setDate(5, updatedDate);
			pst.setInt(6, user.getUpdatedBy().getId());
			pst.setInt(7, user.getId());

			row = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();

		}
		return row;
	}

	@Override
	public Integer deleteUser(Integer userId) {
		Integer row = null;
		try {

			PreparedStatement pst = conn.prepareStatement("UPDATE user SET status=0 where id=?");

			pst.setInt(1, userId);

			row = pst.executeUpdate();

		} catch (Exception ex) {
			System.out.println("ERROR: " + ex.getMessage());
			ex.printStackTrace();
		}
		return row;
	}

	@Override
	public User getUserById(Integer id) {
		User user = null;
		ResultSet rs = null;
		try {

			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM user where id=? and status > 0");

			pstmt.setInt(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				// create obj of roll Class and get integer value of created_by column from user
				Role r1 = new Role();
				r1.setId(rs.getInt("created_by"));
				Role r2 = new Role();
				r2.setId(rs.getInt("updated_by"));

				Role userRole = new Role();
				userRole.setId(rs.getInt("role"));

				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setRole(userRole);
				user.setCreateDate(rs.getDate("create_date"));
				user.setUpdateDate(rs.getDate("update_date"));
				user.setCreatedBy(r1);
				user.setUpdatedBy(r2);

			}

		} catch (Exception ex) {
			System.out.println("ERROR: " + ex.getMessage());
			ex.printStackTrace();
		}
		return user;
	}

	@Override
	public Integer getUserIdByName(String name) {
		Integer id = null;
		ResultSet rs = null;
		try {

			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM user where name=? and status > 0");
			pstmt.setString(1, name);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				id = rs.getInt("id");

			}

		} catch (Exception ex) {
			System.out.println("ERROR: " + ex.getMessage());
			ex.printStackTrace();
		}
		return id;
	}

	@Override
	public Integer getUserIdByEmailandPass(String email, String pass) {
		Integer id = null;
		ResultSet rs = null;
		try {

			PreparedStatement pstmt = conn
					.prepareStatement("SELECT * FROM user where email=? and password=? and status > 0");
			pstmt.setString(1, email);
			pstmt.setString(2, pass);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				id = rs.getInt("id");

			}

		} catch (Exception ex) {
			System.out.println("ERROR: " + ex.getMessage());
			ex.printStackTrace();
		}
		return id;
	}

	@Override
	public List<User> getAllUser() {
		List<User> allUser = new ArrayList<User>();
		ResultSet rs = null;
		try {

			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM user WHERE status > 0");

			rs = pstmt.executeQuery();

			while (rs.next()) {

				Role r1 = new Role();
				r1.setId(rs.getInt("created_by"));
				Role r2 = new Role();
				r2.setId(rs.getInt("updated_by"));

				Role userRole = new Role();
				userRole.setId(rs.getInt("role"));

				User user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setRole(userRole);
				user.setCreateDate(rs.getDate("create_date"));
				user.setUpdateDate(rs.getDate("update_date"));
				user.setCreatedBy(r1);
				user.setUpdatedBy(r2);

				allUser.add(user);

			}

		} catch (Exception ex) {
			System.out.println("ERROR: " + ex.getMessage());
			ex.printStackTrace();
		}
		return allUser;
	}

}
