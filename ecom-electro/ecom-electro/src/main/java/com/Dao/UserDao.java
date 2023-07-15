package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.Util.ElectroUtil;
import com.bean.UserBean;

public class UserDao {

	// user Registration;
	public static void insertUser(UserBean u) {
		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "insert into registration(usertype,fname,lname,email,address,city,country,password,cpassword,mobile) values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, u.getUsertype());
			pst.setString(2, u.getFname());
			pst.setString(3, u.getLname());
			pst.setString(4, u.getEmail());
			pst.setString(5, u.getAddress());
			pst.setString(6, u.getCity());
			pst.setString(7, u.getCountry());
			pst.setString(8, u.getPassword());
			pst.setString(9, u.getCpassword());
			pst.setString(10, u.getMobile());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// check email [user/seller];
	public static boolean checkEmail(String email) {
		boolean ch = false;
		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "select * from registration where email=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				ch = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ch;
	}

	// check login [user/seller];
	public static UserBean checkLogin(String email, String pass) {
		UserBean u = null;
		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "select * from registration where email=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, pass);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				u = new UserBean();
				u.setUid(rs.getInt("uid"));
				u.setUsertype(rs.getString("usertype"));
				u.setFname(rs.getString("fname"));
				u.setLname(rs.getString("lname"));
				u.setEmail(rs.getString("email"));
				u.setAddress(rs.getString("address"));
				u.setCity(rs.getString("city"));
				u.setCountry(rs.getString("country"));
				u.setPassword(rs.getString("password"));
				u.setCpassword(rs.getString("cpassword"));
				u.setMobile(rs.getString("mobile"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}

// update-profile;
	public static void updateProfile(UserBean u) {
		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "update registration set usertype=?,fname=?,lname=?,address=?,city=?,country=? where email=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, u.getUsertype());
			pst.setString(2, u.getFname());
			pst.setString(3, u.getLname());
			pst.setString(4, u.getAddress());
			pst.setString(5, u.getCity());
			pst.setString(6, u.getCountry());
			pst.setString(7, u.getEmail());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// new password;/Update;
	public static void updatePassword(String email, String pass) {
		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "update registration set password=?,cpassword=? where email=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, pass);
			pst.setString(2, pass);
			pst.setString(3, email);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
