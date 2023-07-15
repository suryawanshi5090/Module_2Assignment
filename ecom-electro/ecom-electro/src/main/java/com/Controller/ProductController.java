package com.Controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.Dao.ProductDao;
import com.bean.ProductBean;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 512, // 512MB
		maxFileSize = 1024 * 1024 * 512, // 512MB
		maxRequestSize = 1024 * 1024 * 512) // 512MB
@WebServlet("/ProductController")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String extractfilename(Part file) {
		String cd = file.getHeader("content-disposition");
		System.out.println(cd);
		String[] items = cd.split(";");
		for (String string : items) {
			if (string.trim().startsWith("filename")) {
				return string.substring(string.indexOf("=") + 2, string.length() - 1);
			}
		}
		return "";
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		// add product;
		if (action.equalsIgnoreCase("Add Product")) {
			// image file path;
			String savePath = "C:\\Users\\SLS\\Desktop\\data\\TOPS_TECHNOLOGIES\\TOPS PRECTICE\\JAVA PRECTICE\\ecom-electro\\src\\main\\webapp\\Product_Images";
			File fileSaveDir = new File(savePath);
			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdir();
			}
			Part file1 = request.getPart("image");
			String fileName = extractfilename(file1);
			file1.write(savePath + File.separator + fileName);
			String filePath = savePath + File.separator + fileName;

			// productBean Class object;
			ProductBean p = new ProductBean();
			p.setCategory(request.getParameter("category"));
			p.setPname(request.getParameter("pname"));
			p.setPbrand(request.getParameter("pbrand"));
			p.setPdisc(request.getParameter("pdisc"));
			p.setUid(Integer.parseInt(request.getParameter("uid")));
			p.setPrice(Integer.parseInt(request.getParameter("price")));
			p.setPunit(Integer.parseInt(request.getParameter("punit")));
			p.setImage(fileName);
			ProductDao.addProduct(p);
			request.setAttribute("msg", "Product Add Successfully.");
			request.getRequestDispatcher("s_addProduct.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("Update Product")) {

// update product;
			// int pid = Integer.parseInt(request.getParameter("pid"));
			ProductBean p = new ProductBean();
			p.setPid(Integer.parseInt(request.getParameter("pid")));
			p.setUid(Integer.parseInt(request.getParameter("uid")));
			p.setPname(request.getParameter("pname"));
			p.setPbrand(request.getParameter("pbrand"));
			p.setPdisc(request.getParameter("pdisc"));
			p.setPrice(Integer.parseInt(request.getParameter("price")));
			p.setPunit(Integer.parseInt(request.getParameter("punit")));
			p.setCategory(request.getParameter("category"));
			ProductDao.updateProduct(p);
			response.sendRedirect("s_index.jsp");
		}
	}

}
