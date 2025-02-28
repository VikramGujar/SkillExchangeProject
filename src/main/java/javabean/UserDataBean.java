package javabean;

//JavaBean Class for data storing and getting 
import java.io.Serializable;

@SuppressWarnings("serial")
public class UserDataBean implements Serializable{
	
	//User properties
	private String fname,lname,username,pass;
	
	public UserDataBean() {}

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
	
}
