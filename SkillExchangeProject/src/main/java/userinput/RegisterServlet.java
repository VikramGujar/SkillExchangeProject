package userinput;

import java.io.IOException;
import java.io.PrintWriter;

import databaseoperation.RegistrationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javabean.UserDataBean;

@SuppressWarnings("serial")

@WebServlet("/public/html/reg")
public class RegisterServlet extends HttpServlet {

	UserDataBean ub=null;
	RegistrationDAO au=null;
	@Override
	public void init()
	{
		ub= new UserDataBean();
		au= new RegistrationDAO();
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
	{
		ub.setFname(req.getParameter("first-name"));
		ub.setLname(req.getParameter("last-name"));
		ub.setUsername(req.getParameter("username"));
		ub.setPass(req.getParameter("password"));
		
		int result=au.addData(ub);
		req.setAttribute("username",ub.getFname());
		if(result>0)
		{
			req.setAttribute("msg", "<div class='reg-succces'>Registration Succeess Login now..</div>");
			req.getRequestDispatcher("userlogin.jsp").forward(req, res);
		}
		else
		{
			res.setContentType("text/html");
			
			PrintWriter pw=res.getWriter();
			pw.print("<div class='error-message'>[ Username taken! Try something more unique! ]</div>");
			req.getRequestDispatcher("registration.html").include(req, res);
		}
	}
}
