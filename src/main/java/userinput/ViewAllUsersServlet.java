package userinput;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import com.nit.jsonutility.JsonUtility;

import DatabaseDAO.ViewAllUsersDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
			System.out.println("ViewAllUsersServlet.doPost()");
			try {
				
				 ArrayList<UserDataBean> allUsers =  vaud.viewAllUsers();
				 String jsonData = JsonUtility.convertJavaToJson(allUsers);
				 System.out.println("Json Data :: "+jsonData);
				 //Creating new session
				HttpSession hs=req.getSession();
				
				//User bean adding to session
				hs.setAttribute("allUser", allUsers);
				//Forwarding request and response
				req.getRequestDispatcher("public/html/allUsers.jsp").forward(req, res);
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
