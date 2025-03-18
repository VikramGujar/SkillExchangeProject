package userinput;


	import java.io.IOException;

import DatabaseDAO.UpdateUserProfileDao;
import jakarta.servlet.ServletException;
	import jakarta.servlet.annotation.WebServlet;
	import jakarta.servlet.http.HttpServlet;
	import jakarta.servlet.http.HttpServletRequest;
	import jakarta.servlet.http.HttpServletResponse;
import javabean.UserDataBean;

	@WebServlet("/update")
	public class UpdateUserProfile extends HttpServlet {

		UserDataBean pb=null;
		UpdateUserProfileDao pdao=null;
		public void init() {
			 pb=new UserDataBean();
			 pdao=new UpdateUserProfileDao();
		}
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String fname = req.getParameter("fname");
			String lname = req.getParameter("lname");
			String uname= req.getParameter("uname");
			String email=req.getParameter("email");
			long phno = Long.parseLong(req.getParameter("phno"));
			pb.setFname(fname);
			pb.setLname(lname);
			pb.setUsername(uname);
			pb.setEmail(email);
			pb.setPhno(phno);
			int k=pdao.update(pb);
			if(k>0) {
				req.setAttribute("msg","Details Updated Successfully");
				System.out.println("details updated ");
				req.getRequestDispatcher("/public/html/ViewUpdateUserProfile.jsp").forward(req, resp);
			}
			else {
				req.setAttribute("msg","Details Not Updated");
				req.getRequestDispatcher("/public/html/ViewUpdateUserProfile.jsp").forward(req, resp);
			}
		}
	}

