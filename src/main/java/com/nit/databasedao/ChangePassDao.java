package com.nit.databasedao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.nit.databaseoperation.DatabaseConnection;

public class ChangePassDao {
	public int changePass(String nPass,String uname) {
		int k=0;
		Connection con=null;
		try {
			 con=DatabaseConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("update skillexchangeusers set password=? where username=?");
			ps.setString(1, nPass);
			ps.setString(2, uname);
			k = ps.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return k;
	}
}
