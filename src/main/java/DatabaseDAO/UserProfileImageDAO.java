package DatabaseDAO;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import databaseoperation.DatabaseConnection;

public class UserProfileImageDAO {
	
	private final static String sqlQuery="SELECT PROFILEPIC FROM skillExchangeusers WHERE username = ?";
	
	public Blob getImage(String userName)
	{
		
		Blob imageBlob = null;
		
		try {
			
			Connection conn = DatabaseConnection.getConnection();
			
			PreparedStatement ps = conn.prepareStatement(sqlQuery);
			
			ps.setString(1, userName);
			
			ResultSet rs = ps.executeQuery();

            if (rs.next()) 
            {
                imageBlob = rs.getBlob("PROFILEPIC");
            } 	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return imageBlob;
	}
}
