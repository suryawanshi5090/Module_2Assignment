package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Util.ElectroUtil;
import com.bean.ProductBean;

public class ProductDao {

	// Add Product;
	public static void addProduct(ProductBean p) {
		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "insert into product(uid,pname,pbrand,category,pdisc,image,price,punit) values(?,?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, p.getUid());
			pst.setString(2, p.getPname());
			pst.setString(3, p.getPbrand());
			pst.setString(4, p.getCategory());
			pst.setString(5, p.getPdisc());
			pst.setString(6, p.getImage());
			pst.setInt(7, p.getPrice());
			pst.setInt(8, p.getPunit());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// select All User Product;
	public static List<ProductBean> getUserProduct(int uid) {
		List<ProductBean> list = new ArrayList<>();
		// System.out.println("user id : " + uid);
		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "SELECT * FROM product where uid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, uid);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				ProductBean p = new ProductBean();
				p.setPid(rs.getInt("pid"));
				p.setUid(rs.getInt("uid"));
				p.setPname(rs.getString("pname"));
				p.setPbrand(rs.getString("pbrand"));
				p.setCategory(rs.getString("category"));
				p.setPdisc(rs.getString("pdisc"));
				p.setImage(rs.getString("image"));
				p.setPrice(rs.getInt("price"));
				p.setPunit(rs.getInt("punit"));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println("list size :" + list.size());
		return list;
	}

	// get product by id;
	public static ProductBean getProductById(int pid) {
		ProductBean p = null;
		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "select * from product where pid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, pid);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				p = new ProductBean();
				p.setPid(rs.getInt("pid"));
				p.setUid(rs.getInt("uid"));
				p.setCategory(rs.getString("category"));
				p.setImage(rs.getString("image"));
				p.setPbrand(rs.getString("pbrand"));
				p.setPdisc(rs.getString("pdisc"));
				p.setPname(rs.getString("pname"));
				p.setPrice(rs.getInt("price"));
				p.setPunit(rs.getInt("punit"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}

	// update product;
	public static void updateProduct(ProductBean p) {
		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "update product set uid=?,pname=?,pbrand=?,category=?,pdisc=?,price=?,punit=? where pid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, p.getUid());
			pst.setString(2, p.getPname());
			pst.setString(3, p.getPbrand());
			pst.setString(4, p.getCategory());
			pst.setString(5, p.getPdisc());
			pst.setInt(6, p.getPrice());
			pst.setInt(7, p.getPunit());
			pst.setInt(8, p.getPid());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// delete product;
	public static void deleteProductById(int pid) {
		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "delete from product where pid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, pid);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// get product By category and user id;
	public static List<ProductBean> getProductByCategory(String category, int uid) {
		List<ProductBean> list = new ArrayList<ProductBean>();
		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "select * from product where category=? and uid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, category);
			pst.setInt(2, uid);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				ProductBean p = new ProductBean();
				p.setPid(rs.getInt("pid"));
				p.setUid(rs.getInt("uid"));
				p.setCategory(rs.getString("category"));
				p.setImage(rs.getString("image"));
				p.setPbrand(rs.getString("pbrand"));
				p.setPdisc(rs.getString("pdisc"));
				p.setPname(rs.getString("pname"));
				p.setPrice(rs.getInt("price"));
				p.setPunit(rs.getInt("punit"));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// select all product ;
	public static List<ProductBean> getAllProduct() {
		List<ProductBean> list = new ArrayList<ProductBean>();

		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "select * from product ";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				ProductBean p = new ProductBean();
				p.setCategory(rs.getString("category"));
				p.setImage(rs.getString("image"));
				p.setPbrand(rs.getString("pbrand"));
				p.setPdisc(rs.getString("pdisc"));
				p.setPid(rs.getInt("pid"));
				p.setPname(rs.getString("pname"));
				p.setPrice(rs.getInt("price"));
				p.setPunit(rs.getInt("punit"));
				p.setUid(rs.getInt("uid"));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// product filter by category;
	public static List<ProductBean> getProductByCategory(String category) {
		List<ProductBean> list = new ArrayList<ProductBean>();
		try {
			Connection conn = ElectroUtil.DbConnection();
			String sql = "select * from product where category=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, category);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				ProductBean p = new ProductBean();
				p.setCategory(rs.getString("category"));
				p.setImage(rs.getString("image"));
				p.setPbrand(rs.getString("pbrand"));
				p.setPdisc(rs.getString("pdisc"));
				p.setPid(rs.getInt("pid"));
				p.setPname(rs.getString("pname"));
				p.setPrice(rs.getInt("price"));
				p.setPunit(rs.getInt("punit"));
				p.setUid(rs.getInt("uid"));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
