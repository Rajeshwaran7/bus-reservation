package com.bus.booking.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bus.booking.dto.User;

public class UserDao {

	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/bus";
	private static final String USER = "root";
	private static final String PASSWORD = "tiger";

	public User loginUser(String email, String pwd) {
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			Class.forName(DRIVER);
			try {
				con = DriverManager.getConnection(URL, USER, PASSWORD);
				String query = "SELECT * FROM bus.user WHERE email = ? AND password = ?";
				pstm = con.prepareStatement(query);
				pstm.setString(1, email);
				pstm.setString(2, pwd);
				rs = pstm.executeQuery();

				if (rs.next()) {
					User s = new User();
					int id = rs.getInt(1);
					String name = rs.getString(2);
					String email1 = rs.getString(3);
					String password = rs.getString(4);
					int age = rs.getInt(5);
					String gen = rs.getString(6);
					long mob = rs.getLong(7);

					s.setUserId(id);
					s.setUserName(name);
					s.setEmail(email1);
					s.setPwd(password);
					s.setAge(age);
					s.setGender(gen);
					s.setMobile(mob);

					return s;
				}

			} catch (SQLException e) {

				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				if (pstm != null) {
					try {
						pstm.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		return null;

	}

	public boolean updatePassword(String email,String password) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstm = null;
		try {
			Class.forName(DRIVER);
			try {
				con = DriverManager.getConnection(URL, USER, PASSWORD);
				String query = "UPDATE bus.user SET password = ? WHERE email = ?";
				pstm = con.prepareStatement(query);

				pstm.setString(1, password);
				pstm.setString(2,email );

				int rowAffected = pstm.executeUpdate();

				return rowAffected != 0;

			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if (pstm != null) {
					try {
						pstm.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		return false;
	}

}
