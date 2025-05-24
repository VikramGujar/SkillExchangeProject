package DatabaseDAO;

import java.sql.*;
import java.util.HashSet;
import java.util.Set;
import databaseoperation.DatabaseConnection;
import javabean.UserDataBean;

public class FetchAllUsersDAO {

	// Updated to include profile images
	public Set<UserDataBean> getAllUsers() 
	{
		Set<UserDataBean> allUsers = new HashSet<>();
		String query = "SELECT firstname, lastname, username, email, phonenumber, skilltoteach, skilltolearn, rating, profilepic FROM skillexchangeusers";

		try {

			Connection con = DatabaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) 
			{
				UserDataBean ub = createUserFromResultSet(rs);

				// Get image stream if not null
				Blob blob = rs.getBlob("profilepic");
				if (blob != null) 
				{
					ub.setImage(blob.getBinaryStream());
				}

				allUsers.add(ub);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return allUsers;
	}

	// Used when fetching a single user by username
	public UserDataBean getUserWithImage(String username) 
	{
		String query = "SELECT firstname, lastname, username, email, phonenumber, skilltoteach, skilltolearn, rating, profilepic FROM skillexchangeusers WHERE username = ?";

		try {
			
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
		
			ps.setString(1, username);
			try {
				ResultSet rs = ps.executeQuery();
				if (rs.next()) 
				{
					UserDataBean ub = createUserFromResultSet(rs);
					Blob blob = rs.getBlob("profilepic");
					if (blob != null) 
					{
						ub.setImage(blob.getBinaryStream());
					}
					return ub;
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		
		}
		return null;
	}

	// Reusable method to map basic user fields
	private UserDataBean createUserFromResultSet(ResultSet rs) throws SQLException {
		UserDataBean ub = new UserDataBean();
		ub.setFname(rs.getString("firstname"));
		ub.setLname(rs.getString("lastname"));
		ub.setUsername(rs.getString("username"));
		ub.setEmail(rs.getString("email"));
		ub.setPhno(rs.getLong("phonenumber"));
		ub.setSkillToTeach(rs.getString("skilltoteach"));
		ub.setSkillToLearn(rs.getString("skilltolearn"));
		ub.setRating(rs.getInt("rating"));
		return ub;
	}
}
