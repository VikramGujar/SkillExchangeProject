package DatabaseDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import databaseoperation.DatabaseConnection;
import javabean.UserDataBean;

public class UpdateUserProfileDao {

	public UserDataBean getByUsername(String uname) {
		UserDataBean ub=null;
		try{
			Connection con=DatabaseConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from skillExchangeusers WHERE username=?");
			ps.setString(1,uname);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				ub=new UserDataBean();
				ub.setFname(rs.getString(1));
				ub.setLname(rs.getString(2));
				ub.setUsername(rs.getString(3));
				ub.setEmail(rs.getString(5));
				ub.setPhno(rs.getLong(6));
			}
		}
		catch(Exception e) {
			e.printStackTrace();  
		}
		return ub;
	}
	
}
