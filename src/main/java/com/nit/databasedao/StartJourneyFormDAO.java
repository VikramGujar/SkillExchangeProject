package com.nit.databasedao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.nit.databaseoperation.DatabaseConnection;
import com.nit.javabean.UserDataBean;

public class StartJourneyFormDAO {
	int k = 0;
	public static final String updateQuery = "UPDATE skillexchangeusers SET email = ?, phonenumber = ?, skilltoteach = ?, skilltolearn = ?, rating = ? WHERE USERNAME = ?";

	public int storeData(UserDataBean ub) {
		try {
			
			//Creating connection object
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(updateQuery);
			
			//Setting data into PreparedStatement
			ps.setString(1, ub.getEmail());
			ps.setLong(2, ub.getPhno());
			ps.setString(3, ub.getSkillToTeach());
			ps.setString(4, ub.getSkillToLearn());
			ps.setInt(5, ub.getRating());
			ps.setString(6, ub.getUsername());
			
			//Executing Query
			k=ps.executeUpdate();
			

		} catch (Exception e) {
			
			e.printStackTrace();

		}

		return k;

	}

}
