package com.nit.databasedao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.nit.databaseoperation.DatabaseConnection;
import com.nit.javabean.UserDataBean;

public class ViewUserProfileDAO {

	public ArrayList<UserDataBean> viewProfile(String username) throws SQLException {
		ArrayList<UserDataBean> list = new ArrayList<UserDataBean>();
		UserDataBean ub = null;
		
		try {
			Connection con2 = DatabaseConnection.getConnection();
			PreparedStatement ps = con2.prepareStatement("select * from skillExchangeusers WHERE username=?");

			// Adding UserName
			ps.setString(1, username);

			// Getting Result
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ub = new UserDataBean();
				ub.setFname(rs.getString(1));
				ub.setLname(rs.getString(2));
				ub.setUsername(rs.getString(3));
				ub.setEmail(rs.getString(5));
				ub.setPhno(rs.getLong(6));
				list.add(ub);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
