package javabean;

//JavaBean Class for data storing and getting 
import java.io.Serializable;

@SuppressWarnings("serial")
public class UserDataBean implements Serializable{
	
	//User properties
	private String fname,lname,username,pass,email,skillToTeach,skillToLearn, profilePic;
	private long phno;
	private int rating;

	//No-Para Constructor
	public UserDataBean() { }
	
	public UserDataBean(String fname, String lname, String username, String pass, String email, String skillToTeach,
			String skillToLearn, String profilePic, long phno, int rating) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.username = username;
		this.pass = pass;
		this.email = email;
		this.skillToTeach = skillToTeach;
		this.skillToLearn = skillToLearn;
		this.profilePic = profilePic;
		this.phno = phno;
		this.rating = rating;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	
	//Getter and Setter for get and set the data
	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
	
	public String getSkillToTeach() {
		return skillToTeach;
	}

	public void setSkillToTeach(String skillToTeach) {
		this.skillToTeach = skillToTeach;
	}

	public String getSkillToLearn() {
		return skillToLearn;
	}

	public void setSkillToLearn(String skillToLearn) {
		this.skillToLearn = skillToLearn;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public long getPhno() {
		return phno;
	}

	public void setPhno(long phno) {
		this.phno = phno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "UserDataBean [fname=" + fname + ", lname=" + lname + ", username=" + username + ", pass=" + pass
				+ ", email=" + email + ", skillToTeach=" + skillToTeach + ", skillToLearn=" + skillToLearn
				+ ", profilePic=" + profilePic + ", phno=" + phno + ", rating=" + rating + "]";
	}
}
