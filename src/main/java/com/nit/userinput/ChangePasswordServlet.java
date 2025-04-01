package com.nit.userinput;

import java.io.IOException;

import com.nit.databasedao.ChangePassDao;
import com.nit.javabean.UserDataBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/change")
public class ChangePasswordServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String opass=req.getParameter("opass");
		String npass=req.getParameter("npass");
		String uname=req.getParameter("uname");
		int k=new ChangePassDao().changePass(npass, uname);
		HttpSession hs=req.getSession(false);
		UserDataBean user=(UserDataBean)hs.getAttribute("userbean");
		System.out.println(user.getPass());
		if(uname.equals(user.getUsername())) {
			if (!opass.equals(user.getPass())) {

				req.setAttribute("msg", "Please Enter Correct Old Password!!!");
				req.getRequestDispatcher("changePass.jsp").forward(req, resp);
			}
			else if (opass.equals(npass)) {
				req.setAttribute("msg", "Old Password Must Be Different To the New Password!!");
				req.getRequestDispatcher("changePass.jsp").forward(req, resp);
			}
		}
	}
	
}
