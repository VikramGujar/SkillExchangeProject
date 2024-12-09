package userinput;

import java.io.IOException;
import java.io.PrintWriter;

import databaseoperation.AddUserDataInDBDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javabean.UserDataBean;

@SuppressWarnings("serial")

@WebServlet("/reg")
public class RegisterServlet extends HttpServlet {

	UserDataBean ub=null;
	AddUserDataInDBDAO au=null;
	@Override
	public void init()
	{
		ub= new UserDataBean();
		au= new AddUserDataInDBDAO();
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
	{
		ub.setFname(req.getParameter("first-name"));
		ub.setLname(req.getParameter("last-name"));
		ub.setUsername(req.getParameter("username"));
		ub.setPass(req.getParameter("password"));
		
		int result=au.addData(ub);
		
		if(result>0)
		{
			
		}
		else
		{
			res.setContentType("text/html");
			
			PrintWriter pw=res.getWriter();
			pw.print("Something is wrong try again");
			req.getRequestDispatcher("registration.html").include(req, res);
		}
	}
}
