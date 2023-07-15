package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Util.ElectroUtil;
import com.bean.WishListBean;

public class WishListDao {

	public static void addProduct(WishListBean w) {
		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "insert into wishList (uid,pid) values(?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, w.getUid());
			pst.setInt(2, w.getPid());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// get user wish list;
	public static List<WishListBean> userWishList(int uid) {
		List<WishListBean> list = new ArrayList<WishListBean>();
		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "select * from wishList where uid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, uid);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				WishListBean w = new WishListBean();
				w.setPid(rs.getInt("pid"));
				w.setUid(rs.getInt("uid"));
				w.setWid(rs.getInt("wid"));
				list.add(w);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// check wish list product;
	public static boolean checkWishList(int pid, int uid) {
		boolean ch = false;
		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "select * from wishlist where pid=? and uid=?";
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

	// remove product to wish list;
	public static void removeProductToWishList(int pid, int uid) {

		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "delete from wishlist where pid=? and uid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, pid);
			pst.setInt(2, uid);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
