package userinput;

import java.io.IOException;
import java.sql.SQLException;

import DatabaseDAO.ViewAllUsersDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javabean.UserDataBean;


@SuppressWarnings("serial")
@WebServlet("/showAllUsers")
public class ViewAllUsersServlet extends HttpServlet{
	// Creating reference variable for Classes
	//UserDataBean ub = null;
	ViewAllUsersDAO vaud;
	
	// Method for creating object before used
		@Override
		public void init() 
		{
			vaud = new ViewAllUsersDAO();
		}
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
		{
			System.err.println("ViewAllUsersServlet.doPos	t()");
			try {
				System.out.println(vaud.viewAllUsers());	
				//Forwarding request and response
				req.getRequestDispatcher("public/html/AllUsers.jsp").forward(req, res);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
		{
			System.out.println("ViewAllUsersServlet.doGet()");
			
			doPost(req, res);
		}
}
