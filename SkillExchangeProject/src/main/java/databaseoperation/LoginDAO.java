package databaseoperation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javabean.UserDataBean;

public class LoginDAO {
	
	UserDataBean ub=null;
	
	public UserDataBean checkLogin(String usename,String password)
	{
		
		
		try
		{
			Connection con=DatabaseConnection.getConnection();
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
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return ub;
		
	}

}