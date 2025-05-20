package DatabaseDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;

import databaseoperation.DatabaseConnection;
import javabean.UserDataBean;

public class FetchAllUsersDAO {
	public Set<UserDataBean> allUsers;
	
	public Set<UserDataBean> getAllUsers(){
		Connection con = DatabaseConnection.getConnection();
		
		try {
			PreparedStatement stm = con.prepareStatement("select * from skillExchangeusers");
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				UserDataBean ub = new UserDataBean();
				ub.setFname(rs.getString(1));
				ub.setLname(rs.getString(2));
				ub.setUsername(rs.getString(3));
				ub.setPass(rs.getString(4));
				ub.setEmail(rs.getString(5));
				ub.setPhno(rs.getLong(6));
				ub.setSkillToTeach(rs.getString(7));
				ub.setSkillToLearn(rs.getString(8));
				ub.setRating(rs.getInt(9));
				allUsers.add(ub);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return allUsers;
	}
}
