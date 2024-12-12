package userinput;

import java.io.IOException;

import databaseoperation.LoginDAO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
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
			//Accessing ServletContext object reference
			ServletContext sct = req.getServletContext();
			sct.setAttribute("ubean", ub);
			
			//Creating Cookie
			Cookie ck=new Cookie("firstName", ub.getFname());
			
			//Adding Cookie object to response
			res.addCookie(ck);
			
			//Forwarding request and response
			req.getRequestDispatcher("welcomePage.jsp").forward(req, res);
		}
		else
		{
			req.setAttribute("msg","<div class='login-fail'>Oops! Check your username or password.</div>");
			req.getRequestDispatcher("userlogin.jsp").forward(req, res);
		}
	}
	
	
	
}
