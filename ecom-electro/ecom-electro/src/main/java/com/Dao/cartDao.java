package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Util.ElectroUtil;
import com.bean.MyCartBean;

public class cartDao {

	// insert into cart;
	public static void addToCartProduct(MyCartBean c) {
		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "insert into mycart(pid,uid,qnt,tprice,price) values(?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, c.getPid());
			pst.setInt(2, c.getUid());
			pst.setInt(3, c.getQnt());
			pst.setInt(4, c.getTprice());
			pst.setInt(5, c.getPrice());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// view all user product to cart;
	public static List<MyCartBean> userCart(int uid) {
		List<MyCartBean> list = new ArrayList<MyCartBean>();
		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "select * from mycart where uid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, uid);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				MyCartBean c = new MyCartBean();
				c.setCid(rs.getInt("cid"));
				c.setPid(rs.getInt("pid"));
				c.setQnt(rs.getInt("qnt"));
				c.setTprice(rs.getInt("tprice"));
				c.setUid(rs.getInt("uid"));
				c.setPrice(rs.getInt("price"));
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// remove product to cart by Id;
	public static void removeProductByid(int cid) {
		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "DELETE FROM mycart where cid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, cid);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// get product by id;
	public static MyCartBean getCproductByid(int cid) {
		MyCartBean c = null;
		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "select * from mycart where cid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, cid);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				c = new MyCartBean();
				c.setCid(rs.getInt("cid"));
				c.setPid(rs.getInt("pid"));
				c.setQnt(rs.getInt("qnt"));
				c.setTprice(rs.getInt("tprice"));
				c.setUid(rs.getInt("uid"));
				c.setPrice(rs.getInt("price"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}

	// update cart by cart Id;
	public static void updateCartById(MyCartBean c) {

		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "update mycart set uid=?,pid=?,qnt=?,tprice=?,price=? where cid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, c.getUid());
			pst.setInt(2, c.getPid());
			pst.setInt(3, c.getQnt());
			pst.setInt(4, c.getTprice());
			pst.setInt(5, c.getPrice());
			pst.setInt(6, c.getCid());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// check cart product;
	public static boolean checkCart(int pid, int uid) {
		boolean ch = false;
		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "select * from mycart where pid=? and uid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, pid);
			pst.setInt(2, uid);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				ch = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ch;
	}
}
