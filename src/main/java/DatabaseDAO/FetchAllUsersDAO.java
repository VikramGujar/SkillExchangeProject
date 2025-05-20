package DatabaseDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashSet;
import java.util.Set;

import databaseoperation.DatabaseConnection;
import javabean.UserDataBean;

public class FetchAllUsersDAO {

    public Set<UserDataBean> getAllUsers() {
        Set<UserDataBean> allUsers = new HashSet<>();

        String query = "SELECT fname, lname, username, email, phonenumber, skilltoteach, skilltolearn, rating FROM skillexchangeusers";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                UserDataBean ub = new UserDataBean();
                ub.setFname(rs.getString("fname"));
                ub.setLname(rs.getString("lname"));
                ub.setUsername(rs.getString("username"));
                ub.setEmail(rs.getString("email"));
                ub.setPhno(rs.getLong("phonenumber"));
                ub.setSkillToTeach(rs.getString("skilltoteach"));
                ub.setSkillToLearn(rs.getString("skilltolearn"));
                ub.setRating(rs.getInt("rating"));
                allUsers.add(ub);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return allUsers;
    }
}
