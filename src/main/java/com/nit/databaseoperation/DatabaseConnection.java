package com.nit.databaseoperation;

//Creating class which will provide the Connection interface Object
import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {

	private static Connection con;
	
	private DatabaseConnection() {};
	
	static {
		System.out.println("DatabaseConnection.enclosing_method()");
		try {
			
			// Class Loading
			Class.forName(DatabaseInfo.driver);
			
			//Creating Connection
			con=DriverManager.getConnection(DatabaseInfo.dbUrl,DatabaseInfo.dbUName,DatabaseInfo.dbPassword);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	// Method For Returning Object of Connection
	public static Connection getConnection()
	{
		System.out.println("con : "+con);
		return con;
	}
}
