package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.Util.ElectroUtil;
import com.bean.ContactUsBean;

public class ContactUsDao {
// insert message;
	public static void insertContact(ContactUsBean c) {
		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "insert into contactus (email,message) values(?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, c.getEmail());
			pst.setString(2, c.getMessage());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
