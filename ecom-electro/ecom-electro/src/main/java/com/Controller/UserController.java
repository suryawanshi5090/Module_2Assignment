package com.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.UserDao;
import com.Dao.WishListDao;
import com.Dao.cartDao;
import com.bean.MyCartBean;
import com.bean.UserBean;
import com.bean.WishListBean;
import com.service.Services;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("registration")) {
			boolean ch = UserDao.checkEmail(request.getParameter("email"));
			if (ch == true) {
				request.setAttribute("msg", "Email-Id Already Exists.!!!");
				request.getRequestDispatcher("registration.jsp").forward(request, response);
				;
			} else if (request.getParameter("password").equals(request.getParameter("cpassword"))) {
				UserBean u = new UserBean();
				u.setUsertype(request.getParameter("usertype"));
				u.setFname(request.getParameter("fname"));
				u.setLname(request.getParameter("lname"));
				u.setEmail(request.getParameter("email"));
				u.setAddress(request.getParameter("address"));
				u.setCity(request.getParameter("city"));
				u.setCountry(request.getParameter("country"));
				u.setPassword(request.getParameter("password"));
				u.setCpassword(request.getParameter("cpassword"));
				u.setMobile(request.getParameter("mobile"));
				UserDao.insertUser(u);
				response.sendRedirect("login.jsp");
			} else {
				request.setAttribute("msg", "Password And Confirm Password does Not Match.!!!");
				request.getRequestDispatcher("registration.jsp").forward(request, response);
				;
			}

		} // login
		else if (action.equalsIgnoreCase("login")) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			UserBean u = UserDao.checkLogin(email, password);
			if (u == null) {
				request.setAttribute("msg", "Email And Password Does Not Match.!!!");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			} else if (u.getUsertype().equals("user")) {
				HttpSession session = request.getSession();
				List<WishListBean> list = WishListDao.userWishList(u.getUid());
				List<MyCartBean> list2 = cartDao.userCart(u.getUid());
				session.setAttribute("w_size", list.size());
				session.setAttribute("c_size", list2.size());
				session.setAttribute("user", u);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("user", u);
				request.getRequestDispatcher("s_index.jsp").forward(request, response);
			}
		} // Update Profile;
		else if (action.equalsIgnoreCase("Update Profile")) {
			UserBean u = new UserBean();
			u.setUid(Integer.parseInt(request.getParameter("uid")));
			u.setUsertype(request.getParameter("usertype"));
			u.setFname(request.getParameter("fname"));
			u.setLname(request.getParameter("lname"));
			u.setEmail(request.getParameter("email"));
			u.setAddress(request.getParameter("address"));
			u.setCity(request.getParameter("city"));
			u.setCountry(request.getParameter("country"));
			UserDao.updateProfile(u);
			HttpSession session = request.getSession();
			session.setAttribute("user", u);
			if (u.getUsertype().equals("user")) {
				request.setAttribute("msg", "Profile Update Successfully.!!");
				request.getRequestDispatcher("myProfile.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "Profile Update Successfully.!!");
				request.getRequestDispatcher("s_myProfile.jsp").forward(request, response);
			}
		} // forgot-password;
		else if (action.equalsIgnoreCase("Send OTP")) {
			String email = request.getParameter("email");
			boolean ch = UserDao.checkEmail(email);
			if (ch == true) {
				int min = 1000;
				int max = 9999;
				int otp = (int) (Math.random() * (max - min + 1) + min);
				Services.sendMail(email, otp);
				request.setAttribute("email", email);
				request.setAttribute("otp", otp);
				request.getRequestDispatcher("otp.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "Email Id Not Valid.!!!");
				request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
			}
		}
		// Verify OTP;
		else if (action.equalsIgnoreCase("Verify OTP")) {
			String email = request.getParameter("email");
			int otp = Integer.parseInt(request.getParameter("otp"));
			int uotp = Integer.parseInt(request.getParameter("uotp"));
			if (otp == uotp) {
				request.setAttribute("email", email);

				request.getRequestDispatcher("newPassword.jsp").forward(request, response);
			} else {

				request.setAttribute("email", email);
				request.setAttribute("otp", otp);
				request.setAttribute("msg", "OTP Does Not Match.!!!");
				request.getRequestDispatcher("otp.jsp").forward(request, response);
			}

		} // new password;
		else if (action.equalsIgnoreCase("Reset Password")) {
			String email = request.getParameter("email");
			String npass = request.getParameter("newPassword");
			String cpass = request.getParameter("cNewPassword");
			if (npass.equals(cpass)) {
				UserDao.updatePassword(email, npass);
				response.sendRedirect("login.jsp");
			} else {
				request.setAttribute("email", email);
				request.setAttribute("msg", "New Password And Confirm New Password Does Not Match.!!!");
				request.getRequestDispatcher("newPassword.jsp").forward(request, response);
			}
		} // change Password;
		else if (action.equalsIgnoreCase("Change Password")) {

			String oldpass = request.getParameter("oldPassword");
			String newPass = request.getParameter("newPassword");
			String cNewPass = request.getParameter("cNewPassword");
			HttpSession session = request.getSession();
			UserBean u = (UserBean) session.getAttribute("user");
			// user display;
			if (u.getUsertype().equals("user")) {
				// check old-password;
				if (u.getPassword().equals(oldpass)) {
					// check new password and confirm new password;
					if (request.getParameter("newPassword").equals(request.getParameter("cNewPassword"))) {
						// update password;
						UserDao.updatePassword(u.getEmail(), request.getParameter("newPassword"));
						response.sendRedirect("logout.jsp");
					} else {
						// new password and confirm new password not match m message
						request.setAttribute("msg", "New Password And Confirm New Password Does Not Match.!!!");
						request.getRequestDispatcher("changePassword.jsp").forward(request, response);
					}
					// old password/ new password / confirm new password check message;
				} else if (!((u.getPassword().equals(oldpass)) && (newPass == cNewPass))) {
					request.setAttribute("msg",
							"Old-password/ New Password And Confirm New Password Does Not Match.!!!");
					request.getRequestDispatcher("changePassword.jsp").forward(request, response);
					// old password not match message;
				} else {
					request.setAttribute("msg", "Old-Password Does Not Match.!!!");
					request.getRequestDispatcher("changepassword.jsp").forward(request, response);
				}
// seller display;
			} else {
				// check old Password
				if (u.getPassword().equals(oldpass)) {
					// check new password and confirm new password;
					if (request.getParameter("newPassword").equals(request.getParameter("cNewPassword"))) {
						UserDao.updatePassword(u.getEmail(), request.getParameter("newPassword"));
						response.sendRedirect("logout.jsp");
						// new password and confirm new password not match message;
					} else {
						request.setAttribute("msg", "New Password And Confirm New Password Does Not Match.!!!");
						request.getRequestDispatcher("s_changePassword.jsp").forward(request, response);
					}
					// old password/ new password / confirm new password not match message;
				} else if (!((u.getPassword().equals(oldpass)) && (newPass == cNewPass))) {
					request.setAttribute("msg",
							"Old-password/ New Password And Confirm New Password Does Not Match.!!!");
					request.getRequestDispatcher("s_changePassword.jsp").forward(request, response);

				} else {// old password not match message;
					request.setAttribute("msg", "Old-Password Does Not Match.!!!");
					request.getRequestDispatcher("s_changePassword.jsp").forward(request, response);
				}
			}
		}
	}

}
