package userinput;

import java.io.IOException;
import java.io.PrintWriter;

import databaseoperation.LoginDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javabean.UserDataBean;

@SuppressWarnings("serial")

@WebServlet("/public/html/login")
public class LoginServlet extends HttpServlet{

	LoginDAO ld=null;
	@Override
	public void init()
	{
		ld= new LoginDAO();
	}
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		
		UserDataBean ub=ld.checkLogin(username, password);
		
		if(!(ub==null))
		{
			req.setAttribute("username", ub.getFname());
			req.getRequestDispatcher("welcomePage.jsp").forward(req, res);
		}
		else
		{
			res.setContentType("text/html");
			PrintWriter pw=res.getWriter();
			pw.print("<div class='error-message'>Oops! Check your username or password.</div>");
			
			req.getRequestDispatcher("login.html").include(req, res);
		}
	}
	
	
	
}
