package DatabaseDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

import databaseoperation.DatabaseConnection;
import javabean.UserDataBean;

public class ViewAllUsersDAO {
	
	private Set<UserDataBean> allUsers;

	public ViewAllUsersDAO() {
		allUsers = new HashSet<>();
	}
	
	public Set<UserDataBean> viewAllUsers() throws SQLException{
		
		Connection con = DatabaseConnection.getConnection();
		
		PreparedStatement ps = con.prepareStatement("select * from skillExchangeUsers");
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			UserDataBean udb = new UserDataBean();
			udb.setFname(rs.getString(1));
			udb.setLname(rs.getString(2));
			udb.setUsername(rs.getString(3));
			udb.setPass(rs.getString(4));
			udb.setEmail(rs.getString(5));
			udb.setPhno(rs.getLong(6));
			udb.setSkillToTeach(rs.getString(7));
			udb.setSkillToLearn(rs.getString(8));
			udb.setRating(rs.getInt(9));
			// keeping this empty for #G
//			udb.setProfilePic(rs.getString(10));
			allUsers.add(udb);
		} 
		return allUsers;
	}
	
	

	
	
}
