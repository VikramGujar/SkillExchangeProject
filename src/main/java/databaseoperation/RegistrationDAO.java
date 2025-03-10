package databaseoperation;

//Performing Registration process Storing the User Data in Database
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javabean.UserDataBean;

public class RegistrationDAO {

	int k = 0;

	// Method for getting UserDataBean object and storing in Data in Database if
	// stored then returning k=1
	public int addData(UserDataBean ub) {
		Connection con = DatabaseConnection.getConnection();

		try {
			PreparedStatement ps = con.prepareStatement("Insert into skillExchangeusers values(?,?,?,?,?,?)");

			ps.setString(1, ub.getFname());
			ps.setString(2, ub.getLname());
			ps.setString(3, ub.getUsername());
			ps.setString(4, ub.getPass());
			ps.setString(5, ub.getEmail());
			ps.setLong(6, ub.getPhno());

			k = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return k;

	}

	public ArrayList<UserDataBean> viewProfile() throws SQLException {
		ArrayList<UserDataBean> list = new ArrayList<UserDataBean>();
		UserDataBean ub = null;
		try (Connection con2 = DatabaseConnection.getConnection()) {
			PreparedStatement ps = con2.prepareStatement("select * from skillExchangeusers");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ub = new UserDataBean();
				ub.setFname(rs.getString(1));
				ub.setLname(rs.getString(2));
				ub.setUsername(rs.getString(3));
				ub.setEmail(rs.getString(4));
				ub.setPhno(rs.getLong(5));
				list.add(ub);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
//	public int update(UserDataBean ub) {
//		int k=0;
//		try(Connection con=DatabaseConnection.getConnection()) {
//			PreparedStatement ps=con.prepareStatement("update product68 set name=?,price=?,qty=? where code=?");
//			ps.setString(1,ub.getFname());
//			ps.setString(2, ub.getLname());
//			ps.setString(3, ub.getUsername());
//			ps.setString(4, ub.getEmail());
//			ps.setLong(5, ub.getPhno());
//			k = ps.executeUpdate();
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//		}
//		return k;
//	}

}
