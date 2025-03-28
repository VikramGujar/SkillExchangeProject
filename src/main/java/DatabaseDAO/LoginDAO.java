package DatabaseDAO;

//Checking user data in database and if it is present then returning the UserDataBean object 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import databaseoperation.DatabaseConnection;
import javabean.UserDataBean;

public class LoginDAO {
	
	//Method for storing user data in UserDataBean and returning the object
	public UserDataBean checkLogin(String usename,String password)
	{
		UserDataBean ub=null;
		Connection con=null;
		System.out.println("LoginDAO.checkLogin()");
		
		try
		{
			con=DatabaseConnection.getConnection();
			System.out.println("LoginDAO.checkLogin() con : "+con);
			PreparedStatement ps=con.prepareStatement("Select * from skillexchangeusers Where username=? AND password=?");
			
			ps.setString(1, usename);
			ps.setString(2, password);
			
			
			ResultSet rs=ps.executeQuery();
			
			
			if(rs.next())
			{
				ub=new UserDataBean();
				ub.setFname(rs.getString(1));
				ub.setLname(rs.getString(2));
				ub.setUsername(rs.getString(3));
				ub.setPass(rs.getString(4));
				System.out.println("Login DAO Start");
				System.out.println(rs.getString(5));
				System.out.println("Login DAO end");
//				ub.setEmail(rs.getString(5));
//				ub.setPhno(rs.getLong(6));
				
			}
		}
		catch(Exception e)
		{
			System.out.println("Inside else con : "+con);
			e.printStackTrace();
		}
		
		return ub;
		
	}

}
