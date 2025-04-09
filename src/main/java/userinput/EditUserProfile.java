package userinput;

import java.io.IOException;

import com.nit.databasedao.UpdateUserProfileDao;
import com.nit.javabean.UserDataBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/showEditUserPro")
public class EditUserProfile extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String uname = req.getParameter("username");
			System.out.println(uname);
			UserDataBean ub = new UpdateUserProfileDao().getByUsername(uname);

			if (uname == null || uname.isEmpty()) {
				req.setAttribute("msg", "Invalid username");
				System.out.println("uname from 1st con: " + uname);
				req.getRequestDispatcher("/public/html/WelcomePage.jsp").forward(req, resp);
				return;
			}
			if (ub == null) 
			{
				req.setAttribute("msg", "User Data Not Found");
				System.out.println("ub is null: " + ub);
				req.getRequestDispatcher("/public/html/WelcomePage.jsp").forward(req, resp);
			}

			else {
				System.out.println("edit user profile");
				req.setAttribute("user", ub);
				req.getRequestDispatcher("/public/html/showEditProd.jsp").forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
