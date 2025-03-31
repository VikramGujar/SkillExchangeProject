package com.nit.databasedao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.nit.databaseoperation.DatabaseConnection;
import com.nit.javabean.UserDataBean;

public class UpdateUserProfileDao {
//it will show the information for updation
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
				ub.setEmail(rs.getString(5));//changes ac to database no
				ub.setPhno(rs.getLong(6));//changes
			}
		}
		catch(Exception e) {
			e.printStackTrace();  
		}
		return ub;
	}
	public int update(UserDataBean user) {
		int k=0;
		//it will set the new values(update the record)
		try{
			Connection con=DatabaseConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("update skillexchangeusers set FIRSTNAME=?,LASTNAME=?,EMAIL=? ,PHONENUMBER=? where username=?");
			ps.setString(1,user.getFname());
			ps.setString(2,user.getLname());
			ps.setString(3, user.getEmail());
			ps.setLong(4,user.getPhno());
			ps.setString(5, user.getUsername());
			k = ps.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return k;
	}
		
	
}
