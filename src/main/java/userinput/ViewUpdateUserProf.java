package userinput;


	import java.io.IOException;
	import java.util.ArrayList;

	import DatabaseDAO.ViewUserProfileDAO;
	import jakarta.servlet.ServletException;
	import jakarta.servlet.annotation.WebServlet;
	import jakarta.servlet.http.HttpServlet;
	import jakarta.servlet.http.HttpServletRequest;
	import jakarta.servlet.http.HttpServletResponse;
	import javabean.UserDataBean;

	@SuppressWarnings("serial")
	@WebServlet("/viewEditUserPro")
	public class ViewUpdateUserProf extends HttpServlet {

		UserDataBean ub = null;
		ViewUserProfileDAO udao = null;

		public void init() {
			ub = new UserDataBean();
			udao = new ViewUserProfileDAO();
		}

		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
		{
			try {
				
				//Get user name from URL parameter
		        String username = req.getParameter("username");

		        if (username == null || username.isEmpty()) {
		            req.setAttribute("msg", "Invalid username");
		            req.getRequestDispatcher("/public/html/WelcomePage.jsp").forward(req, res);
		            return;
		        }
				
				ArrayList<UserDataBean> vieww = udao.viewProfile(username);
				if (vieww.isEmpty()) 
				{
					req.setAttribute("msg", "User Data Not Found");
					req.getRequestDispatcher("WelcomePage.jsp").forward(req, res);
				} 
				else {
					req.setAttribute("profile", vieww);
					req.getRequestDispatcher("/public/html/ViewUpdateUserProfile.jsp").forward(req, res);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}