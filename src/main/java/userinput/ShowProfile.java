package userinput;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import databaseoperation.RegistrationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javabean.UserDataBean;

@WebServlet("/view")
public class ShowProfile extends HttpServlet {

	UserDataBean ub = null;
	RegistrationDAO udao = null;

	public void init() {
		ub = new UserDataBean();
		udao = new RegistrationDAO();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ArrayList<UserDataBean> ul = new ArrayList<UserDataBean>();
		try {
			ArrayList<UserDataBean> view = udao.viewProfile();
			if (view.isEmpty()) {
				req.setAttribute("msg", "Book not found");
				req.getRequestDispatcher("index.html").forward(req, res);
			} else {
				req.setAttribute("profile", view);
				req.getRequestDispatcher("Display.jsp").forward(req, res);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
