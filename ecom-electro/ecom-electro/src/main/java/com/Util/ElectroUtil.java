package com.Util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ElectroUtil {

	public static Connection DbConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/ecom_electro", "root", "");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
