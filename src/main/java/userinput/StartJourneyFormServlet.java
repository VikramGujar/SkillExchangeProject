package userinput;

import java.io.IOException;

import DatabaseDAO.StartJourneyFormDAO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javabean.UserDataBean;

@WebServlet("/public/html/startJourneyForm")
public class StartJourneyFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// Creating reference variable for Classes
	UserDataBean ub = null;
	StartJourneyFormDAO sjf;

	// Method for creating object before used
	@Override
	public void init() 
	{
		ub = new UserDataBean();
		sjf= new StartJourneyFormDAO();
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		//Setting data into UserBean
		ub.setPhno(Long.parseLong(req.getParameter("phoneNumber")));
		ub.setEmail(req.getParameter("email"));
		ub.setSkillToLearn(req.getParameter("skillToLearn"));
		ub.setSkillToTeach(req.getParameter("skillToTeach"));
		ub.setRating(Integer.parseInt(req.getParameter("skillRating")));
		
		// Get ServletContext object
        ServletContext sct = req.getServletContext();
        // Retrieve UserBean object
        UserDataBean ub1 = (UserDataBean) sct.getAttribute("ubean");
		
        //Setting the username in UserDataBean
        ub.setUsername(ub1.getUsername());

		
		//Storing into DAO and getting result
		int result=sjf.storeData(ub);
		System.out.println(result);
		//Checking data is stored or not in DB
		if (result > 0) 
		{
			System.out.println("Data Updated in Database");
			res.sendRedirect("fetchAllUsers");
		} 
		else 
		{
			System.out.println("Data Not Updated in Database");
		}
	}

}
